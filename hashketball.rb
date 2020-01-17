require 'pry'


def game_hash
hash = {
:home => {
  :team_name => "Brooklyn Nets",
  :colors => ["Black", "White"],
  :players => [
    {
      :player_name => "Alan Anderson",
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
    },
    {
      :player_name => "Reggie Evans",
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7,
    },
    {
      :player_name => "Brook Lopez",
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15,
    },
    {
      :player_name => "Mason Plumlee",
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 11,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5,
    },
    {
      :player_name => "Jason Terry",
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1,
    },],
  },
:away => {
  :team_name => "Charlotte Hornets",
  :colors => ["Turquoise", "Purple"],
  :players => [
    {
      :player_name => "Jeff Adrien",
      :number => 4,
      :shoe => 18,
      :points => 10,
      :rebounds => 1,
      :assists => 1,
      :steals => 2,
      :blocks => 7,
      :slam_dunks => 2
    },
    {
      :player_name => "Bismack Biyombo",
      :number => 0,
      :shoe => 16,
      :points => 12,
      :rebounds => 4,
      :assists => 7,
      :steals => 22,
      :blocks => 15,
      :slam_dunks => 10
    },
    {
      :player_name => "DeSagna Diop",
      :number => 2,
      :shoe => 14,
      :points => 24,
      :rebounds => 12,
      :assists => 12,
      :steals => 4,
      :blocks => 5,
      :slam_dunks => 5
    },
    {
      :player_name => "Ben Gordon",
      :number => 8,
      :shoe => 15,
      :points => 33,
      :rebounds => 3,
      :assists => 2,
      :steals => 1,
      :blocks => 1,
      :slam_dunks => 0
    },
    {
      :player_name => "Kemba Walker",
      :number => 33,
      :shoe => 15,
      :points => 6,
      :rebounds => 12,
      :assists => 12,
      :steals => 7,
      :blocks => 5,
      :slam_dunks => 12
    }],
  },
}
end

def num_points_scored(players_name)
  points = 0
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name

            return points += player[:points]
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |p|
          if p[:player_name] == player
            return p[:shoe]
          end
        end
      end
    end
  end
end

def team_colors(the_team)
  colors = []
  game_hash.each do |place, team|
    if team[:team_name] == the_team
      team.each do |attribute, data|
        if attribute == :colors
          data.each do |color|
            colors << color
          end
        end
      end
    end
  end
  return colors
end

def team_names
  teams = []
  game_hash.each do |place, team|
    team.each do |team_attribute, team_data|
      if team_attribute == :team_name
        teams << team_data
      end
    end
  end
  return teams
end

def player_numbers(the_team_in_question)
  numbs = []
  game_hash.each do |place, team|
    if team[:team_name] == the_team_in_question
      team.each do |team_attribute, team_data|
        if team_attribute == :players
          team_data.each do |player_attributes|
            if player_attributes[:number]
              numbs << player_attributes[:number]
            end
          end
        end
      end
    end
  end
  return numbs
end

def player_stats(the_player_in_question)
  game_hash.each do |place, team|
    team.each do |team_keys, team_values|
      if team_keys == :players
        team_values.each do |player|
          if player[:player_name] == the_player_in_question
            player.delete(:player_name)
            return player
          end
        end
      end
    end
  end
end

def find_big_shoe_rebounds
  shoes = []
  game_hash.each do |place, team_info|
    team_info.each do |team_keys, team_values|
      if team_keys == :players
        team_values.each do |player|
          player.each do |player_key, player_value|
            if player_key == :shoe
              shoes << player_value
            end
          end
        end
      end
    end
  end
  return shoes.max
end

def big_shoe_rebounds
  game_hash.each do |place, team_info|
    team_info.each do |team_keys, team_values|
      if team_keys == :players
        team_values.each do |player|
          player.each do |player_key, player_value|
            # binding.pry
            if player_value == 19
              return player[:shoe]
            end
          end
        end
      end
    end
  end
end
