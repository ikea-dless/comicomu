require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'ActiveModel' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
  end

  describe 'ActiveModel' do
    it { is_expected.to belong_to :user }
  end
end
