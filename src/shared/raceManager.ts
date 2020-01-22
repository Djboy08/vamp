import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"
import raceMoves from "shared/raceMoves"

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;

export default class raceManager {

    public race: AnyRace;
    public player: Player;
    // public moveManager: raceMoves;

    constructor({race, player}: {race: AnyRace, player: Player}){
        this.race = race;
        this.player = player;
        // this.moveManager = new raceMoves(this.race);

        
    }
}