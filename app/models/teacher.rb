class Teacher < ApplicationRecord
    has_secure_password
    has_many :students
    has_many :favorites

    has_many :com_teacher_relations, dependent: :delete_all
    has_many :communities, through: :com_teacher_relations
    

    has_many :messages, dependent: :destroy
    has_many :entries, dependent: :destroy


    validates :full_name, presence: true
    validates :nickname, presence: true, uniqueness: true, length: { minimum: 3 }
  #  validates :password, presence: true, length: { minimum: 4, maximum: 20 }
    
    mount_uploader :image, ImageUploader
    
    def self.find_or_create_from_auth(auth)
      provider = auth[:provider]
      uid = auth[:uid]
      name = auth[:info][:name]
      image = auth[:info][:image]
      #必要に応じて情報追加してください
    
      #ユーザはSNSで登録情報を変更するかもしれので、毎回データベースの情報も更新する
      self.find_or_create_by(provider: provider, uid: uid) do |user|
        user.username = name
        user.image_path = image
      end
    end
end
