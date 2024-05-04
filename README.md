# 簡易Python環境構築

## 概要
このプロジェクトはPythonを使用したサンプルアプリケーションです。Dockerを利用して環境を構築し、ローカルで容易に実行できます。

### projectディレクトリについて
コンテナ起動中、`project`ディレクトリのみがコンテナ内の`/usr/src/app`にマウントされます。

これにより、`project`ディレクトリ内でのファイル編集がリアルタイムでコンテナ内に反映され、効率的な開発が可能となります。

## 前提条件
- Gitがインストールされていること。
- Docker Desktopがインストールされていること。

## プロジェクトの構成
```
C:.
│  .gitignore
│  README.md
│  requirements.txt
│
├─.docker
│      docker-compose.yml
│      Dockerfile
│
├─project
│      README.md
│      requirements.txt
│
└─tests
        test.py
```

## 実行手順

1. **プロジェクトのクローン**

    まず、このプロジェクトをあなたのローカルシステムにクローンします。
    ```
    git clone https://github.com/yamato-snow/Django_study_Docker.git <プロジェクト名>
    ```
    クローンしたディレクトリに移動します。
    ```
    cd <プロジェクト名>
    ```

2. **ディレクトリの移動**

    プロジェクトのルートディレクトリに移動します。
    ```
    cd <プロジェクト名>
    ```

3. **リポジトリの紐づけを変更**
    
    リポジトリの紐づけを変更します。
    ```
    git remote set-url origin <新しいリポジトリのURL>
    ```

    ※変更されたか確認する場合は、次のコマンドを実行します。
    ```
    git remote -v
    ```

4. **リポジトリの変更をプッシュ**

    リポジトリの変更をプッシュします。
    ```
    git push -u origin main
    ```

5. **Dockerイメージのビルド**

    プロジェクトのルートディレクトリから、Dockerイメージをビルドします。
    ```
    docker-compose -f .docker/docker-compose.yml build
    ```

6. **コンテナの起動**

    Dockerイメージのビルドが完了したら、コンテナを起動します。
    ```
    docker-compose -f .docker/docker-compose.yml up -d
    ```

7. **bashの実行**

    bashの実行をするためには、次のコマンドを実行します。
    ```
    docker exec -it <コンテナ名> bash
    ```
    ※コンテナ名は、`docker container ls -a`コマンドで確認できます。

    ※bashを出る場合は、次のコマンドを実行します。
    ```
    exit
    ```

8. **アプリケーションの停止とクリーンアップ**

    アプリケーションの実行を停止し、コンテナを削除するには、次のコマンドを実行します。
    ```
    docker-compose -f .docker/docker-compose.yml down
    ```

## ※補足１：各種コマンド

1. **Docker環境下**

    Dockerのコンテナを確認

    ```
    docker container ls -a 
    ```

    Dockerのイメージを確認
    ```
    docker images ls -a
    ```

    Dockerのボリュームを確認
    ```
    docker volume ls
    ```

2. **bash環境下（Djangoコマンド）**

    Djangoプロジェクトの作成
    ```
    django-admin startproject <プロジェクト名> .
    ```

    Djangoアプリケーションの作成
    ```
    python manage.py startapp <アプリ名>
    ```

    Djangoのマイグレーション
    ```
    python manage.py makemigrations
    python manage.py migrate
    ```

    Djangoのスーパーユーザー作成
    ```
    python manage.py createsuperuser
    ```

    Djangoの開発サーバー起動
    ```
    python manage.py runserver 0.0.0.0:8000
    ```

## ※補足２：docker-compose.ymlについて
docker-compose.ymlファイルにおけるサービス名とコンテナ名の競合に関するケースを示した表です。

| ケース                                                                         | 許容される |
|------------------------------------------------------------------------------|--------|
| 同じdocker-compose.ymlファイル内で、サービス名が同じでコンテナ名が同じ                              | ×      |
| 同じdocker-compose.ymlファイル内で、サービス名が同じでコンテナ名が異なる                              | ×      |
| 同じdocker-compose.ymlファイル内で、サービス名が異なりコンテナ名が同じ                               | ○      |
| 同じdocker-compose.ymlファイル内で、サービス名が異なりコンテナ名が異なる                              | ○      |
| 異なるdocker-compose.ymlファイル間で、サービス名が同じでコンテナ名が同じ                              | ×      |
| 異なるdocker-compose.ymlファイル間で、サービス名が同じでコンテナ名が異なる                             | ○      |
| 異なるdocker-compose.ymlファイル間で、サービス名が異なりコンテナ名が同じ                              | ×      |
| 異なるdocker-compose.ymlファイル間で、サービス名が異なりコンテナ名が異なる                             | ○      |

### まとめ
- 同じdocker-compose.ymlファイル内では、サービス名の競合は許容されない。
- 同じdocker-compose.ymlファイル内では、コンテナ名の競合は許容される。
- 異なるdocker-compose.ymlファイル間では、サービス名の競合は許容される。
- 異なるdocker-compose.ymlファイル間では、コンテナ名の競合は許容されない。

## ※補足３：project/requirements.txtについて
`project/requirements.txt`ファイルには、Pythonプロジェクトで使用するパッケージを記述します。

例えば、Pandasを使用する場合、`project/requirements.txt`ファイルには次のように記述します。

```requirements.txt
pandas==1.3.3
```

インストールする場合は、次のコマンドを実行します。

```
pip install -r requirements.txt
```