-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 21, 2020, 5:42 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local makeHello = TS.import(game:GetService("ReplicatedStorage"), "TS", "module").makeHello;
print(makeHello("main.client.ts"));
