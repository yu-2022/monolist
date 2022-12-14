# テーブル設計

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| user_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| user_text          | text   |                           |

### Association

- has_many :lists
- has_many :items
- has_many :favorites
- has_many :follows

## listsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| list_name  | string     | null: false                    |
| list_text  | text       |                                |
| privacy_id | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :items
- has_many :favorites

## itemsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| item_name | string     | null: false                    |
| item_text | text       |                                |
| item_date | date       |                                |
| user      | references | null: false, foreign_key: true |
| list      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :list
- has_many :tags, through :tag_maps

## favoritesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| list   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :list

## tagsテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| tag_name  | string     | null: false                    |

### Association

- has_many :items, through :tag_maps

## tag_mapsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| item   | references | null: false, foreign_key: true |
| tag    | references | null: false, foreign_key: true |

### Association

- has_many :items
- has_many :tags

## followsテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| follower | references | null: false, foreign_key: true |
| followed | references | null: false, foreign_key: true |

### Association

- belongs_to :user