FROM ubuntu:latest
LABEL Description="Ontario Emergency App build env"

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git python3 python3-pip python3-tk python3-pil python3-pil.imagetk && \
    pip3 install pyinstaller --break-system-packages && \
    cd $HOME && git clone https://github.com/AFOEK/OEApp && \
    cd OEApp && pip3 install -r requirements.txt --break-system-packages && \
    pyinstaller --onefile OEApp.py