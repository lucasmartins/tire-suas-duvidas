class Question
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :content, type: String
  field :hits, type: Integer

  has_many :answers
  belongs_to :user

  validates :title, :content, :user, :presence => true

  def hit
    if self.hits==nil
      self.hits=0
    end
    self.hits+=1
    save
  end
end
