-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 22, 2020, 3:47 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local compose = TS.import(TS.getModule("object-composer")).default;
local isFeeder = function()
	local _0 = {};
	_0.hunger = 100;
	function _0:feed()
		print("feed");
	end;
	return _0;
end;
local isPerson = function(_0)
	local player = _0.player;
	return {
		player = player;
	};
end;
local isCompulser = function(_0)
	local player = _0.player;
	print(player.Name .. " is A COMPULSER");
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
