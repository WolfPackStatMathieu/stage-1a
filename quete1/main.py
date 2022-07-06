from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    print("Un appel a eu lieu")
    return "<p>Hello, World!</p>"
