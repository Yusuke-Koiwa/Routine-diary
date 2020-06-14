## アプリ名： Continue!
毎日の習慣を楽しく継続することをテーマにしたアプリケーションです。    
作品URL: https://www.routine-app.xyz/

## 制作背景
何かを継続して続けるのはとても素晴らしいことです。<br>
しかし、一人でコツコツ続けるのはモチベーションが続き辛く、仲間を見つけようと思っても、同じ習慣を身につけようとしている人達は身近に中々いないものです。<br>
そこで、日々の活動を記録として残しながら、それらをインターネットを通じて誰かと共有することで、楽しく習慣化が出来るのではないかと考え、このアプリを制作しました。<br>

## 使用技術
### バックエンド
Ruby / Ruby on Rails
### フロントエンド
Haml / SCSS / JavaScript / jQuery
### 環境
MySQL / Nginx / Unicorn / Capistrano  
AWS ( EC2 / S3 / Route53 / ACM / ELB )  

## アプリケーションの機能一覧
- アカウント登録 / ログイン機能 (devise)
- 管理ユーザー機能
- 記事の一覧 / 詳細表示・投稿・編集・削除機能
- ページネーション機能 (kaminari)
- カレンダー上に投稿を一覧表示する機能 (simple calendar)
- 画像アップロード機能 (CarrierWave)
- 投稿の検索機能 (ransack)
- 投稿のカテゴリー別表示機能
- コメント機能
- いいね機能 (非同期通信)
- フォロー機能 (非同期通信)
- 通知機能

## 使用イメージ
1. マイページにカレンダーが表示されます。まずは画面上部から習慣にしたいことを設定します。  
<img width="33%" alt="1_マイページ" src="https://user-images.githubusercontent.com/63847712/84460139-1d098a80-aca4-11ea-9602-172f38f3ac35.png"> <img width="33%" alt="2_習慣設定" src="https://user-images.githubusercontent.com/63847712/84460741-acfc0400-aca5-11ea-83dd-b5c037406bf9.png"> <img width="33%" alt="3_習慣設定後" src="https://user-images.githubusercontent.com/63847712/84460837-e7fe3780-aca5-11ea-8e05-9c90e179aaf6.png">  
  
2. 日付をクリックし、習慣を実行できたか毎日記録していきます。  
<img width="33%" alt="4_実績入力" src="https://user-images.githubusercontent.com/63847712/84461071-82f71180-aca6-11ea-9f67-911ad47d6cee.png"> <img width="33%" alt="5_実績入力後" src="https://user-images.githubusercontent.com/63847712/84461556-b4241180-aca7-11ea-8a0b-6dab58a8324c.png">  
  
3. 先ほどの投稿が一覧ページに公開されます。ここで他ユーザーの投稿を確認することができます。<br>そこからユーザーの活動を確認してフォローしたり、投稿にコメントやグッジョブ（いいね）をすることができます。<br><img width="33%" alt="6_投稿後トップページ" src="https://user-images.githubusercontent.com/63847712/84461632-e5044680-aca7-11ea-9b17-59f9bda03268.png"> <img width="33%" alt="8_ユーザー詳細" src="https://user-images.githubusercontent.com/63847712/84462942-437ef400-acab-11ea-9dd5-af15bd80c2d7.png"> <img width="33%" alt="9_コメント" src="https://user-images.githubusercontent.com/63847712/84463367-842b3d00-acac-11ea-8af9-64c7964f77e9.png">

## 今後の開発予定
- グループ機能
- 継続日数ランキング機能
- 開発環境にDockerを導入
- CircleCIでCI/CDパイプライン構築
- フロントエンドにVue.jsもしくはReactを使用
## DB設計
<img width="75%" alt="DB設計" src="https://user-images.githubusercontent.com/63847712/84472801-de36fd00-acc2-11ea-8874-164cb5a262f8.png">
