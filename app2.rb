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
sleep 1
puts puts

puts "quEl Est vOtrE nOm ...?"
player_name = gets.chomp
user = HumanPlayer.new(player_name)

enemies = Array.new
bot1 = Player.new('Josiane')
bot2 = Player.new('José')
enemies << bot1
enemies << bot2

while user.life_points > 0 && (bot1.life_points > 0 || bot2.life_points > 0)
  user.show_state
  bot1.attacks(user)
end

puts "eNd oF thE GaMe !"
user.life_points > 0 ? "Tu aS gAgNé la PArTie maMaIne!" : "Tu as perdu poil au Ruru, tu es fini poil au Ruby !"

binding.pry