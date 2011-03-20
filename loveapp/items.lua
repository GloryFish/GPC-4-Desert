-- 
--  items.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

-- Rarities: common, uncommon, rare, legendary

items = {}

items[1] = {
  name = 'water',
  description = 'A refreshing beverage. Restores some energy.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/water.png')
}

items[2] = {
  name = 'apple',
  description = 'A crisp apple. It is red and delicious,',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/apple.png')
}

items[3] = {
  name = 'book',
  description = 'An old book. Contains words of wisdom, or poetry, or something.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/book.png')
}

items[4] = {
  name = 'boombox',
  description = 'Pump up the jam.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/boombox.png')
}

items[5] = {
  name = 'broccoli',
  description = 'A hunk of broccoli. Uncooked.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/broccoli.png')
}

items[6] = {
  name = 'cheese',
  description = 'A wheel of cheese. Do people even buy these anymore?',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/cheese.png')
}

items[7] = {
  name = 'chicken',
  description = 'A whole roasted chicken cooked rotisserie style.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/chicken.png')
}

items[8] = {
  name = 'cap',
  description = 'A stylish blue baseball cap. Impress your... well, there\'s no one out here to impress, is there?',
  value = 5,
  rarity = 'rare',
  image = love.graphics.newImage('resources/images/items/cap.png')
}

items[9] = {
  name = 'candybar',
  description = 'A delicious chocolaty treat. Don\'t spoil your dinner!',
  value = 3,
  rarity = 'uncommon',
  image = love.graphics.newImage('resources/images/items/candybar.png')
}

items[10] = {
  name = 'cake',
  description = 'Baked to perfection! It\'s a tad salty... That\'s weird.',
  value = 3,
  rarity = 'uncommon',
  image = love.graphics.newImage('resources/images/items/cakeslice.png')
}

items[11] = {
  name = 'cell',
  description = 'No bars. Figures. The Symbian interface is a little wonky too.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/cell.png')
}

items[12] = {
  name = 'chips',
  description = 'BBQ potato chips! Someone left the bag open though, so they\'re kind of stale.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/chips.png')
}

items[13] = {
  name = 'clock',
  description = 'A bell ringer alarm clock. A pleasing red color.',
  value = 1,
  rarity = 'common',
  image = love.graphics.newImage('resources/images/items/clock.png')
}

items[14] = {
  name = 'gun',
  description = 'A gun. Maybe you can take potshots at some scorpions, or a coyote.',
  value = 10,
  rarity = 'uncommon',
  image = love.graphics.newImage('resources/images/items/gun.png')
}

items[15] = {
  name = 'hook',
  description = 'Oh! A delightful novelty hook hand! What fun!',
  value = 5,
  rarity = 'uncommon',
  image = love.graphics.newImage('resources/images/items/hook.png')
}

items[16] = {
  name = 'glasses',
  description = 'Everything comes into focus... you\'re lost in a desert.',
  value = 5,
  rarity = 'uncommon',
  image = love.graphics.newImage('resources/images/items/glasses.png')
}

items[17] = {
  name = 'laptop',
  description = 'A shiny new MacBook Pro. How\'d this get way out here?',
  value = 50,
  rarity = 'rare',
  image = love.graphics.newImage('resources/images/items/laptop.png')
}

items[18] = {
  name = 'lunch',
  description = 'This appears to be Jay\'s lunch. Who\'s Jay?',
  value = 1000,
  rarity = 'rare',
  image = love.graphics.newImage('resources/images/items/lunch.png')
}

items[19] = {
  name = 'moose',
  description = 'A mounted moose head. This seems useful.',
  value = 100,
  rarity = 'rare',
  image = love.graphics.newImage('resources/images/items/moose.png')
}

items[20] = {
  name = 'liquor',
  description = 'Smells like either very strong bourbon or iodine.',
  value = 20,
  rarity = 'uncommon',
  image = love.graphics.newImage('resources/images/items/liquor.png')
}

items[21] = {
  name = 'meds',
  description = 'Makes everything seem a bit nicer.',
  value = 20,
  rarity = 'uncommon',
  image = love.graphics.newImage('resources/images/items/meds.png')
}


for i, item in ipairs(items) do
  item.image:setFilter('nearest', 'nearest')
end