class Story < ActiveRecord::Base
	has_many :lines

	# TODO: THIS IS BROKEN.
	# scope :new_stories, -> lambda { includes(:lines).group("story_id").having("count(story_id) == 1") }
	# scope :continue_stories, -> lambda { includes(:lines).group("story_id").having("count(story_id) == 1") }
	# scope :finished_stories, -> lambda { includes(:lines).group("story_id").having("count(story_id) == 1") }

	#TODO: This is a n+1 query. Optimize if it becomes an issue
	def self.new_stories
		Story.all.select do |s|
			s.lines.length == 1
		end
	end

	def self.continue_stories
		Story.all.select do |s|
			s.lines.length > 1 && s.lines.length < s.max
		end
	end

	def self.finished_stories
		Story.all.select do |s|
			s.lines.length == s.max
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
