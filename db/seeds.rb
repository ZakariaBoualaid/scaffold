# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Mod.create(:name => "Ruby", :description => "Learn Ruby with Scaffold.")

Unit.create(:name => "Introduction to Ruby", :mod_id => 1)

Course.create(:name => "Introduction to Ruby", :description => "This tutorial will introduce you to Ruby, an object-oriented scripting language you can use on its own or as part of the Ruby on Rails web framework.", :unit_id => 1)
Course.create(:name => "Putting the Form in Formatter", :description => "Now that you know a little bit of Ruby, let's put together your first project! In this one, we'll write a small program that will format a user's input.", :unit_id => 1)

Lesson.create(:name => "Variables & Data Types", :course_id => 1)
Lesson.create(:name => "String Methods", :course_id => 1)
Lesson.create(:name => "Writing Good Code", :course_id => 1)
Lesson.create(:name => "Review", :course_id => 1)

Exercice.create(:name => "Overview & Sneak Peek", :lesson_id => 1)
Exercice.create(:name => "Data Types: Numbers, Strings, Booleans", :lesson_id => 1)
Exercice.create(:name => "Variables", :lesson_id => 1)
Exercice.create(:name => "Math", :lesson_id => 1)
Exercice.create(:name => "Puts & print", :lesson_id => 1)