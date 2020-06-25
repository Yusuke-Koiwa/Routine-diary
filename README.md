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
### 開発環境
Docker ( MySQL / Nginx / puma )
### 本番環境
MySQL / Nginx / Unicorn   
AWS ( EC2 / S3 / Route53 / ELB / CloudFront / CloudWatch / SNS )  
CircleCI ( RuboCop → Rspec → Capistranoによる自動デプロイ )  

## アプリケーションの機能一覧
- アカウント登録 / ログイン機能 ( devise )
- 管理ユーザー機能
- 記事の一覧 / 詳細表示・投稿・編集・削除機能
- ページネーション機能 ( kaminari, jScroll )
- カレンダー上に投稿を一覧表示する機能 ( simple calendar )
- 画像アップロード機能 ( CarrierWave )
- 投稿の検索機能 ( ransack )
- 投稿のカテゴリー別表示機能
- コメント機能
- いいね機能 ( 非同期通信 )
- フォロー機能 ( 非同期通信 )
- 通知機能

## 使用イメージ
1. マイページにカレンダーが表示されます。まずは画面上部から習慣にしたいことを設定します。  
<img width="45%" alt="1_マイページ" src="https://user-images.githubusercontent.com/63847712/84460139-1d098a80-aca4-11ea-9602-172f38f3ac35.png"> <img width="45%" alt="2_習慣設定" src="https://user-images.githubusercontent.com/63847712/84460741-acfc0400-aca5-11ea-83dd-b5c037406bf9.png">  
  
2. 日付をクリックし、習慣を実行できたか毎日記録していきます。  
<img width="45%" alt="4_実績入力" src="https://user-images.githubusercontent.com/63847712/84461071-82f71180-aca6-11ea-9f67-911ad47d6cee.png"> <img width="45%" alt="5_実績入力後" src="https://user-images.githubusercontent.com/63847712/84461556-b4241180-aca7-11ea-8a0b-6dab58a8324c.png">  
  
3. 先ほどの投稿が一覧ページに公開されます。ここで他ユーザーの投稿を確認することができます。<br>そこからユーザーの活動を確認してフォローしたり、投稿にコメントやグッジョブ（いいね）をすることができます。<br><img width="45%" alt="6_投稿後トップページ" src="https://user-images.githubusercontent.com/63847712/84461632-e5044680-aca7-11ea-9b17-59f9bda03268.png"> <img width="45%" alt="9_コメント" src="https://user-images.githubusercontent.com/63847712/84463367-842b3d00-acac-11ea-8af9-64c7964f77e9.png">

## 今後の開発予定
- グループ機能
- 継続日数ランキング機能
- ~開発環境にDockerを導入~ → 6/16 実装完了
- ~CircleCIでCI/CDパイプライン構築~ → 6/20 実装完了
- 本番環境にDockerを導入
- フロントエンドにVue.jsもしくはReactを使用

## インフラ構成図
<img width="75%" alt="infrastructure" src="https://user-images.githubusercontent.com/63847712/85555785-383fa700-b661-11ea-88ae-7efc0fa6ca80.png">

## DB設計
<img width="75%" alt="DB設計" src="https://user-images.githubusercontent.com/63847712/84472801-de36fd00-acc2-11ea-8874-164cb5a262f8.png">
