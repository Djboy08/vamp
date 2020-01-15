-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 15, 2020, 5:13 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local buildRace = TS.import(game:GetService("ReplicatedStorage"), "TS", "buildRace").buildRace;
local Players = TS.import(TS.getModule("services")).Players;
local race = "isCompulser";
local traits = {};
traits["isRegenerator"] = true;
Players.PlayerAdded:Connect(function(p)
	local composition = buildRace(race, traits, p);
	local _ = composition;
end);
