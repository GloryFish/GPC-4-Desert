-- 
--  scene_intro.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-17.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'logger'
require 'vector'
require 'colors'

require 'background'
require 'fader'
require 'menu'
require 'textbutton'
require 'textfader'
require 'man'

require 'script'
require 'scene_game'
require 'scene_itemviewer'

intro = Gamestate.new()
intro.level = ''

function intro.enter(self, pre)
  intro.background = Background()
  intro.elapsed = 100
  
  intro.log = Logger(vector(20, 20))
  intro.period = 120
  intro.speed = 1
  
  intro.fader = Fader()
  intro.fader.maxduration = 10
  intro.fader:fadeIn()

  intro.textfader = TextFader(vector(love.graphics.getWidth() / 2, 525), fonts.default, colors.white)
  
  intro.man = Man(vector(love.graphics.getWidth() / 2, 450))
  intro.man:setState('standing')
  
  intro.menu = Menu(vector(love.graphics.getWidth() / 2, 200))
  intro.menu.visible = false
  
  local startButton = TextButton('BEGIN')
  startButton.action = intro.beginGame
  intro.menu:addButton(startButton)

  local endButton = TextButton('END')
  endButton.action = intro.endGame
  intro.menu:addButton(endButton)

  local itemButton = TextButton('ITEMS')
  itemButton.action = intro.showItemviewer
  intro.menu:addButton(itemButton)
  
  for i, line in ipairs(script.intro) do
    intro.textfader:addLine(line)
  end
end

function intro.keypressed(self, key, unicode)
  if key == 'escape' then
    love.event.push('q')
  end
end

function intro.mousepressed(self, x, y, button)
  if intro.menu.visible ~= true then
    -- intro.elapsed = 127
    -- intro.fader.state = nil
    -- intro.fader.opacity = 0
    -- intro.menu.visible = true
    
    intro.speed = 35
  end
  
  intro.menu:mousepressed(vector(x, y))
end

function intro.mousereleased(self, x, y, button)
  intro.menu:mousereleased(vector(x, y))
end

function intro.update(self, dt)
  dt = dt * intro.speed
  
  intro.elapsed = intro.elapsed + dt
  local _, time = math.modf(intro.elapsed / intro.period)
  
  intro.log:update(dt)
  intro.log:addLine(string.format('Period: %i', intro.period))
  intro.log:addLine(string.format('Time: %f', time))
  intro.log:addLine(string.format('Elapsed: %i', self.elapsed))
  
  intro.background:update(dt, time)
  
  intro.fader:update(dt)
  intro.textfader:update(dt)
  
  intro.man:update(dt)
  
  if intro.elapsed > 127 and intro.startButton == nil then
    intro.menu.visible = true
    intro.speed = 1
  end
end


function intro.beginGame()
  game.elapsed = intro.elapsed
  game.background = intro.background
  game.man = intro.man
  Gamestate.switch(game)
end

function intro.endGame()
  love.event.push('q')
end

function intro.showItemviewer()
  itemviewer.elapsed = intro.elapsed
  itemviewer.background = intro.background
  Gamestate.switch(itemviewer)
end

function intro.draw(self)
  intro.background:draw()
  intro.man:draw()
  
  intro.menu:draw()

  intro.textfader:draw()
  intro.fader:draw()
  intro.log:draw()
end

function intro.leave(self)
  self.log = nil
  self.fader = nil
  self.textfader = nil
end