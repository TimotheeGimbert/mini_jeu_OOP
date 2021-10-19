require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def welcome_msg
# Message introducing the game with puts
  system('clear')
  puts "---------------------------------".red
  puts "| WelCoMe tO dA zOmBiEs GaMe !  |"
  puts "|    we hOpE yOu'Ll sUrVivE     |"
  puts "---------------------------------".red
  puts puts
  sleep 0.5
end

def get_hero_name
# ask the player for his hero name
  puts "QuEl Est toN nOm de HerO ... ?".green
  puts
  return gets.chomp.to_s
end

def counter_attack_msg
# announce the zombies counter-attack
  puts puts
  puts '------------------------> PRèS pOuR lA RipOStE zOmBiE ?? <------------------------'.red 
  gets.chomp
end

def perform
# Main execution
  welcome_msg
  game = Game.new(get_hero_name)

  while game.is_ongoing? do
    game.menu # show the game action menu
    choice = gets.chomp.to_s # select choice after menu is displayed
    game.menu_choice(choice) # launch event sequence (fight or look for stuff)
    puts
    if game.players_left == 0 then break end # if player just have killed the last enemy
    game.show_gamers
    game.add_players_in_sight # zombies arriving in sight are added to the array of ennemies in sight 
    counter_attack_msg # announcing the zombies attack
    game.enemies_attack # zombies attack
  end
  
  game.end

end

perform