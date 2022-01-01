# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

# How To Deploy To Production

本番環境には AWS を使用しています。
一部を除くリソースについては CloudFormation を使用して構築しています。

現状、常時本番環境にてアプリケーションを稼働させるのはお金の面で辛いので使用していない時は CloudFormation の Stack を削除することでリソースの削除を行なっています。

常時残しているリソースとして、VPN、Subnet、RouteTable、SecurityGroup、Internet Gateway があります

デプロイをする際は、まず ECS on Fargate でアプリケーションを起動するための`cfn-ecs.yaml`という Stack を CFn より作成します

次に、CFn での作成を行なっていないデプロイ用の Application、Deployment Groups を作成します（Deployment Group の作成には、先ほど構築した中に含まれるロードバランサー、ターゲットグループ、ECS クラスター、ECS サービスが必要になります）

これらの手動でのリソース作成を行った後に、CI/CD 用の Stack を`cfn-cicd.yaml`ファイルより作成します

この Stack 作成時にパラメータ入力が必要となりますが、これらは手動で作成した Deployment Group の名前や AWS に存在する CodeCommit のリポジトリ名を入力してください（入力内容をデフォルトで設定しているので、基本的にはデフォルト内容に従って各種リソースを作成してください）

デプロイ制御として Blue/Green Deployment を採用しています

デプロイを完了する前にテストリスナーにてデプロイしているアプリケーションの挙動を確認することができるので確認したい動作がある場合はテストリスナーより確認することができます

デプロイが完了した後も旧バージョンのアプリケーションは残っているので何か不具合が発生した場合はロールバックすることが可能です
