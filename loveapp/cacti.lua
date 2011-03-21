-- 
--  cacti.lua
--  desert
--  
--  Draws scrolling cacti
--
--  Created by Jay Roberts on 2011-03-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'vector'
require 'colors'

Cacti = class('Cacti')

function Cacti:initialize()
  self.image = love.graphics.newImage('resources/images/cacti.png')
  self.image:setFilter('nearest', 'nearest')
  self.quads = {
    love.graphics.newQuad(0 * 16, 0, 16, 32, self.image:getWidth(), self.image:getHeight()),
    love.graphics.newQuad(1 * 16, 0, 16, 32, self.image:getWidth(), self.image:getHeight()),
    love.graphics.newQuad(2 * 16, 0, 16, 32, self.image:getWidth(), self.image:getHeight()),
    love.graphics.newQuad(3 * 16, 0, 16, 32, self.image:getWidth(), self.image:getHeight())
  }

  self.cacti = {}
  self.speed = 40
  self.moving = true
  
  self.interval = 0
end

function Cacti:add()
  local layers = {'back', 'front'}
  local layer = layers[math.random(2)]
  
  local cactus = {
    kind = math.random(#self.quads),
    position = vector(love.graphics.getWidth(), 0),
    layer = layer
  }
  table.insert(self.cacti, cactus)
end

function Cacti:getInterval()
  return math.random(7, 10)
end


function Cacti:update(dt)
  if self.moving then
    self.interval = self.interval - dt

    if self.interval < 0 then
      self:add()
      self.interval = self:getInterval()
    end
    
    local toRemove = {}
    for i, cactus in ipairs(self.cacti) do
      if cactus.layer == 'front' then
        cactus.position.x = cactus.position.x - self.speed * dt
      else
        cactus.position.x = cactus.position.x - self.speed * dt * 0.5
      end
      
      if cactus.position.x < -16 then
        table.insert(toRemove, i)
      end
    end
    for i, v in ipairs(toRemove) do
       table.remove(self.cacti, v - i + 1)
    end
  end
end

function Cacti:drawBack()
  colors.white:set()
  for i, cactus in ipairs(self.cacti) do
    if cactus.layer == 'back' then
      love.graphics.drawq(self.image, self.quads[cactus.kind], cactus.position.x, 400, 0, 2, 2, 0, 0)
    end
  end
end

function Cacti:drawFront()
  colors.white:set()
  for i, cactus in ipairs(self.cacti) do
    if cactus.layer == 'front' then
      love.graphics.drawq(self.image, self.quads[cactus.kind], cactus.position.x, 500, 0, 4, 4, 0, 0)
    end
  end
end