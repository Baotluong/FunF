class LinesController < ApplicationController
	def new
		@line = Line.new
	end

	def create
		@line = Line.create(line_params)
		if @line.save
			## creates new story when a story ends
			if @line.story.lines.length == @line.story.max
				story1 = Story.create(start_f:  [true, false].sample,
				          			  max:      rand(10..20))

				Line.create(story: 	  story1,
	            			text:     PromptName.order("RANDOM()").first.name + " " + PromptAction.order("RANDOM()").first.action + " " + PromptLocation.order("RANDOM()").first.location,
				            is_f:     story1.start_f,
						    report:   0)

				flash[:success] = "The End."	
	     	    redirect_to controller: "stories", action: "show", id: @line.story_id
	     	else
	     		flash[:success] = "Thank you for contributing."
	     		redirect_to controller: "stories", action: "show", id: @line.story_id
	     	end
	    else
	    	flash[:success] = "Error."
	       	redirect_to controller: "stories", action: "show", id: @line.story_id, alert: "Error."
	    end
	end

	private

		def line_params
			params.permit(:text, :is_f, :story_id)
		end
end