class Exercice < ActiveRecord::Base
  belongs_to :lesson
  has_and_belongs_to_many :users

  def render_instructions
  	require 'redcarpet'
  	renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    markdown.render self.content
  end

	def markdown(content)
		@markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true, fenced_code_blocks: true)
		@markdown.render(content)
	end

end
