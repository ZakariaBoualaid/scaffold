class ModsController < ApplicationController

  def index
  	@mods = Mod.all
  end

  def show
    @mod = Mod.find_by_slug(params[:slug])
    @units = @mod.units
  end

  def new
  	
  end

  def create
  	
  end

end
