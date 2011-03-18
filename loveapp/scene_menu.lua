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

menu = Gamestate.new()
menu.level = ''

function menu.enter(self, pre)
  menu.background = Background()
  menu.elapsed = 0
  
  menu.log = Logger(vector(20, 20))
  menu.period = 10
end

function menu.update(self, dt)
  menu.elapsed = menu.elapsed + dt
  local _, time = math.modf(menu.elapsed / menu.period)
  
  menu.log:update(dt)
  menu.log:addLine(string.format('Period: %i', menu.period))
  menu.log:addLine(string.format('Time: %f', time))
  
  menu.background:update(dt, time)
end

function menu.draw(self)
  menu.background:draw()
  menu.log:draw()
end

function menu.leave(self)
end