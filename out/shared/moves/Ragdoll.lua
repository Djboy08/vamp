-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 3:31 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local setRagdoll = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "setRagdoll").setRagdoll;
local client_helper_Ragdoll_true = {};
client_helper_Ragdoll_true.cooldown = 2;
client_helper_Ragdoll_true.tick = 0;
function client_helper_Ragdoll_true:init(_0)
	local plr = _0.plr;
	local remote = _0.remote;
	local mapping = _0.mapping;
	local char = _0.char;
	if char and (char:FindFirstChildOfClass("Humanoid")) then
		local humanoid = char:FindFirstChildOfClass("Humanoid");
		setRagdoll(humanoid, true);
	end;
end;
local client_helper_Ragdoll_false = {};
client_helper_Ragdoll_false.cooldown = 2;
client_helper_Ragdoll_false.tick = 0;
function client_helper_Ragdoll_false:init(_0)
	local plr = _0.plr;
	local remote = _0.remote;
	local mapping = _0.mapping;
	local char = _0.char;
	if char and (char:FindFirstChildOfClass("Humanoid")) then
		local humanoid = char:FindFirstChildOfClass("Humanoid");
		setRagdoll(humanoid, false);
	end;
end;
exports.client_helper_Ragdoll_true = client_helper_Ragdoll_true;
exports.client_helper_Ragdoll_false = client_helper_Ragdoll_false;
return exports;
