class CoursesController < ApplicationController

	def show
		@course = Course.find_by_slug(params[:slug])
		@lesson = Lesson.where(:course_id => @course.id).first
		@exercice = Exercice.where(:lesson => @lesson).first
		redirect_to long_exercice_path(@course, @lesson.id, @exercice.id)
	end

end