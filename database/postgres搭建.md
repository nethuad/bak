yum list postgresql*

centos安装postgresql
yum install https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-6-x86_64/pgdg-centos10-10-2.noarch.rpm
yum install postgresql10-server
service postgresql-10 initdb
chkconfig postgresql-10 on
service postgresql-10 start

登录
su postgres
psql

创建用户
create role xsd LOGIN PASSWORD 'Xsd123!@#';
alter role xsd PASSWORD 'Xsd123$';
create database xueshandai;



GRANT ALL PRIVILEGES on DATABASE test to xsd;
GRANT ALL PRIVILEGES on DATABASE xueshandai to xsd;

\c test
\c xueshandai
GRANT ALL PRIVILEGES on all tables in schema public to xsd;
REVOKE ALL PRIVILEGES on all tables in schema public from xsd;

配置文件目录: /var/lib/pgsql/10/data/pg_hba.conf
host    all             all             192.168.0.1/24          md5

修改postgresql.conf中的listen_address=*，监听所有端口，这样远程才能通过TCP/IP登录数据库


