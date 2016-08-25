class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # QUESTION: HOW DOES THE BEFORE FILTER WORK?
  before_filter :random_story_id

  def random_story_id
  	@random_story_id = Random.rand(Story.count) + 1
  end
  
end
