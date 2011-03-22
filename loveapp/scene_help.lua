-- 
--  scene_help.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'vector'
require 'colors'
require 'items'
require 'hazards'
require 'inventory'
require 'iteminfo'
require 'script'
require 'logger'

help = Gamestate.new()

function help.enter(self, pre)
  self.period = 120
  
  self.textfader.maxduration = 3
  self.textfader.position = vector(love.graphics.getWidth() / 2, 300)
  
  self.showWater = false
  self.showStuff = false
  self.showWeirdStuff = false
  self.showHazards = false
  self.showProtect = false
  
  self.duration = 0
  
  self.scriptIndex = 0
  
  self:loadNextScript()
  
  self.logger = Logger(vector(50, 50))
end

function help.loadNextScript(self)
  self.scriptIndex = self.scriptIndex + 1
  
  local scriptChunk = script.help[self.scriptIndex]
  
  if scriptChunk == nil then
    return false
  end
  
  for i, line in ipairs(scriptChunk) do
    intro.textfader:addLine(line)
  end
  
  return true
end

function help.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function help.mousepressed(self, x, y, button)
  self.duration = self.duration + (self.textfader.maxduration - self.textfader.duration)
  self.textfader:skip()
end

function help.mousereleased(self, x, y, button)
end

function help.update(self, dt)
  self.logger:update(dt)
  self.duration = self.duration + dt
  self.logger:addLine(string.format('time: %f', self.duration))
  self.elapsed = self.elapsed + dt
  local _, time = math.modf(self.elapsed / self.period)

  self.background:update(dt, time)
  
  self.textfader:update(dt)
  self.man:update(dt)
  
  if #self.textfader.lines == 0 then
    if self:loadNextScript() == false then
      self:quit()
    end
  end
  
  if self.duration > 3.5 then
    self.showWater = true
  end
  if self.duration > 12 then
    self.showWater = false
  end

  if self.duration > 18.5 then
    self.showStuff = true
  end
  if self.duration > 21 then
    self.showWeirdStuff = true
  end
  if self.duration > 33 then
    self.showWeirdStuff = false
  end
  if self.duration > 36 then
    self.showStuff = false
  end

  if self.duration > 51 then
    self.showHazards = true
  end

  if self.duration > 57.5 then
    self.showProtect = true
  end

  if self.duration > 60.5 then
    self.showHazards = false
    self.showProtect = false
  end
  
end

function help.draw(self)
  self.background:draw()
  self.textfader:draw()
  self.man:draw()
  
  love.graphics.setFont(fonts.tiny)
  colors.black:set()
  love.graphics.print('created by Paul Bredenberg and Jay Roberts for Game Prototype Challenge v4', 51, 561)
  colors.white:set()
  love.graphics.print('created by Paul Bredenberg and Jay Roberts for Game Prototype Challenge v4', 50, 560)

  colors.black:set()
  love.graphics.print('music by elerya', 51, 581)
  colors.white:set()
  love.graphics.print('music by elerya', 50, 580)
  
  if self.showWater then
    love.graphics.draw(items[1].image, love.graphics.getWidth() / 2, 250, 0, 4, 4, 8, 8)
  end

  if self.showStuff then
    love.graphics.draw(items[22].image, love.graphics.getWidth() / 2 - 88, 250, 0, 4, 4, 8, 8)
    love.graphics.draw(items[29].image, love.graphics.getWidth() / 2, 250, 0, 4, 4, 8, 8)
  end

  if self.showWeirdStuff then
    love.graphics.draw(items[4].image, love.graphics.getWidth() / 2 + 88, 250, 0, 4, 4, 8, 8)
  end

  if self.showHazards then
    love.graphics.draw(hazards[1].image, love.graphics.getWidth() / 2 - 108, 250, 0, 4, 4, 8, 8)
    love.graphics.draw(hazards[2].image, love.graphics.getWidth() / 2 - 38, 250, 0, 4, 4, 8, 8)
    love.graphics.draw(hazards[3].image, love.graphics.getWidth() / 2 + 38, 250, 0, 4, 4, 8, 8)
    love.graphics.draw(hazards[4].image, love.graphics.getWidth() / 2 + 108, 250, 0, 4, 4, 8, 8)
  end

  if self.showProtect then
    love.graphics.draw(items[14].image, love.graphics.getWidth() / 2 - 88, 360, 0, 4, 4, 8, 8)
    love.graphics.draw(items[15].image, love.graphics.getWidth() / 2, 360, 0, 4, 4, 8, 8)
    love.graphics.draw(items[21].image, love.graphics.getWidth() / 2 + 88, 360, 0, 4, 4, 8, 8)
  end
  
  
  self.logger:draw()
end

function help.quit(self)
  Gamestate.switch(intro)
end

function help.leave(self)
end