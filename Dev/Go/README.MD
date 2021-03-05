# 手順

``` shell:
\> cd docker-compose.xmlがあるディレクトリ

\> docker-compose build

\> docker network create xxxxnetwork

\> docker-compose up -d
```

## dockercompose の操作について

### 起動

``` shell:
docker-compose up -d
```

### 終了

``` shell:
docker-compose down
```

### ボリューム削除して終了

``` shell:
docker-compose down -v
```

### 接続

``` shell:
docker-compose exec db1 bash
```
