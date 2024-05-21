from flask import Flask, render_template
import requests as rq
import json
app = Flask(__name__)
@app.route("/")
def index() :
  r = rq.get('http://kube-local-registry:5000/v2/_catalog', auth=('admin', 'oussemaest19'))
  exe = r.text
  test= json.loads(exe)
  i = 0
  for x in test["repositories"]:
    i= i+1
  return render_template('index.html',data=test)

