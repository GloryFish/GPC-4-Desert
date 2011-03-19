-- 
--  man.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

Man = class('Man')

function Man:initialize(pos)
  self.position = pos
  self.state = 'standing'
end

function Man:setState(state)
end

function Man:update(dt)
end

function Man:draw()
  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.setFont(fonts.default)
  
  local lineWidth = fonts.default:getWidth(self.state)
  love.graphics.print(self.state, 
                      self.position.x - lineWidth / 2, 
                      self.position.y);
end