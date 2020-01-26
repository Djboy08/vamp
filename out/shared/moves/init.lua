-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 3:31 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
TS.exportNamespace(TS.import(script, game:GetService("ReplicatedStorage"), "TS", "moves", "WeakAgainstSun"), exports);
TS.exportNamespace(TS.import(script, game:GetService("ReplicatedStorage"), "TS", "moves", "Ragdoll"), exports);
TS.exportNamespace(TS.import(script, game:GetService("ReplicatedStorage"), "TS", "moves", "Dash"), exports);
return exports;
