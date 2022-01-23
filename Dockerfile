FROM python:3.6.15-buster

WORKDIR /code
COPY . /code

ENV PYTHONPATH "${PYTHONPATH}:/code"
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    vim
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && \
    pip install poetry

# 仮想環境は不要なので作らない
# https://qiita.com/yolo_kiyoshi/items/332ae902aeb730fbd068
RUN poetry config virtualenvs.create false
# 開発用のパッケージをインストールしないなら、--no-devオプションが必要
# https://org-technology.com/posts/python-poetry.html#org8bc4a1e
 RUN poetry install --no-root