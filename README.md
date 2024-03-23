プロジェクト名: Advanced Django-PostgreSQL Development Environment

# 1. Advanced Django-PostgreSQL Development Environment

このドキュメントは、DjangoとPostgreSQLを使用したWebアプリケーションのための高度な開発環境を提供する開発環境提供者向けに記述されています。DockerとDocker Composeを活用し、開発、テスト、本番環境の一貫性を確保しながら、チームメンバー間での環境差異を最小限に抑えます。

## 主要技術

- **Django**: バックエンドフレームワークとして使用。
- **PostgreSQL**: データの永続化に使用するデータベース。
- **Docker**: 開発、テスト、本番環境のコンテナ化を実現。
- **Docker Compose**: 複数コンテナの管理を容易にする。

## 開発環境のセットアップ

### 前提条件

- DockerとDocker Composeがインストールされていることを確認してください。

### セットアップ手順

1. **プロジェクトのセットアップ**:
   GitHubやその他のソースコード管理システムからプロジェクトのリポジトリをクローンします。
   ```
   git clone https://example.com/advanced-django-postgresql-environment.git
   cd advanced-django-postgresql-environment
   ```

2. **環境変数の設定**:
   `.env`ファイルを作成し、必要な環境変数（例：データベースのユーザー名、パスワード）を設定します。

3. **Dockerイメージのビルド**:
   Docker Composeを使用して、必要なイメージをビルドします。
   ```
   docker-compose build
   ```

4. **コンテナの起動**:
   以下のコマンドでコンテナを起動し、開発環境を構築します。
   ```
   docker-compose up
   ```

5. **データベースマイグレーション**:
   Djangoのマイグレーションを実行してデータベーススキーマを更新します。
   ```
   docker-compose run web python manage.py migrate
   ```

6. **開発サーバーへのアクセス**:
   ブラウザを使用して `http://localhost:8000` にアクセスし、開発サーバーが正しく起動していることを確認します。

## プロジェクトの構成

- **Dockerfile**: DjangoアプリケーションのDockerイメージをビルドするためのファイル。
- **docker-compose.yml**: DjangoアプリケーションとPostgreSQLデータベースを含むサービスの定義。
- **requirements.txt**: Djangoアプリケーションが依存するPythonパッケージのリスト。

## 追加の開発ヒント

- 開発中にデータベースの内容をリセットしたい場合は、関連するDockerコンテナとボリュームを削除して再構築してください。
- セキュリティを考慮し、`.env` ファイルや `docker-compose.override.yml` を使用して、機密情報をソースコードから分離してください。
- チームメンバー間での開発環境の一貫性を保つために、Dockerイメージのバージョンを定期的に更新し、変更をドキュメントに反映させてください。

このREADMEは開発環境の基本的なセットアップと初期開発ステップをカバーしています。プロジェクトの進行に伴い、更なる詳細や進化するベストプラクティスに合わせて更新することをお勧めします。

# 2. Sample Django-PostgreSQL Project

このプロジェクトはDjangoを使用したWebアプリケーションで、PostgreSQLをデータベースとして利用します。Dockerを用いて開発環境を構築することで、環境依存の問題を最小限に抑え、チームメンバー間での環境の一貫性を保ちます。

## 主要技術

- **Django**: プロジェクトのWebフレームワーク
- **PostgreSQL**: データベースシステム
- **Docker**: 開発環境のコンテナ化
- **Docker Compose**: 複数のコンテナの定義と実行

## 開発環境のセットアップ

### 前提条件

- DockerとDocker Composeがシステムにインストールされていること。

### セットアップ手順

1. **プロジェクトのクローン**:
   ```
   git clone https://example.com/sample-django-postgresql-project.git
   cd sample-django-postgresql-project
   ```

2. **Dockerイメージのビルド**:
   DockerとDocker Composeを使用して、必要なイメージをビルドします。
   ```
   docker-compose build
   ```

3. **コンテナの起動**:
   ビルドしたイメージからコンテナを起動します。
   ```
   docker-compose up
   ```
   これで、DjangoアプリケーションとPostgreSQLデータベースが含まれるコンテナが起動します。

4. **データベースマイグレーション**:
   Djangoのマイグレーションを実行して、データベーススキーマを最新の状態にします。
   ```
   docker-compose run web python manage.py migrate
   ```

5. **開発サーバーへのアクセス**:
   ブラウザを開き、`http://localhost:8000`にアクセスして、Djangoアプリケーションが正しく起動していることを確認します。

## 追加情報

