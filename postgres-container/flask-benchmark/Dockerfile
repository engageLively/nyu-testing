FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY server/flask_benchmark.py /app/

ENV PORT=8080
ENV DATABASE=postgres_test_db
ENV DB_USERNAME=postgres
ENV DB_PASSWORD=postgres

EXPOSE 8080

CMD ["python", "flask_benchmark.py"]
