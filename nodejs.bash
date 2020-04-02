
cd /opt/nodejs/
mv node-v8.17.0-linux-x64/ 8.17.0
ln -s 8.17.0 current
ln -s /opt/nodejs/current/bin/node /bin/node
node -v
ln -s /opt/nodejs/current/bin/npm /bin/npm

