class Question < ApplicationRecord
  belongs_to :theme
  validates :content, presence: true
end
