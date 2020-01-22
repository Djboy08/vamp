-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 22, 2020, 4:00 PM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local buildRace = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "buildRace").buildRace;
local _0 = TS.import(script, TS.getModule(script, "services"));
local Workspace, Players = _0.Workspace, _0.Players;
local buildData = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "DataBuild").default;
local raceManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "raceManager").default;
local Net = TS.import(script, TS.getModule(script, "net").out);
local remote = Net.ServerEvent.new("movesEvent");
local race_manager = raceManager.new();
Players.PlayerAdded:Connect(function(plr)
	local DataBuild = buildData.new(plr);
	plr.CharacterAdded:Connect(function(char)
		wait(1);
		local race = buildRace(plr, remote, unpack(DataBuild:combineTraitsAndRace()));
		race_manager:add({
			race = race;
			player = plr;
			DataBuild = DataBuild;
		});
		warn(DataBuild:toString());
		local humanoid = char:FindFirstChildOfClass("Humanoid");
		if humanoid then
			humanoid.Died:Connect(function()
				race_manager:delete({
					player = plr;
				});
				plr:LoadCharacter();
			end);
		end;
	end);
	plr:LoadCharacter();
end);
local traitsModel = Workspace:FindFirstChild("Traits");
if traitsModel then
	local children = traitsModel:GetChildren();
	for _1 = 1, #children do
		local obj = children[_1];
		if obj:IsA("Part") then
			obj.Touched:Connect(function(part)
				if (part.Parent) and (part.Parent:IsA("Model")) then
					local split = string.split((obj.Name), ":");
					local t = split[1];
					local P = Players:GetPlayerFromCharacter(part.Parent);
					local _2 = split[2];
					repeat
						if _2 == "add" then
							print("Adding");
							raceManager.mapping[tostring(P.UserId)].db:addTraits(t);
							P:LoadCharacter();
							break;
						end;
						if _2 == "rem" then
							print("removing");
							raceManager.mapping[tostring(P.UserId)].db:removeTraits(t);
							P:LoadCharacter();
							break;
						end;
					until true;
				end;
			end);
		end;
	end;
end;
