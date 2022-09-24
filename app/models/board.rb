class Board < ApplicationRecord
  validates_presence_of :title
  belongs_to :project

  def as_json(options = {})
    super(
      only: %i(id title),
      include: {
        project: { only: %i(id name) }
      },
    )
  end
end
