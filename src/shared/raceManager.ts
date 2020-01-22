import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;

export default class raceManager {

    public race: AnyRace;
    public player: Player;

    constructor({race, player}: {race: AnyRace, player: Player}){
        this.race = race;
        this.player = player;
        if("punch" in race){
            race.punch()
        }
        if("feed" in race){
            race.feed()
        }
        if("compulse" in race){
            if(player.Character){
                race.compulse(player.Character);
            }
        } 
        if("heal" in race){
            race.heal();
        }
    }
}