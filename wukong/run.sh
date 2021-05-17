alias cp='cp'
wget http://127.0.0.1:8899/share/wukongdata/config.yml
wget http://127.0.0.1:8899/wukongdata/wukong.pmdl
cp -f config.yml /root/.wukong/config.yml
cp -f wukong.pmdl /root/.wukong/wukong.pmdl
python3 wukong.py
