FROM python:3.9-slim

WORKDIR /app

VOLUME ["/app"]

RUN apt update 
RUN apt install -y gcc
RUN apt install -y g++

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY / .

CMD [ "/usr/local/bin/uvicorn", "--host", "0.0.0.0", "--port", "80", "app:app", "--reload" ]