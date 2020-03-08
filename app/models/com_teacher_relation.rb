class ComTeacherRelation < ApplicationRecord
  belongs_to :community
  belongs_to :teacher
end
