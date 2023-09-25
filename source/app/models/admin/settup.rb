# frozen_string_literal: true

module Admin
  class Settup < Sinclair::Model
    initialize_with :admin, :settings

    class << self
      def attribute_names
        [:admin]
      end

      def all
        self.new(
          admin: User.admin.find_or_initialize_by({}),
          settings: ActiveSetting.all 
        )
      end
    end
  end
end
