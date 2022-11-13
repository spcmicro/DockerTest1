FROM navikey/raspbian-buster
# Update apt and install raspi libs
RUN apt update
RUN apt-get install -y --reinstall libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin

# Install python3 and opencv
RUN apt install -y python3 python3-pip
RUN apt install -y python3-opencv
RUN apt install -y python3-tk
RUN apt install -y libatlas-base-dev

# Install pip dependencies
RUN python3 -m pip install ftputil
RUN python3 -m pip install picamera
RUN python3 -m pip install imutils
RUN python3 -m pip install requests
RUN python3 -m pip install rpi.gpio
RUN python3 -m pip install pandas
RUN python3 -m pip install pandastable
RUN python3 -m pip install Pillow
RUN python3 -m pip install pybind11
RUN python3 -m pip install scipy
RUN python3 -m pip install sklearn
RUN python3 -m pip install cycler
RUN python3 -m pip install future
RUN python3 -m pip install joblib
RUN python3 -m pip install kiwisolver
RUN python3 -m pip install MarkupSafe
RUN python3 -m pip install six
RUN python3 -m pip install smbus
RUN python3 -m pip install sqlparse
RUN python3 -m pip install tabulate
RUN python3 -m pip install threadpoolctl
RUN python3 -m pip install xlrd
RUN python3 -m pip install yoyo-migrations
RUN python3 -m pip install pdf2img
RUN python3 -m pip install pyparsing
RUN python3 -m pip install python-dateutil
RUN python3 -m pip install pytz
RUN python3 -m pip install matplotlib

# See https://github.com/waveform80/picamera/issues/578
ENV READTHEDOCS=True
ENV OPENCV_VERSION="4.0.1"

WORKDIR /aimpi
RUN groupadd -r aimusers && useradd -r -g aimusers aimpi
RUN usermod -aG video aimpi

RUN mkdir -p /aimpi/local-aim-storage
RUN mkdir -p AIM-Lite/settings/factory
RUN mkdir -p AIM-Lite/settings/software

COPY . .
COPY AIM-Lite/settings/AIM_MasterConfig.ini AIM-Lite/settings/AIM_Config.ini
COPY AIM-Lite/database/AIM_Master.db AIM-Lite/database/default.db
COPY AIM-Lite/settings/AIM_factorySettings.ini AIM-Lite/settings/factory/AIM_factorySettings.ini

USER aimpi
# RUN xhost +

CMD []
# ENTRYPOINT ["python", "AIM_dateTime_support.py"]  
ENTRYPOINT ["/bin/bash"]  



