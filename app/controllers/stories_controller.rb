class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category] == "new"
			@stories = Story.new_stories
		elsif params[:category] == "continue"
			@stories = Story.continue_stories
		elsif params[:category] == "finished"
			@stories = Story.finished_stories
		else
			@stories = Story.all.shuffle
		end
	end

	def create
		@stories = Story.new(story_params)
	end

	def show
	end

	def report_up
		# TODO: Add if statement to delete line if it has been censored and is the last line.
		reported_line = Line.find(params[:line_id])

		if cookies[params[:line_id]] != params[:line_id]
			cookies[params[:line_id]] = { value: params[:line_id], expires: 5.minute.from_now }

			Line.increment_counter(:report, params[:line_id])

			if reported_line.report >= @reports_allowed
				if reported_line == reported_line.story.lines.last
					reported_line.destroy
					flash[:success] = "This line has been removed."
				else
					flash[:success] = "This line has been deleted."
				end
			else
		    	flash[:success] = "Report has been submitted."
		    end
		else
			flash[:failure] = "You cannot report this line again so soon."
		end

		# TODO: FIX THIS. IT IS IDENTICAL TO THE OTHER ANCHORS. IDK BRAH
	    redirect_to story_path(reported_line.story_id, :anchor => "flash-anchor")
	end
	
	private

		def find_story
			@story = Story.find(params[:id])
		end
end