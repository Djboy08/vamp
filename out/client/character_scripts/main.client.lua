-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 4:25 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Net = TS.import(script, TS.getModule(script, "net").out);
local _0 = TS.import(script, TS.getModule(script, "services"));
local Players, UserInputService, Lighting, Workspace = _0.Players, _0.UserInputService, _0.Lighting, _0.Workspace;
local inspect = TS.import(script, TS.getModule(script, "inspect").inspect);
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
remote:Connect(function(msg, plr)
	if msg == "sun_damage" then
		while plr.Character do
			local sun_direction = Lighting:GetSunDirection();
			local root;
			if Players.LocalPlayer.Character then
				root = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
			else
				root = nil;
			end;
			if root and (root:IsA("BasePart")) then
				local ray = Ray.new(root.Position, (sun_direction * (20)));
				local _2 = ray;
				local _1;
				if root.Parent then
					_1 = root.Parent:GetChildren();
				else
					_1 = {};
				end;
				local part = { Workspace:FindPartOnRayWithIgnoreList(_2, _1) };
				if part[1] then
					print(inspect(part[1]));
				else
					remote:SendToServer("sun_damage");
				end;
			end;
			wait(3);
		end;
	end;
end);
