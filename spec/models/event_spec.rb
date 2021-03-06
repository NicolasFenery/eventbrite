require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do
    michel = User.create(first_name: "MicheL", last_name: "Polnareff", email: "michelpolnareff@teuteu.fr", description: "Je chante bien sous ma douche")
    gilbert = User.create(first_name: "Gilbert", last_name: "Montagné", email: "gilbertmontagne@teuteu.fr", description: "Je chante les yeux fermés et les doigts dans le nez")
    @event = Event.create(start_date: "Tue, 23 Apr 2019 00:00:00 +0000", duration: 100, title: "Evenement de baguettes", description: "Grosses baguettes bien cuites et bien dures", price: 30, location: "Paris", administrator: michel)
    attendance_1 = Attendance.create(stripe_customer_id: "bonjour", guest: gilbert, event: @event)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid
    end

    describe "#duration" do
      it "should be positive and 5 % == 0" do
        bad_event = Event.create(duration: -1)
        expect(bad_event).not_to be_valid
        # test très sympa qui permet de vérifier que la fameuse formule user.errors retourne bien un hash qui contient une erreur concernant le first_name. 
        expect(bad_event.errors.include?(:duration)).to eq(true)
      end
    end

    describe "#title" do
      it "should be between 5 & 140 chars" do
        bad_event = Event.create(title: "John")
        expect(bad_event).not_to be_valid
        expect(bad_event.errors.include?(:title)).to eq(true)
      end
    end

    describe "#description" do
      it "should be between 20 & 1K chars" do
        invalid_event = Event.create(description: "miam")
        expect(invalid_event).not_to be_valid
        expect(invalid_event.errors.include?(:description)).to eq(true)
      end
    end

    describe "#price" do
      it "should be between 1 & 1000" do
        invalid_event = Event.create(price: 1100)
        expect(invalid_event).not_to be_valid
        expect(invalid_event.errors.include?(:price)).to eq(true)
      end
    end
  end

  context "associations" do

    describe "attendances" do
      it "should have_many attendances" do
        attendance = Attendance.create(event: @event)
        expect(@event.attendances.include?(attendance)).to eq(@event)
      end
    end
  end

  context "public instance methods" do

    describe "#is_event_passed?" do

      it "should return true if event happened already" do
        expect(@event.is_event_passed?).to eq(true)
      end
    end

    describe "#correct_duration" do

      it "should return true if event duration is a multiple of 5" do
        expect(@event.correct_duration).to eq(true)
      end
    end
  end
end