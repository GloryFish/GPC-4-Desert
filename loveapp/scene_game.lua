-- 
--  scene_game.lua
--  redditgamejam-05
--  
--  Created by Jay Roberts on 2011-01-06.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'logger'
require 'vector'

game = Gamestate.new()
game.level = ''

function game.enter(self, pre)
  game.period = 120
  game.man:setState('walking')
  
  game.inventory = Inventory(vector(50, 50))
  
end

function game.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function game.mousepressed(self, x, y, button)
end

function game.mousereleased(self, x, y, button)
end

function game.update(self, dt)
  game.elapsed = game.elapsed + dt
  local _, time = math.modf(game.elapsed / game.period)
  self.background:update(dt, time)
  self.inventory:update(dt)

  self.man:update(dt)
end

function game.draw(self)
  self.background:draw(dt)
  self.inventory:draw()
  self.man:draw()
end


function game.quit(self)
  Gamestate.switch(intro)
end

function game.leave(self)
end