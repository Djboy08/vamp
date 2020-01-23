import { Workspace, Players, ReplicatedStorage, Lighting, TweenService } from "@rbxts/services";
import * as races from "shared/traits"
import buildData from "shared/DataBuild"
import Net from "@rbxts/net";
import inspect from "@rbxts/inspect"
import { move } from "shared/moves/move";
import NetClientEvent from "@rbxts/net/out/ClientEvent";
import raceManager, { UserGameData } from "shared/raceManager";
import NetServerEvent from "@rbxts/net/out/ServerEvent";

export const server_trait_Dash_began: move = {
    init(plr: Player, remote: NetServerEvent, mapping?: Map<string, UserGameData>){
        if(mapping){
            const UserData = mapping.get(tostring(plr.UserId)) as UserGameData;
            if("dash" in UserData.race){
                UserData.race.dash();
            }
        }
    }
}
