-- 
--  scene_menu.lua
--  redditgamejam-05
--  
--  Created by Jay Roberts on 2011-01-06.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'logger'
require 'vector'
require 'colors'

require 'background'
require 'fader'
require 'textbutton'
require 'textfader'
require 'man'

require 'script'
require 'scene_game'

menu = Gamestate.new()
menu.level = ''

function menu.enter(self, pre)
  menu.background = Background()
  menu.elapsed = 100
  
  menu.log = Logger(vector(20, 20))
  menu.period = 120
  
  menu.fader = Fader()
  menu.fader.maxduration = 10
  menu.fader:fadeIn()

  menu.textfader = TextFader(vector(love.graphics.getWidth() / 2, 400), fonts.default, colors.white)
  
  menu.man = Man(vector(love.graphics.getWidth() / 2, 450))
  
  for i, line in ipairs(script.intro) do
    menu.textfader:addLine(line)
  end
end

function menu.keypressed(self, key, unicode)
  if key == 'escape' then
    love.event.push('q')
  end
end

function menu.mousepressed(self, x, y, button)
  if menu.startButton ~= nil then
    menu.startButton:mousepressed(vector(x, y))
  else
    menu.addButtons()
  end

  if menu.endButton ~= nil then
    menu.endButton:mousepressed(vector(x, y))
  end
end

function menu.mousereleased(self, x, y, button)
  if menu.startButton ~= nil then
    menu.startButton:mousereleased(vector(x, y))
  end
  if menu.endButton ~= nil then
    menu.endButton:mousereleased(vector(x, y))
  end
end

function menu.update(self, dt)
  menu.elapsed = menu.elapsed + dt
  local _, time = math.modf(menu.elapsed / menu.period)
  
  menu.log:update(dt)
  menu.log:addLine(string.format('Period: %i', menu.period))
  menu.log:addLine(string.format('Time: %f', time))
  menu.log:addLine(string.format('Elapsed: %i', self.elapsed))
  
  menu.background:update(dt, time)
  
  menu.fader:update(dt)
  menu.textfader:update(dt)
  
  menu.man:update(dt)
  
  if menu.elapsed > 127 and menu.startButton == nil then
    menu.addButtons()
  end
end

function menu.addButtons()
  menu.startButton = TextButton(vector(love.graphics.getWidth() / 2, 200), 'BEGIN')
  menu.startButton.action = menu.beginGame

  menu.endButton = TextButton(vector(love.graphics.getWidth() / 2, 245), 'END')
  menu.endButton.action = menu.endGame
  
  menu.fader.state = nil
  menu.fader.opacity = 0
end

function menu.beginGame()
  game.elapsed = menu.elapsed
  game.background = menu.background
  Gamestate.switch(game)
end

function menu.endGame()
  love.event.push('q')
end

function menu.draw(self)
  menu.background:draw()
  menu.man:draw()
  
  if menu.startButton ~= nil then
    menu.startButton:draw()
    menu.endButton:draw()
  end
  
  menu.textfader:draw()
  menu.fader:draw()
  menu.log:draw()
end

function menu.leave(self)
  self.log = nil
  self.fader = nil
  self.textfader = nil
end