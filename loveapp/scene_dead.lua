-- 
--  scene_dead.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 


require 'logger'
require 'vector'
require 'colors'
require 'items'
require 'inventory'
require 'iteminfo'

dead = Gamestate.new()

function dead.enter(self, pre)
  dead.period = 120
end

function dead.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function dead.mousepressed(self, x, y, button)
end

function dead.mousereleased(self, x, y, button)
end

function dead.update(self, dt)
  dead.elapsed = dead.elapsed + dt
  local _, time = math.modf(dead.elapsed / dead.period)

  dead.background:update(dt, time)
  dead.man:update(dt, time)
end

function dead.draw(self)
  dead.background:draw()
  dead.man:draw()
end

function dead.quit(self)
  Gamestate.switch(intro)
end

function dead.leave(self)
end