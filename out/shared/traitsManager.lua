-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 3:20 AM Eastern Standard Time

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
		local DataBuild = _0.DataBuild;
		if DataBuild and (DataBuild.player) then
			local _1 = traitManager.mapping;
			_1[tostring(DataBuild.player.UserId)] = {
				db = DataBuild;
				race = race;
			};
		else
		end;
	end;
	function traitManager:delete(_0)
		local DataBuild = _0.DataBuild;
		if DataBuild and (DataBuild.player) then
			traitManager.mapping[tostring(DataBuild.player.UserId)] = nil;
		else
		end;
	end;
	traitManager.mapping = {};
end;
exports.default = traitManager;
return exports;
