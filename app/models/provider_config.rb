class ProviderConfig
  include Mongoid::Document
  include Mongoid::Timestamps
  #extend Destroyer
  field :name, type: String
  field :label, type: String
  field :key, type: String
  field :secret, type: String

  validates :name, :key, :secret, :presence => true
end