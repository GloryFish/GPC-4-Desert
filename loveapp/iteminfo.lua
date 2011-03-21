-- 
--  iteminfo.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'vector'
require 'colors'
require 'items'

ItemInfo = class('ItemInfo')

function ItemInfo:initialize()
  self.itemId = 1
  self.position = vector(0, 0)
  self.width = 300
  self.height = 376
  self.itemId = 0
  self.padding = 10
end

function ItemInfo:setItemId(id)
  self.itemId = id
end

function ItemInfo:update(dt)
end

function ItemInfo:draw()
  love.graphics.setLineWidth(4)
  colors.transgray:set()
  love.graphics.rectangle('line', self.position.x, self.position.y, self.width, self.height)

  colors.transwhite:set()
  love.graphics.rectangle('fill', self.position.x, self.position.y, self.width, self.height)
  
  if self.itemId ~= 0 then
    local item = items[self.itemId]

    -- Item name
    love.graphics.setFont(fonts.default)
    colors.black:set()
    love.graphics.print(item.name, self.position.x + self.padding + 1, self.position.y + self.padding + 1)

    local nameColor = items.colorForRarity(item.rarity)
    nameColor:set()
    love.graphics.print(item.name, self.position.x + self.padding, self.position.y + self.padding)

    love.graphics.setFont(fonts.small)
    
    -- Value
    colors.black:set()
    love.graphics.printf(string.format('Worth: $%i', item.value), self.position.x + self.padding + 1, self.position.y + 40 + 1, self.width - self.padding * 2, 'left')

    colors.white:set()
    love.graphics.printf(string.format('Worth: $%i', item.value), self.position.x + self.padding, self.position.y + 40, self.width - self.padding * 2, 'left')

    -- Rarity
    colors.black:set()
    love.graphics.printf(string.format('Rarity: %s', item.rarity), self.position.x + self.padding + 1, self.position.y + 60 + 1, self.width - self.padding * 2, 'left')

    colors.white:set()
    love.graphics.printf(string.format('Rarity: %s', item.rarity), self.position.x + self.padding, self.position.y + 60, self.width - self.padding * 2, 'left')

    -- Item action
    colors.black:set()
    love.graphics.printf(string.format('Click to %s', item.action), self.position.x + self.padding + 1, self.position.y + 90 + 1, self.width - self.padding * 2, 'left')

    colors.white:set()
    love.graphics.printf(string.format('Click to %s', item.action), self.position.x + self.padding, self.position.y + 90, self.width - self.padding * 2, 'left')

    -- Item description
    colors.black:set()
    love.graphics.printf(item.description, self.position.x + self.padding + 1, self.position.y + 120, (self.width - self.padding * 2) + 1, 'left')

    colors.white:set()
    love.graphics.printf(item.description, self.position.x + self.padding, self.position.y + 120, self.width - self.padding * 2, 'left')
  end

end