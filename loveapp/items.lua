-- 
--  items.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'colors'

items = {}

items[1] = {
  name = 'water',
  description = 'A refreshing beverage. Restores some energy.',
  value = 1,
  rarity = 'common',
  action = 'use',
  energy = 0.25,
  image = love.graphics.newImage('resources/images/items/water.png')
}

items[2] = {
  name = 'apple',
  description = 'A crisp apple. It is red and delicious. Restores a bit of energy.',
  value = 1,
  rarity = 'common',
  action = 'use',
  energy = 0.1,
  image = love.graphics.newImage('resources/images/items/apple.png')
}

items[3] = {
  name = 'book',
  description = 'An old book.  Contains words of wisdom, or poems, or something.',
  value = 10,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/book.png')
}

items[4] = {
  name = 'boombox',
  description = 'Pump up the jam. One singular jam.',
  value = 30,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/boombox.png')
}

items[5] = {
  name = 'broccoli',
  description = 'A hunk of broccoli. Uncooked. Will restor a tiny amount of energy.',
  value = 1,
  rarity = 'common',
  action = 'use',
  energy = 0.05,
  image = love.graphics.newImage('resources/images/items/broccoli.png')
}

items[6] = {
  name = 'cheese',
  description = 'A wheel of cheese. Do people even buy these anymore? Restores a lot of energy.',
  value = 4,
  rarity = 'rare',
  action = 'use',
  energy = 0.5,
  image = love.graphics.newImage('resources/images/items/cheese.png')
}

items[7] = {
  name = 'chicken',
  description = 'A whole roasted chicken cooked rotisserie style. Restores some energy.',
  value = 6,
  rarity = 'common',
  action = 'use',
  energy = 0.25,
  image = love.graphics.newImage('resources/images/items/chicken.png')
}

items[8] = {
  name = 'cap',
  description = 'A collectible baseball cap. To impress my... well, there\'s no one out here to impress, is there?',
  value = 45,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/cap.png')
}

items[9] = {
  name = 'candybar',
  description = 'A delicious chocolaty treat. Better not spoil my dinner! restores some energy.',
  value = 10,
  rarity = 'uncommon',
  action = 'use',
  energy = 0.1,
  image = love.graphics.newImage('resources/images/items/candybar.png')
}

items[10] = {
  name = 'cake',
  description = 'Baked to perfection! It\'s a tad salty... That\'s weird. Restores some energy.',
  value = 3,
  rarity = 'uncommon',
  action = 'use',
  energy = 0.20,
  image = love.graphics.newImage('resources/images/items/cakeslice.png')
}

items[11] = {
  name = 'cell phone',
  description = 'No bars. Figures. The Symbian interface is a little wonky too.',
  value = 55,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/cell.png')
}

items[12] = {
  name = 'bag of chips',
  description = 'BBQ potato chips! Someone left the bag open though, so they\'re kind of stale. Restores a bit of energy.',
  value = 1,
  rarity = 'common',
  action = 'use',
  energy = 0.1,
  image = love.graphics.newImage('resources/images/items/chips.png')
}

items[13] = {
  name = 'clock',
  description = 'An antique bell-ringer alarm clock. A pleasing red color.',
  value = 200,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/clock.png')
}

items[14] = {
  name = 'gun',
  description = 'A gun. I bet I could hit a scorpion or a rat. I\'m awesome.',
  value = 9,
  rarity = 'uncommon',
  action = 'drop',
  protect = {1, 3},
  image = love.graphics.newImage('resources/images/items/gun.png')
}

items[15] = {
  name = 'hook',
  description = 'Oh! A delightful novelty hook hand! What fun! I could use it to fling a snake away.',
  value = 75,
  rarity = 'uncommon',
  action = 'drop',
  protect = {4},
  image = love.graphics.newImage('resources/images/items/hook.png')
}

items[16] = {
  name = 'pair of glasses',
  description = 'Everything comes into focus...I\'m lost in a desert.',
  value = 102,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/glasses.png')
}

items[17] = {
  name = 'laptop',
  description = 'A shiny new MacBook Pro. No Wifi networks are available.',
  value = 300,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/laptop.png')
}

items[18] = {
  name = 'lunch',
  description = 'This appears to be Jay\'s lunch. Who\'s Jay?',
  value = 1500,
  rarity = 'legendary',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/lunch.png')
}

