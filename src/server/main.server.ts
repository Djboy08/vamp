import compose from "@rbxts/object-composer";
import * as races from "shared/races"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";

Players.PlayerAdded.Connect(plr => {
    let x = buildRace(plr, "isCompulser","isCombatter", "isFeeder");

    if("compulse" in x){
        // We know they are a compulser.
        
    }
});




