module Errors
    class TicketError < StandardError
      def initialize(msg="msg")
        super
      end
    end
  end