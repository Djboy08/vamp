import compose from "@rbxts/object-composer";
import * as races from "shared/races"

interface mapping {
    [key: string]: unknown
}
let map: mapping = {};
map["isFeeder"] = races.isFeeder
map["isCombatter"] = races.isCombatter
map["isCompulser"] = races.isCompulser
map["isPerson"] = races.isPerson
map["isRegenerator"] = races.isRegenerator
map["isVampire"] = races.isVampire

export const buildRace = (race: keyof typeof races, s: Set<string>, player: Player) =>{

    return compose(
        races[race],
        races.isPerson,
        
    )({player});
}