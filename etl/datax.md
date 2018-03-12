https://github.com/alibaba/DataX
$ tar zxvf datax.tar.gz
$ sudo chmod -R 755 {YOUR_DATAX_HOME}
$ cd  {YOUR_DATAX_HOME}/bin
$ python datax.py ../job/job.json

mysql同步到odps  python datax.py /job/mysql2odps.json

odps同步到mysql  python datax.py /job/odps2mysql.json

帮助文档
http://blog.csdn.net/thriving_fcl/article/details/77279026
http://blog.51cto.com/daisywei/1903085