-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 4:48 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Net = TS.import(script, TS.getModule(script, "net").out);
TS.async(function()
	local exampleClientTwo = Net.ClientEvent.new("EventName");
	exampleClientTwo:Connect(function(e)
		print("wow recieved something! " .. e);
	end);
	exampleClientTwo:SendToServer("testig");
end)();
