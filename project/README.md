# Djangoのコマンド一覧

## 1. djangoプロジェクトの作成
```
django-admin startproject bookproject .
```

## 2. djangoアプリケーションの作成
```
python manage.py startapp book
```

## 3. DBへ登録するためにmigrationファイルを作成
```
python manage.py makemigrations
```

## 4. DBにmigrationファイルに記載した内容を登録
```
python manage.py migrate
```

## 5. 管理者ユーザーの作成
```
python manage.py createsuperuser
```