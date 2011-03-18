-- 
--  textfader.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-17.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'vector'

TextFader = class('TextFader')

function TextFader:initialize(pos, font, color)
  self.position = pos
  self.font     = font
  self.color    = color
  self.lines = {}
  self.currentline = ''
  self.opacity = 0

  self.maxduration = 4
  self.duration = self.maxduration
  self.fadein  = self.maxduration * 0.3
  self.fadeout = self.maxduration * 0.7
end

function TextFader:update(dt)
  self.duration = self.duration + dt
  
  if self.duration >= 0 and self.duration < self.fadein then -- fade in
    self.opacity = self.duration / self.fadein
  end

  if self.duration >= self.fadein and self.duration < self.fadeout then -- opaque
    self.opacity = 1
  end

  if self.duration >= self.fadeout and self.duration < self.maxduration then -- fade out
    self.opacity = 1 - (self.duration - self.fadeout) / (self.maxduration - self.fadeout)
  end
  
  if self.duration > self.maxduration then
    self.duration = 0
    
    self.currentline = table.remove(self.lines, 1)
    if self.currentline == nil then
      self.currentline = ''
    end
  end
end

function TextFader:addLine(line)
  table.insert(self.lines, line)
end

function TextFader:draw(dt)
  love.graphics.setFont(self.font)
  
  love.graphics.setColor(self.color.r,
                         self.color.g,
                         self.color.b,
                         self.opacity * 255);
  local lineWidth = self.font:getWidth(self.currentline)

  love.graphics.print(self.currentline, 
                      self.position.x - lineWidth / 2, 
                      self.position.y);
end