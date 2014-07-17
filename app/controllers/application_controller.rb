class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_filter :authenticate_user!

  # around_filter :you_dont_have_bloody_clue

  # protected

  # def you_dont_have_bloody_clue
  #   klasses = [ActiveRecord::Base, ActiveRecord::Base.class]
  #   methods = ["session", "cookies", "params", "request"]

  #   methods.each do |shenanigan|
  #     oops = instance_variable_get(:"@_#{shenanigan}") 

  #     klasses.each do |klass|
  #       klass.send(:define_method, shenanigan, proc { oops })
  #     end
  #   end

  #   yield

  #   methods.each do |shenanigan|      
  #     klasses.each do |klass|
  #       klass.send :remove_method, shenanigan
  #     end
  #   end

  # end
end
