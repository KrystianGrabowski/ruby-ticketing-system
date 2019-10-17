module Errors
    class EventError < StandardError
      def initialize(msg="msg")
        super
      end
    end
  end