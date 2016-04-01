class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :post_id, presence: true

  validates_acceptance_of :value
  attr_accessor :value
  after_find { @value = '1' } # true
end
