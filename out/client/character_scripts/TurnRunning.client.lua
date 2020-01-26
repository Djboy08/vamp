-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 3:15 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local _0 = TS.import(script, TS.getModule(script, "services"));
local Players, TweenService = _0.Players, _0.TweenService;
local plr = Players.LocalPlayer;
if (plr.Character) and (plr.Character:FindFirstChildOfClass("Humanoid")) then
	local char = plr.Character;
	local humanoid = char:FindFirstChildOfClass("Humanoid");
	local LowerTorso = char:WaitForChild("LowerTorso");
	local UpperTorso = char:WaitForChild("UpperTorso");
	local Root = LowerTorso:FindFirstChildOfClass("Motor6D");
	local Waist = UpperTorso:FindFirstChildOfClass("Motor6D");
	if (LowerTorso:IsA("BasePart")) and (Root:IsA("Motor6D")) and (humanoid:GetState() ~= Enum.HumanoidStateType.Freefall) and (UpperTorso:IsA("BasePart")) and (Waist:IsA("Motor6D")) then
		local root_c1 = Root.C1;
		local waist_c1 = Waist.C1;
		while plr.Character do
			local yvel = char:FindFirstChild("HumanoidRootPart").RotVelocity.Y;
			local tweeninfoo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
			local properties = {};
			local val = (-math.rad(yvel) * 3) / 2;
			local CoordinateFrame_root = CFrame.Angles(0, 0, math.clamp(val, -0.5, 0.5));
			local CoordinateFrame_waist = CFrame.Angles(0, 0, math.clamp(val, -0.5, 0.5));
			properties["C1"] = (root_c1 * (CoordinateFrame_root));
			local tween_root = TweenService:Create(Root, tweeninfoo, properties);
			properties["C1"] = (waist_c1 * (CoordinateFrame_waist));
			local tween_waist = TweenService:Create(Waist, tweeninfoo, properties);
			tween_root:Play();
			tween_waist:Play();
			wait();
		end;
	end;
end;
