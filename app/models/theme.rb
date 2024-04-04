class Theme < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  has_many :questions
end
