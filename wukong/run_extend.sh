alias cp='cp'
if [ ! -f "/root/.wukong/qa.csv" ]; then
  wget http://127.0.0.1:8899/share/wukongdata/qa.csv
  cp -f qa.csv /root/.wukong/qa.csv
fi