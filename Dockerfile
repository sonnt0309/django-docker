FROM python:3.6

RUN rm -rf /var/lib/apt/lists/* && apt-get update -y
RUN apt-get install -y telnet vim git curl supervisor gettext libgettextpo-dev

RUN mkdir -p /app
WORKDIR /app
COPY . /app

RUN pip install -r requirements.txt

# Clear old entrypoint
RUN rm -rf /usr/local/bin/entrypoint.sh
COPY entrypoint.sh /usr/local/bin/
RUN sed -i -e 's/\r$//' /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh && ln -s /usr/local/bin/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8000