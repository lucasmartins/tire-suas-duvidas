class Provider
  include Mongoid::Document
  include Mongoid::Timestamps
  extend Destroyer
  field :name, type: String
  field :email, type: String
  field :uid, type: String
  field :oauth_token, type: String
  field :oauth_expires_at, type: Time

  belongs_to :user
end