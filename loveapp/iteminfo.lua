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
  self.height = 380
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
    local nameColor = items.colorForRarity(item.rarity)
    nameColor:set()
    love.graphics.print(item.name, self.position.x + self.padding, self.position.y + self.padding)

    love.graphics.setFont(fonts.small)
    colors.white:set()
    
    -- Value
    love.graphics.printf(string.format('Worth: $%i', item.value), self.position.x + self.padding, self.position.y + 40, self.width - self.padding * 2, 'left')

    -- Rarity
    love.graphics.printf(string.format('Rarity: %s', item.rarity), self.position.x + self.padding, self.position.y + 60, self.width - self.padding * 2, 'left')

    -- Item description
    love.graphics.printf(item.description, self.position.x + self.padding, self.position.y + 90, self.width - self.padding * 2, 'left')
    
    
  end

end