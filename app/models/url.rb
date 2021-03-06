class Url < ApplicationRecord
	before_create :shorten
	validates :long_url, presence: true, format: URI::regexp(%w(http https)), uniqueness: true
	def shorten
		range = [*'0'..'9',*'A'..'Z',*'a'..'z']

		@short_url = (0...6).map{ range.sample }.join
	self.short_url = @short_url
	end

end
