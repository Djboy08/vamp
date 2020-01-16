import compose from "@rbxts/object-composer";
import * as races from "shared/races"

interface mapping {
    [key: string]: unknown
}
let map = new Map<string, unknown>();
map.set("isFeeder", races.isFeeder)
map.set("isCombatter", races.isCombatter)
map.set("isCompulser", races.isCompulser)
map.set("isPerson", races.isPerson)
map.set("isRegenerator", races.isRegenerator)
map.set("isVampire", races.isVampire)


export const buildRace = (race: keyof typeof races, s: Set<string>, player: Player) =>{
    const x = races[race]
    type X = typeof x;
    return compose(
        races[race],
        races.isPerson,
        
    )({player});
}