#from flask import Flask
import requests as rq
import json
#app = Flask(__name__)
r = rq.get('http://localhost:32000/v2/_catalog', auth=('admin', 'oussemaest19'))
exe = r.text
print(exe)
json= json.loads(exe)
i = 0
for x in json:
 i= i+1
print (i)
#@app.route("/")
#def hello_world():
#    return "<p>Hello, World!</p>"
