-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 1:27 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Net = TS.import(script, TS.getModule(script, "net").out);
local UserInputService = TS.import(script, TS.getModule(script, "services")).UserInputService;
local inspect = TS.import(script, TS.getModule(script, "inspect").inspect);
local remote = Net.ClientEvent.new("movesEvent");
UserInputService.InputBegan:Connect(function(inputObject, gameProcessedEvent)
	if inputObject.UserInputType == Enum.UserInputType.Keyboard then
		local key = inputObject.KeyCode;
		if key == Enum.KeyCode.Q then
			print('sent');
			remote:SendToServer("server_trait_Dash_began");
		end;
	end;
end);
