class Question < ApplicationRecord
  belongs_to :theme
  has_many :options
  validates :content, presence: true
end
