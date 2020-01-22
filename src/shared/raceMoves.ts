import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;

type isPerson = ReturnType<typeof races.isPerson>;

type isCompulser = ReturnType<typeof races.isCompulser> & isPerson;
type isCombatter = ReturnType<typeof races.isCombatter> & isPerson;
type isRegenerator = ReturnType<typeof races.isRegenerator> & isPerson;
type isFeeder = ReturnType<typeof races.isFeeder> & isPerson;
type isVampire = ReturnType<typeof races.isVampire> & isPerson;

interface Map {
    [key: string] : (race: any) => void;
}
export default class raceMoves {
    public moves: Map = {
        "punch": (race: isCombatter) => {
            race.punch();
        },
        "feed": (race: isFeeder) => {
            race.feed()
        },
        "heal": (race: isRegenerator) => {
            race.heal()
        },
        "compulse": (race: isCompulser) => {
            if(race.player.Character){
                race.compulse(race.player.Character);
            }
        }
    };

    constructor(race: AnyRace){
        Object.entries(this.moves).forEach((value) => {
            let index = value[0];
            let callback = value[1];
            if(index in race){
                callback(race);
            }
        });
    }

}