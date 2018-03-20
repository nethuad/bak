pip3 install pymssql

mssql+pymssql://huadong:XXXXXXXXXX@192.168.0.231:1433/portrait

gunicorn superset:app -b 0.0.0.0:8158 > superset.log 2>&1 &

