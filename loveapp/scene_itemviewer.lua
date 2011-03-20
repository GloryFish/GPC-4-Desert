-- 
--  scene_itemviewer.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'logger'
require 'vector'
require 'colors'
require 'items'
require 'inventory'

itemviewer = Gamestate.new()
itemviewer.level = ''

function itemviewer.enter(self, pre)
  itemviewer.period = 120
  
  itemviewer.inventory = Inventory()
  itemviewer.inventory.position = vector(50, 50)
  
  for i = 1, #items do
    itemviewer.inventory:addItem(i)
  end  
end

function itemviewer.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function itemviewer.mousepressed(self, x, y, button)
end

function itemviewer.mousereleased(self, x, y, button)
end

function itemviewer.update(self, dt)
  itemviewer.elapsed = itemviewer.elapsed + dt
  local _, time = math.modf(itemviewer.elapsed / itemviewer.period)

  itemviewer.background:update(dt, time)
  
  local mousePos = vector(love.mouse.getX(), love.mouse.getY())
  itemviewer.inventory:update(dt, mousePos)
end

function itemviewer.draw(self)
  itemviewer.background:draw(dt, time)

  itemviewer.inventory:draw(dt)
end

function itemviewer.quit(self)
  Gamestate.switch(intro)
end

function itemviewer.leave(self)
end