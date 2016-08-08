class LinesController < ApplicationController

	def new
		@line = Line.new
	end

	def create
		@line = Line.create(line_params)
		if @line.save
     	    redirect_to controller: "stories", action: "show", id: @line.story_id
    	else
        	redirect_to controller: "stories", action: "show", id: @line.story_id
    	end
	end

	private

		def line_params
			params.permit(:text, :is_f, :story_id)
		end
end