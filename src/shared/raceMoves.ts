import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as traits from "shared/traits"

type RaceNames = Exclude<keyof typeof traits, "isPerson">;
type AnyRace = ReturnType<typeof traits[keyof typeof traits]>;

type isPerson = ReturnType<typeof traits.isPerson>;

type isCompulser = ReturnType<typeof traits.isCompulser> & isPerson;
type isCombatter = ReturnType<typeof traits.isCombatter> & isPerson;
type isRegenerator = ReturnType<typeof traits.isRegenerator> & isPerson;
type isFeeder = ReturnType<typeof traits.isFeeder> & isPerson;

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
        Object.entries(this.moves).forEach(([index, callback]) => {
            if(index in race){
                callback(race);
            }
        });
    }

}