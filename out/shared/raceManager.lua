-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 4:45 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local DataStore2 = TS.import(script, TS.getModule(script, "datastore2").src);
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
	end;
end;
exports.default = raceManager;
return exports;
