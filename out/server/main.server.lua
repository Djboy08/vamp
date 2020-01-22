-- Compiled with https://roblox-ts.github.io v0.2.14
-- January 22, 2020, 3:17 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local races = TS.import(game:GetService("ReplicatedStorage"), "TS", "races");
local buildRace = TS.import(game:GetService("ReplicatedStorage"), "TS", "buildRace").buildRace;
local _0 = TS.import(TS.getModule("services"));
local Workspace, Players = _0.Workspace, _0.Players;
local buildData = TS.import(game:GetService("ReplicatedStorage"), "TS", "DataBuild").default;
local raceManager = TS.import(game:GetService("ReplicatedStorage"), "TS", "raceManager").default;
Players.PlayerAdded:Connect(function(plr)
	local DataBuild = buildData.new(plr);
	plr.CharacterAdded:Connect(function(char)
		local race = buildRace(plr, unpack(DataBuild:getTraits()));
		warn(DataBuild:toString());
		local race_manager = raceManager.new({
			race = race;
			player = plr;
		});
		local traitsModel = Workspace:FindFirstChild("Traits");
		if traitsModel then
			local children = traitsModel:GetChildren();
			for _1 = 1, #children do
				local obj = children[_1];
				if obj.ClassName == "Part" then
					(obj).Touched:Connect(function(part)
						if part.Parent and part.Parent.ClassName == "Model" then
							local split = string.split((obj.Name), ":");
							local t = split[1];
							local _2 = split[2];
							repeat
								if _2 == "add" then
									print("Adding");
									DataBuild:addTraits(t);
									break;
								end;
								if _2 == "rem" then
									print("removing");
									DataBuild:removeTraits(t);
									break;
								end;
							until true;
						end;
					end);
				end;
			end;
		end;
	end);
end);
