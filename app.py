import os
import json
import logging
from collections import namedtuple

import webapp2
import jinja2

from urllib import quote, urlencode
from google.appengine.api import urlfetch

import configuration

import py2neo

jinja_environment = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.join(os.path.dirname(__file__), "templates")))

RelationshipLink = namedtuple('RelationshipLink', ['node', 'label'])

def graph():
	db_url = configuration.lookup('db_url', 'http://localhost:7474/db/data/')
	return py2neo.Graph(db_url)

def relationship_label(rel):
	logging.info(rel)
	return rel.type

def find_final_node(path_elements, node):
	if not path_elements:
		return node

	linked_nodes = [rel.start_node for rel in node.match()]
	logging.info(linked_nodes)

	matching_path_nodes = filter(lambda n: n.properties['path'] == path_elements[0], linked_nodes)
	logging.info(matching_path_nodes)

	if matching_path_nodes:
		return matching_path_nodes[0]
	return None

def other_node(current_node, relationship):
	label = relationship_label(relationship)
	if relationship.start_node == current_node:
		return RelationshipLink(relationship.end_node, label)
	return RelationshipLink(relationship.start_node, label)

def related_nodes (node):
	return [other_node(node, rel) for rel in node.match()]

class MainPage(webapp2.RequestHandler):
	def get(self):

		gdb = graph()

		template = jinja_environment.get_template('index.html')

		template_values = {}

		self.response.out.write(template.render(template_values))

class DataPage(webapp2.RequestHandler):
	def get(self, path):

		gdb = graph()

		path_elements = path.split("/")
		logging.info(path_elements)

		query = 'MATCH (n) WHERE n.path = "{path}" RETURN n'.format(path=path_elements[0])
		result = find_final_node(path_elements[1:], gdb.cypher.execute_one(query))

		if not result:
			webapp2.abort(404, "Cannot find that node")

		template = jinja_environment.get_template('data.html')

		template_values = {'request_path': self.request.path,
			'path': path,
			'results': result,
			'related_nodes': related_nodes(result),
			'data': result.properties,
			'schema_data': dict([(key[6:], value) for key, value in result.properties.items() if key.startswith('schema')]),
		}

		self.response.out.write(template.render(template_values))

app = webapp2.WSGIApplication([
	('/', MainPage),
	webapp2.Route('/<path:.*>', handler=DataPage)],
                              debug=True)
