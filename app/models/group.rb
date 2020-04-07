class Group < ApplicationRecord
    has_many :comments, dependent: :destroy
end
