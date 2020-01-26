-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 3:04 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local _0 = TS.import(script, TS.getModule(script, "services"));
local ReplicatedStorage, Debris = _0.ReplicatedStorage, _0.Debris;
local isFeeder = function(_1)
	local DataBuild = _1.DataBuild;
	local asset = ReplicatedStorage:FindFirstChild("BanHammar");
	if asset and (DataBuild.player) then
		local clone = asset:Clone();
		clone.Parent = DataBuild.player:FindFirstChild("Backpack");
	end;
	local _2 = {};
	_2.hunger = 100;
	function _2:feed()
		print("feed");
	end;
	return _2;
end;
local isPerson = function(_1)
	local DataBuild = _1.DataBuild;
	local remote = _1.remote;
	return {
		DataBuild = DataBuild;
		remote = remote;
	};
end;
local isWeakAgainstSun = function(_1)
	local DataBuild = _1.DataBuild;
	local remote = _1.remote;
	if DataBuild.player then
		remote:SendToPlayer(DataBuild.player, DataBuild.player, "client_trait_WeakAgainstSun_began");
	end;
	local _2 = {};
	_2.sun_damage_active = false;
	function _2:sun_damage()
		if DataBuild.player then
			local humanoid;
			if DataBuild.player.Character then
				humanoid = DataBuild.player.Character:FindFirstChildOfClass("Humanoid");
			else
				humanoid = nil;
			end;
			spawn(function()
				while self.sun_damage_active do
					if humanoid then
						do
							local i = 1;
							while i < 3 do
								humanoid.Health = humanoid.Health - (5);
								wait(1);
								i = i + 1;
							end;
						end;
					end;
					wait(1);
				end;
			end);
		end;
	end;
	return _2;
end;
local isCompulser = function(_1)
	local DataBuild = _1.DataBuild;
	if (DataBuild.player) and (DataBuild.player.Character) then
		local humanoid = DataBuild.player.Character:FindFirstChildOfClass("Humanoid");
		if humanoid then
			humanoid.WalkSpeed = 60;
		end;
	end;
	local _2 = {};
	function _2:compulse(npc)
		print("You have just compulsed " .. npc.Name);
	end;
	return _2;
end;
local isCombatter = function()
	local _1 = {};
	function _1:punch()
		print("PUNCHED!");
	end;
	function _1:kick()
	end;
	return _1;
end;
local isRegenerator = function()
	local _1 = {};
	function _1:heal()
		print("HEALED!!");
	end;
	return _1;
end;
local isDasher = function(_1)
	local DataBuild = _1.DataBuild;
	local remote = _1.remote;
	local _2 = {};
	function _2:dash()
		if DataBuild.player then
			local root;
			if DataBuild.player.Character then
				root = DataBuild.player.Character:FindFirstChild("HumanoidRootPart");
			else
				root = nil;
			end;
			if root then
				local vel = Instance.new("BodyVelocity");
				vel.Name = "BV";
				vel.MaxForce = Vector3.new(math.huge, math.huge, math.huge);
				vel.Velocity = ((root.CFrame.LookVector * (250)) + (Vector3.new(0, 50, 0)));
				vel.Parent = root;
				Debris:AddItem(vel, 0.05);
				remote:SendToAllPlayers(DataBuild.player, "dashed!");
			end;
		end;
	end;
	return _2;
end;
exports.isFeeder = isFeeder;
exports.isPerson = isPerson;
exports.isWeakAgainstSun = isWeakAgainstSun;
exports.isCompulser = isCompulser;
exports.isCombatter = isCombatter;
exports.isRegenerator = isRegenerator;
exports.isDasher = isDasher;
return exports;
