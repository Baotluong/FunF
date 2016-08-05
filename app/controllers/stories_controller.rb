class StoriesController < ApplicationController
	before_action :find_story, only: [:show, :edit, :update, :destroy]

	def index
		@stories = Story.all.order("created_at DESC")
	end

	/# def create
		@story = Story.new(story_params)
	end #/

	def show
	end

	private

		def story_params
			params.require(:story).permit(:start_f, :max)
		end

		def find_story
			@story = Story.find(params[:id])
		end
end