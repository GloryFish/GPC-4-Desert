-- 
--  man.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-18.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'vector'
require 'colors'

Man = class('Man')

function Man:initialize(pos)
  -- Tileset
  self.tileset = love.graphics.newImage('resources/images/man.png')
  self.tileset:setFilter('nearest', 'nearest')

  self.tileSize = vector(16, 32)
  
  self.scale = 4
  self.offset = vector(8, 16)

  -- Quads, animation frames
  self.animations = {}
  
  self.animations['standing'] = {}
  self.animations['standing'].quads = {
    love.graphics.newQuad(0 * self.tileSize.x, 3 * self.tileSize.y, self.tileSize.x, self.tileSize.y, self.tileset:getWidth(), self.tileset:getHeight()),
  }

  self.animations['walking'] = {}
  self.animations['walking'].frameInterval = 0.8
  self.animations['walking'].quads = {
    love.graphics.newQuad(1 * self.tileSize.x, 1 * self.tileSize.y, self.tileSize.x, self.tileSize.y, self.tileset:getWidth(), self.tileset:getHeight()),
    love.graphics.newQuad(2 * self.tileSize.x, 1 * self.tileSize.y, self.tileSize.x, self.tileSize.y, self.tileset:getWidth(), self.tileset:getHeight()),
  }
    
  self.animations['dead'] = {}
  self.animations['dead'].quads = {
    love.graphics.newQuad(3 * self.tileSize.x, 0, self.tileSize.x * 2, self.tileSize.y, self.tileset:getWidth(), self.tileset:getHeight()),
  }

  self.animation = {}
  self.animation.frame = 1
  self.animation.elapsed = 0

  -- Instance vars
  self.position = pos
  self.state = 'standing'
end

function Man:setState(state)
  if (self.state.current ~= state) then
    self.state = state
    self.animation.current = 1
    self.animation.frame = 1
  end
end


function Man:update(dt)
  self.animation.elapsed = self.animation.elapsed + dt
  
  -- Handle animation
  if #self.animations[self.state].quads > 1 then -- More than one frame
    local interval = self.animations[self.state].frameInterval
    
    if self.animation.elapsed > interval then -- Switch to next frame
      self.animation.frame = self.animation.frame + 1
      if self.animation.frame > #self.animations[self.state].quads then -- Aaaand back around
        self.animation.frame = 1
      end
      self.animation.elapsed = 0
    end
  end
end

function Man:draw()
  colors.white:set()

  local manX = self.position.x
  local manY = self.position.y
  local offset = self.offset
  
  if self.state == 'dead' then
    manX = manX - 48
    manY = manY + 48
    offset = vector(16, 8)
  end

  love.graphics.drawq(self.tileset,
                      self.animations[self.state].quads[self.animation.frame], 
                      manX, 
                      manY,
                      0,
                      self.scale,
                      self.scale,
                      self.offset.x,
                      self.offset.y)

end