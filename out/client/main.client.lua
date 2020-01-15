-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 15, 2020, 2:20 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local makeHello = TS.import(game:GetService("ReplicatedStorage"), "TS", "module").makeHello;
print(makeHello("main.client.ts"));
