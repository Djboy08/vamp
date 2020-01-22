-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 22, 2020, 3:17 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local raceMoves;
do
	raceMoves = setmetatable({}, {
		__tostring = function() return "raceMoves" end;
	});
	raceMoves.__index = raceMoves;
	function raceMoves.new(...)
		local self = setmetatable({}, raceMoves);
		self:constructor(...);
		return self;
	end;
	function raceMoves:constructor(race)
		self.moves = {
			["punch"] = function(race)
				race:punch();
			end;
			["feed"] = function(race)
				race:feed();
			end;
			["heal"] = function(race)
				race:heal();
			end;
			["compulse"] = function(race)
				if race.player.Character then
					race:compulse(race.player.Character);
				end;
			end;
		};
		TS.array_forEach(TS.Object_entries(self.moves), function(_0)
			local index = _0[1];
			local callback = _0[2];
			if race[index] ~= nil then
				callback(race);
			end;
		end);
	end;
end;
exports.default = raceMoves;
return exports;
