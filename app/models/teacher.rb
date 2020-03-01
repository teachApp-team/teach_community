class Teacher < ApplicationRecord
    has_secure_password
    has_many :students
    
    validates :full_name, presence: true
    validates :nickname, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :password, presence: true, length: { minimum: 4, maximum: 20 }
end
