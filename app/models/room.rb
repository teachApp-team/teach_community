class Room < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy
end
