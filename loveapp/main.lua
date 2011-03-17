-- 
--  main.lua
--  xenofarm
--  
--  Created by Jay Roberts on 2011-01-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'
require 'middleclass-extras'

require 'wordlist'
require 'lettergrid'
require 'logger'

function love.load()
  
  -- Seed random
  local seed = os.time()
  math.randomseed(seed);
  math.random(); math.random(); math.random()
  
  log = Logger(vector(5, 5))

  wl = Wordlist('words.list')
  
  lg = Lettergrid(32, 24)
  lg.position = vector(40, 30)
  lg:randomize()
  
  dur = 0
  
  lastword = ''
  inlist = false
  
end

function love.keypressed(key, unicode)
  if key == ' ' then
    lg:randomize()
  end
end

function love.mousepressed(x, y, button)
  lg:beginSelect(vector(x, y))
end

function love.mousereleased(x, y, button)
  lg:endSelect(vector(x, y))
  lastword = lg:selectedWord()
  
  inlist = wl:contains(lastword)
end


function love.update(dt)
  log:update(dt)
  lg:moveSelect(vector(love.mouse.getX(), love.mouse.getY()))
  log:addLine(string.format('Selected: %s', lg:selectedWord()))  
  
  -- dur = dur + dt
  -- if dur > 3 then
  --   lg:randomize()
  --   dur = 0
  -- end
end

function love.draw()
  lg:draw()
  log:draw()

  love.graphics.setColor(255, 0, 0, 255)
  local message = '%s is not in the dictionary'
  
  if inlist then
    love.graphics.setColor(0, 240, 20, 255)
    message = '%s is in the dictionary'
  end
  
  love.graphics.print(string.format(message, lastword:upper()), 20, 740)
  
end