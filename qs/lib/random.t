-- TODO: Ability to swap out different uniform random number generators
local CRand = terralib.includecstring [[
#include <stdlib.h>
#include <time.h>
double random_() { return rand() / (RAND_MAX+1.0); }
void initrand_() { srand(time(NULL)); }
]]

local R = {}

R.random = CRand.random_
R.initrand = CRand.initrand_

return R