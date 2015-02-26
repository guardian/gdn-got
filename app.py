import os
import json
import logging
from collections import namedtuple

import webapp2
import jinja2

from urllib import quote, urlencode
from google.appengine.api import urlfetch

import py2neo

import configuration
import content_api
import nodes
import gae

jinja_environment = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.join(os.path.dirname(__file__), "templates")))

def graph():
	db_url = configuration.lookup('gdb_url', 'http://localhost:7474/db/data/')
	logging.info(db_url)
	return py2neo.Graph(db_url)

class MainPage(webapp2.RequestHandler):
	def get(self):

		gdb = graph()

		query = 'MATCH (c: Category) RETURN c'

		results = gdb.cypher.execute(query)

		template = jinja_environment.get_template('index.html')

		template_values = {
			'categories' : results.to_subgraph().nodes
		}

		self.response.out.write(template.render(template_values))

class DataPage(webapp2.RequestHandler):
	def get(self, path):

		gdb = graph()

		path_elements = path.split("/")

		query = 'MATCH (n) WHERE n.path = "{path}" RETURN n'.format(path=path_elements[0])
		result = nodes.find_final_node(path_elements[1:], gdb.cypher.execute_one(query))

		if not result:
			webapp2.abort(404, "Cannot find that node")

		template = jinja_environment.get_template('data.html')

		template_values = {'request_path': self.request.path,
			'path': path,
			'results': result,
			'related_nodes': nodes.related_nodes(result),
			'data': result.properties,
			'schema_data': dict([(key[6:].lower(), value) for key, value in result.properties.items() if key.startswith('schema')]),
			'links_here' : nodes.incoming(result),
		}

		if 'tagQuery' in result.properties:
			search_content = content_api.search({'tag': result.properties['tagQuery']})
			json_data = json.loads(search_content)
			logging.info(json_data)
			template_values['news_content'] = content_api.read_results(json_data)

		if 'contributorId' in result.properties:
			template_values['contributor_content'] = content_api.read_contributor_content(result.properties['contributorId'])

		self.response.out.write(template.render(template_values))

app = webapp2.WSGIApplication([
	('/', MainPage),
	webapp2.Route('/<path:.*>', handler=DataPage)],
                              debug=True)
