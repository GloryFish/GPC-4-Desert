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
require 'logo'
require 'man'

require 'script'
require 'scene_game'
require 'scene_help'
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

  intro.textfader = TextFader(vector(love.graphics.getWidth() / 2, 530), fonts.default, colors.white)
  
  intro.logo = Logo()
  intro.logo.position = vector(200, 200)
  
  intro.man = Man(vector(200, 470))
  intro.man:setState('standing')
  
  intro.menu = Menu(vector(love.graphics.getWidth() / 2, 200))
  intro.menu.visible = false
  
  local startButton = TextButton('BEGIN')
  startButton.action = intro.beginGame
  intro.menu:addButton(startButton)

  local helpButton = TextButton('LEARN')
  helpButton.action = intro.showHelp
  intro.menu:addButton(helpButton)

  local endButton = TextButton('END')
  endButton.action = intro.endGame
  intro.menu:addButton(endButton)

  local itemButton = TextButton('ITEMS')
  itemButton.action = intro.showItemviewer
  -- intro.menu:addButton(itemButton)

  
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
  
  intro.background:update(dt, time)
  
  intro.fader:update(dt)
  intro.textfader:update(dt)
  
  intro.man:update(dt)
  
  intro.logo:update(dt)

  if intro.elapsed > 121 and intro.logo.opacity == 0 then
    intro.logo:fadeIn()
  end
  
  if intro.elapsed > 123 and intro.menu.visible == false then
    intro.menu.visible = true
    intro.speed = 1
  end
end


function intro.beginGame()
  game.elapsed = intro.elapsed
  game.background = intro.background
  game.man = intro.man
  game.textfader = intro.textfader
  Gamestate.switch(game)
end

function intro.endGame()
  love.event.push('q')
end

function intro.showHelp()
  help.elapsed = intro.elapsed
  help.background = intro.background
  help.man = intro.man
  help.textfader = intro.textfader
  Gamestate.switch(help)
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

  intro.logo:draw()

  intro.textfader:draw()
  intro.fader:draw()
  intro.log:draw()
end

function intro.leave(self)
  self.log = nil
  self.fader = nil
end