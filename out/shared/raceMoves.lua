-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 22, 2020, 12:34 AM Eastern Standard Time

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
	function raceMoves:constructor()
	end;
end;
exports.default = raceMoves;
return exports;
