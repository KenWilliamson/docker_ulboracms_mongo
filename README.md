# Docker Ulbora Mongo
- 1.0.0, latest[ (Dockerfile)](https://github.com/Ulbora/docker_ulboracms_mongo/blob/master/Dockerfile)

This is Docker Ulbora Mongo running on Debian


# Running

```
docker run -v /data/db:/data/db -v /databackup:/databackup --name \
ulboramongo -d ulboralabs/ulboracms-mongo
```

###Then run the database restore script

```
 docker exec -it ulboramongo bash /db.sh
```

#Linking to a mongo container
### The link to your mongodb container should always end with :mongo as shown below

```
docker run --name some-ulboracms-web-app \
--link some-mongodb-container-name:mongo -d  ulboralabs/ulboracms sh
```

#About linking to a mongo container
The :mongo is an alias that produces an environment variable named MONGO_PORT_27017_TCP_ADDR inside the web container.
If :mongo were to be changed to :mongodb, then the environment variable would be named MONGODB_PORT_27017_TCP_ADDR and 
Ulbora CMS would not connect the the mongo database. Ulbora CMS needs the environment variable to be 
named MONGO_PORT_27017_TCP_ADDR.

Also notice that we do not start the mongo container and expose port 27017 by using -p 27017:27017.
Doing so would expose the container outside of Docker and would require additional security.
If you start the mongo container with -p 27017:27017, make sure to follow the Docker guidelines on securing 
the container.

# Connect to running instance

```
docker exec -it ulboralabs/ulboracms-mongodb bash
```

