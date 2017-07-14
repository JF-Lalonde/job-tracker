require 'rails_helper'

describe Category, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  describe "relationships" do
    it { should have_many(:jobs) }
  end
end
