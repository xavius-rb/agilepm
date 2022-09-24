json.extract! card, :id, :project_id, :code, :summary, :state, :created_at, :updated_at
json.url card_url(card, format: :json)
