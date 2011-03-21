-- 
--  colors.lua
--  desert
--  
--  Created by Jay Roberts on 2011-03-17.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'middleclass'

Color = class('Color')

function Color:initialize(r, g, b, a)
  self.r = tonumber(r) or 0
  self.g = tonumber(g) or 0
  self.b = tonumber(b) or 0
  self.a = tonumber(a) or 255
end

function Color:set()
	love.graphics.setColor(self.r,self.g,self.b,self.a)
end

function Color:grayscale()
	local a = (self.r + self.g + self.b) / 3
	return Color(a, a, a, self.a)
end

function Color:inverse()
	return Color(255 - self.r, 255 - self.g, 255 - self.b, 255 - self.a)
end

colors = {
  red = Color(255, 0, 0),
  green = Color(0, 255, 0),
  blue = Color(0, 0, 255),
  orange = Color(205, 114, 30),
  purple = Color(148, 40, 255),
  pink = Color(255, 147, 242),
  yellow = Color(255, 244, 27),
  skyblue = Color(58, 88, 135),
  night = Color(1, 21, 45),
  white = Color(255, 255, 255),
  black = Color(0, 0, 0),
  brown = Color(135, 113, 58),
  clear = Color(0, 0, 0, 0),
  gray = Color(44, 44, 44),
  lightgray = Color(120, 120, 120),
  transgray = Color(44, 44, 44, 44),
  transwhite = Color(88, 88, 88, 44)
}