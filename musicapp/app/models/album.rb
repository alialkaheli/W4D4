class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true
  validates :type, inclusion: TYPE, presence: true
  TYPE = %w{live studio}

  belongs_to :band,
  foreign_key: :band_id,
  class_name: :Band
end
