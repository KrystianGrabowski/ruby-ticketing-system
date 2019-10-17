class ConfirmCart < ActiveInteraction::Base
    object :event, class: Event
    object :quantity, class: Integer
    object :user_id, class: Integer
    #temp
    object :token, class: String, default: String.new

    include Adapters::Payment
    include Errors
  
    def execute
      ActiveRecord::Base.transaction do
        check_date
        update_quantity
        perform_transaction
        create_payment
      end
    end

    def check_date
        if event.date < Time.now
            raise TicketError, "Tickets are no longer available. Event occured in the past"
        end
    end
  
    def perform_transaction
        Gateway.charge(amount: event.price, token: token)
    end
  
    def update_quantity
        if quantity <= 0 || event.available_tickets - quantity < 0
            raise TicketError, "Not enough tickets to perform this operation"
        end
        event.update available_tickets: event.available_tickets - quantity
    end

    def create_payment
        #'price' in Payment model is the price for one ticket only !
        @payment = Payment.new(user_id: user_id, event_id: event.id, price: event.price, quantity: quantity )
        if !@payment.save
            raise TicketError, "Could not create payment"
        end
    end

end
  