class EventsController < ApplicationController

    skip_before_action :verify_authenticity_token

    def create
        @event = Event.new(params.require(:event).permit!)
        @event.save
        render json: @event
    end

    def show
        @event = Event.find(params[:id])
        render json: @event
    end

    def index
        @events = Event.all
        render json: @events
    end

    def update_number_of_tickets
        @event = Event.find(params[:id])
        @event.update available_tickets: @event.available_tickets - 1
    end

end
