import webapp2
import jinja2
import os
import json
import logging
from urllib import quote, urlencode
from google.appengine.api import urlfetch

import configuration

import py2neo

jinja_environment = jinja2.Environment(
    loader=jinja2.FileSystemLoader(os.path.join(os.path.dirname(__file__), "templates")))

def graph():
	db_url = configuration.lookup('db_url', 'http://localhost:7474/db/data/')
	return py2neo.Graph(db_url)

class MainPage(webapp2.RequestHandler):
	def get(self):

		gdb = graph()

		template = jinja_environment.get_template('index.html')
		
		template_values = {}

		self.response.out.write(template.render(template_values))

app = webapp2.WSGIApplication([('/', MainPage)],
                              debug=True)