items[19] = {
  name = 'moose',
  description = 'A mounted moose head. This seems useful.',
  value = 375,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/moose.png')
}

items[20] = {
  name = 'liquor',
  description = 'This might be a good thing, or a very bad thing.',
  value = 93,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/liquor.png')
}

items[21] = {
  name = 'bottle of pills',
  description = 'Standard prescription bottle. Says "universal antivenom" on the label.',
  value = 10,
  rarity = 'uncommon',
  action = 'drop',
  protect = {3, 4},
  image = love.graphics.newImage('resources/images/items/meds.png')
}

items[22] = {
  name = 'log',
  description = 'A very dull log.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/log.png')
}

items[23] = {
  name = 'money',
  description = 'I should spend it wisely, if I could find somewhere to spend it...',
  value = 404,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/money.png')
}

items[24] = {
  name = 'cup',
  description = 'A red plastic party cup. Worth more than it looks apparently.',
  value = 80,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/partycup.png')
}

items[25] = {
  name = 'hat',
  description = 'A wild and crazy party hat.',
  value = 95,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/partyhat.png')
}

items[26] = {
  name = 'phone',
  description = 'Ring ring! Hello? Who is it? Oh that\'s right, nobody.',
  value = 57,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/phone.png')
}

items[26] = {
  name = 'photo',
  description = 'This appears to be a photo of a dog or a monkey.',
  value = 99,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/photo.png')
}

items[27] = {
  name = 'plant',
  description = 'A potted plant. Sorry buddy. I need the water more than you.',
  value = 17,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/plant.png')
}

items[28] = {
  name = 'ring',
  description = 'A nice gold ring. I tried it on. I didn\'t turn invisible.',
  value = 500,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/ring.png')
}

items[29] = {
  name = 'rock',
  description = 'Wow. A rock. Amazing. Could probanly fill a hole with it.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  protect = {2},
  image = love.graphics.newImage('resources/images/items/rock.png')
}

items[30] = {
  name = 'shoe',
  description = 'A sturdy shoe. Looks like it\'ll protect my feet.',
  value = 10,
  rarity = 'uncommon',
  action = 'drop',
  protect = {2, 3},
  image = love.graphics.newImage('resources/images/items/shoe.png')
}

items[31] = {
  name = 'soda',
  description = 'I did not know they still made Tab. Restores a small amount of energy.',
  value = 20,
  rarity = 'uncommon',
  action = 'use',
  energy = 0.25,
  image = love.graphics.newImage('resources/images/items/soda.png')
}

items[32] = {
  name = 'tumbleweed',
  description = 'Just a nice tumbleweed. Look at it tumblin\'.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/tumbleweed.png')
}

items[33] = {
  name = 'moonshine',
  description = 'Uh oh.',
  value = 200,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/moonshine.png')
}

items.count = 33

function items.colorForRarity(rarity)
  if rarity == 'common' then
    return colors.white
  elseif rarity == 'uncommon' then
    return colors.green
  elseif rarity == 'rare' then
    return colors.blue
  elseif rarity == 'legendary' then
    return colors.orange
  end
end

function items.weightForRarity(rarity)
  if rarity == 'common' then
    return 65
  elseif rarity == 'uncommon' then
    return 25
  elseif rarity == 'rare' then
    return 10
  elseif rarity == 'legendary' then
    return 1
  end
end

function items.getRandomIdEnergy()
  local threshold = math.random(0, items.totalWeight())
  local last_choice
  for i, item in ipairs(items) do
    if item.rarity ~= nil then
      threshold = threshold - items.weightForRarity(item.rarity)
      if threshold <= 0 and items[i].energy ~= nil then 
        return i
      end
      last_choice = i
    end
  end
  return last_choice
end

function items.getRandomId()
  local threshold = math.random(0, items.totalWeight())
  local last_choice
  for i, item in ipairs(items) do
    if item.rarity ~= nil then
      threshold = threshold - items.weightForRarity(item.rarity)
      if threshold <= 0 then 
        return i
      end
      last_choice = i
    end
  end
  return last_choice
end

function items.totalWeight()
  local total = 0
  for i, item in ipairs(items) do
    if item.rarity ~= nil then
      total = total + items.weightForRarity(item.rarity)
    end
  end
  return total
end

for i, item in ipairs(items) do
  item.image:setFilter('nearest', 'nearest')
end