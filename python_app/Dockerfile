FROM python:latest
WORKDIR /app/
ADD . .
RUN pip3 install -r requiment.txt
ENTRYPOINT ["flask","--app","server.py","run","--debug","--host=0.0.0.0"]
