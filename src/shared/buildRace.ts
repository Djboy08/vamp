import compose from "@rbxts/object-composer";
import * as races from "shared/races"

let map = new Map<string, unknown>();
map.set("isFeeder", races.isFeeder)
map.set("isCombatter", races.isCombatter)
map.set("isCompulser", races.isCompulser)
map.set("isPerson", races.isPerson)
map.set("isRegenerator", races.isRegenerator)
map.set("isVampire", races.isVampire)


export const buildRace = (race: string, s: Set<string>, player: Player) =>{
    if(map.has(race)){
        const x = map.get(race)
        return compose(races.isPerson)({player})
    }
    // return compose(

    //     races.isPerson,
        
    // )({player});
}

