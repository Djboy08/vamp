import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;

interface Map {
    [key: string] : (race: any) => void;
}
export default class raceMoves {
    public moves: Map = {
        "punch": (race: AnyRace) => {
            
        },
        "feed": (race: AnyRace) => {
            race.feed()
        },
        "heal": (race: AnyRace) => {
            race.heal()
        },
        "compulse": (race: AnyRace) => {
            if(race.player.Character){
                race.compulse(race.player.Character);
            }
        }
    };

    constructor(race: AnyRace){
        this.moves.forEach((func: (race: any) => void, index: string) => {
            if(index in race){
                func(race);
            }
        });
    }

}