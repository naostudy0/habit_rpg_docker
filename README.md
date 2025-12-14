# Habit RPG Docker

自己管理型RPG風アプリ（Habit RPG）のDockerコンテナ環境です。  
Laravel、Flutterの利用を想定しており、MySQL、phpMyAdmin、Ollama（LLM）を含む開発環境になります。



## 構成

- **バックエンド**: Laravel 12（API サーバー）
- **フロントエンド**: Flutter（モバイルアプリ）
- **LLM連携**: Ollama（ローカル LLM API、モデルは Llama3 を想定）
- **インフラ**: Docker + Apache + MySQL + PHP + phpMyAdmin

## ディレクトリ構成

```
habit_rpg_docker/
├── backend/ # Dockerfile や Apache 設定
│ ├── apache/ # Apache仮想ホスト設定
│ ├── html/ # Laravelアプリケーション格納ディレクトリ
│ │ └── habit_rpg_api/
│ └── Dockerfile
├── frontend/ # Flutterアプリ（habit_rpg_app）
├── llm/ # LLM関連のログなどを格納
├── docker-compose.yml
└── .env # 設定ファイル
```

## 初期設定

プロジェクト初回セットアップ時は、以下の手順で Docker 用の環境変数や初期構築を行います。


### 1. `.env` の作成（Docker 用）

プロジェクトルート直下の`.env.example` をコピーして `.env` ファイルを作成します。

```bash
cp .env.example .env
```

`.env.example`には以下の設定が含まれています：

- **MySQLコンテナ設定**: `MYSQL_ROOT_PASSWORD`, `DB_DATABASE`, `DB_USERNAME`, `DB_PASSWORD`
- **phpMyAdmin設定**: `PMA_PORT`

この`.env`ファイルの内容は`docker-compose.yml`の`environment:`セクションに反映されます。

MySQLコンテナの初回起動時に、以下の処理が自動実行されます：
- `DB_DATABASE`で指定したデータベース（初期値: `habit_rpg`）が自動作成されます
- `DB_USERNAME`で指定したユーザー（初期値: `habit_rpg`）が自動作成され、そのデータベースへの全権限が付与されます

### 2. Docker イメージのビルドと起動

```
docker compose up --build -d
```

### 3. Ollama モデルの取得（初回のみ）

#### Llama3 の場合
```
docker exec -it ollama_container ollama pull llama3
```