#!/bin/sh

set -e

echo `date '+%y/%m/%d %H:%M:%S'`
echo "---------SQL Start---------"
psql -d yyyy -U admin << EOSQL

-- SQLを実行する
\i /docker-entrypoint-initdb.d/SQL/init_pmdb.sql

EOSQL

# 初期データリストア
pg_restore -c -d yyyy -U admin -Ft /docker-entrypoint-initdb.d/xxxx.tar

echo `date '+%y/%m/%d %H:%M:%S'`
echo "---------SQL Finished---------"

