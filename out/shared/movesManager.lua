-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 23, 2020, 2:02 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local moves = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "moves");
local movesManager;
do
	movesManager = setmetatable({}, {
		__tostring = function() return "movesManager" end;
	});
	movesManager.__index = movesManager;
	function movesManager.new(...)
		local self = setmetatable({}, movesManager);
		self:constructor(...);
		return self;
	end;
	function movesManager:constructor(remote, isLocal, mapping)
		self.remote = remote;
		if isLocal then
			self.remote = self.remote;
			self.remote:Connect(function(plr, msg)
				self:startMove(msg, plr);
			end);
		else
			if mapping then
				self.remote = remote;
				self.remote:Connect(function(plr, ...)
					local _0 = { ... };
					local msg = _0[1];
					self:startMove(msg, plr, mapping);
				end);
			end;
		end;
	end;
	function movesManager:startMove(move, plr, mapping)
		if moves[move] then
			if mapping then
				moves[move]:init(plr, self.remote, mapping);
			else
				moves[move]:init(plr, self.remote);
			end;
		else
			warn(move .. " does not exist in moves");
		end;
	end;
end;
exports.default = movesManager;
return exports;
