require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


system('clear')
puts "---------------------------------"
puts "| WelCoMe tO dA GaMe maMainE !  |"
puts "| i hOpE yOu'Ll sUrVivE iT ...  |"
puts "---------------------------------"
puts puts
sleep 0.5

puts "QuEl Est toN nOm de HerO ... ?"
puts
hero_name = gets.chomp

game = Game.new(hero_name)
game.menu