-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 1:06 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Net = TS.import(script, TS.getModule(script, "net").out);
local UserInputService = TS.import(script, TS.getModule(script, "services")).UserInputService;
local remote = Net.ClientEvent.new("movesEvent");
UserInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent)
	if inputObject.UserInputType == Enum.UserInputType.Keyboard then
		local key = inputObject.KeyCode;
		if key == Enum.KeyCode.Q then
			print('sent');
			remote:SendToServer("dash");
		end;
	end;
end);
remote:Connect(function(msg)
	print(msg, "doin effects yo!");
end);
