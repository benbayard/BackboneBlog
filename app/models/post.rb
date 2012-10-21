class Post < ActiveRecord::Base
  attr_accessible :body, :title, :flair, :summary
  acts_as_commentable

  has_attached_file :flair, :styles => {:header => "750x280"}

  validates :body, presence: true
  validates :title, presence: true

  def flair_url
    flair.url(:header)
  end

  def post_date
    created_at.strftime("%A, %b %d")
  end
end
