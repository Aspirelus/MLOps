FROM jupyter/scipy-notebook

RUN pip install joblib


USER root
RUN apt-get update && apt-get install -y jq

RUN mkdir model raw_data processed_data results


ENV RAW_DATA_DIR=/home/admin/raw_data
ENV PROCESSED_DATA_DIR=/home/admin/processed_data
ENV MODEL_DIR=/home/admin/model
ENV RESULTS_DIR=/home/admin/results
ENV RAW_DATA_FILE=adult.csv
ENV NB_USER=admin
ENV HOME=/home/admin
ENV XDG_CACHE_HOME=/home/admin/.cache/

COPY adult.csv ./raw_data/adult.csv
COPY preprocessing.py ./preprocessing.py
COPY train.py ./train.py
COPY test.py ./test.py
