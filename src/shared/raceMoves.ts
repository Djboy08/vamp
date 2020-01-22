import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;

interface Map {
    [key: string] : (race: any) => void;
}
export default class raceMoves {
    public map: Map;

    public moves: Map = {
        "punch": (race: AnyRace) => {
            
        },
        "feed": (race: feeder) => {
            race.feed()
        },
        "heal": (race: ReturnType<typeof races["isRegenerator"]>) => {
            race.heal()
        },
        "compulse": (race: ReturnType<typeof races["isCompulser"]>) => {
            if(race.player.Character){
                race.compulse(race.player.Character);
            }
        }
    };

    constructor(race: AnyRace){
        this.map = this.moves;
        this.map.forEach((func: (race: any) => void, index: string) => {
            if(index in race){
                func(race);
            }
        });
    }

}