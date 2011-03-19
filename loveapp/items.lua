-- 
--  items.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

items = {}

items[1] = {
  name = 'default',
  description = 'default image',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/default.png')
}

items[2] = {
  name = 'red',
  description = 'red image',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/red.png')
}

items[3] = {
  name = 'green',
  description = 'green image',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/green.png')
}

items[4] = {
  name = 'purple',
  description = 'purple image',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/purple.png')
}


for i, item in ipairs(items) do
  item.image:setFilter('nearest', 'nearest')
end