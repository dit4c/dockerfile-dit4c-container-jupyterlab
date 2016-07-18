FROM dit4c/dit4c-container-ipython:latest
MAINTAINER Tim Dettrick <t.dettrick@uq.edu.au>

RUN su - researcher -c \
  "/opt/python/bin/pip install jupyterlab && \
  /opt/python/bin/jupyter serverextension enable --py jupyterlab"
RUN rm -f /etc/supervisord.d/ipynb.conf
RUN sed -i -e 's/\/ipynb\//\/jupyter\//' /home/researcher/.jupyter/jupyter_notebook_config.py

ADD /etc /etc
ADD /var /var
