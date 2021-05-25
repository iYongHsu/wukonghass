alias cp='cp'
if [ ! -f "/root/.wukong/config.yml" ]; then
  wget http://127.0.0.1:8899/share/wukongdata/config.yml
  cp -f config.yml /root/.wukong/config.yml
fi
if [ ! -f "/root/.wukong/huanxing.pmdl" ]; then
  wget http://127.0.0.1:8899/share/wukongdata/huanxing.pmdl
  cp -f huanxing.pmdl /root/.wukong/huanxing.pmdl
fi
# wget http://127.0.0.1:8899/share/wukongdata/config.yml
# wget http://127.0.0.1:8899/share/wukongdata/wukong.pmdl
# cp -f config.yml /root/.wukong/config.yml
# cp -f wukong.pmdl /root/.wukong/wukong.pmdl
python3 wukong.py
