FROM ghost:0.7.1

ADD adapter.sh /opt/adapter.sh
ADD config_mysql.js /opt/config_mysql.js
ADD config_sqlite.js /opt/config_sqlite.js
ADD content.zip /opt/content.zip
RUN chmod +x /opt/adapter.sh 
RUN apt-get update &&
apt-get install unzip &&
unzip content.zip -d /usr/src/ghost/content &&

ENTRYPOINT ["/opt/adapter.sh", "/entrypoint.sh"]
CMD ["npm", "start", "--production"]