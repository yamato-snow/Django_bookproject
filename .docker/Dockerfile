# Python公式イメージをベースにする
FROM python:3.8.12

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# Pythonがpycファイルとディスクキャッシュを生成するのを防ぐ
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 依存関係をインストール
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt