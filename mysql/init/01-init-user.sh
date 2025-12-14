#!/bin/bash
# MySQL初期化スクリプト
# このスクリプトはMySQLコンテナの初回起動時に自動実行されます

# 環境変数から値を取得
DB_USERNAME=${DB_USERNAME:-habit_rpg}
DB_PASSWORD=${DB_PASSWORD:-}

# MySQLに接続してユーザーを作成
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" -e \
  "CREATE USER IF NOT EXISTS '${DB_USERNAME}'@'%' IDENTIFIED WITH mysql_native_password BY '${DB_PASSWORD}'; \
   GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${DB_USERNAME}'@'%'; \
   FLUSH PRIVILEGES;"
