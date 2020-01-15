import compose from "@rbxts/object-composer";
import * as races from "shared/races"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";

const race = "isCompulser";
let traits: Set<string> = new Set()
traits.add("isRegenerator");

Players.PlayerAdded.Connect((p: Player)=>{
    let composition = buildRace(race, traits, p);
    composition.
})



