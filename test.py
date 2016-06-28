import requests

def hello_world (arg):
	r = requests.get(arg)
	print r.status_code
	print arg
	print r.text
	print len(r.content)
	
