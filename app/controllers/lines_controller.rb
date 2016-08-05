class LinesController < ApplicationController

	def new
		@line = Line.new
	end

	def create
		@line = Line.new(line_params)
	end

	private

		def line_params
			params.require(:line).permit(:line)
		end
end
