import compose from "@rbxts/object-composer";
import * as races from "shared/races"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";

Players.PlayerAdded.Connect(plr => {
    type AnyRace = ReturnType<typeof races[keyof typeof races]>

    const race = buildRace(plr, "isFeeder", "isCompulser") as AnyRace;
    if("punch" in race){
        race.punch()
        

    }
});




