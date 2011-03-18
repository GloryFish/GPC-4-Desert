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
    center = vector(300, 300),
    radius = 200
  }
  
  self.time = 0
end


function Background:update(dt, time)
  self.time = time
end


function Background:draw()
  -- Draw night sky
  
  
  -- Draw day sky
  love.graphics.setColor(colors.skyblue.r,
                         colors.skyblue.g,
                         colors.skyblue.b,
                         self.time * 255)
  love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight() - 150)
  
  
  -- Draw ground
  love.graphics.setColor(colors.brown.r,
                         colors.brown.g,
                         colors.brown.b,
                         colors.brown.a)
  love.graphics.rectangle('fill', 0, love.graphics.getHeight() - 150, love.graphics.getWidth(), 150)


  local sunPos = vector(self.system.center.x + math.cos(self.time * 2 * math.pi + math.pi) * self.system.radius,
                        self.system.center.y + math.sin(self.time * 2 * math.pi + math.pi) * self.system.radius) 

  local moonPos = vector(self.system.center.x + math.cos(self.time * 2 * math.pi) * self.system.radius,
                         self.system.center.y + math.sin(self.time * 2 *math.pi) * self.system.radius) 

  
  -- Draw celestial system
  love.graphics.setColor(colors.white.r,
                         colors.white.g,
                         colors.white.b,
                         colors.white.a)
  -- Draw sun
  love.graphics.draw(self.sun, sunPos.x, sunPos.y, 0, 4, 4, 16, 16)
  
  -- Draw moon
  love.graphics.draw(self.moon, moonPos.x, moonPos.y, 0, 4, 4, 16, 16)

  love.graphics.setColor(colors.red.r,
                         colors.red.g,
                         colors.red.b,
                         colors.red.a)
  love.graphics.circle('line', self.system.center.x, self.system.center.y, 15, 15)


end

