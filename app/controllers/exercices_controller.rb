class ExercicesController < ApplicationController

	def show
		@course = Course.find_by_slug(params[:course])
		@lessons = @course.lessons
		@lesson = Lesson.find(params[:lesson])
		@exercice = Exercice.find(params[:exercice])
		if request.post?
			raise params.inspect
		end
	end

end