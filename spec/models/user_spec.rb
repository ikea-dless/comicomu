require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ActiveModel' do
    it { is_expected.to validate_presence_of :username }
    it { is_expected.to validate_uniqueness_of :username }
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of :email }
    it { is_expected.to validate_presence_of :password }
  end

  describe 'ActiveRecord' do
    it { is_expected.to have_many :posts }
    it { is_expected.to have_many :favorites }
  end
end
