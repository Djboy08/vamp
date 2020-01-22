import * as traits from "shared/traits"

type RaceNames = Exclude<keyof typeof traits, "isPerson">;

let map = new Map<string, Array<RaceNames>>();

map.set("Vampire",["isCombatter","isCompulser","isFeeder"]);


export const getRaceTraits = (race: string) => {
    if(map.has(race)){
        let ar = map.get(race) as Array<RaceNames>;
        return ar;
    }else{
        return undefined;
    }
}