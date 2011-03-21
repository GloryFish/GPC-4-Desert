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
require 'inventory'
require 'iteminfo'
require 'script'

help = Gamestate.new()

function help.enter(self, pre)
  self.period = 120
  
  self.textfader.maxduration = 3
  self.textfader.position = vector(love.graphics.getWidth() / 2, 300)
  
  self.scriptIndex = 0
  
  self:loadNextScript()
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
  self.textfader:skip()
end

function help.mousereleased(self, x, y, button)
end

function help.update(self, dt)
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
  
  
  
  
  
end

function help.quit(self)
  Gamestate.switch(intro)
end

function help.leave(self)
end