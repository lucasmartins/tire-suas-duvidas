class Answer
  include Mongoid::Document
  field :content, type: String

  belongs_to :question
end
