import { setRagdoll } from "shared/setRagdoll";
import { move, UserGameData } from "./move";
import NetClientEvent from "@rbxts/net/out/ClientEvent";

export const client_helper_Ragdoll_true: move = {
    cooldown: 2,
    tick: 0,
    init({plr, remote, mapping, char}: {plr: Player, remote: NetClientEvent, mapping?: Map<string, UserGameData>, char? :Model}){
        if(char && char.FindFirstChildOfClass("Humanoid")){
            print(char);
            const humanoid = char.FindFirstChildOfClass("Humanoid") as Humanoid;
            setRagdoll(humanoid, true);
        }
        // if(plr && plr.Character && plr.Character.FindFirstChildOfClass("Humanoid") ){
        //     const humanoid = plr.Character.FindFirstChildOfClass("Humanoid") as Humanoid;
        //     setRagdoll(humanoid, true);
        // }
    }
}
export const client_helper_Ragdoll_false: move = {
    cooldown: 2,
    tick: 0,
    init({plr, remote, mapping, char}: {plr: Player, remote: NetClientEvent, mapping?: Map<string, UserGameData>, char? :Model}){
        if(plr && plr.Character && plr.Character.FindFirstChildOfClass("Humanoid") ){
            const humanoid = plr.Character.FindFirstChildOfClass("Humanoid") as Humanoid;
            setRagdoll(humanoid, false);
        }
    }
}