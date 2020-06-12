## アプリ名： Continue!
ユーザー同士で繋がりながら、毎日の習慣を楽しく継続することを目的としたアプリケーションです。    
作品URL: https://www.routine-app.xyz/

## 使用技術
### バックエンド
Ruby / Ruby on Rails
### フロントエンド
Haml / SCSS / jQuery
### 環境
DB: MySQL  
Webサーバー: Nginx  
Appサーバー: Unicorn  
インフラ関係: AWS ( EC2 / S3 / Route53 / ACM / ELB )  
デプロイ: Capistrano

## アプリケーションの機能一覧
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

## 使用イメージ
1. マイページ上部から、習慣にしたいことを設定します。  
<img width="33%" alt="1_マイページ" src="https://user-images.githubusercontent.com/63847712/84460139-1d098a80-aca4-11ea-9602-172f38f3ac35.png"> <img width="33%" alt="2_習慣設定" src="https://user-images.githubusercontent.com/63847712/84460741-acfc0400-aca5-11ea-83dd-b5c037406bf9.png"> <img width="33%" alt="3_習慣設定後" src="https://user-images.githubusercontent.com/63847712/84460837-e7fe3780-aca5-11ea-8e05-9c90e179aaf6.png">  
  
2. 日付をクリックし、習慣を実行できたか記録します。  
<img width="33%" alt="4_実績入力" src="https://user-images.githubusercontent.com/63847712/84461071-82f71180-aca6-11ea-9f67-911ad47d6cee.png"> <img width="33%" alt="5_実績入力後" src="https://user-images.githubusercontent.com/63847712/84461556-b4241180-aca7-11ea-8a0b-6dab58a8324c.png">  
  
3. 先ほどの投稿が一覧ページに公開されます。ここで他ユーザーの投稿を確認することができます。<br>そこからユーザーの活動を確認してフォローしたり、投稿にコメントやグッジョブ（いいね）をすることができます。<br><img width="33%" alt="6_投稿後トップページ" src="https://user-images.githubusercontent.com/63847712/84461632-e5044680-aca7-11ea-9b17-59f9bda03268.png"> <img width="33%" alt="8_ユーザー詳細" src="https://user-images.githubusercontent.com/63847712/84462942-437ef400-acab-11ea-9dd5-af15bd80c2d7.png"> <img width="33%" alt="9_コメント" src="https://user-images.githubusercontent.com/63847712/84463367-842b3d00-acac-11ea-8af9-64c7964f77e9.png">
