require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'ActiveModel' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to ensure_length_of(:title).is_at_most(32) }

    it { is_expected.to validate_presence_of :body }
    it { is_expected.to ensure_length_of(:body).is_at_most(1000) }
  end

  describe 'ActiveModel' do
    it { is_expected.to belong_to :user }
  end
end
