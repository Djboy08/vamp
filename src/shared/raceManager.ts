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

    public race: AnyRace;
    public player: Player;
    public static mapping: Map<string, UserGameData> = new Map<string, UserGameData>();
    // public moveManager: raceMoves;

    constructor({race, player, DataBuild}: {race: AnyRace, player: Player, DataBuild: buildData}){
        this.race = race;
        this.player = player;
        raceManager.mapping.set(tostring(player.UserId), {db: DataBuild, race});

        let connection = remote.Connect((plr: Player, ...[msg])=>{
            let r = raceManager.mapping.get(tostring(plr.UserId)) as UserGameData;
            if(msg === 'dash' && "dash" in r.race){
                r.race.dash();
            }
        })



        let root = player.Character ? player.Character.FindFirstChildOfClass("Humanoid") : undefined;
        if(root){
            let c: RBXScriptConnection;
            
            c = player.CharacterRemoving.Connect(()=>{
                connection.Disconnect();
                c.Disconnect();
            })
        }
        // this.moveManager = new raceMoves(this.race);
    }
}