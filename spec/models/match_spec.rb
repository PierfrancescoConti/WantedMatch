require "rails_helper"

describe Match, :type => :model do
    subject {described_class.new}
    
    it  "is valid with valid attributes" do
        subject.date = Date.today - 1.week
        expect(subject).to be_valid
   end
end
