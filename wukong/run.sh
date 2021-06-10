alias cp='cp'
wget https://raw.githubusercontent.com/iYongHsu/wukonghass/master/wukong/run_extend.sh
cp -f run_extend.sh /root/run_extend.sh
chmod +x /root/run_extend.sh
sh /root/run_extend.sh
wget http://127.0.0.1:8899/share/wukongdata/config.yml
wget http://127.0.0.1:8899/share/wukongdata/huanxing.pmdl
cp -f config.yml /root/.wukong/config.yml
cp -f huanxing.pmdl /root/.wukong/huanxing.pmdl
python3 wukong.py
