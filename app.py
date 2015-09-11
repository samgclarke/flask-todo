import os
from flask import Flask, render_template, redirect, \
    request, url_for
from flask.ext.sqlalchemy import SQLAlchemy


app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = os.environ['DATABASE_URL']
db = SQLAlchemy(app)


class Todo(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=True)
    description = db.Column(db.String(120), unique=True)

    def __init__(self, name, description):
        self.name = name
        self.description = description

    def __repr__(self):
        return '<Todo %r>' % self.name


@app.route("/")
def index():
    items = Todo.query.all()
    return render_template('index.html', items=items)


@app.route("/new", methods=['POST'])
def new():
    name = request.form['name']
    description = request.form['description']
    todo = Todo(name=name, description=description)
    db.session.add(todo)
    db.session.commit()
    return redirect(url_for('index'))

if __name__ == "__main__":
    app.run(debug=True)
