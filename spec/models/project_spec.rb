require 'rails_helper'

RSpec.describe Project, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:boards) }
    xit { is_expected.to have_many(:cards) }
    it { is_expected.to have_one(:default_board) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
  end

  describe "callbacks" do
    describe "#set_code" do
      let(:project) { build(:project, name: "Helloway") }

      before { expect(project.code).to be_nil }
      it { expect(project.save).to be_truthy }
      after { expect(project.code).to include("HE") }
    end
  end
end
