-- 
--  hazards.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-21.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'colors'

hazards = {}

hazards[1] = {
  name = 'desert rat',
  description = 'A snarling desert rat.',
  damage = 0.25,
  image = love.graphics.newImage('resources/images/hazards/desertrat.png')
}

hazards[2] = {
  name = 'pit',
  description = 'A yawining pit. With spikes. Kind of borning. YAAAWN.',
  damage = 0.25,
  image = love.graphics.newImage('resources/images/hazards/pit.png')
}

hazards[3] = {
  name = 'scorpion',
  description = 'A scorpion. Is it on me? I feel like it\'s on me.',
  damage = 0.25,
  image = love.graphics.newImage('resources/images/hazards/scorpion.png')
}

hazards[4] = {
  name = 'viper',
  description = 'It hisses like a viper. It slithers like a viper. It kills you with poison like a viper. Must be a viper.',
  damage = 0.25,
  image = love.graphics.newImage('resources/images/hazards/viper.png')
}

hazards.count = 4

function hazards.getRandomId()
  -- TODO: pick item based on rarity
  return math.random(hazards.count)
end

for i, hazard in ipairs(hazards) do
  hazard.image:setFilter('nearest', 'nearest')
end