-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 21, 2020, 11:07 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local raceManager;
do
	raceManager = setmetatable({}, {
		__tostring = function() return "raceManager" end;
	});
	raceManager.__index = raceManager;
	function raceManager.new(...)
		local self = setmetatable({}, raceManager);
		self:constructor(...);
		return self;
	end;
	function raceManager:constructor(_0)
		local race = _0.race;
		local player = _0.player;
		self.race = race;
		self.player = player;
		if race["punch"] ~= nil then
			race:punch();
		end;
		if race["feed"] ~= nil then
			race:feed();
		end;
		if race["compulse"] ~= nil then
			if player.Character then
				race:compulse(player.Character);
			end;
		end;
		if race["heal"] ~= nil then
			race:heal();
		end;
	end;
end;
exports.default = raceManager;
return exports;
