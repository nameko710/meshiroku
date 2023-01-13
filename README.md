# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

- has_many :fridges
- has_many :eats

## fridges テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | -------------------------------|
| food    | string     | null: false                    |
| amount  | integer    | null: false                    |
| unit    | string     | null: false                    |
| price   | integer    | null: false                    |
| user    | references | null: false, foreign_key: true |

- belongs_to :user

## eats テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| total_price | integer    | null: false                    |
| comment     | text       |                                |
| date        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

-belongs_to :user


* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
