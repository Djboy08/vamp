import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"
import raceMoves from "shared/raceMoves"
import buildData from "shared/DataBuild"
import Net from "@rbxts/net";

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;
export interface UserGameData {
    db: buildData;
    race: AnyRace;
}
const remote = new Net.ServerEvent("movesEvent");

export default class raceManager {

    public static mapping: Map<string, UserGameData> = new Map<string, UserGameData>();
    // public moveManager: raceMoves;
    constructor(){
        let connection = remote.Connect((plr: Player, ...[msg])=>{
            const UserData = raceManager.mapping.get(tostring(plr.UserId)) as UserGameData;
            if(msg === 'dash' && "dash" in UserData.race){
                UserData.race.dash();
            }
        })
    }

    public add({race, player, DataBuild}: {race: AnyRace, player: Player, DataBuild: buildData}){
        raceManager.mapping.set(tostring(player.UserId), {db: DataBuild, race});
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

