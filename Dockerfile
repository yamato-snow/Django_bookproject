# Pythonの公式イメージをベースに使用します。バージョンはプロジェクトに合わせて選択してください。
FROM python:3.12

# 環境変数を設定してPythonがpycファイルやディスクキャッシュを生成しないようにします。
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 作業ディレクトリを設定します。コンテナ内でのアプリケーションのルートディレクトリです。
WORKDIR /app

# 依存関係ファイルをコンテナにコピーします。
COPY requirements.txt /app/

# requirements.txtにリストされたパッケージをインストールします。
RUN pip install --no-cache-dir -r requirements.txt

# プロジェクトディレクトリ（src/）をコンテナの作業ディレクトリにコピーします。
COPY src/ /app/

# manage.pyをコンテナの作業ディレクトリ直下にコピーします。
COPY manage.py /app/

# コンテナ起動時にDjango開発サーバーを起動するコマンドを指定します。
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
