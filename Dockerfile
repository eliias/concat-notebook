FROM jupyter/base-notebook
MAINTAINER Hannes Moser <box@hannesmoser.at>

ADD install_jupyterhub /tmp/install_jupyterhub
ARG JUPYTERHUB_VERSION=1.2
# install pinned jupyterhub and ensure notebook is installed
RUN python3 /tmp/install_jupyterhub && \
    python3 -m pip install \
        notebook \
        numpy \
        pandas
