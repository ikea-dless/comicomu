class Comment < ActiveRecord::Base
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  validates :post_id, presence: true
  validates :username, presence: true
  validates :content, presence: true, length: { maximum: 1000 }
end
