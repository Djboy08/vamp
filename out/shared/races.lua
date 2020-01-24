-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 23, 2020, 6:50 PM Eastern Standard Time

local exports = {};
local map = {};
map["Vampire"] = { "isCombatter", "isCompulser", "isFeeder" };
local getRaceTraits = function(race)
	if map[race] ~= nil then
		local ar = map[race];
		return ar;
	else
		return nil;
	end;
end;
exports.getRaceTraits = getRaceTraits;
return exports;
