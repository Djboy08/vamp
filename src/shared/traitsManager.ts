import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import * as traits from "shared/traits"
import buildData from "shared/DataBuild"
import Net from "@rbxts/net";
import inspect from "@rbxts/inspect"
import { UserGameData } from "shared/moves/move"

import movesManager from "shared/movesManager"

type RaceNames = Exclude<keyof typeof traits, "isPerson">;
type AnyTrait = ReturnType<typeof traits[keyof typeof traits]>;
const remote = new Net.ServerEvent("movesEvent");

export default class raceManager extends movesManager {

    public static mapping: Map<string, UserGameData> = new Map<string, UserGameData>();
    // public moveManager: raceMoves;
    constructor(){
        super(remote, raceManager.mapping);
    }

    public add({race, player, DataBuild}: {race: AnyTrait, player: Player, DataBuild: buildData}){
        raceManager.mapping.set(tostring(player.UserId), {db: DataBuild, race});
    }

    public delete({player}: {player: Player}){
        raceManager.mapping.delete(tostring(player.UserId));
    }
}




// CHECK SKILLTREE PSUDO STUFF BELOW
        //left = what you need to unlock right
// function checkSkillTree(){
//     let x = [   ['A','B'],
//                 ['C','B'],
//                 ['D','B'],
//                 ['F','A']];
//     let finding = 'A';
//     let have = ['A','C','D', 'F'];
//     for(let i = 0; i < x.size(); i++){
//         let [unlocker, unlockee] = x[i];
//         let check = false;
//         if(unlockee === finding){
//             for(let j = 0; j < have.size(); j++){
//                 if(unlocker === have[j]){
//                     check = true;
//                 }
//             }
//             if(!check) return false;
//         }
//     }
//     return true;
// }

