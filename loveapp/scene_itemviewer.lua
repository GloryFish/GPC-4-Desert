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
require 'itemgrid'

itemviewer = Gamestate.new()
itemviewer.level = ''

function itemviewer.enter(self, pre)
  itemviewer.itemgrid = ItemGrid()
  itemviewer.itemgrid.position = vector(50, 50)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(2)
  itemviewer.itemgrid:addItem(3)
  itemviewer.itemgrid:addItem(4)
  itemviewer.itemgrid:addItem(2)
  itemviewer.itemgrid:addItem(3)
  itemviewer.itemgrid:addItem(3)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(1)
  itemviewer.itemgrid:addItem(3)
  itemviewer.itemgrid:addItem(4)
  itemviewer.itemgrid:addItem(2)
  
end

function itemviewer.mousepressed(self, x, y, button)
end

function itemviewer.mousereleased(self, x, y, button)
end

function itemviewer.update(self, dt)
  itemviewer.itemgrid:update(dt)
end

function itemviewer.draw(self)
  colors.gray:set()
  love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())

  itemviewer.itemgrid:draw(dt)
end

function itemviewer.leave(self)
end