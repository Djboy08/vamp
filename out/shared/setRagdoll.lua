-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 23, 2020, 8:02 PM Eastern Standard Time

local exports = {};
local setRagdoll = function(humanoid, setRagdoll)
	if humanoid then
		local state;
		if setRagdoll then
			state = Enum.HumanoidStateType.Physics;
		else
			state = Enum.HumanoidStateType.Physics;
		end;
		humanoid:ChangeState(state);
	end;
end;
exports.setRagdoll = setRagdoll;
return exports;
