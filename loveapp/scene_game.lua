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
require 'cacti'
require 'textfader'
require 'script'
require 'hazards'

game = Gamestate.new()
game.level = ''

function game.enter(self, pre)
  game.period = 120
  game.man:setState('walking')

  game.inventory = Inventory()
  game.inventory.position = vector(50, 50)
  game.inventory.width = 5
  game.inventory.maxitems = 15

  -- Start with some water
  game.inventory:addItem(1)
  game.inventory:addItem(1)
  game.inventory:addItem(1)

  game.iteminfo = ItemInfo()
  game.iteminfo.position = vector(450, 50)
  
  game.textfader.maxduration = 5
  game.textfader.position = vector(love.graphics.getWidth() / 2, 540)
  
  game.energy = Energy()
  game.energy.position = vector(50, 360)
  game.energyLossRate = 0.01
  
  game.things = {}
  game.leavingThings = {}
  game.thingSpeed = 100
  game.thingHeight = 450
  
  game.cacti = Cacti()
  game.cacti.baseSpeed = self.thingSpeed
  
  game.hazardChance = 0.1
  
  music.game:setVolume(0.5)
  love.audio.play(music.game)
end

function game.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function game.getEnergyLossRate(self)
  local rateMultiplier = 1
  if #self.inventory.itemIds >= self.inventory.maxitems then
    rateMultiplier = 3
  end
  
  
  return self.energyLossRate * rateMultiplier
end

function game.mousepressed(self, x, y, button)
  local itemId = self.inventory.selectedItemId
  if itemId ~= 0 then
    if items[itemId].action == 'drop' then
      local thing = {
        id = self.inventory.selectedItemId,
        type = 'item',
        position = vector(self.man.position.x - 32, game.thingHeight),
        state = 'leaving'
      }
      table.insert(self.things, thing)
      self.inventory:removeSelectedItem()
    elseif items[itemId].action == 'use' then
      self.energy.amount = self.energy.amount + items[itemId].energy
      self.inventory:removeSelectedItem()
    end
  end
end

function game.mousereleased(self, x, y, button)
end

function game.spawnThing(self)
  local itemRoll = math.random()

  -- if player is below certain energy and has no energy items
  -- Spawn an energy item
  
  if self.energy.amount < 0.25 and self.inventory:hasEnergyItem() == false then
    local thing = {
      id = items:getRandomIdEnergy(),
      type = 'item',
      position = vector(800, 470),
      state = 'arriving'
    }
    table.insert(self.things, thing)
    local spawnString = script.spawnStrings[math.random(#script.spawnStrings)]

    self.textfader:addLine(string.format(spawnString, items[thing.id].name))
  elseif itemRoll > self.hazardChance then
    local thing = {
      id = items:getRandomId(),
      type = 'item',
      position = vector(800, 470),
      state = 'arriving'
    }
    table.insert(self.things, thing)
    local spawnString = script.spawnStrings[math.random(#script.spawnStrings)]
    
    self.textfader:addLine(string.format(spawnString, items[thing.id].name))
  else
    local thing = {
      id = hazards:getRandomId(),
      type = 'hazard',
      position = vector(800, 470),
      state = 'arriving'
    }
    table.insert(self.things, thing)
    local hazardString = script.hazardStrings[math.random(#script.hazardStrings)]
    
    self.textfader:addLine(string.format(hazardString, hazards[thing.id].name))
  end  
end

function game.update(self, dt)
  game.elapsed = game.elapsed + dt
  local _, time = math.modf(game.elapsed / game.period)
  self.background:update(dt, time)

  self.energy.amount = self.energy.amount - self:getEnergyLossRate() * dt
  self.energy:update(dt)

  self.cacti:update(dt)

  local mousePos = vector(love.mouse.getX(), love.mouse.getY())
  self.inventory:update(dt, mousePos)
  self.iteminfo:update(dt)
  self.iteminfo:setItemId(self.inventory.selectedItemId)
  
  self.textfader:update(dt)
  
  self.man:update(dt)
  
  if self.energy.currentAmount <= 0 then
    self.man:setState('dead')
    game:gameOver()
  end
  
  if #self.things == 0 then
    self:spawnThing()
  end
  
  -- Update things
  local toRemove = {}
  for i, thing in ipairs(self.things) do
    thing.position.x = thing.position.x - self.thingSpeed * dt
    
    if thing.state == 'leaving' and thing.position.x < -64 then -- Edge of screen
      table.insert(toRemove, i)
    elseif thing.state == 'arriving' and thing.position.x < self.man.position.x then -- At the man
      if thing.type == 'item' then
        if #self.inventory.itemIds < self.inventory.maxitems then -- Pick up
          self.inventory:addItem(thing.id)
          table.insert(toRemove, i)
        else -- Let go
          thing.state = 'leaving'
        end
      else -- Hazard hit the man
        if self.inventory:protect(thing.id) == false then
          self.energy.amount = self.energy.amount - hazards[thing.id].damage
        end
        
        thing.state = 'leaving'
      end
    end
  end
  for i, v in ipairs(toRemove) do
     table.remove(self.things, v - i + 1)
  end
  
end

function game.gameOver(self)
  dead.elapsed = game.elapsed
  dead.background = game.background
  dead.man = game.man
  Gamestate.switch(dead)
end

function game.draw(self)
  self.background:draw()
  self.energy:draw()
  self.inventory:draw()
  self.iteminfo:draw()
  self.textfader:draw()

  self.cacti:drawBack()
  
  for i, thing in ipairs(self.things) do
    local image = items[thing.id].image
    if thing.type == 'hazard' then
      image = hazards[thing.id].image
    end
    
    love.graphics.draw(image, 
                       thing.position.x, 
                       thing.position.y, 
                       0, 
                       4, 
                       4, 
                       0, 
                       0)
  end
  self.man:draw()
  
  self.cacti:drawFront()
end


function game.quit(self)
  love.audio.stop(music.game)
  
  Gamestate.switch(intro)
end

function game.leave(self)
  self.inventory = nil
  self.energy = nil
  self.iteminfo = nil
end