require 'mini_magick'

module Dota2api
  RADIANT_TOWERS = [
      [130, 795], # t4 top
      [150, 810], # t4 bot
      [250, 870], # t3 bot
      [480, 870], # t2 bot
      [820, 870], # t1 bot
      [205, 745], # t3 mid
      [270, 660], # t2 mid
      [410, 580], # t1 mid
      [80, 700],  # t3 top
      [115, 520],  # t2 top
      [115, 383]  # t1 top
  ]
  DIRE_TOWERS = [
      [830, 180], # t4 top
      [860, 205], # t4 bot
      [895, 310], # t3 bot
      [910, 490], # t2 bot
      [875, 597], # t1 bot
      [760, 265], # t3 mid
      [640, 350], # t2 mid
      [560, 470], # t1 mid
      [725, 130], # t3 top
      [450, 100], # t2 top
      [180, 100] # t1 top
  ]
  RADIANT_BARRACKS = [
      [220, 890], # BOT RANGED
      [220, 850], # BOT MELEE
      [165, 760], # MID RANGED
      [195, 780], # MID MELEE
      [60, 730], # TOP RANGED
      [100, 730] # TOP MELEE
  ]
  DIRE_BARRACKS = [
      [870, 285], # BOT RANGED
      [920, 285], # BOT MELEE
      [775, 235], # MID RANGED
      [800, 255], # MID MELEE
      [750, 110], # TOP RANGED
      [750, 150] # TOP MELEE
  ]

  def self.map tower_status_radiant, tower_status_dire, barracks_status_radiant, barracks_status_dire
    tower_status_radiant = sprintf('%011b', tower_status_radiant)
    tower_status_dire = sprintf('%011b', tower_status_dire)
    barracks_status_radiant = sprintf('%011b', barracks_status_radiant)[5..-1]
    barracks_status_dire = sprintf('%011b', barracks_status_dire)[5..-1]

    result = MiniMagick::Image.open("#{Dota2api.root}/data/dota_map.jpg")
    tower_radiant = MiniMagick::Image.open("#{Dota2api.root}/data/tower_radiant.png")
    tower_dire = MiniMagick::Image.open("#{Dota2api.root}/data/tower_dire.png")
    barracks_radiant = MiniMagick::Image.open("#{Dota2api.root}/data/racks_radiant.png")
    barracks_dire = MiniMagick::Image.open("#{Dota2api.root}/data/racks_dire.png")

    data = [[
        tower_status_radiant,
        tower_radiant,
        RADIANT_TOWERS
      ],[
        tower_status_dire,
        tower_dire,
        DIRE_TOWERS
      ],[
        barracks_status_radiant,
        barracks_radiant,
        RADIANT_BARRACKS
      ],[
        barracks_status_dire,
        barracks_dire,
        DIRE_BARRACKS
    ]]

    data.each do |status, pic, positions|
      positions.each_with_index do |pos, index|
        if defined?(status[index]) and status[index] == "1"
          result = result.composite(pic) do |c|
            c.compose "Over"
            c.geometry "+#{pos[0]}+#{pos[1]}"
          end
        end
      end
    end

    result
  end

end
