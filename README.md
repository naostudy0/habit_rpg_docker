# Habit RPG Docker

自己管理型RPG風アプリ（Habit RPG）のDockerコンテナ環境です。  
Laravel、Flutterの利用を想定しており、MySQL、phpMyAdmin、Ollama（LLM）を含む開発環境になります。



## 構成

- **バックエンド**: Laravel 12（API サーバー）
- **フロントエンド**: Flutter（モバイルアプリ）
- **LLM連携**: Ollama（ローカル LLM API、モデルは Llama3 または Nous Hermes2）
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

プロジェクトルート直下の`.env.example` をコピーして `.env` ファイルを作成し、以下の内容を記載します。

```dotenv
# MySQL
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=

MYSQL_ROOT_PASSWORD=password
MYSQL_DATABASE=laravel

# phpMyAdmin
PMA_PORT=3306
```
この .env は docker-compose.yml の environment: セクションに反映されます。

### 2. Docker イメージのビルドと起動

```
docker compose up --build -d
```

### 3. Ollama モデルの取得（初回のみ）

#### Llama3 の場合
```
docker exec -it ollama_container ollama pull llama3
```