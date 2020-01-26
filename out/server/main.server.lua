-- Compiled with https://roblox-ts.github.io v0.3.0
-- January 26, 2020, 1:46 AM Eastern Standard Time

local TS = require(game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include"):WaitForChild("RuntimeLib"));
local waitForObjectParent;
local buildRace = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "buildRace").buildRace;
local _0 = TS.import(script, TS.getModule(script, "services"));
local Workspace, Players = _0.Workspace, _0.Players;
local buildData = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "DataBuild").default;
local traitManager = TS.import(script, game:GetService("ReplicatedStorage"), "TS", "traitsManager").default;
local Net = TS.import(script, TS.getModule(script, "net").out);
local remote = Net.ServerEvent.new("movesEvent");
local trait_manager = traitManager.new();
Players.PlayerAdded:Connect(function(plr)
	local DataBuild = buildData.new(plr);
	plr.CharacterAdded:Connect(function(char)
		waitForObjectParent(char, plr);
		local race = buildRace(plr, remote, unpack(DataBuild:combineTraitsAndRace()));
		trait_manager:add({
			race = race;
			player = plr;
			DataBuild = DataBuild;
		});
		warn(DataBuild:toString());
		local humanoid = char:FindFirstChildOfClass("Humanoid");
		if humanoid then
			local connection = humanoid.HealthChanged:Connect(function(health)
				if health < 20 then
					print(plr.Name .. " HP has changed to " .. tostring(health));
					remote:SendToPlayer(plr, plr, "client_helper_Ragdoll_true");
				end;
			end);
			local connection2;
			connection2 = humanoid.Died:Connect(function()
				trait_manager:delete({
					player = plr;
				});
				plr:LoadCharacter();
				humanoid:Destroy();
				connection:Disconnect();
				connection2:Disconnect();
			end);
		end;
	end);
	plr:LoadCharacter();
end);
waitForObjectParent = function(obj, p)
	if not (obj:IsDescendantOf(game)) then
		obj.AncestryChanged:Wait();
	end;
end;
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
					if P then
						local humanoid;
						if P.Character then
							humanoid = P.Character:FindFirstChildOfClass("Humanoid");
						else
							humanoid = nil;
						end;
						local User = traitManager.mapping[tostring(P.UserId)];
						if User then
							local _2 = split[2];
							repeat
								if _2 == "add" then
									print("Adding");
									User.db:addTraits(t);
									if humanoid then
										humanoid.Health = 0;
									end;
									break;
								end;
								if _2 == "rem" then
									print("removing");
									User.db:removeTraits(t);
									if humanoid then
										humanoid.Health = 0;
									end;
									break;
								end;
							until true;
						end;
					end;
				end;
			end);
		end;
	end;
end;
