require 'rails_helper'

RSpec.describe Attendance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

before(:each) do 
    @guest = User.create(first_name: "MicheL", last_name: "Polnareff", email: "michelpolnareff@teuteu.fr", description: "Je chante bien sous ma douche" )
    michelita = User.create(first_name: "Michelita", last_name: "Polnareffa", email: "michelpolnareffa@teuteu.fr", description: "Je chante très mal" )
    @event = Event.create(start_date: "Tue, 23 Apr 2019 00:00:00 +0000", duration: 100, title: "Evenement de baguettes", description: "Grosses baguettes bien cuites et bien dures", price: 30, location: "Paris", administrator: michelita)
    @attendance = Attendance.create(stripe_customer_id: "bonjour", guest: @guest, event: @event)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end
  end

  context "associations" do

    describe "attendances" do
      it "should belong to a user" do
        expect(@attendance.guest).to eq(@guest)
      end

      it "should belong to an event" do
        expect(@attendance.event).to eq(@event)
      end
    end
  end
end