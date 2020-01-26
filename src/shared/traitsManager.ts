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

export default class traitManager extends movesManager {

    public static mapping: Map<string, UserGameData> = new Map<string, UserGameData>();
    // public moveManager: raceMoves;
    constructor(){
        super(remote, traitManager.mapping);
    }

    public add({race, DataBuild}: {race: AnyTrait, DataBuild: buildData}){
        if(DataBuild && DataBuild.player){
            traitManager.mapping.set(tostring(DataBuild.player.UserId), {db: DataBuild, race});
        }else{
            // this means it should be a NPC
            // the key should be something unique that would be inside the humanoid of the NPC ( GUID? )
            // traitManager.mapping.set(tostring(DataBuild.char.UniqueID), {db: DataBuild, race});
        }
    }

    public delete({DataBuild}: {DataBuild: buildData}){
        if(DataBuild && DataBuild.player){
            traitManager.mapping.delete(tostring(DataBuild.player.UserId));
        }else{
            // this means it should be a NPC
            // the key should be something unique that would be inside the humanoid of the NPC ( GUID? )
            // traitManager.mapping.delete(tostring(DataBuild.char.UniqueID));
        }
    }
}


// CHECK SKILLTREE PSUDO STUFF BELOW
        //left = what you need to unlock right
// function checkSkillTree(){
//     let x = [   
//         ['Blacksmithing','Ironsmithing'],
//         ['C','B'],
//         ['D','B'],
//         ['F','A']
// ];
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

