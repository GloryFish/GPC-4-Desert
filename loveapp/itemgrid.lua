-- 
--  itemgrid.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'vector'
require 'colors'

require 'items'

ItemGrid = class('ItemGrid')

function ItemGrid:initialize()
  self.itemSize = 16
  self.itemScale = 4
  self.position = vector(0, 0)
  self.itemIds = {}
  self.width = 5
  self.padding = 3
end

function ItemGrid:addItem(itemId)
  table.insert(self.itemIds, itemId)
end

function ItemGrid:update(dt)
end

function ItemGrid:draw()
  colors.white:set()
  
  for i, itemId in ipairs(self.itemIds) do
    
    local x = (i - 1) % self.width
    local y = math.floor((i - 1) / self.width)
    
    love.graphics.draw(items[itemId].image, 
                       self.position.x + x * (self.itemSize + self.padding) * self.itemScale, 
                       self.position.y + y * (self.itemSize + self.padding) * self.itemScale, 
                       0, 
                       self.itemScale, 
                       self.itemScale, 
                       0, 
                       0)
  end
end