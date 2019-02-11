require 'rails_helper'

RSpec.describe Attendance, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

before(:each) do 
    @attendance = Attendance.create(stripe_customer_id: "bonjour", guest_id: 1, event_id: 1)
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
        attendance = Attendance.create(guest: @guest)
        expect(@guest.attendance.include?(attendance)).to eq(true)
      end

      it "should belong to an event" do
        attendance = Attendance.create(event: @event)
        expect(@event.attendance.include?(attendance)).to eq(true)
      end
    end
  end
end