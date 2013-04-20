class Question
  include Mongoid::Document
  field :title, type: String
  field :content, type: String
  field :hits, type: Integer

  has_many :answers 
end
