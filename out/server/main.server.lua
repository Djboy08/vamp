-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 16, 2020, 12:07 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local buildRace = TS.import(game:GetService("ReplicatedStorage"), "TS", "buildRace").buildRace;
local Players = TS.import(TS.getModule("services")).Players;
local race = "isCompulser";
local traits = {};
traits["isRegenerator"] = true;
Players.PlayerAdded:Connect(function(p)
	local composition = buildRace(race, traits, p);
end);
