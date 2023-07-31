# frozen_string_literal: true

class Settings
  extend Sinclair::ChainSettable

  source :env, EnvSettings

  with_settings(
    :password_salt,
    hex_code_size: 16,
    session_period: 2.days,
    cache_age: 10.seconds,
    title: 'Timeshift',
    favicon: '/favicon.ico'
  )
end
