class TopicSite < ApplicationRecord
   
    validates :name, presence: true, uniqueness: true
    validates :base_url, presence: true, uniqueness: true
end
