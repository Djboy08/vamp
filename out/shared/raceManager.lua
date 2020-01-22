-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 22, 2020, 12:51 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local raceMoves = TS.import(game:GetService("ReplicatedStorage"), "TS", "raceMoves").default;
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
		self.moveManager = raceMoves.new(self.race);
	end;
end;
exports.default = raceManager;
return exports;
