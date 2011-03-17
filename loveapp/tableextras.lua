-- 
--  tableextras.lua
--  ExperimentalGameplayProject-Feb-2011
--  
--  Created by Jay Roberts on 2011-02-07.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

function table.contains(tbl, element)
  for k, v in pairs(tbl) do
    if v == element then
      return true
    end
  end
  return false
end