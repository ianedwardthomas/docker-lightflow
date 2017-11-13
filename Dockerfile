FROM python:3
ENV PYTHONUNBUFFERED 1

MAINTAINER Ian Thomas <ianedwardthomas@gmail.com>

RUN groupadd -r nginx && adduser --home /opt/lightflow --disabled-password --gecos '' lightflow

WORKDIR /opt/lightflow
COPY requirements.txt /opt/lightflow/requirements.txt
COPY docker-entrypoint.sh /opt/lightflow/docker-entrypoint.sh
RUN chmod 755 /opt/lightflow/docker-entrypoint.sh
RUN pip install --no-cache-dir -r requirements.txt

USER lightflow

RUN lightflow config default .
RUN lightflow config examples .

COPY lightflow.cfg /opt/lightflow
ENTRYPOINT ["/opt/lightflow/docker-entrypoint.sh"]

