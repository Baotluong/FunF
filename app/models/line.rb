class Line < ActiveRecord::Base
	belongs_to :story
	validates :text, presence: true
end