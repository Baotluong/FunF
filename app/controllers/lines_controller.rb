class LinesController < ApplicationController
	def new
		@line = Line.new
	end

	def create
		puts line_params
		@line = Line.create(line_params())
		if @line
			## creates new story when a story ends
			if @line.story.lines.length == @line.story.max
				Story.create_new

				flash[:success] = "The End."
	     	    redirect_to controller: "stories", action: "show", id: @line.story_id
	     	else
	     		flash[:success] = "Thank you for contributing."
	     		redirect_to controller: "stories", action: "show", id: @line.story_id
	     	end
	    else
	    	flash[:success] = "Error."
	       	redirect_to controller: "stories", action: "show", id: @line.story_id
	    end
	end

	private

		def line_params
			params.permit(:text, :is_f, :story_id, :line_count)
		end
end