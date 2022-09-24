class Project < ApplicationRecord
  validates_presence_of :name

  has_many :boards
  has_one :default_board, -> { order(:created_at) }, class_name: "Board"

  before_create private def set_code
    name_chars = name.to_s.gsub(/\s+/, "").upcase.chars
    self.code = "#{name_chars.first(2).join}#{name_chars.sample}"
  end
end
