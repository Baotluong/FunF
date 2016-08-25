class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@stories = Story.all.order("created_at DESC")
		elsif params[:category] == "new"
			@stories = Story.new_stories
		elsif params[:category] == "continue"
			@stories = Story.continue_stories
		else
			@stories = Story.finished_stories
		end
	end

	def create
		@stories = Story.new(story_params)
	end

	def show
	end

	def report_up
		Line.increment_counter(:report, params[:line_id])
		# TODO: Add if statement to delete line if it has been censored and is the last line.
		redirect_to story_path
	end
	
	private

		def find_story
			@story = Story.find(params[:id])
		end
end