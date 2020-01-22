-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 5:16 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Net = TS.import(script, TS.getModule(script, "net").out);
TS.async(function()
	local exampleClientTwo = Net.ClientEvent.new("movesEvent");
	exampleClientTwo:Connect(function(plr, msg)
		print(plr.Name, msg);
	end);
end)();
