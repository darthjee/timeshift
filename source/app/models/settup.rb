# frozen_string_literal: true

class Settup
  include ActiveModel::Model
  
  attr_reader :admin

  class << self
    def attribute_names
      [:admin]
    end

    def all
      self.new(
        admin: User.find_or_initialize_by({ admin: true }),
        settings: ActiveSetting.all 
      )
    end
  end
end
