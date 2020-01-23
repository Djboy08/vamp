-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 23, 2020, 2:10 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local raceManager;
local Net = TS.import(script, TS.getModule(script, "net").out);
local movesManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "movesManager").default;
local remote = Net.ServerEvent.new("movesEvent");
do
	local super = movesManager;
	raceManager = setmetatable({}, {
		__index = super;
		__tostring = function() return "raceManager" end;
	});
	raceManager.__index = raceManager;
	function raceManager.new(...)
		local self = setmetatable({}, raceManager);
		self:constructor(...);
		return self;
	end;
	function raceManager:constructor()
		super.constructor(self, remote, false, raceManager.mapping);
	end;
	function raceManager:add(_0)
		local race = _0.race;
		local player = _0.player;
		local DataBuild = _0.DataBuild;
		local _1 = raceManager.mapping;
		_1[tostring(player.UserId)] = {
			db = DataBuild;
			race = race;
		};
	end;
	function raceManager:delete(_0)
		local player = _0.player;
		raceManager.mapping[tostring(player.UserId)] = nil;
	end;
	raceManager.mapping = {};
end;
exports.default = raceManager;
return exports;
