-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 1:29 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local DataStore2 = TS.import(script, TS.getModule(script, "datastore2").src);
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
