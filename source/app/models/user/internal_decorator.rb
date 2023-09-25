# frozen_string_literal: true

class User < ApplicationRecord
  class InternalDecorator < User::Decorator
    expose :admin
  end
end
