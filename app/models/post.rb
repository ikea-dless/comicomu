class Post < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 32 }
  validates :body, presence: true, length: { maximum: 1000 }
  validates :deadline_at, presence: true

  enum status: { progressing: 0, completed: 1, closed: 2 }
end
