-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 2:11 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local _0 = TS.import(script, TS.getModule(script, "services"));
local Players, TweenService = _0.Players, _0.TweenService;
local plr = Players.LocalPlayer;
if (plr.Character) and (plr.Character:FindFirstChildOfClass("Humanoid")) then
	local char = plr.Character;
	local humanoid = char:FindFirstChildOfClass("Humanoid");
	local LowerTorso = char:WaitForChild("LowerTorso");
	local Root = LowerTorso:FindFirstChildOfClass("Motor6D");
	if (LowerTorso:IsA("BasePart")) and (Root:IsA("Motor6D")) and (humanoid:GetState() ~= Enum.HumanoidStateType.Freefall) then
		local copy = Root.C1;
		while plr.Character do
			local yvel = char:FindFirstChild("HumanoidRootPart").RotVelocity.Y;
			local tweeninfoo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
			local properties = {};
			local CoordinateFrame = CFrame.Angles(0, 0, math.clamp(-math.rad(yvel) * 3, -0.5, 0.5));
			properties["C1"] = (copy * (CoordinateFrame));
			local tween = TweenService:Create(Root, tweeninfoo, properties);
			tween:Play();
			wait();
		end;
	end;
end;
