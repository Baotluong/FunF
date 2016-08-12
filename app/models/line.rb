class Line < ActiveRecord::Base
	belongs_to :story
	validates :text, presence: true
	before_save :check_exists
	attr_accessor :line_count

	private

	def check_exists
		if line_count && !(line_count.to_i == story.lines.count)
			return false
		else
			return true
		end
	end
	
end