# アプリ名： Continue!
ユーザー同士で繋がりながら、毎日の習慣を楽しく継続することを目的としたアプリケーションです。    
作品URL: https://www.routine-app.xyz/

# 使用技術
## バックエンド
Ruby / Ruby on Rails
## フロントエンド
Haml / SCSS / jQuery
## 環境
DB: MySQL  
Webサーバー: Nginx  
Appサーバー: Unicorn  
インフラ関係: AWS ( EC2 / S3 / Route53 / ACM / ELB )  
デプロイ: Capistrano

# アプリケーションの機能一覧
- アカウント登録 / ログイン機能 (devise)
- 管理ユーザー機能
- 記事の一覧 / 詳細表示・投稿・編集・削除機能
- ページネーション機能 (kaminari)
- カレンダー上で投稿を作成・一覧表示する機能 (simple calendar)
- 画像アップロード機能 (CarrierWave)
- 投稿の検索機能 (ransack)
- 投稿のカテゴリー別表示機能
- コメント機能
- いいね機能
- フォロー機能
- 通知機能
