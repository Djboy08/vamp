-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 1:46 AM Eastern Standard Time

local exports = {};
local server_trait_Dash_began = {};
server_trait_Dash_began.cooldown = 1;
server_trait_Dash_began.tick = 0;
function server_trait_Dash_began:init(_0)
	local plr = _0.plr;
	local remote = _0.remote;
	local mapping = _0.mapping;
	local char = _0.char;
	if mapping then
		local UserData = mapping[tostring(plr.UserId)];
		if UserData.race["dash"] ~= nil then
			UserData.race:dash();
		end;
	end;
end;
exports.server_trait_Dash_began = server_trait_Dash_began;
return exports;
