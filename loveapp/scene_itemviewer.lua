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

itemviewer = Gamestate.new()
itemviewer.level = ''

function itemviewer.enter(self, pre)
end

function itemviewer.mousepressed(self, x, y, button)
end

function itemviewer.mousereleased(self, x, y, button)
end

function itemviewer.update(self, dt)
end

function itemviewer.draw(self)
  colors.white:set()
  
  love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end

function itemviewer.leave(self)
end