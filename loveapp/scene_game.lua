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
  game.inventory.maxitems = 25

  -- Start with some water
  game.inventory:addItem(1)
  game.inventory:addItem(1)
  game.inventory:addItem(1)
  
  game.iteminfo = ItemInfo()
  game.iteminfo.position = vector(450, 50)
  
  game.energy = Energy()
  game.energy.position = vector(50, 30)
  
  game.things = {}
  game.leavingThings = {}
  game.thingSpeed = 300
  game.thingHeight = 450
  
  game.hazardChance = 0.1
end

function game.keypressed(self, key, unicode)
  if key == 'escape' then
    self:quit()
  end
end

function game.getEnergyLossRate(self)
  return 0.01
end

function game.mousepressed(self, x, y, button)
  local itemId = self.inventory.selectedItemId
  if itemId ~= 0 then
    if items[itemId].action == 'drop' then
      local thing = {
        id = self.inventory.selectedItemId,
        type = 'item',
        position = vector(self.man.position.x - 8, game.thingHeight),
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

  if itemRoll > self.hazardChance then
    local thing = {
      id = items:getRandomId(),
      type = 'item',
      position = vector(800, 450),
      state = 'arriving'
    }
    table.insert(self.things, thing)
  end  
end

function game.update(self, dt)
  game.elapsed = game.elapsed + dt
  local _, time = math.modf(game.elapsed / game.period)
  self.background:update(dt, time)

  self.energy.amount = self.energy.amount - self:getEnergyLossRate() * dt
  self.energy:update(dt)

  local mousePos = vector(love.mouse.getX(), love.mouse.getY())
  self.inventory:update(dt, mousePos)
  self.iteminfo:update(dt)
  self.iteminfo:setItemId(self.inventory.selectedItemId)
  
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
  self.background:draw(dt)
  self.energy:draw()
  self.inventory:draw()
  self.iteminfo:draw()
  self.man:draw()
  
  for i, thing in ipairs(self.things) do
    love.graphics.draw(items[thing.id].image, 
                       thing.position.x, 
                       thing.position.y, 
                       0, 
                       4, 
                       4, 
                       0, 
                       0)
  end
  
  
end


function game.quit(self)
  Gamestate.switch(intro)
end

function game.leave(self)
  self.inventory = nil
  self.energy = nil
  self.iteminfo = nil
end