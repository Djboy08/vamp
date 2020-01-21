-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 21, 2020, 6:05 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local buildRace = TS.import(game:GetService("ReplicatedStorage"), "TS", "buildRace").buildRace;
local Players = TS.import(TS.getModule("services")).Players;
local DataStore2 = TS.import(TS.getModule("datastore2").src);
Players.PlayerAdded:Connect(function(plr)
	local dataStore = DataStore2("Traits4", plr);
	local ar = dataStore:Get({});
	do
		local i = 0;
		while i < #ar do
			print(ar[i + 1]);
			i = i + 1;
		end;
	end;
	ar[#ar + 1] = "isVampire";
	ar = TS.array_filter(ar, function(elem, index, self)
		return index == TS.array_indexOf(self, elem);
	end);
	dataStore:Set(ar);
	local race = buildRace(plr, unpack(ar));
	if race["punch"] ~= nil then
		race:punch();
	end;
	if race["feed"] ~= nil then
		race:feed();
	end;
	plr.CharacterAdded:Connect(function(char)
		print("Char added");
		if race["compulse"] ~= nil then
			race:compulse(char);
		end;
	end);
end);
