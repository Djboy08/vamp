-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 23, 2020, 2:02 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local _0 = TS.import(script, TS.getModule(script, "services"));
local Workspace, Players, ReplicatedStorage, Lighting, TweenService = _0.Workspace, _0.Players, _0.ReplicatedStorage, _0.Lighting, _0.TweenService;
local client_trait_WeakAgainstSun_began = {};
function client_trait_WeakAgainstSun_began:init(plr, remote)
	local status = false;
	if plr ~= Players.LocalPlayer then
		return nil;
	end;
	while plr.Character do
		local sun_direction = Lighting:GetSunDirection();
		local root;
		if plr.Character then
			root = plr.Character:FindFirstChild("HumanoidRootPart");
		else
			root = nil;
		end;
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
				if status == true then
					remote:SendToServer("server_trait_WeakAgainstSun_deletefire");
					status = false;
				end;
			else
				if status == false then
					remote:SendToServer("server_trait_WeakAgainstSun_addfire");
					status = true;
				end;
			end;
		end;
		wait(0.5);
	end;
end;
local client_trait_WeakAgainstSun_addfire = {};
function client_trait_WeakAgainstSun_addfire:init(plr, remote)
	local asset = ReplicatedStorage:FindFirstChild("Fire"):Clone();
	local root;
	if plr.Character then
		root = plr.Character:FindFirstChild("HumanoidRootPart");
	else
		root = nil;
	end;
	if root and (root:FindFirstChild("Fire")) then
		asset = root:FindFirstChild("Fire");
	end;
	asset.Enabled = true;
	if plr.Character then
		asset.Parent = plr.Character:FindFirstChild("HumanoidRootPart");
	else
		asset.Parent = nil;
	end;
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
	local t = TweenService:Create(asset, tweenInfo, {
		LightEmission = 0.86;
		Rate = 70;
	});
	t:Play();
end;
local server_trait_WeakAgainstSun_addfire = {};
function server_trait_WeakAgainstSun_addfire:init(plr, remote, mapping)
	if mapping then
		local UserData = mapping[tostring(plr.UserId)];
		if (UserData.race["sun_damage"] ~= nil) and (not (UserData.race.sun_damage_active)) then
			UserData.race.sun_damage_active = true;
			UserData.race:sun_damage();
			remote:SendToAllPlayers(UserData.db.player, "client_trait_WeakAgainstSun_addfire");
		end;
	end;
end;
local server_trait_WeakAgainstSun_deletefire = {};
function server_trait_WeakAgainstSun_deletefire:init(plr, remote, mapping)
	if mapping then
		local UserData = mapping[tostring(plr.UserId)];
		if (UserData.race["sun_damage_active"] ~= nil) and (UserData.race.sun_damage_active) then
			UserData.race.sun_damage_active = false;
			remote:SendToAllPlayers(UserData.db.player, "client_trait_WeakAgainstSun_deletefire");
		end;
	end;
end;
local client_trait_WeakAgainstSun_deletefire = {};
function client_trait_WeakAgainstSun_deletefire:init(plr, remote)
	local asset = ReplicatedStorage:FindFirstChild("Fire"):Clone();
	local root;
	if plr.Character then
		root = plr.Character:FindFirstChild("HumanoidRootPart");
	else
		root = nil;
	end;
	if root and (root:FindFirstChild("Fire")) then
		asset = root:FindFirstChild("Fire");
	end;
	local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
	local t = TweenService:Create(asset, tweenInfo, {
		LightEmission = 0;
		Rate = 0;
	});
	t:Play();
end;
exports.client_trait_WeakAgainstSun_began = client_trait_WeakAgainstSun_began;
exports.client_trait_WeakAgainstSun_addfire = client_trait_WeakAgainstSun_addfire;
exports.server_trait_WeakAgainstSun_addfire = server_trait_WeakAgainstSun_addfire;
exports.server_trait_WeakAgainstSun_deletefire = server_trait_WeakAgainstSun_deletefire;
exports.client_trait_WeakAgainstSun_deletefire = client_trait_WeakAgainstSun_deletefire;
return exports;
