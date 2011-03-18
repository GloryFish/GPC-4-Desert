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
require 'textfader'
require 'colors'

require 'script'

menu = Gamestate.new()
menu.level = ''

function menu.enter(self, pre)
  menu.background = Background()
  menu.elapsed = 110
  
  menu.log = Logger(vector(20, 20))
  menu.period = 120
  
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
  
  menu.background:update(dt, time)
  
  menu.textfader:update(dt)
end

function menu.draw(self)
  menu.background:draw()
  menu.textfader:draw()
  menu.log:draw()
end

function menu.leave(self)
end