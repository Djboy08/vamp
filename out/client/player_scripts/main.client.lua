-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 24, 2020, 9:03 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Net = TS.import(script, TS.getModule(script, "net").out);
local inspect = TS.import(script, TS.getModule(script, "inspect").inspect);
local moveManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "movesManager").default;
local remote = Net.ClientEvent.new("movesEvent");
local moves_manager = moveManager.new(remote);
