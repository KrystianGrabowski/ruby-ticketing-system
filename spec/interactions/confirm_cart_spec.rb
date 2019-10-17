require 'rails_helper'
include Errors

RSpec.describe ConfirmCart do
  let(:price) {42}
  let(:user_id) {25}
  let(:available_tickets) {5}
  let(:event) { Event.new(available_tickets: available_tickets, price: price, date: Time.now + 2592000 ) }
  let(:past_event) { Event.new(available_tickets: available_tickets, price: price, date: Time.now - 2592000) }


  describe '.run' do
    subject { described_class.run(event: event, quantity: 2, user_id: user_id) }
    it 'decreases number of tickets by 2' do
      expect { subject }.to change { event.available_tickets }.by(-2)
    end
  end

  let(:token1) {"card_error"}
  describe '.run with card_error' do
    subject { described_class.run(event: event, quantity: 1, user_id: user_id, token: token1) }
    it 'raises exception' do
        expect { subject }.to raise_error Adapters::Payment::Gateway::CardError
    end
  end

  let(:token2) {"payment_error"}
  describe '.run with payment_error' do
    subject { described_class.run(event: event, quantity: 1, user_id: user_id, token: token2) }
    it 'raises exception' do
        expect { subject }.to raise_error Adapters::Payment::Gateway::PaymentError
    end
  end

  describe 'update quantity with -1' do
    subject { described_class.run(event: event, quantity: -1, user_id: user_id) }
    it 'raises exception' do
        expect { subject }.to raise_error TicketError
    end
  end

  describe 'update quantity with 0' do
    subject { described_class.run(event: event, quantity: 0, user_id: user_id) }
    it 'raises exception' do
        expect { subject }.to raise_error TicketError
    end
  end

  describe "not enough tickets" do
    subject { described_class.run(event: past_event, quantity: available_tickets + 1, user_id: user_id) }
    it 'raises exception' do
        expect { subject }.to raise_error TicketError
    end
  end

end