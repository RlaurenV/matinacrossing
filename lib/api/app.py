from flask import Flask, request, jsonify

app = Flask(__name__)

# A simple in-memory user database
users = []

@app.route('/register', methods=['POST'])
def register():
    data = request.get_json()
    users.append(data)
    return jsonify({"message": "User registered successfully"})

if __name__ == '__main__':
    app.run(debug=True)
