class Card < ApplicationRecord
  validates_presence_of :summary, :state
  belongs_to :project

  before_create do
    project.transaction do
      project.increment!(:card_count).tap do |p_reloaded|
        self.code = "#{project.code}-#{p_reloaded.card_count}"
      end
    end
  end

  def to_param
    code
  end
end
