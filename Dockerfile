FROM python:3.7-slim

RUN pip install pip==18.1 pipenv==2018.10.13

COPY Pipfile Pipfile.lock /app/
WORKDIR /app

RUN pipenv install --system --deploy --dev

COPY . /app

CMD python src/server.py
