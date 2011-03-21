-- 
--  balloons.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-21.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'vector'
require 'colors'
require 'middleclass'

Balloons = class('Balloons')

function Balloons:initialize()
  self.image = love.graphics.newImage('resources/images/balloon.png')
  self.image:setFilter('nearest', 'nearest')
  
  self.colors = {
    colors.red,
    colors.green,
    colors.blue,
    colors.orange,
    colors.purple,
    colors.pink,
    colors.yellow
  }
  
  self.balloons = {}
  self.baseSpeed = 40
  self.moving = true
  
  self.interval = 0  
end

function Balloons:add()
  local balloon = {
    position = vector(love.graphics.getWidth(), math.random(50, 300)),
    color = self.colors[math.random(#self.colors)],
    speed = math.random() + 1,
    scale = (math.random() + 0.5) * 4
  }
  table.insert(self.balloons, balloon)
end

function Balloons:getInterval()
  return math.random(2, 5)
end

function Balloons:update(dt)
  if self.moving then
    self.interval = self.interval - dt

    if self.interval < 0 then
      self:add()
      self.interval = self:getInterval()
    end
    
    local toRemove = {}
    for i, balloon in ipairs(self.balloons) do
      balloon.position.x = balloon.position.x - self.baseSpeed * balloon.speed * dt
      
      if balloon.position.x < -64 then
        table.insert(toRemove, i)
      end
    end
    for i, v in ipairs(toRemove) do
       table.remove(self.balloons, v - i + 1)
    end
  end
end

function Balloons:draw()
  for i, balloon in ipairs(self.balloons) do
    balloon.color:set()
    love.graphics.draw(self.image, balloon.position.x, balloon.position.y, 0, balloon.scale, balloon.scale, 0, 0)
  end
end