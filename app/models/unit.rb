class Unit < ActiveRecord::Base
  belongs_to :mod
  has_many :courses
  before_save :to_slug

  def to_param
    slug  	
  end

  def to_slug
    ret = self.name.downcase

    ret.gsub! /['`]/,""

    ret.gsub! /\s*@\s*/, " at "

    ret.gsub! /\s*&\s*/, " and "

    ret.gsub! /\s*[^a-z0-9\.\-]\s*/, '-'  

    ret.gsub! /-+/,"-"

    ret.gsub! /\A[-\.]+|[-\.]+\z/,""

    self.slug = ret
  end
end
