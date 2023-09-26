# frozen_string_literal: true

module Admin
  class Settup < Sinclair::Model
    initialize_with :admin, :settings

    SETTINGS=%i[].freeze

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

      def all_settings

      end
    end
  end
end
