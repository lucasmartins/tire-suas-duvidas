class Vote
  include Mongoid::Document
  include Mongoid::Timestamps
  field :up, type: Boolean
  belongs_to :user
  belongs_to :answer

  validates :answer, :user, :up, :presence => true
end
