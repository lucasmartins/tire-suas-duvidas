class Answer
  include Mongoid::Document
  field :content, type: String
  field :up_votes, type: Integer
  field :down_votes, type: Integer

  belongs_to :question
  belongs_to :user

  validates :content, :user, :question, :presence => true

  def votes
    return self.up_votes-self.down_votes    
  end
end
