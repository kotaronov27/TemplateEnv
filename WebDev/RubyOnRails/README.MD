
# 参考環境  

## 起動手順  

### 1. 作業ディレクトリを作成し、下記ファイルをそこへ移動する

※移動しないと大変なことになる。

* docker-compose.yml
* dockerfile
* src
* .env

### 2. .env のプロジェクト名を変更する

※デフォルトはcomposefile のあるディレクトリ名

```shell:.env
COMPOSE_PROJECT_NAME=rubytestenv
```

### 3. rails new を実行する

```shell
docker-compose run web rails new . --force --database=mysql --skip-bundle
```

### 4. ./config/database.yml を次のように変更する

```yml:database.yml
default: &default
  adapter: mysql2
  encoding: utf8
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  username: root
  password: password # docker-compose.ymlのMYSQL_ROOT_PASSWORD
  host: db # docker-compose.ymlのservice名
```

### 5. build

```shell
# build
docker-compose build

# up
docker-compose up -d

# db create
docker-compose run web rails db:create
```

### 6. VSCode でattachする

## ディレクトリ構成

```note
sampleApp ---- Dockerfile
           |-- docker-compose.yml
           |
           |-- src -- |-- app
                      |-- bin
                      |-- config
                      |-- db
                      |-- lib
                      |-- log
                      |-- public
                      |-- storage
                      |-- test
                      |-- tmp
                      |-- vendor
                      |-- config.ru
                      |-- Gemfile
                      |-- Gemfile.lock
                      |-- README.md
                      |-- Rakefile
```

## ※ 本環境とは無関係

|app|version|
|:---|:---|
|UbuntuServer|16.04LTS|
|Ruby|2.4.5|
|Rails|5.2.0|
|Bootstrap|3.3.7|
|jQuery|3.2.1|
|Unicorn|5.4.1|
|PHP|7.0.33|
|ImageMagick|6.8.9.9|
|SQLite|3.11.0|
|vsftpd|3.0.3|
|Nginx|1.10.3|
|netcat|1.10.41|
|fcgiwrap|1.1.0|

## 参考にした記事（SpecialThanks!!）

 [丁寧すぎるDocker-composeによるrails5 + MySQL on Dockerの環境構築(Docker for Mac)](https://qiita.com/azul915/items/5b7063cbc80192343fc0)
