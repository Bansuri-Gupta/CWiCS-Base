#This is example Dockerfile
FROM python3.9-alpine

WORKDIR /app
COPY . /app
RUN pip install flask
EXPOSE 8080
FROM nginx:1.21.1
WORKDIR /usr/share/nginx/html
COPY index.html
EXPOSE 8080
FROM python:3.9-alpine
RUN mkdir /app
ADD requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
ADD main.py /app/main.py
RUN chmod +x /app/main.py

CMD ["python", "/app/main.py"]
