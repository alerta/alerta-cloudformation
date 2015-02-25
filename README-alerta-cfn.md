Deploy Alerta on AWS EC2 using CloudFormation
=============================================

There are two different cloudformation templates that can be used to launch an Alerta stack in EC2.

The first is for a stand-alone single server instance without any redundancy.



To Do - Single
-----
- allow user to choose AZ for single server instance
- add Route 53 to the single server template


ReplicaSet
- add replSet=alerta to /etc/mongodb.conf

dbpath=/var/lib/mongodb
logpath=/var/log/mongodb/mongodb.log
logappend=true
bind_ip = 127.0.0.1
journal=true
replSet=alerta



$ mongo
> rs.initiate()
> rs.conf()
> rs.add("mongodb1.example.net")
> rs.add("mongodb1.example.net")
> rs.status()


key=
api-key
api_key
apiKey

