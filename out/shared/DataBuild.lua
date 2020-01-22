-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 21, 2020, 11:12 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local DataStore2 = TS.import(TS.getModule("datastore2").src);
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local buildData;
do
	buildData = setmetatable({}, {
		__tostring = function() return "buildData" end;
	});
	buildData.__index = buildData;
	function buildData.new(...)
		local self = setmetatable({}, buildData);
		self:constructor(...);
		return self;
	end;
	function buildData:constructor(plr)
		self.player = plr;
		self.traits = DataStore2("Traits6", plr);
		self.ar = self.traits:Get({});
		self:removeDuplicates();
		self:set();
	end;
	function buildData:removeDuplicates()
		self.ar = TS.array_filter(self.ar, function(elem, index, self)
			return index == TS.array_indexOf(self, elem);
		end);
	end;
	function buildData:toString()
		local str = "Player: " .. self.player.Name .. "\nTraits: " .. TS.array_toString(self.ar);
		return str;
	end;
	function buildData:addTraits(...)
		local traits = { ... };
		do
			local i = 0;
			while i < #traits do
				local _0 = self.ar;
				_0[#_0 + 1] = traits[i + 1];
				warn("Giving player " .. self.player.Name .. " the trait " .. traits[i + 1]);
				i = i + 1;
			end;
		end;
		self:removeDuplicates();
		self:set();
	end;
	function buildData:removeTraits(...)
		local traits = { ... };
		do
			local i = 0;
			while i < #traits do
				local _0 = self.ar;
				_0[#_0 + 1] = traits[i + 1];
				warn("Giving player " .. self.player.Name .. " the trait " .. traits[i + 1]);
				i = i + 1;
			end;
		end;
		self:removeDuplicates();
		self:set();
	end;
	function buildData:set()
		self.traits:Set(self.ar);
	end;
	function buildData:getTraits()
		return self.ar;
	end;
	function buildData:__tostring() return self:toString(); end;
end;
exports.default = buildData;
return exports;
