#build images on images
#get python image from https://hub.docker.com
FROM python:3.7-alpine
#maintaining line
MAINTAINER ninetyninejellies

#tells python to run in unburrfered mode when running docker container
ENV PTHONUNBUFFERED 1


#dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

#create user -  for security
RUN adduser -D user
USER user