from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    return "Miner is running."

if __name__ == "__main__":
    # Use port 8080 as it's standard for web services
    port = int(os.environ.get("PORT", 8080))
    app.run(host='0.0.0.0', port=port)
