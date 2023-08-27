# frozen_string_literal: true

class Sinclair
  module Settable
    class Caster
      cast_with(:seconds) { |value| value.to_i.seconds }
      cast_with(:boolean) { |value| value == 'true' }
    end
  end
end

class Settings
  extend Sinclair::ChainSettable

  source :env, EnvSettings
  source :db,  ActiveSettings

  setting_with_options(:password_salt)
  setting_with_options(:hex_code_size, default: 16, type: :integer)
  setting_with_options(:session_period, default: 2.days, type: :seconds)
  setting_with_options(:cache_age, default: 10.seconds, type: :seconds)
  setting_with_options(:title, default: 'Timeshift')
  setting_with_options(:favicon, default: '/favicon.ico')
  setting_with_options(:set, default: false, type: :boolean)
end
