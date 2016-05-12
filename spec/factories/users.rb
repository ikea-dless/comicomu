FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}" }
    sequence(:email) { |n| "testuser#{n}@example.com" }
    password 'password'
    password_confirmation 'password'

    factory :noname do
      username nil
    end

    factory :noemail do
      email nil
    end

    factory :nopassword do
      password nil
      password_confirmation nil
    end

    factory :shortpassword do
      password 'ABC'
      password_confirmation 'ABC'
    end

    factory :longpassword do
      password 'ABC' * 11
      password_confirmation 'ABC' * 11
    end
  end
end
