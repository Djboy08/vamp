-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 12:57 PM Eastern Standard Time

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
		self.dataDS = DataStore2("Data1", plr);
		local d = self.dataDS:Get({
			traits = {};
			skills = {};
		});
		self.data = {
			traits = d.traits;
			skills = d.skills;
		};
		self:removeDuplicates();
		self:set();
	end;
	function buildData:removeDuplicates()
		local _0 = TS.set_new(self.data.traits);
		self.data.traits = TS.set_values(_0);
		local _1 = TS.set_new(self.data.skills);
		self.data.skills = TS.set_values(_1);
	end;
	function buildData:toString()
		local str = "Player: " .. self.player.Name .. "\nTraits: " .. TS.array_toString(self.data.traits) .. "\nSkills: " .. TS.array_toString(self.data.skills);
		return str;
	end;
	function buildData:addTraits(...)
		local traits = { ... };
		local temp_set = TS.set_new(self.data.traits);
		do
			local i = 0;
			while i < #traits do
				print("is " .. traits[i + 1] .. " in their traits? = " .. tostring((temp_set[traits[i + 1]] ~= nil)));
				if not (temp_set[traits[i + 1]] ~= nil) then
					local _0 = self.data.traits;
					_0[#_0 + 1] = traits[i + 1];
					warn("Giving player " .. self.player.Name .. " the trait " .. traits[i + 1]);
				else
				end;
				i = i + 1;
			end;
		end;
		self:removeDuplicates();
		self:set();
	end;
	function buildData:removeTraits(...)
		local traits = { ... };
		local temp_set = TS.set_new(self.data.traits);
		do
			local i = 0;
			while i < #traits do
				if temp_set[traits[i + 1]] ~= nil then
					temp_set[traits[i + 1]] = nil;
				else
				end;
				i = i + 1;
			end;
		end;
		self.data.traits = TS.set_values(temp_set);
		self:set();
	end;
	function buildData:set()
		self.data = {
			traits = self.data.traits;
			skills = self.data.skills;
		};
		self.dataDS:Set(self.data);
	end;
	function buildData:getTraits()
		return self.data.traits;
	end;
	function buildData:__tostring() return self:toString(); end;
end;
exports.default = buildData;
return exports;
