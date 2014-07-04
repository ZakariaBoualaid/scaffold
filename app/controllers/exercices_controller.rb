class ExercicesController < ApplicationController

	require 'pygmentize_html'
	#require 'app/modules/rspec/*.rb'

	def show
		@pygmentize = PygmentizeHTML.new
		@course = Course.find_by_slug(params[:course])
		@lessons = @course.lessons
		@lesson = Lesson.find(params[:lesson])
		@exercice = Exercice.find(params[:exercice])
		@entries = Dir['app/modules/'+params[:course]+'_'+params[:lesson]+'-'+params[:exercice]+'.rb']

		if request.post?
			@content = params[:editor]
			file = File.open('app/modules/'+params[:course]+'_'+params[:lesson]+'-'+params[:exercice]+'.rb', "w")
			file.truncate(0)
			file.write(@content)
			file.close
			output_of_test = `ruby app/modules/rspec/rspec_#{params[:course]}_#{params[:lesson]}-#{params[:exercice]}.rb`.html_safe
			if !output_of_test.include? "ERROR"
				flash.now[:notice] = "Good job !"
			else 
				f = File.open("app/modules/rspec/error_console.log", "r")
				@error_console = ""
				f.each do |line|
					@error_console += line if line != ""
				end
				#f.truncate(0)
				f.close
				output = "Error " + output_of_test.partition("ERROR").last.partition(".").first + "."
				flash.now[:alert] = output
			end
		else
			if @entries.empty?
				file = File.new('app/modules/'+params[:course]+'_'+params[:lesson]+'-'+params[:exercice]+'.rb',"w")
				@fileRspec = File.new('app/modules/rspec/rspec_'+params[:course]+'_'+params[:lesson]+'-'+params[:exercice]+'.rb',"w")
			else
				@content = ""
				file = File.open('app/modules/'+params[:course]+'_'+params[:lesson]+'-'+params[:exercice]+'.rb', "r")
				file.each do |line|
					@content += line
				end
				file.close
				# run Unit test ##############################################################################################
			end	
		end

		render layout: 'editor'
	end

end