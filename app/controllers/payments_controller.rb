class PaymentsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        @event = Event.find(params[:event_id])
        outcome = ConfirmCart.run(event: @event, quantity: params[:quantity], user_id: params[:user_id], token: params[:token])
        if outcome.valid?
            render json: {"Status": "Ok"}
        else
            head :service_unavailable

        end
    end

    def show
        @payment = Payment.find(params[:id])
        render json: @payment
    end

    def index
        @payments = Payment.all
        render json: @payments
    end

end
