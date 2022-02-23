RSpec.describe Person, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_length_of(:cpf).is_equal_to(11) }
    it { is_expected.to allow_value("test@test.com").for(:email) }
    it { is_expected.not_to allow_value("test.com").for(:email) }
    it { is_expected.to_not allow_value(nil).for(:active) }
    specify "is expected to cpf is unique" do
      subject { create(:person) }
      expect validate_uniqueness_of(:cpf).ignoring_case_sensitivity
    end
    specify "is expected to email is unique" do
      subject { create(:person) }
      expect validate_uniqueness_of(:email).ignoring_case_sensitivity
    end
  end
end
