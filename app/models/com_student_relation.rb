class ComStudentRelation < ApplicationRecord
  belongs_to :community
  belongs_to :student

end
