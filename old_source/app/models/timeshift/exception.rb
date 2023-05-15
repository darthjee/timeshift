# frozen_string_literal: true

module Timeshift
  class Exception < StandardError
    class LoginFailed  < Timeshift::Exception; end
    class Unauthorized < Timeshift::Exception; end
    class NotLogged    < Timeshift::Exception; end
  end
end
