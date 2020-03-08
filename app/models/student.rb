class Student < ApplicationRecord
  belongs_to :teacher
  has_many :com_student_relations, dependent: :delete_all
  has_many :communities, through: :com_student_relations
  has_secure_password
 
  validates :full_name, presence: true
  validates :nickname, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :password, presence: true, length: { minimum: 4, maximum: 20 }
end
