class ExercicesController < ApplicationController
	before_action :session_token, only:[:save, :show, :check, :fill]
	before_action :set_variables, only:[:save, :show, :check, :fill]

	def session_token
		if !current_user
			if !session['token']
				session['token'] = loop do
					token = SecureRandom.urlsafe_base64(nil, false)
					break token unless User.exists?(token_authenticatable: token)
				end
			end
			Dir.mkdir("app/users_progression/#{session[:token]}/") unless File.directory?("app/users_progression/#{session[:token]}/")
			@token_authenticatable = session['token']
		else
		  @token_authenticatable = current_user.token_authenticatable	
		end
	end

	def set_variables
		@module = Course.find_by_slug(params[:course]).unit.mod.slug
		@course_id = params[:course]
		@lesson_id = params[:lesson]
		@exercice_id = params[:exercice]
	end

	def check
		@output_of_test = `ruby app/modules/#{@module}/rspec_#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb #{@token_authenticatable}`
		@output_of_console = `ruby app/users_progression/#{@token_authenticatable}/#{@module}/#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb`
		#CONSOLE=`ruby app/users_progression/#{@token_authenticatable}/#{@module}/#{@course_id}_#{@lesson_id}-#{@exercice_id}.r`
		#@console = @output_for_console.readlines
		puts "------------------EXERCICE TEST--------------------"
		puts @output_of_test
		puts "---------------------CONSOLE-----------------------"
		#puts @console
		print @output_of_console

		if !@output_of_test.include? "ERROR"
			@output_of_test = "Nice work!"
			@success = true
		else 
			@success = false
			@output_of_test = "Error " + @output_of_test.partition("ERROR").last.partition(".").first + "."
		end
		#render js: "output = #{@output}", :content_type => 'text/javascript'
		#render :partial => 'check_results', :content_type => 'text/html'
		render :json => {:console => @output_of_console, :output_of_test => @output_of_test, :success => @success}.to_json
	end

	def save
		@code = params[:code]
		file = File.open("app/users_progression/#{@token_authenticatable}/#{@module}/#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb", "w")
		file.truncate(0)
		file.write(@code)
		file.close
		respond_to :json
	end

	def show
		Dir.mkdir("app/users_progression/#{@token_authenticatable}/#{@module}/") unless File.directory?("app/users_progression/#{@token_authenticatable}/#{@module}/")

		@exercices_entry = Dir.entries("app/users_progression/#{@token_authenticatable}/#{@module}/")
		unless @exercices_entry.include?("#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb")
			file = File.new("app/users_progression/#{@token_authenticatable}/#{@module}/#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb","w")
		end

		Dir.mkdir("app/modules/#{@module}/") unless File.directory?("app/modules/#{@module}/")

		@rspec_entry = Dir.entries("app/modules/#{@module}/")
		unless @rspec_entry.include?("rspec_#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb")
			file = File.new("app/modules/#{@module}/rspec_#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb","w")
		end

		render layout: 'editor'
	end

	def fill
		@content = ""
		file = File.open("app/users_progression/#{@token_authenticatable}/#{@module}/#{@course_id}_#{@lesson_id}-#{@exercice_id}.rb", "r")
		file.each do |line|
			@content += line
		end
		file.close
		render :text => @content
	end

end