module BPS
	class User
		attr_accessor :name, :password,:email

		def self.authenticate(username,password)
			user = self.find(username)
			(user.password == password) ? user : false 
		end
	end
end