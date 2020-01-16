-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 16, 2020, 6:03 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local buildRace = TS.import(game:GetService("ReplicatedStorage"), "TS", "buildRace").buildRace;
local Players = TS.import(TS.getModule("services")).Players;
Players.PlayerAdded:Connect(function(plr)
	local x = buildRace(plr, "isCompulser", "isCombatter", "isFeeder");
	if x["compulse"] ~= nil then
	end;
end);
