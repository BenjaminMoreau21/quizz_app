class Result < ApplicationRecord
  belongs_to :user
  belongs_to :theme

  validates :user, :theme, presence: true
end
