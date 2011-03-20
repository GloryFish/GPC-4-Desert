-- 
--  iventory.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'vector'
require 'colors'
require 'logger'

require 'items'

Inventory = class('Inventory')

function Inventory:initialize()
  self.itemSize = 16
  self.itemScale = 4
  self.position = vector(0, 0)
  self.itemIds = {}
  self.width = 9
  self.padding = 3
  self.selectedIndex = 0
  self.maxitems = 50
  
  self.log = Logger(vector(10, 10))
end

function Inventory:addItem(itemId)
  if #self.itemIds < self.maxitems + 1 then
    table.insert(self.itemIds, itemId)
  end
end

function Inventory:update(dt, mousePos)
  self.log:update(dt)
  self.mousePos = mousePos
  self.selectedIndex = self:itemIndexAtPosition(mousePos)
end

-- Returns the list index of the item that is displayed at the world position specified by pos
function Inventory:itemIndexAtPosition(pos)
  if pos == nil then
    return 0
  end
  
  local grid = vector(math.floor( (pos.x - self.position.x - self.itemSize / 2) / ( (self.itemSize + self.padding) * self.itemScale)),
                      math.floor( (pos.y - self.position.y - self.itemSize / 2) / ( (self.itemSize + self.padding) * self.itemScale)))

  if grid.x < 0 or 
     grid.x > self.width or 
     grid.y < 0 or
     grid.y > math.floor((#self.itemIds - 1) / self.width) then
    return 0
  end

  return ((grid.y * self.width) + grid.x) + 1
end

function Inventory:drawGrid()
  colors.transgray:set()
  
  love.graphics.setLineWidth(4)
  
  for x = 0, self.width - 1 do
    for y = 0, (self.maxitems / self.width) do
      
      local boxX = self.position.x + x * (self.itemSize + self.padding) * self.itemScale
      local boxY = self.position.y + y * (self.itemSize + self.padding) * self.itemScale
      
      love.graphics.rectangle('line', 
                              boxX, 
                              boxY, 
                              (self.itemSize + 2) * self.itemScale, 
                              (self.itemSize + 2) * self.itemScale)
    end
  end
end

function Inventory:draw()
  -- Draw grid
  self:drawGrid()
  
  -- Draw items
  for i, itemId in ipairs(self.itemIds) do
    colors.white:set()
    
    local x = (i - 1) % self.width
    local y = math.floor((i - 1) / self.width)
    
    local imageX = self.position.x + x * (self.itemSize + self.padding) * self.itemScale
    local imageY = self.position.y + y * (self.itemSize + self.padding) * self.itemScale
    
    love.graphics.draw(items[itemId].image, 
                       imageX, 
                       imageY, 
                       0, 
                       self.itemScale, 
                       self.itemScale, 
                       0, 
                       0)

    -- Draw selected
    if self.selectedIndex == i then
      colors.red:set()
      love.graphics.setLineWidth(4)
      love.graphics.rectangle('line', 
                              imageX - 1, 
                              imageY - 1,  
                              (self.itemSize + 2) * self.itemScale,
                              (self.itemSize + 2)* self.itemScale)
      colors.white:set()
    end
  end
  
  self.log:draw()
end