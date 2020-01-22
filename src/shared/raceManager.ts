import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"
import raceMoves from "shared/raceMoves"
import buildData from "shared/DataBuild"

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;
interface UserGameData {
    db: buildData;
    race: AnyRace;
}

export default class raceManager {

    public race: AnyRace;
    public player: Player;
    public static mapping: Map<string, UserGameData> = new Map<string, UserGameData>();
    // public moveManager: raceMoves;

    constructor({race, player, DataBuild}: {race: AnyRace, player: Player, DataBuild: buildData}){
        this.race = race;
        this.player = player;
        raceManager.mapping.set(tostring(player.UserId), {db: DataBuild, race});
        // this.moveManager = new raceMoves(this.race);
    }
}