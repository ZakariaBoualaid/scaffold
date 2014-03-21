class Exercice < ActiveRecord::Base
  belongs_to :lesson
  has_and_belongs_to_many :users
end
