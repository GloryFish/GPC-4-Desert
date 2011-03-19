-- 
--  fader.lua
--  desert
--  
--  Performs full screen fade in/out
--
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'colors'

Fader = class('Fader')

function Fader:initialize()
  self.duration = 0 
  self.maxduration = 5
  self.state = nil
  self.color = colors.black
  self.opacity = 0
end


function Fader:fadeIn()
  self.duration = 0
  self.state = 'fadein'
  self.opacity = 1
end

function Fader:fadeOut()
  self.duration = 0
  self.state = 'fadeout'
  self.opacity = 0
end

function Fader:update(dt)
  if self.state == 'fadein' then
    self.duration = self.duration + dt
    self.opacity = 1 - self.duration / self.maxduration
    if self.duration > self.maxduration then
      self.status = nil
      self.opacity = 0
    end
  end
  if self.state == 'fadeout' then
    self.duration = self.duration + dt
    self.duration = self.duration + dt
    self.opacity = self.duration / self.maxduration
    if self.duration > self.maxduration then
      self.status = nil
      self.opacity = 1
    end
  end
end


function Fader:draw()
  love.graphics.setColor(self.color.r,
                         self.color.g,
                         self.color.b,
                         self.opacity * 255)
  love.graphics.rectangle('fill', 0, 0, love.graphics.getWidth(), love.graphics.getHeight())
end