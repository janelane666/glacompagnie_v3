require 'digest'

class User < ApplicationRecord
	before_save do
		self.password = Digest::SHA2.new(512).hexdigest self.password
	end
end
