class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :option
  belongs_to :result

  validates :user, :option, :result, presence: true
end
