require 'rails_helper'

RSpec.describe Card, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:summary) }
    it { is_expected.to validate_presence_of(:state) }
  end

  describe "callbacks" do
    describe "#set_code" do
      let(:project) { build(:project) }
      let(:card) { build(:card, project: project) }

      before do
        expect(card.code).to be_nil
        allow(project).to receive(:code).and_return("BMW")
        allow(project).to receive(:card_count).and_return(3)
      end

      it { expect(card.save).to be_truthy }
      after { expect(card.code).to eq("BMW-3") }
    end
  end
end
