import os
import psycopg2
from flask import Flask, jsonify, request
import random

app = Flask(__name__)

def get_db_connection():
    conn = psycopg2.connect(
        host='postgres',
        database=os.environ["DATABASE"],
        user=os.environ['DB_USERNAME'],
        password=os.environ['DB_PASSWORD'],
        port=int(os.environ.get("DB_PORT", 5432))  # Default to 5432 if DB_PORT is not set
    )
    return conn


def _get_random_row():
    conn = get_db_connection()
    cur = conn.cursor()
    value = random.randint(1, 10000)
    cur.execute(f'SELECT * FROM world where ID={value};')
    result = cur.fetchall()
    cur.close()
    conn.close()
    return result

@app.route('/db')
def db():
    result = _get_random_row()
    return jsonify(result)

@app.route('/queries')
def queries():
    num_queries  = int(request.args.get('queries'))
    num_queries = min(500, max(num_queries, 1))
    result = [_get_random_row()[0]  for i in range(num_queries)]
    return jsonify(result)

@app.route('/plaintext')
def plaintext():
    return 'Hello, world'

if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))