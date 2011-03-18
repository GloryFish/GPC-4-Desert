-- 
--  background.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-17.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'vector'
require 'colors'

Background = class('Background')

function Background:initialize(pos)
  self.sun = love.graphics.newImage('resources/images/sun.png')
  self.sun:setFilter('nearest', 'nearest')

  self.moon = love.graphics.newImage('resources/images/moon.png')
  self.moon:setFilter('nearest', 'nearest')
  
  self.system = {
    center = vector(love.graphics.getWidth() / 2, 400),
    radius = 370
  }
  
  self.time = 0
end


function Background:update(dt, time)
  self.time = time
end


function Background:draw()
  -- Draw night sky
  
  
  -- Draw day sky
  local skyAlpha = 0
  
  if self.time >= 0 and self.time < 0.5 then -- Day
    skyAlpha = 1
  end
  
  
  if self.time >= 0.5 and self.time < 0.75 then
    skyAlpha = ((self.time - 0.5) / 0.25) * 1.7
    if skyAlpha > 1 then
      skyAlpha = 1
    end
    skyAlpha = 1 - skyAlpha
  end 

  if self.time >= 0.75 and self.time <= 1 then
    skyAlpha = 1.7 - ( (self.time - 0.75) / 0.25) * 1.7
    if skyAlpha > 1 then
      skyAlpha = 1
    end
    skyAlpha = 1 - skyAlpha
  end 
  
  love.graphics.setColor(colors.skyblue.r,
                         colors.skyblue.g,
                         colors.skyblue.b,
                         skyAlpha * 255)
  love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight() - 150)
  
  -- Draw celestial system
  local sunPos = vector(self.system.center.x + math.cos(self.time * 2 * math.pi + math.pi) * self.system.radius,
                        self.system.center.y + math.sin(self.time * 2 * math.pi + math.pi) * self.system.radius) 

  local moonPos = vector(self.system.center.x + math.cos(self.time * 2 * math.pi) * self.system.radius,
                         self.system.center.y + math.sin(self.time * 2 *math.pi) * self.system.radius) 
  
  love.graphics.setColor(colors.white.r,
                         colors.white.g,
                         colors.white.b,
                         colors.white.a)
  -- Draw sun
  love.graphics.draw(self.sun, sunPos.x, sunPos.y, 0, 4, 4, 16, 16)
  
  -- Draw moon
  love.graphics.draw(self.moon, moonPos.x, moonPos.y, 0, 4, 4, 16, 16)

  -- Draw ground
  love.graphics.setColor(colors.brown.r,
                         colors.brown.g,
                         colors.brown.b,
                         colors.brown.a)
  love.graphics.rectangle('fill', 0, love.graphics.getHeight() - 150, love.graphics.getWidth(), 150)

end

