
import logging
from collections import namedtuple

import transformers

RelationshipLink = namedtuple('RelationshipLink', ['node', 'label'])

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
	label = transformers.relationship_label(relationship)
	if relationship.start_node == current_node:
		return RelationshipLink(relationship.end_node, label)
	return RelationshipLink(relationship.start_node, label)

def related_nodes(node):
	return [other_node(node, rel) for rel in node.match_outgoing()]

def incoming(node):
	return [RelationshipLink(rel.start_node, transformers.relationship_label(rel)) for rel in node.match_incoming()]