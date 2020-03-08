class Community < ApplicationRecord
    has_many :com_teacher_relations, dependent: :delete_all
    has_many :teachers, through: :com_teacher_relations
    has_many :com_student_relations, dependent: :delete_all
    has_many :students, through: :com_student_relations
    
    validates :name, presence: :true
    
    mount_uploader :image, ImageUploader
end
