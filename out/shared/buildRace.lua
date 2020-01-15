-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 15, 2020, 5:13 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local compose = TS.import(TS.getModule("object-composer")).default;
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local map = {};
map["isFeeder"] = races.isFeeder;
map["isCombatter"] = races.isCombatter;
map["isCompulser"] = races.isCompulser;
map["isPerson"] = races.isPerson;
map["isRegenerator"] = races.isRegenerator;
map["isVampire"] = races.isVampire;
local buildRace = function(race, s, player)
	return compose(races[race], races.isPerson)({
		player = player;
	});
end;
exports.buildRace = buildRace;
return exports;
