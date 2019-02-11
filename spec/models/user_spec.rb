require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  before(:each) do 
    @user = User.create(email: "john@doe.com", encrypted_password: 0123456, description: "John Doe, lives in Paris, loves paris brest", first_name: "John", last_name: "Doe")
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end
  end

end
