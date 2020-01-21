import compose from "@rbxts/object-composer";
import * as races from "shared/races"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");

Players.PlayerAdded.Connect(plr => {
    type RaceNames = Exclude<keyof typeof races, "isPerson">;

    const dataStore = DataStore2<Array<RaceNames>>("Traits4", plr);
    let ar = dataStore.Get([]) as Array<RaceNames>;
    for(let i = 0; i<ar.size(); i++){
        print(ar[i])
    }
    ar.push("isVampire");
    
    //Removes duplicates [BELOW]
    ar = ar.filter(function(elem, index, self) {
        return index === self.indexOf(elem);
    })

    dataStore.Set(ar);
    // dataStore.Set(ar2);
    type AnyRace = ReturnType<typeof races[keyof typeof races]>

    const race = buildRace<Array<RaceNames>>(plr, ...ar) as AnyRace;
    if("punch" in race){
        race.punch()
    }
    if("feed" in race){
        race.feed()
    }
    plr.CharacterAdded.Connect((char: Model) => {
        print("Char added")
        if("compulse" in race){
            race.compulse(char);
        } 
    })
});




