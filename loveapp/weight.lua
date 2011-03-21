-- 
--  weight.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'vector'
require 'colors'
require 'middleclass'

Weight = class('Weight')

function Weight:initialize()
  self.amount = 0
  self.currentAmount = 0
  self.position = vector(0, 0)
  self.width = 380
  
  self.burdenedPercent = 0.5
  self.maxWeight = 100
end

function Weight:update(dt)
  if self.amount < 0 then
    self.amount = 0
  end

  if self.amount > 1 then
    self.amount = 1
  end
  
  if self.amount > self.maxWeight then
    self.amount = self.maxWeight
  end

  self.currentAmount = self.amount
end

function Weight:draw()
  colors.white:set()
  love.graphics.setLineWidth(4)
  love.graphics.line(self.position.x + self.width * self.burdenedPercent, 
                     self.position.y - 4,
                     self.width * self.burdenedPercent,
                     self.position.y + 8)
  
  if self.currentAmount < self.burdenWeight then
    colors.green:set()
  else 
    colors.red:set()
  end
  
  local amount = (self.currentAmount / self.maxWeight) * self.width
  
  love.graphics.rectangle('fill', self.position.x, self.position.y, self.width * amount, 8)
end