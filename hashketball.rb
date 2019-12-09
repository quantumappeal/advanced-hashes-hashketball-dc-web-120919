def num_points_scored(sought_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players
      data.each do |player|
        return player[:points] if player[:player_name] == sought_player_name
      end
    end
  end
end
def shoe_size(sought_player_name)
  game_hash.each do |_place, team|
    team.each do |attribute, data|
      next unless attribute == :players
      data.each do |player|
        return player[:shoe] if player[:player_name] == sought_player_name
      end
    end
  end
end
def team_colors(team_name)
  game_hash.each do |place, team|
    return game_hash[place][:colors] if team[:team_name] == team_name
  end
end
def team_names
  game_hash.collect do |_place, team|
    team[:team_name]
  end
end
def player_numbers(team_name)
  nums = []
  game_hash.each do |_place, team|
    next unless team[:team_name] == team_name
    team.each do |attribute, data|
      next unless attribute == :players
      data.each do |data|
        nums << data[:number]
      end
    end
  end
  nums
end
def player_stats(sought_player_name)
  new_hash = {}
  game_hash.collect do |place, team|
    team.each do |attribute, _data|
      next unless attribute == :players
      game_hash[place][attribute].each do |player|
        next unless player[:player_name] == sought_player_name
        new_hash = player.delete_if do |k, _v|
          k == :player_name
        end
      end
    end
  end
  new_hash
end
def big_shoe_rebounds
  biggest_shoe = 0
  num_rebounds = 0
  game_hash.each do |_team, game_data|
    game_data[:players].each do |player|
      if player[:shoe] > biggest_shoe
        biggest_shoe = player[:shoe]
        num_rebounds = player[:rebounds]
      end
    end
  end
  num_rebounds
end










