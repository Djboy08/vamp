-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 3:04 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local buildRace;
local compose = TS.import(script, TS.getModule(script, "object-composer")).compose;
local traits = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "traits");
function buildRace(DataBuild, remote, ...)
	local traitNames = { ... };
	return compose(traits.isPerson, unpack(TS.array_map(traitNames, function(r)
		return traits[r];
	end)))({
		DataBuild = DataBuild;
		remote = remote;
	});
end;
exports.buildRace = buildRace;
return exports;
