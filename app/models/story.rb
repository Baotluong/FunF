class Story < ActiveRecord::Base
	has_many :lines

	#TODO: This is a n+1 query. Optimize if it becomes an issue
	def self.new_stories
		Story.all.select do |s|
			s.lines.length == 1
		end
	end

	def self.create_new
		story1 = Story.create(start_f:  [true, false].sample,
				          			  max:      rand(10..20))

		Line.create(story: 	  story1,
	            	text:     PromptName.order("RANDOM()").first.name + " " + PromptAction.order("RANDOM()").first.action + " " + PromptLocation.order("RANDOM()").first.location,
				    is_f:     story1.start_f,
				    report:   0)
	end
end
