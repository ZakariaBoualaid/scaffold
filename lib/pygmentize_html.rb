class PygmentizeHTML < Redcarpet::Render::HTML
  def block_code(code)
    require 'pygmentize'
    Pygmentize.process(code, :ruby)
  end
end