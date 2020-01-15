-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 15, 2020, 5:06 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local compose = TS.import(TS.getModule("object-composer")).default;
local isFeeder = function()
	local _0 = {};
	_0.hunger = 100;
	function _0:feed(npc)
		self.hunger = self.hunger - 1;
		print("Feeding on " .. npc.Name);
	end;
	return _0;
end;
local isPerson = function(_0)
	local player = _0.player;
	return {
		player = player;
	};
end;
local isCompulser = function()
	local _0 = {};
	function _0:compulse()
		print("You have just compulsed");
	end;
	return _0;
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
		print("PUNCHED!");
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
