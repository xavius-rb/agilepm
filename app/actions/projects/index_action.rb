class Projects::IndexAction < Xavius::Actions::Base
  def perform
    resource_class.includes(:default_board).order(updated_at: :desc).select(:id, :name, :code)
  end
end
