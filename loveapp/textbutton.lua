-- 
--  textbutton.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'vector'
require 'colors'

TextButton = class('TextButton')

function TextButton:initialize(text)
  self.position = vector(0, 0)
  self.text = text
  self.color = colors.white
  self.font = fonts.button
  self.fontSelected = fonts.buttonSelected
  
  self.width = self.font:getWidth(self.text)
  self.height = self.font:getHeight(self.text)  
  
  self.selected = false
  
  self.action = nil
end

function TextButton:mousepressed(pos)
  self.mousePos = pos
  if self:containsPosition(pos) then
    self.selected = true
  end
end

function TextButton:mousereleased(pos)
  self.mousePos = pos
  self.selected = false

  if self:containsPosition(pos) and self.action ~= nil then
    love.audio.play(sounds.menuselect)
    self:action()
  end
end

function TextButton:containsPosition(pos)
  local lineWidth = self.font:getWidth(self.text)
  local halfWidth = lineWidth / 2
  
  
  if pos.x >= self.position.x - halfWidth and
     pos.x <= self.position.x + halfWidth and
     pos.y >= self.position.y and
     pos.y <= self.position.y + self.height then
    return true
  else
    return false
  end
end


function TextButton:draw()
  local font = self.font
  if self.selected then
    font = self.fontSelected
  end
  
  love.graphics.setFont(font)
  local lineWidth = font:getWidth(self.text)

  colors.black:set()
  love.graphics.print(self.text, 
                      (self.position.x - lineWidth / 2) + 1, 
                      self.position.y + 1)

  love.graphics.setColor(self.color.r,
                         self.color.g,
                         self.color.b,
                         self.color.a)

  love.graphics.print(self.text, 
                      self.position.x - lineWidth / 2, 
                      self.position.y)

end