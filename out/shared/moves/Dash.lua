-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 23, 2020, 2:02 AM Eastern Standard Time

local exports = {};
local server_trait_Dash_began = {};
function server_trait_Dash_began:init(plr, remote, mapping)
	if mapping then
		local UserData = mapping[tostring(plr.UserId)];
		if UserData.race["dash"] ~= nil then
			UserData.race:dash();
		end;
	end;
end;
exports.server_trait_Dash_began = server_trait_Dash_began;
return exports;
