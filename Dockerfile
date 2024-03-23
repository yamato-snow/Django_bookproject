# Pythonのベースイメージを指定
FROM python:3.9

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# Pythonがpycファイルとディスクキャッシュを生成するのを防ぐ
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 依存関係をインストール
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# ポートを公開
EXPOSE 8000

# デフォルトコマンド
CMD ["django-admin", "startproject", "myproject", "."]
