require 'rails_helper'

RSpec.describe Board, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:project) }
  end

  describe "#as_json" do
    subject { board.as_json }
    let(:board) { build_stubbed(:board, title: "Example") }

    it "returns custom json" do
      is_expected.to be_a(Hash)
      is_expected.to include(
        "id" => board.id,
        "title" => "Example",
        "project" => hash_including(
          "id" => board.project.id,
          "name" => board.project.name,
        )
      )
    end
  end
end
