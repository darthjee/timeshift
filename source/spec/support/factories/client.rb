# frozen_string_literal: true

FactoryBot.define do
  factory :client, class: 'Client' do
    user

    sequence(:name) { |n| "Client ###{n}" }
  end
end
