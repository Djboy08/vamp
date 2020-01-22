-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 10:26 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local buildRace;
local compose = TS.import(script, TS.getModule(script, "object-composer")).compose;
local races = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "races");
function buildRace(player, remote, ...)
	local raceNames = { ... };
	return compose(races.isPerson, unpack(TS.array_map(raceNames, function(r)
		return races[r];
	end)))({
		player = player;
		remote = remote;
	});
end;
exports.buildRace = buildRace;
return exports;
