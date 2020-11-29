FROM python:3

RUN mkdir /home/aj
WORKDIR /home/aj
COPY . /home/aj

RUN pip install -r requirements.txt
CMD [ "ls -ltr" ]