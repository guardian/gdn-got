import logging

def relationship_label(rel):
	logging.info(rel)
	rel_type = rel.type.replace("_", " ")
	return rel_type.capitalize()