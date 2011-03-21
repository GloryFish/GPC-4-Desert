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
require 'fader'
require 'balloons'

dead = Gamestate.new()

function dead.enter(self, pre)
  self.period = 120
  self.countDuration = 0
  self.countMaxDuration = 7
  self.displayscore = 0
  
  self.fader = Fader()
  self.fader.maxduration = 6
  self.fader.color = colors.white
  self.fader:fadeIn()
  
  self.balloons = Balloons()
  
  self.menu = Menu(vector(love.graphics.getWidth() / 2, 240))
  self.menu.visible = false
  self.menu.showprompt = false
  
  local startButton = TextButton('BEGIN')
  startButton.action = self.beginGame
  self.menu:addButton(startButton)

  local endButton = TextButton('END')
  endButton.action = self.quit
  self.menu:addButton(endButton)
  
  -- TODO: Hook up menu actions
  
end

function dead.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function dead.mousepressed(self, x, y, button)
  self.menu:mousepressed(vector(x, y))
end

function dead.mousereleased(self, x, y, button)
  self.menu:mousereleased(vector(x, y))
end

function dead.update(self, dt)
  self.elapsed = self.elapsed + dt
  local _, time = math.modf(self.elapsed / self.period)

  self.background:update(dt, time)
  self.man:update(dt, time)
  
  self.fader:update(dt)
  
  if self.countDuration < self.countMaxDuration then
    self.countDuration = self.countDuration + dt
    
    self.displayscore = (self.countDuration / self.countMaxDuration) * self.finalscore
  else
    self.displayscore = self.finalscore
    self.menu.visible = true
  end

  self.balloons:update(dt)
end

function dead.draw(self)
  dead.background:draw()
  dead.man:draw()
  
  
  -- Draw score
  love.graphics.setFont(fonts.button)
  colors.black:set()
  love.graphics.print(string.format('Total wealth: $%i', self.displayscore), 131, 151)
  
  colors.white:set()
  love.graphics.print(string.format('Total wealth: $%i', self.displayscore), 130, 150)  

  self.menu:draw()
  
  self.balloons:draw()
  
  self.fader:draw()
  
end

function dead.beginGame()
  game.elapsed = dead.elapsed
  game.background = dead.background
  game.man = dead.man

  love.audio.stop(music.game)

  Gamestate.switch(game)
end

function dead.quit(self)
  love.audio.stop(music.game)
  
  Gamestate.switch(intro)
end

function dead.leave(self)
end