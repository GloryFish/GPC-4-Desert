-- 
--  game.lua
--  xenofarm
--  
--  Created by Jay Roberts on 2011-01-20.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

Game = class('Game', StatefulObject)

function Game:initialize()
  super.initialize(self)
  print('Creating global game variables')
  self:gotoState('MainMenu')
end

local MainMenu = Game:addState('MainMenu')
function MainMenu:enterState()
  print('Creating the main menu buttons')
end
function MainMenu:exitState()
  print('Destroying the main menu buttons')
end

local OptionsMenu = Game:addState('OptionsMenu')
function OptionsMenu:enterState()
  print('Creating the options menu buttons')
end
function OptionsMenu:exitState()
  print('Destroying the options menu buttons')
end

local Play = Game:addState('Play')
function Play:enterState()
  print('Creating player, world and enemies')
end
function Play:exitState()
  print('Destroying the player, world and enemies')
end
