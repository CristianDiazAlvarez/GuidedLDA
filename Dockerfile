FROM python:3.7

USER root
RUN mkdir /work
WORKDIR /work

COPY . .
 
RUN apt-get update && apt-get -y install gcc git libevent-dev


RUN pip install --upgrade pip
RUN pip install -U pip setuptools wheel
RUN pip install cython

RUN pip install git+https://github.com/CristianDiazAlvarez/GuidedLDA

RUN pip install -r requirements.txt

RUN pip install jupyter==1.0.0 -U && pip install jupyterlab==3.5.3
EXPOSE 8888
ENTRYPOINT ["jupyter", "lab","--ip=0.0.0.0","--allow-root", "--browser='google-chrome-stable %s'"]
RUN echo $(jupyter server list)

# docker run -it --rm -p 8888:8888 --name lda -v $PWD:/work lda