# start by pulling the python image
FROM python:3.10

# cree le repertoire app
RUN mkdir -p /app

#switch working directory
WORKDIR /app

RUN pip3 install flask
ENV FLASK_APP=main
ENV FLASK_RUN_HOST=0.0.0.0
# copy le fichier flask.py dans le repertoire /app
COPY main.py .

# configure le conteneur pour demarrer de la maniere suivante
#CMD ["flask","run","--host","0.0.0.0"]
CMD ["flask","run"]


