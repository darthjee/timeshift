# frozen_string_literal: true

class Sinclair::Settable::Caster
  cast_with(:seconds, &:seconds)
end

class Settings
  extend Sinclair::ChainSettable

  source :env, EnvSettings

  with_settings(:password_salt)
  setting_with_options(:hex_code_size, default: 16, type: :integer)
  setting_with_options(:session_period, default:  2.days, type: :seconds)
  setting_with_options(:cache_age, default: 10.seconds, type: :seconds)
  setting_with_options(:title, default: 'Timeshift')
  setting_with_options(:favicon, default: '/favicon.ico')
end
