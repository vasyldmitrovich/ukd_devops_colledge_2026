from flask import Flask
from redis import Redis

app = Flask(__name__)
# Підключення до іншого контейнера через внутрішню мережу Docker за ім'ям сервісу "redis"
redis_db = Redis(host="redis", port=6379, decode_responses=True)

@app.route("/")
def index():
    count = redis_db.incr("hits")
    print(f"Новий запит оброблено. Поточний лічильник: {count}", flush=True)
    return f"Привіт! Цю сторінку відкрили {count} раз(ів).\n"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
