class User < ActiveRecord::Base
	has_secure_password
	
	has_many :recipes
	has_many :ingredients, through: :recipes
	
	validates :name, uniqueness: true, presence: true
	
	def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
			user.password = (0...8).map { (65 + rand(26)).chr }.join #Random String
    end
	end
end
