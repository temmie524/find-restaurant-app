# 環境構築

## docker compose v2の利用
1. ビルド
```
docker compose build
```

2. 立ち上げ
```
docker compose up
```

3. dbの作成
```
docker compose run web rails db:create
```
4. dbのマイグレーション
```
docker compose run web rails db:migrate
```