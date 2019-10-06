from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello World! fanchao test1,test2,k8s,at home,an test again,test jenkins'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
