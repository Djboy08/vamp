-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 10:26 AM Eastern Standard Time

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
	function raceManager:constructor(_0)
		local race = _0.race;
		local player = _0.player;
		local DataBuild = _0.DataBuild;
		self.race = race;
		self.player = player;
		local _1 = raceManager.mapping;
		_1[tostring(player.UserId)] = {
			db = DataBuild;
			race = race;
		};
		local connection = remote:Connect(function(plr, ...)
			local _2 = { ... };
			local msg = _2[1];
			if (msg == 'dash') and (self.race["dash"] ~= nil) then
				self.race:dash();
			end;
		end);
		local root;
		if player.Character then
			root = player.Character:FindFirstChildOfClass("Humanoid");
		else
			root = nil;
		end;
		if root then
			local c;
			c = player.CharacterRemoving:Connect(function()
				connection:Disconnect();
				c:Disconnect();
			end);
		end;
	end;
	raceManager.mapping = {};
end;
exports.default = raceManager;
return exports;
