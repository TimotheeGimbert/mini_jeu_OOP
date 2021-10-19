require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


def welcome_msg
  system('clear')
  puts "---------------------------------".red
  puts "| WelCoMe tO dA zOmBiEs GaMe !  |"
  puts "|    we hOpE yOu'Ll sUrVivE     |"
  puts "---------------------------------".red
  puts puts
  sleep 0.5
end

def get_hero_name
  puts "QuEl Est toN nOm de HerO ... ?".green
  puts
  return gets.chomp.to_s
end

def counter_attack_msg
  puts puts
  puts '------------------------> PRèS pOuR lA RipOStE zOmBiE ?? <------------------------'.red 
  gets.chomp
end

def perform

  welcome_msg
  game = Game.new(get_hero_name)

  while game.is_ongoing? do
    game.menu
    choice = gets.chomp.to_s
    game.menu_choice(choice)
    puts
    if game.players_left == 0 then break end
    game.show_gamers
    game.add_players_in_sight
    counter_attack_msg
    game.enemies_attack
  end
  
  game.end

end

perform