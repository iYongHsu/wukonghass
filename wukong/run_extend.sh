
apt-get -y install libasound2-dev libspeexdsp-dev
git clone https://github.com/voice-engine/ec.git
cd ec
make
cp ec /usr/local/bin/

pacmd load-module module-pipe-sink sink_name=ec.sink format=s16 rate=16000 channels=1 file=/tmp/ec.input
pacmd load-module module-pipe-source source_name=ec.source format=s16 rate=16000 channels=2 file=/tmp/ec.output
pacmd set-default-sink ec.sink
pacmd set-default-source ec.source

ec -i plughw:2 -o plughw:1 -d 200
