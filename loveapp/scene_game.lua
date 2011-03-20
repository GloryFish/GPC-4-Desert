-- 
--  scene_game.lua
--  desert
--  
--  Created by Jay Roberts on 2011-01-06.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'logger'
require 'vector'
require 'energy'
require 'scene_dead'

game = Gamestate.new()
game.level = ''

function game.enter(self, pre)
  game.period = 120
  game.man:setState('walking')

  game.inventory = Inventory()
  game.inventory.position = vector(50, 50)
  game.inventory.width = 5
  game.inventory.maxitems = 20
  
  game.energy = Energy()
  game.energy.position = vector(50, 30)
end

function game.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function game.getEnergyLossRate(self)
  return 1
end

function game.mousepressed(self, x, y, button)
end

function game.mousereleased(self, x, y, button)
end

function game.update(self, dt)
  game.elapsed = game.elapsed + dt
  local _, time = math.modf(game.elapsed / game.period)
  self.background:update(dt, time)

  self.energy.amount = self.energy.amount - self:getEnergyLossRate() * dt
  self.energy:update(dt)

  self.inventory:update(dt)

  self.man:update(dt)
  
  if self.energy.currentAmount <= 0 then
    self.man:setState('dead')
    game:gameOver()
  end
end

function game.gameOver(self)
  dead.elapsed = game.elapsed
  dead.background = game.background
  dead.man = game.man
  Gamestate.switch(dead)
end

function game.draw(self)
  self.background:draw(dt)
  self.energy:draw()
  self.inventory:draw()
  self.man:draw()
end


function game.quit(self)
  Gamestate.switch(intro)
end

function game.leave(self)
  self.inventory = nil
  self.energy = nil
  self.iteminfo = nil
end