-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 1:27 AM Eastern Standard Time

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
