# 手順
> cd docker-compose.xmlがあるディレクトリ
> docker-compose build
> docker network create zabbixnw
> docker-compose up -d
http://localhost:11922/xxxx-WEB

# docker-compose.yaml について
```

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
### alpine 
docker-compose exec コンテナ名 sh

### other
docker-compose exec コンテナ名 bash
```

## Docker network
### 検索
docker network ls

### 作成
docker network create ネットワーク名

## バックアップ例
### 構造ごと
pg_dump -d xxxx -U admin -Ft > /docker-entrypoint-initdb.d/xxxxdbback.tar
### データのみ
pg_dump -a -d xxxx -U admin -Ft > /docker-entrypoint-initdb.d/xxxxdbback.tar