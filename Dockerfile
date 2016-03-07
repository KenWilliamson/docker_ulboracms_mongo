FROM mongo
RUN mkdir -p /databackup /tempbackup
RUN chown -R mongodb:mongodb /databackup
VOLUME /databackup
ADD ulboracmsdb.tar.gz /tempbackup
ADD db.sh /db.sh




