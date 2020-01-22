-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 22, 2020, 12:02 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local buildRace;
local compose = TS.import(TS.getModule("object-composer")).compose;
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
function buildRace(player, ...)
	local raceNames = { ... };
	return compose(races.isPerson, unpack(TS.array_map(raceNames, function(r)
		return races[r];
	end)))({
		player = player;
	});
end;
exports.buildRace = buildRace;
return exports;