- **プロジェクトの構成**: このセクションでは、`Dockerfile`や`docker-compose.yml`、`requirements.txt`の概要を説明します。
- **開発中のヒント**: データベースの再起動、アプリケーションのデバッグ方法、依存関係の更新など、開発中に役立つヒントを提供します。
- **セキュリティと最適化**: 本番環境にデプロイする前に考慮すべきセキュリティ対策やパフォーマンス最適化に関するアドバイスを記載します。

このREADMEファイルはプロジェクトの基本的なセットアップと初期の開発ステップをカバーしています。プロジェクトの進行に伴って、詳細なドキュメントや追加のガイドを参照してください。

# 3. Python環境設定と実行方法

このドキュメントでは、Pythonの環境設定と実行方法について説明します。

## 目次

1. [pyenvでのPythonバージョンの指定](#1-pyenvでのpythonバージョンの指定)
2. [Python仮想環境の作成とアクティベーション](#2-python仮想環境の作成とアクティベーション)
3. [pipのアップデート](#3-pipのアップデート)
4. [仮想環境の停止](#4-仮想環境の停止)
5. [JupyterNotebookの実行環境を構築](#5-jupyternotebookの実行環境を構築)
6. [JupyterLabの実行環境を構築](#6-jupyterlabの実行環境を構築)
7. [VSCodeでmdファイルをプレビュー](#7-vscodeでmdファイルをプレビュー)

## 1. pyenvでのPythonバージョンの指定

指定したいPythonのバージョン（例：3.11.5）をpyenvを使用して指定します。

```bash
pyenv local 3.12.2
```

### 1.1 **注：** pyenvに指定したバージョンがない場合は、以下のコマンドでインストールします。

```bash
pyenv install 3.12.2
```

## 2. Python仮想環境の作成とアクティベーション
Pythonの仮想環境を作成します。
```bash
python -m venv .venv
```

### 2.1 Windowsでのアクティベーション
- パワーシェルの場合
```bash
.venv/Scripts/activate.ps1
```

- コマンドプロンプトの場合
```bash
.venv\Scripts\activate.bat
```

### 2.2 macOSでのアクティベーション

- 管理者権限の場合
```bash
source .venv/bin/activate
```

- 通常の場合
```bash
. .venv/bin/activate
```

## 3. pipのアップデート

仮想環境内のpipをアップデートします。

```bash
python -m pip install --upgrade pip
```
## 3.1 必要なパッケージのインストール

```bash
python -m pip install -r requirements.txt
```

## 4. djangoプロジェクトの作成
.をつけるとカレントディレクトリにプロジェクトが作成される。（余計にフォルダができない🌟）
```bash
django-admin startproject todoproject .
```

## 5. djangoアプリケーションの立ち上げ

```bash
python manage.py runserver
```
## 6. アプリケーションの作成

```bash
python manage.py startapp todo
```

## 7. templatesフォルダの作成

```bash
mkdir templates
```

## 5. DBへ登録するためにmigrationファイルを作成
```bash
python manage.py makemigrations
```

## 6. DBにmigrationファイルに記載した内容を登録
```bash
python manage.py migrate
```
## 7. 管理者ユーザーの作成
```bash
python manage.py createsuperuser
```
## 8. ListViewの作成
- Read(読み込む【情報を取る】)のためのViewを作成します。
- データの一覧をりすととして表示することに適したテンプレート

## 9. DetailViewの作成
- Read(読み込む【情報を取る】)のためのViewを作成します。
- データの一個一個の中身を表示することに適したテンプレート

## 11. BootStrapの導入
- まずは、[BootStrap](https://getbootstrap.jp/docs/4.3/getting-started/introduction/)の公式サイトから、[Starter template](https://getbootstrap.jp/docs/4.3/getting-started/introduction/#starter-template)をコピーして、list.htmlとdetail.htmlに貼り付けます。
- その後、[Components](https://getbootstrap.jp/docs/4.3/components/alerts/)をコピーして、list.htmlとdetail.htmlに貼り付けます。
- その後、[Utilities](https://getbootstrap.jp/docs/4.3/utilities/borders/)をコピーして、list.htmlとdetail.htmlに貼り付けます。

## 12. base.htmlの作成
![イメージ画像](img/1.png "サンプル")

## 13. CreateViewの作成
- Create(作成する【情報を登録する】)のためのViewを作成します。
- データを新しく作るときに適したテンプレート

## 14. DeleteViewの作成
- Delete(削除する【情報を削除する】)のためのViewを作成します。
- データを削除するときに適したテンプレート

## 15. UpdateViewの作成
- Update(更新する【情報を更新する】)のためのViewを作成します。
- データを更新するときに適したテンプレート

## 16. URLタグの設定
- URLタグを使って、リンクを作成します。

## 17. レイアウトなどの調整
- レイアウトなどを調整します。