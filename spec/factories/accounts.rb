# frozen_string_literal: true
FactoryBot.define do
  factory :account do
    sequence(:email) { |n| "sample_#{n}@example.com" }
    password { 'password' }
    first_name { 'taro' }
    last_name { 'yamada' }
    role { Account::Role::CUSTOMER }

    trait :admin do
      role { Account::Role::ADMIN }
    end
  end
end
