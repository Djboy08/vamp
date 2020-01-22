-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 6:15 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local Net = TS.import(script, TS.getModule(script, "net").out);
local _0 = TS.import(script, TS.getModule(script, "services"));
local Players, UserInputService, Lighting, Workspace, ReplicatedStorage, TweenService = _0.Players, _0.UserInputService, _0.Lighting, _0.Workspace, _0.ReplicatedStorage, _0.TweenService;
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
		local asset = ReplicatedStorage:FindFirstChild("Fire"):Clone();
		while plr.Character do
			local sun_direction = Lighting:GetSunDirection();
			if plr.Character then
				asset.Parent = plr.Character:FindFirstChild("HumanoidRootPart");
			else
				asset.Parent = nil;
			end;
			local root;
			if Players.LocalPlayer.Character then
				root = Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart");
			else
				root = nil;
			end;
			local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
			local t = TweenService:Create(asset, tweenInfo, {
				LightEmission = 0;
				Rate = 0;
			});
			local t2 = TweenService:Create(asset, tweenInfo, {
				LightEmission = 0.86;
				Rate = 70;
			});
			if root and (root:IsA("BasePart")) then
				local ray = Ray.new(root.Position, (sun_direction * (50)));
				local _2 = ray;
				local _1;
				if root.Parent then
					_1 = root.Parent:GetChildren();
				else
					_1 = {};
				end;
				local part = { Workspace:FindPartOnRayWithIgnoreList(_2, _1) };
				if part[1] then
					t:Play();
					t.Completed:Connect(function(playbackState)
						asset.Parent = nil;
					end);
				else
					t2:Play();
					t2.Completed:Connect(function(playbackState)
						if plr.Character then
							asset.Parent = plr.Character:FindFirstChild("HumanoidRootPart");
						else
							asset.Parent = nil;
						end;
					end);
					if plr == Players.LocalPlayer then
						remote:SendToServer("sun_damage");
					end;
				end;
			end;
			wait(1);
		end;
	end;
end);
