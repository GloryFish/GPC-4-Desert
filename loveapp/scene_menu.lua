-- 
--  scene_menu.lua
--  redditgamejam-05
--  
--  Created by Jay Roberts on 2011-01-06.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'logger'
require 'vector'
require 'background'
require 'fader'
require 'textfader'
require 'colors'

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
  
  for i, line in ipairs(script.intro) do
    menu.textfader:addLine(line)
  end
end

function menu.keypressed(self, key, unicode)
  if key == 'escape' then
    love.event.push('q')
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
  
  
  if self.elapsed > 127 then
    game.elapsed = self.elapsed
    game.background = self.background
    Gamestate.switch(game)
  end
end

function menu.draw(self)
  menu.background:draw()
  menu.textfader:draw()
  menu.fader:draw()
  menu.log:draw()
end

function menu.leave(self)
  self.log = nil
end