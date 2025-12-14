#!/bin/bash
# MySQL初期化スクリプト
# このスクリプトはMySQLコンテナの初回起動時に自動実行されます

# 環境変数から値を取得
DB_USERNAME=${DB_USERNAME:-habit_rpg}
DB_PASSWORD=${DB_PASSWORD:-}

# MySQLに接続してユーザーを作成
mysql -uroot -p"${MYSQL_ROOT_PASSWORD}" <<EOF
-- アプリケーション用の専用ユーザーを作成
CREATE USER IF NOT EXISTS '${DB_USERNAME}'@'%' IDENTIFIED WITH mysql_native_password BY '${DB_PASSWORD}';

-- データベースへの全権限を付与
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${DB_USERNAME}'@'%';

-- 権限の変更を反映
FLUSH PRIVILEGES;
EOF
