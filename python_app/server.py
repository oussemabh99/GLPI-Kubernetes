from flask import Flask
import requests as rq
import json
app = Flask(__name__)
@app.route("/")
def index() :
  r = rq.get('http://localhost:32000/v2/_catalog', auth=('admin', 'oussemaest19'))
  exe = r.text
  test= json.loads(exe)
  i = 0
  for x in test:
    i= i+1
  return (str(i))
