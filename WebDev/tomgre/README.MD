# 手順
\> cd docker-compose.xmlがあるディレクトリ

\> docker-compose build

\> docker network create xxxxnetwork

\> docker-compose up -d

http://localhost:18080/WEBAPPNAME


# docker-compose.yaml について
```
version: '3'
services:
  db1:
    image: postgres:11-alpine
    container_name: xxxxdb1
    build: .
    ports:
    #使用ポートのホスト側：VM側
      - 15432:5432 #外：内
    environment:
    #Passwordを特定のものにする場合、
    #初期処理でSQLを実行する際にシェルスクリプトや、
    #SQLファイルの中にパスワードを書き込む必要が出てくるため、
    #次の手順が必要。
    #１．手動で初期化を行う。
    #２．永続化処理をする。
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: admin
      POSTGRES_DB: xxxx
    volumes:
#      - db_data:/var/lib/postgresql/data # 永続化
      - ./dockerinit:/docker-entrypoint-initdb.d
    networks:
      - xxxxnetwork
#volumes: # 永続化
#  db_data: {} # 永続化

```

# docker の操作について
## 起動
```
docker-compose up -d
```

## 終了
```
docker-compose down
```

## ボリューム削除して終了
```
docker-compose down -v
```

## 接続
```
docker-compose exec db1 bash
```
## バックアップ例
### 構造ごと
pg_dump -d xxxx -U admin -Ft > /docker-entrypoint-initdb.d/xxxx.tar
### データのみ
pg_dump -a -d xxxx -U admin -Ft > /docker-entrypoint-initdb.d/xxxx.tar

#### host　→ コンテナ
```text:db
ドメイン：localhost
ポート：15432
```
```text:tomcat
ドメイン：localhost
ポート：18080
```

#### コンテナ　→ コンテナ
```text:db
ドメイン：xxxxdb1
ポート：5432
```
```text:tomcat
ドメイン：xxxxtomcat
ポート：8080
```
