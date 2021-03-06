-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 3:39 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local exports = {};
local RunService = TS.import(script, TS.getModule(script, "services")).RunService;
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
	function movesManager:constructor(remote, mapping)
		self.remote = remote;
		if RunService:IsClient() then
			self.remote = self.remote;
			self.remote:Connect(function(plr, msg, char)
				self:startMove({
					move = msg;
					plr = plr;
					char = char;
				});
			end);
		else
			if mapping then
				self.remote = remote;
				self.remote:Connect(function(plr, ...)
					local _0 = { ... };
					local msg = _0[1];
					local char = _0[2];
					self:startMove({
						move = msg;
						plr = plr;
						mapping = mapping;
						char = char;
					});
				end);
			end;
		end;
	end;
	function movesManager:startMove(_0)
		local move = _0.move;
		local plr = _0.plr;
		local mapping = _0.mapping;
		local char = _0.char;
		print(move);
		if moves[move] then
			if (tick() - moves[move].tick) > moves[move].cooldown then
				moves[move].tick = tick();
				if mapping then
					moves[move]:init({
						plr = plr;
						remote = self.remote;
						mapping = mapping;
						char = char;
					});
				else
					moves[move]:init({
						plr = plr;
						remote = self.remote;
						mapping = mapping;
						char = char;
					});
				end;
			end;
		else
			warn(move .. " does not exist in moves");
		end;
	end;
end;
exports.default = movesManager;
return exports;
