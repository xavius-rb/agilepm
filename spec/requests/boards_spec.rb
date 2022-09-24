require 'rails_helper'

RSpec.describe "/boards", type: :request do
  describe "GET /show" do
    let(:board) { create(:board) }

    it "renders a successful response" do
      get project_board_path(board.project, board)
      expect(response).to be_successful
    end
  end
end
