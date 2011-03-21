-- 
--  logo.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'vector'
require 'middleclass'

Logo = class('Logo')

function Logo:initialize()
  self.image = love.graphics.newImage('resources/images/logo.png')
  self.image:setFilter('nearest', 'nearest')
  self.position = vector(0, 0)
  self.opacity = 0

  self.duration = 0
  self.fadeInMax = 2
  self.state = ''
end

function Logo:fadeIn()
  self.opacity = 0
  self.duration = 0
  self.state = 'fading'
end

function Logo:update(dt)
  self.duration = self.duration + dt
  if self.state == 'fading' then
    self.opacity = self.duration / self.fadeInMax
    
    if self.duration > self.fadeInMax then
      self.opacity = 1
      self.state = ''
    end
  end
end

function Logo:draw()
  love.graphics.setColor(colors.white.r,
                         colors.white.g,
                         colors.white.b,
                         self.opacity * 255)
  
  love.graphics.draw(self.image, self.position.x, self.position.y, 0, 4, 4, 16, 32)
end