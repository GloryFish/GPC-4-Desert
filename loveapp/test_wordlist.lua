-- 
--  test_wordlist.lua
--  ExperimentalGameplayProject-Feb-2011
--  
--  Created by Jay Roberts on 2011-02-02.
--  Copyright 2011 GloryFish.org. All rights reserved.
-- 

require 'wordlist'

-- Seed random
local seed = os.time()
math.randomseed(seed);
math.random(); math.random(); math.random()

wordlist = Wordlist('words.list')

-- Is it a valid word?
print(wordlist:contains('zymome'))

print(wordlist:contains('wakugflksadfglksjfgdk'))

-- Get any random word from the list
print(wordlist:random())

-- Get a random word of a specific length
print(wordlist:random(5))
print(wordlist:random(15))

