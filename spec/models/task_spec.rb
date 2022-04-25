require "rails_helper"

RSpec.describe Task, type: :model do
  user = User.create(email:"test@email.com",password:"password")
  describe "title validations" do
    it "is invalid without a title" do
      task = user.tasks.build(importance:0,limit:2022-05-20)
      expect(task).to be_invalid
    end
    it "is invalid with a title longer than 100 letters" do
      task = user.tasks.build(title:"a"*101,importance:0,limit:2022-05-20)
      expect(task).to be_invalid
    end
  end
  describe "impoetance validations" do
    it "is invalid without a importance level" do
      task = user.tasks.build(title:"test",limit:2022-05-20)
      expect(task).to be_invalid
    end
  end
end
