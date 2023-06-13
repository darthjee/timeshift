# frozen_string_literal: true

FactoryBot.define do
  factory :account, class: 'Account' do
    user

    sequence(:name) { |n| "Account ###{n}" }
  end
end
