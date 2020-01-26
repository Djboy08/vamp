-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 2:42 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local DataStore2 = TS.import(script, TS.getModule(script, "datastore2").src);
local getRaceTraits = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "races").getRaceTraits;
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
		self.dataDS = DataStore2("Data7", plr);
		local d = self.dataDS:Get({
			traits = {};
			skills = {};
			race = "Human";
		});
		self.data = {
			traits = d.traits;
			skills = d.skills;
			race = d.race;
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
		local str = "Player: " .. tostring(self.player) .. "\
Traits: " .. TS.array_toString(self.data.traits) .. "\
Skills: " .. TS.array_toString(self.data.skills) .. "\
Race:   \"" .. self.data.race .. "\"\
CombinedTraits: " .. TS.array_toString(self:combineTraitsAndRace());
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
					warn("Giving player " .. tostring(self.player) .. " the trait " .. traits[i + 1]);
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
			race = self.data.race;
		};
		self.dataDS:Set(self.data);
	end;
	function buildData:getTraits()
		return self.data.traits;
	end;
	function buildData:combineTraitsAndRace()
		if self.data.race == "" then
			return self:getTraits();
		end;
		local race = self.data.race;
		local race_traits = getRaceTraits(race);
		if race_traits ~= nil then
			local _0 = TS.set_new(TS.array_concat(race_traits, self:getTraits()));
			local new_traits = TS.set_values(_0);
			return new_traits;
		else
			return self:getTraits();
		end;
	end;
	function buildData:__tostring() return self:toString(); end;
end;
exports.default = buildData;
return exports;
