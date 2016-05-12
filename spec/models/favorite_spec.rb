require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'ActiveModel' do
    it { is_expected.to validate_presence_of :user_id }
    it { is_expected.to validate_presence_of :post_id }
  end

  describe 'ActiveRecord' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :post }
  end
end
