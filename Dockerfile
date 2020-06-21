FROM jupyterhub/singleuser:1.2

MAINTAINER Hannes Moser <box@hannesmoser.at>

RUN python3 -m pip install \
        notebook \
        numpy \
        matplotlib \
        pandas \
        psycopg2-binary \
        seaborn \
        sklearn
