-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 6:07 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local compose = TS.import(script, TS.getModule(script, "object-composer")).default;
local ReplicatedStorage = TS.import(script, TS.getModule(script, "services")).ReplicatedStorage;
local isFeeder = function(_0)
	local player = _0.player;
	local asset = ReplicatedStorage:FindFirstChild("BanHammar");
	if asset then
		local clone = asset:Clone();
		clone.Parent = player:FindFirstChild("Backpack");
	end;
	local _1 = {};
	_1.hunger = 100;
	function _1:feed()
		print("feed");
	end;
	return _1;
end;
local isPerson = function(_0)
	local player = _0.player;
	local remote = _0.remote;
	return {
		player = player;
		remote = remote;
	};
end;
local isCompulser = function(_0)
	local player = _0.player;
	if player.Character then
		local humanoid = player.Character:FindFirstChildOfClass("Humanoid");
		if humanoid then
			humanoid.WalkSpeed = 60;
		end;
	end;
	local _1 = {};
	function _1:compulse(npc)
		print("You have just compulsed " .. npc.Name);
	end;
	return _1;
end;
local isCombatter = function()
	local _0 = {};
	function _0:punch()
		print("PUNCHED!");
	end;
	function _0:kick()
	end;
	return _0;
end;
local isRegenerator = function()
	local _0 = {};
	function _0:heal()
		print("HEALED!!");
	end;
	return _0;
end;
local isVampire = compose(isFeeder, isCompulser);
exports.isFeeder = isFeeder;
exports.isPerson = isPerson;
exports.isCompulser = isCompulser;
exports.isCombatter = isCombatter;
exports.isRegenerator = isRegenerator;
exports.isVampire = isVampire;
return exports;
