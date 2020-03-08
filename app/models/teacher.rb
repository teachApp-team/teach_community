class Teacher < ApplicationRecord
    has_secure_password
    has_many :students

    has_many :com_teacher_relations, dependent: :delete_all
    has_many :communities, through: :com_teacher_relations
    

    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy


    validates :full_name, presence: true
    validates :nickname, presence: true, uniqueness: true, length: { minimum: 3 }
    validates :password, presence: true, length: { minimum: 4, maximum: 20 }
end
