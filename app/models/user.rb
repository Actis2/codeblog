class User < ActiveRecord::Base
	has_secure_password 
	validates :email, presence: true,
										uniqueness: true,
										format: {
											with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
										}

	before_save :downcase_email



	def downcase_email
		self.email = email.downcase
	end

end
