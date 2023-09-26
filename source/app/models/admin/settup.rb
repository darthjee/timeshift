# frozen_string_literal: true

module Admin
  class Settup < Sinclair::Model
    initialize_with :admin, :settings

    SETTINGS=%i[set favicon title cache_age session_period].freeze

    class << self
      def attribute_names
        [:admin, :settings]
      end

      def all
        self.new(
          admin: User.admin.find_or_initialize_by({}),
          settings: all_settings
        )
      end

      private

      def all_settings
        SETTINGS.map do |key|
          [key, ActiveSetting.find_by(key: key)&.value]
        end.to_h
      end
    end
  end
end
