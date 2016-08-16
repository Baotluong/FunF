class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		@stories = Story.all.order("created_at DESC")
	end

	def create
		@stories = Story.new(story_params)
	end

	def show
		@random_story_id = Random.rand(Story.count) + 1
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