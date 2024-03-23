# 提供側のREADME.md

# Python Docker 環境

このプロジェクトは、基本的なPythonとDjangoの開発環境をDockerで提供します。

## 初期設定

まず、Djangoプロジェクトを始める前に必要なライブラリを`requirements.txt`に追加してください。

例:

```
Django>=3.2,<4.0
```

## Dockerコンテナのビルド

プロジェクトディレクトリで以下のコマンドを実行してDockerイメージをビルドします。

```
docker-compose build
```

## Dockerコンテナの起動

Dockerコンテナを起動するには、以下のコマンドを実行します。

```
docker-compose up
```

このコマンドにより、Django開発サーバーが起動します。ブラウザで`http://localhost:8000`にアクセスして動作を確認してください。

## Djangoプロジェクトの作成

Dockerイメージ内でDjangoプロジェクトを作成するには、次のコマンドを実行します。

```
docker-compose run web django-admin startproject config .
```

## ライブラリの追加

プロジェクトに新しいPythonライブラリを追加するには、`requirements.txt`にライブラリを追加し、`docker-compose build`を再実行してください。


# 使用者側のREADME.md

# プロジェクトの開始

このプロジェクトは、Dockerを使用してPythonとDjangoでの開発を行うための環境を提供します。

## 必要条件

- Docker
- Docker Compose

がインストールされていることを確認してください。

## 開発の始め方

1. このリポジトリをクローンします。
2. 必要に応じて、`requirements.txt`にライブラリを追加します。
3. `docker-compose up --build` コマンドでDocker環境を構築して起動します。
4. ブラウザを開き、`http://localhost:8000` にアクセスして、Djangoアプリケーションが正しく動作していることを確認します。

## ライブラリの追加方法

プロジェクトに新しいライブラリを追加したい場合は、以下の手順に従ってください。

1. 必要なライブラリを `requirements.txt` に追加します。
2. `docker-compose build` コマンドを実行して、Dockerイメージを再ビルドします。
3. 再ビルド後、`docker-compose up` でコンテナを再起動します。

この手順により、追加したライブラリがコンテナ内にインストールされます。

## Djangoプロジェクトの管理

Djangoプロジェクトに対してマイグレーションや管理コマンドを実行するには、`docker-compose run web` コマンドを使用します。例えば、マイグレーションを適用するには、次のコマンドを実行します。

```
docker-compose run web python manage.py migrate
```

このようにして、Dockerコンテナ内でDjangoプロジェクトの管理が可能になります。

## 注意事項

- コンテナ内で作成されたファイルは、コンテナを実行しているユーザーの権限で作成されます。ファイルの所有権に関する問題が発生した場合は、適宜、権限の調整を行ってください。
- Dockerコンテナの環境は、`Dockerfile` および `docker-compose.yml` で定義されています。環境に変更が必要な場合は、これらのファイルを編集し、再ビルドを行ってください。

これで、Dockerを使用してPythonとDjangoの開発環境を構築し、プロジェクトの開発を始める準備が整いました。開発中に追加の依存関係が生じた場合は、上記の手順に従って環境を更新してください。