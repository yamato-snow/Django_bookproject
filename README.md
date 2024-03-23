# 簡易Python環境構築

## 概要
このプロジェクトはPythonを使用したサンプルアプリケーションです。Dockerを利用して環境を構築し、ローカルで容易に実行できます。

## 前提条件
- Dockerがインストールされていること。
- Docker Composeがインストールされていること。

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
├─src
│      main.py
│
└─tests
```

## 実行手順

1. **プロジェクトのクローン**

    まず、このプロジェクトをあなたのローカルシステムにクローンします。
    ```
    git clone <プロジェクトのURL>
    ```
    クローンしたディレクトリに移動します。
    ```
    cd <プロジェクト名>
    ```

2. **Dockerイメージのビルド**

    プロジェクトのルートディレクトリから、Dockerイメージをビルドします。以下のコマンドを実行してください。
    ```
    docker-compose -f .docker/docker-compose.yml build
    ```

3. **コンテナの起動**

    Dockerイメージのビルドが完了したら、コンテナを起動します。
    ```
    docker-compose -f .docker/docker-compose.yml up
    ```

    コンテナをバックグラウンドで実行したい場合は、コマンドに`-d`フラグを追加します。
    ```
    docker-compose -f .docker/docker-compose.yml up -d
    ```

4. **アプリケーションの停止とクリーンアップ**

    アプリケーションの実行を停止し、コンテナを削除するには、次のコマンドを実行します。
    ```
    docker-compose -f .docker/docker-compose.yml down
    ```

## 注意事項
- この手順は、プロジェクトのディレクトリ構造や設定が予め指定された通りであることを前提としています。
- 必要に応じて、`.env`ファイルを作成し、環境変数を設定してください。

以下は、`.env`ファイルを含む更新されたディレクトリ構造の例です。

```
C:.
│  .gitignore              # Gitの無視ファイルリスト
│  README.md               # プロジェクトの説明
│  requirements.txt        # Pythonの依存関係リスト
│  .env                    # 環境変数設定ファイル <-- ここに配置
│
├─.docker
│      docker-compose.yml  # Docker Compose設定ファイル
│      Dockerfile          # Dockerイメージのビルド指示ファイル
│
├─src
│      main.py             # アプリケーションのメインスクリプト
│
└─tests
    # テストスクリプト（ここに配置されます）
```

`.env`ファイルをプロジェクトのルートディレクトリに配置することで、`docker-compose.yml`がデフォルトでその場所から環境変数を読み込むことができます。このファイルを使用することで、データベースの接続情報、APIキー、その他の機密情報など、開発、テスト、本番環境に特有の設定を管理できます。また、`.env`ファイルはプライバシーを保護するために、バージョン管理システム（例: Git）から除外すべきです。これは、`.gitignore`ファイルに`.env`を追加することで達成できます。

### 重要:
- `.env`ファイルは機密情報を含む可能性があるため、外部に公開しないようにしてください。
- 環境ごとに異なる`.env`ファイルを持つ場合（例：`.env.production`、`.env.development`）、適切なファイルが各環境で読み込まれるように設定する必要があります。これは`docker-compose.yml`やアプリケーションの起動スクリプトで管理できます。