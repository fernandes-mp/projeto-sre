FROM python:3.9.6

COPY . /app/api_catalogo

EXPOSE 5001

RUN apt-get -y update && pip3 install flask && pip3 install pymysql && pip3 install mysql-connector-python && \
pip3 install flask_sqlalchemy && pip3 install datetime && pip3 install flask_httpauth && pip3 install Response && \
pip3 install requests

WORKDIR /app/api_catalogo

CMD python3 Execute.py


