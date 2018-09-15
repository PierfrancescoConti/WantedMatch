require "rails_helper"

describe User, :type => :model do
    subject {described_class.new}
    
    it  "is valid with valid attributes" do
        subject.usname = "Anything"
        subject.password = "Anything1"
        expect(subject).to be_valid
   end
   
    it "is not valid without a usname" do
        subject.usname = nil
        expect(subject).to_not be_valid
   end
   
       it "is not valid without a passoword" do
        subject.usname = "Anything"
        subject.password = nil
        expect(subject).to_not be_valid
   end
   
       it "is not valid without a passoword with size > 7" do
        subject.usname = "Anything"
        subject.password = "ciao"
        expect(subject).to_not be_valid
   end
   
   it "is not valid without email without @" do
        subject.usname = "Anything"
        subject.password = "Anything1"
        subject.email = "ciao"
        expect(subject).to_not be_valid
   end
   
end
