# 
FROM andrewosh/binder-base
MAINTAINER Holger Schulz <iamholger@gmail.com>
USER root
RUN apt-get update
RUN apt-get install libeigen3-dev -y
RUN pip install iminuit
#RUN pip install fileupload
RUN jupyter nbextension install --py fileupload
RUN jupyter nbextension enable --py fileupload
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN wget http://www.hepforge.org/archive/yoda/YODA-1.6.6.tar.gz
RUN tar xzf YODA-1.6.6.tar.gz
RUN cd YODA-1.6.6 && ./configure --prefix=/usr/local && make install
RUN rm -rf YODA*
RUN wget http://www.hepforge.org/archive/professor/Professor-2.2.0.tar.gz
RUN tar xzf Professor-2.2.0.tar.gz && cd Professor-2.2.0 && PREFIX=/usr/local make install
RUN rm -rf Professor-2.2.0*
ENV LD_LIBRARY_PATH /usr/local/lib
ENV PYTHONPATH /usr/local/lib64/python2.7/site-packages
#ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/contrib
