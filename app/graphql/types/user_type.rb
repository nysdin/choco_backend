module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :email, String, null: false
    field :nick_name, String, null: true
    field :image, String, null: true
    field :evaluation, Integer, null: false
    field :listed_merchandises, [Types::MerchandiseType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
