-- 
--  items.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

-- Rarities: common, uncommon, rare, legendary

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
  description = 'A crisp apple. It is red and delicious,',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/apple.png')
}

items[3] = {
  name = 'book',
  description = 'An old book. Contains words of wisdom, or poetry, or something.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/book.png')
}

items[4] = {
  name = 'boombox',
  description = 'Pump up the jam. One singular jam.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/boombox.png')
}

items[5] = {
  name = 'broccoli',
  description = 'A hunk of broccoli. Uncooked.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/broccoli.png')
}

items[6] = {
  name = 'cheese',
  description = 'A wheel of cheese. Do people even buy these anymore?',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/cheese.png')
}

items[7] = {
  name = 'chicken',
  description = 'A whole roasted chicken cooked rotisserie style.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/chicken.png')
}

items[8] = {
  name = 'cap',
  description = 'A stylish blue baseball cap. To impress my... well, there\'s no one out here to impress, is there?',
  value = 5,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/cap.png')
}

items[9] = {
  name = 'candybar',
  description = 'A delicious chocolaty treat. Better not spoil my dinner!',
  value = 3,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/candybar.png')
}

items[10] = {
  name = 'cake',
  description = 'Baked to perfection! It\'s a tad salty... That\'s weird.',
  value = 3,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/cakeslice.png')
}

items[11] = {
  name = 'cell phone',
  description = 'No bars. Figures. The Symbian interface is a little wonky too.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/cell.png')
}

items[12] = {
  name = 'bag of chips',
  description = 'BBQ potato chips! Someone left the bag open though, so they\'re kind of stale.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/chips.png')
}

items[13] = {
  name = 'clock',
  description = 'A bell ringer alarm clock. A pleasing red color.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/clock.png')
}

items[14] = {
  name = 'gun',
  description = 'A gun. Maybe I can take potshots at some scorpions, or a coyote.',
  value = 10,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/gun.png')
}

items[15] = {
  name = 'hook',
  description = 'Oh! A delightful novelty hook hand! What fun!',
  value = 5,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/hook.png')
}

items[16] = {
  name = 'pair of glasses',
  description = 'Everything comes into focus...I\'m lost in a desert.',
  value = 15,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/glasses.png')
}

items[17] = {
  name = 'laptop',
  description = 'A shiny new MacBook Pro. No Wifi networks are available.',
  value = 200,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/laptop.png')
}

items[18] = {
  name = 'lunch',
  description = 'This appears to be Jay\'s lunch. Who\'s Jay?',
  value = 1000,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/lunch.png')
}

items[19] = {
  name = 'moose',
  description = 'A mounted moose head. This seems useful.',
  value = 100,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/moose.png')
}

items[20] = {
  name = 'liquor',
  description = 'This might be a good thing, or a very bad thing.',
  value = 20,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/liquor.png')
}

items[21] = {
  name = 'bottle of pills',
  description = 'Makes everything seem a bit nicer.',
  value = 20,
  rarity = 'uncommon',
  action = 'drop',
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
  value = 200,
  rarity = 'rare',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/money.png')
}

items[24] = {
  name = 'cup',
  description = 'A red plastic party cup. This would look good with booze in it.',
  value = 20,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/partycup.png')
}

items[25] = {
  name = 'hat',
  description = 'A wild and crazy party hat.',
  value = 20,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/partyhat.png')
}

items[26] = {
  name = 'phone',
  description = 'Ring ring! Hello? Who is it? Oh that\'s right, nobody.',
  value = 30,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/phone.png')
}

items[26] = {
  name = 'photo',
  description = 'This appears to be a photo of a dog or a monkey.',
  value = 40,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/photo.png')
}

items[27] = {
  name = 'plant',
  description = 'A potted plant. Sorry buddy. I need the water more than you.',
  value = 5,
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
  description = 'Wow. A rock. Amazing.',
  value = 1,
  rarity = 'common',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/rock.png')
}

items[30] = {
  name = 'shoe',
  description = 'A sturdy shoe. Looks like it\'ll protect my feet.',
  value = 20,
  rarity = 'uncommon',
  action = 'drop',
  image = love.graphics.newImage('resources/images/items/shoe.png')
}

items[31] = {
  name = 'soda',
  description = 'I did not know they still made Tab. Restores a small amount of energy.',
  value = 20,
  rarity = 'uncommon',
  action = 'use',
  energy = 0.1,
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

function items.getRandomId()
  -- TODO: pick item based on rarity
  return math.random(items.count)
end
for i, item in ipairs(items) do
  item.image:setFilter('nearest', 'nearest')
end