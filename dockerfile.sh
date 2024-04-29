how to create dockerfile for tomcat webserver::


step1:os amazon linux
step2: cat>ash.sh
yum update -y && yum upgrade -y && yum install docker -y
service docker start
service docker status
docker --version

before we create dockerfile we need to install tomcat file
go to browser and  download tomcat

> wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.23/bin/apache-tomcat-10.1.23.tar.gz
>ls
>we need to extract file
>tar -zxvf apache-tomcat-10.1.23.tar.gz
>ls
>mv apache-tomcat-10.1.23 tomcat
>rm apache-tomcat-10.1.23.tar.gz
>ls
 tomcat
>cd tomcat/
>ls
cd bin/
>ls
>pwd 
/home/ec2-user/tomcat/bin
>cd ..
>cd ..
ec2-user: vi Dockerfile

FROM amazonlinux
RUN yum install java -y
COPY . /opt/
EXPOSE 1
ENTRYPOINT ["/opt/tomcat/bin/catalina.sh", "run"]

:wq!

now go to cd tomcat/
>ls
you will get server.xml file

need to change port

vi server.xml
you can take anyone i ll take "1"

:wq!

now i am goiny to build image

ec2-user> docker build -t myimage .

>docker images 
you will get tomcat image

>docker run -p 1000:1 tomcat


now go to browser and check 
pubilc ip:1000

its done.


**push image in dockerhub

docker login
docker tag imagename userid/imagename (anyname you can give>
>docker push userid/imagename












