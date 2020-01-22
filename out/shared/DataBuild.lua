-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 4:45 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local DataStore2 = TS.import(script, TS.getModule(script, "datastore2").src);
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
		self.traits = DataStore2("Traits8", plr);
		self.ar = self.traits:Get({});
		self:removeDuplicates();
		self:set();
	end;
	function buildData:removeDuplicates()
		local _0 = TS.set_new(self.ar);
		self.ar = TS.set_values(_0);
	end;
	function buildData:toString()
		local str = "Player: " .. self.player.Name .. "\nTraits: " .. TS.array_toString(self.ar);
		return str;
	end;
	function buildData:addTraits(...)
		local traits = { ... };
		local temp_set = TS.set_new(self.ar);
		do
			local i = 0;
			while i < #traits do
				print("is " .. traits[i + 1] .. " in their traits? = " .. tostring((temp_set[traits[i + 1]] ~= nil)));
				if not (temp_set[traits[i + 1]] ~= nil) then
					local _0 = self.ar;
					_0[#_0 + 1] = traits[i + 1];
					warn("Giving player " .. self.player.Name .. " the trait " .. traits[i + 1]);
				else
					error("Player " .. self.player.Name .. " Already has this trait!");
				end;
				i = i + 1;
			end;
		end;
		self:removeDuplicates();
		self:set();
	end;
	function buildData:removeTraits(...)
		local traits = { ... };
		local temp_set = TS.set_new(self.ar);
		do
			local i = 0;
			while i < #traits do
				if temp_set[traits[i + 1]] ~= nil then
					temp_set[traits[i + 1]] = nil;
				else
					error("This trait can not be removed because its not in their traits list.");
				end;
				i = i + 1;
			end;
		end;
		self.ar = TS.set_values(temp_set);
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
