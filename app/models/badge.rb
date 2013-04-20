class Badge
  include Mongoid::Document
  include Mongoid::Timestamps
  field :name, type: String
  field :logo, type: String
  field :rule, type: String
end
