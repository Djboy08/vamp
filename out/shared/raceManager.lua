-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 10:46 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local raceManager;
local DataStore2 = TS.import(script, TS.getModule(script, "datastore2").src);
local Net = TS.import(script, TS.getModule(script, "net").out);
local remote = Net.ServerEvent.new("movesEvent");
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
	function raceManager:constructor()
		local connection = remote:Connect(function(plr, ...)
			local _0 = { ... };
			local msg = _0[1];
			local UserData = raceManager.mapping[tostring(plr.UserId)];
			if (msg == 'dash') and (UserData.race["dash"] ~= nil) then
				UserData.race:dash();
			end;
		end);
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
	raceManager.mapping = {};
end;
exports.default = raceManager;
return exports;
