class LinesController < ApplicationController
	def new
		@line = Line.new
	end

	def create
		@line = Line.new(line_params)
		if @line.save
			## creates new story when a story ends
			if @line.story.lines.length == @line.story.max
				Story.create_new

				flash[:success] = "The End."
	     	    redirect_to story_path(@line.story_id)
	     	else
	     		flash[:success] = "Thank you for contributing."
	     		redirect_to story_path(@line.story_id)
	     	end
	    else
	    	flash[:failure] = "Error."
	       	redirect_to story_path(@line.story_id)
	    end
	end

	private

		def line_params
			params.permit(:text, :is_f, :story_id, :line_count)
		end
end