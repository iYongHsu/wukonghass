alias cp='cp'
if [ ! -f "/root/.wukong/config.yml" ]; then
  wget http://127.0.0.1:8899/share/wukongdata/config.yml
  cp -f config.yml /root/.wukong/config.yml
fi
if [ ! -f "/root/.wukong/wukong.pmdl" ]; then
  wget http://127.0.0.1:8899/share/wukongdata/xiaotianquan.pmdl
  cp -f xiaotianquan.pmdl /root/.wukong/xiaotianquan.pmdl
fi
# wget http://127.0.0.1:8899/share/wukongdata/config.yml
# wget http://127.0.0.1:8899/share/wukongdata/wukong.pmdl
# cp -f config.yml /root/.wukong/config.yml
# cp -f wukong.pmdl /root/.wukong/wukong.pmdl
python3 wukong.py
