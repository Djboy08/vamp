-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 1:17 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local compose = TS.import(script, TS.getModule(script, "object-composer")).default;
local _0 = TS.import(script, TS.getModule(script, "services"));
local ReplicatedStorage, Debris = _0.ReplicatedStorage, _0.Debris;
local isFeeder = function(_1)
	local player = _1.player;
	local asset = ReplicatedStorage:FindFirstChild("BanHammar");
	if asset then
		local clone = asset:Clone();
		clone.Parent = player:FindFirstChild("Backpack");
	end;
	local _2 = {};
	_2.hunger = 100;
	function _2:feed()
		print("feed");
	end;
	return _2;
end;
local isPerson = function(_1)
	local player = _1.player;
	local remote = _1.remote;
	return {
		player = player;
		remote = remote;
	};
end;
local isCompulser = function(_1)
	local player = _1.player;
	if player.Character then
		local humanoid = player.Character:FindFirstChildOfClass("Humanoid");
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
	local player = _1.player;
	local remote = _1.remote;
	local _2 = {};
	function _2:dash()
		local root;
		if player.Character then
			root = player.Character:FindFirstChild("HumanoidRootPart");
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
			remote:SendToAllPlayers("dashed!");
		end;
	end;
	return _2;
end;
local isVampire = compose(isFeeder, isCompulser);
exports.isFeeder = isFeeder;
exports.isPerson = isPerson;
exports.isCompulser = isCompulser;
exports.isCombatter = isCombatter;
exports.isRegenerator = isRegenerator;
exports.isDasher = isDasher;
exports.isVampire = isVampire;
return exports;
