-- 
--  energy.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'vector'
require 'colors'
require 'middleclass'

Energy = class('Energy')

function Energy:initialize()
  self.amount = 1
  self.currentAmount = 1
  self.position = vector(0, 0)
  self.width = 380
end

function Energy:update(dt)
  if self.amount < 0 then
    self.amount = 0
  end

  if self.amount > 1 then
    self.amount = 1
  end

  self.currentAmount = self.amount
end

function Energy:draw()
  if self.currentAmount > 0.6 then
    colors.green:set()
  elseif self.currentAmount > 0.25 then
    colors.orange:set()
  else
    colors.red:set()
  end
  
  love.graphics.rectangle('fill', self.position.x, self.position.y, self.width * self.currentAmount, 8)

  colors.transgray:set()
  love.graphics.rectangle('line', self.position.x - 2, self.position.y - 2, self.width + 4, 13)

end