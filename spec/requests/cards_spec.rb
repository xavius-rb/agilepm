require 'rails_helper'

RSpec.describe "/cards", type: :request do
  let(:valid_attributes) { attributes_for(:card, project_id: create(:project).id) }
  let(:invalid_attributes) { attributes_for(:card, summary: "") }
  it_behaves_like :resource_controller, Card, except: [:new, :show, :edit, :create, :update]
end
