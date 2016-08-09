class Line < ActiveRecord::Base
	belongs_to :story
	validates :text, presence: true
	before_save :check_exists


	/# def check_exists
		## This is broken.
		if Line.find_by(id: self.id) == self.id
			false
		else
			true
		end
	end#/
end