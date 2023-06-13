# frozen_string_literal: true

class Client < ApplicationRecord
  class Decorator < Azeroth::Decorator
    expose :id
    expose :name
    expose :errors, if: :invalid?

    def errors
      object.errors.messages.stringify_keys
    end
  end
end
