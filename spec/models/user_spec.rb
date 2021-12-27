require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  it "Valid with Attributes" do
    expect(subject).to be_valid
  end

  describe "[Attr]" do

    describe "Name" do
      it "- Without it" do
        subject.name = nil
        expect(subject).to_not be_valid
      end
    end

    describe "CPF" do
      it "- Without it" do
        subject.cpf = nil
        expect(subject).to_not be_valid
      end
    end
    
    describe "Email" do
      it "- Without it" do
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end

    describe "Address" do
      it "- Without it" do
        subject.address = nil
        expect(subject).to_not be_valid
      end
    end

    describe "Birthday" do
      it "- Without it" do
        subject.birthday = nil
        expect(subject).to_not be_valid
      end

      it "- Wrong Type" do
        subject.birthday = "birthday"
        expect(subject).to_not be_valid
      end
    end

    describe "Active" do
      it "- Without it" do
        subject.active = nil
        expect(subject).to_not be_valid
      end
    end
    
  end
  
end
