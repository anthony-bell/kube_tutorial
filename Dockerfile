FROM python:alpine3.7
COPY . /home/aj
WORKDIR /home/aj
RUN pip install -r requirements.txt