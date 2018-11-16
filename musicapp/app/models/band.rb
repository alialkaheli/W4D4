class Band < ApplicationRecord
  validates :name, :user_id, presence: true

  belongs_to :user,
  foreign_key: :user_id,
  class_name: :User

  has_many :albums
end
