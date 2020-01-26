-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 2:24 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local traitManager;
local Net = TS.import(script, TS.getModule(script, "net").out);
local movesManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "movesManager").default;
local remote = Net.ServerEvent.new("movesEvent");
do
	local super = movesManager;
	traitManager = setmetatable({}, {
		__index = super;
		__tostring = function() return "traitManager" end;
	});
	traitManager.__index = traitManager;
	function traitManager.new(...)
		local self = setmetatable({}, traitManager);
		self:constructor(...);
		return self;
	end;
	function traitManager:constructor()
		super.constructor(self, remote, traitManager.mapping);
	end;
	function traitManager:add(_0)
		local race = _0.race;
		local player = _0.player;
		local DataBuild = _0.DataBuild;
		local _1 = traitManager.mapping;
		_1[tostring(player.UserId)] = {
			db = DataBuild;
			race = race;
		};
	end;
	function traitManager:delete(_0)
		local player = _0.player;
		traitManager.mapping[tostring(player.UserId)] = nil;
	end;
	traitManager.mapping = {};
end;
exports.default = traitManager;
return exports;
