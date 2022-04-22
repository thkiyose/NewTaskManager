require "rails_helper"

RSpec.describe User, type: :model do
  describe "name validations" do
    it "is invalid without a name" do
      user = User.new(email:"test@email.com",password:"password")
      expect(user).to be_invalid
    end
    it "is invalid with a name longer than 10 letters" do
      user = User.new(name:"a"*11,email:"test@email.com",password:"password")
      expect(user).to be_invalid
    end
    describe "email validations" do
      it "is invalid when an email is in a incorrect format" do
        user = User.new(name:"test_user",email:"email",password:"password")
        expect(user).to be_invalid
      end
      it "is invalid with duplicated emails" do
        user1 = User.create(name:"test_user1",email:"email@e.com",password:"password")
        user2 = User.new(name:"test_user2",email:"email@e.com",password:"password")
        expect(user1).to be_valid
        expect(user2).to be_invalid
      end
      it "is invalid without an email" do
        user = User.new(name:"test_user",password:"password")
        expect(user).to be_invalid
      end
      it "is invalid with an email longer than 255 letters" do
        user = User.new(name:"test_user",email:"x"*250 + "@e.com",password:"password")
        expect(user).to be_invalid
      end
    end
  end
end
