import compose from "@rbxts/object-composer";
import * as races from "shared/races"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import buildData from "shared/data"

type RaceNames = Exclude<keyof typeof races, "isPerson">;

Players.PlayerAdded.Connect(plr => {
    const DataBuild = new buildData(plr);
    // dataStore.Set(ar2);
    type AnyRace = ReturnType<typeof races[keyof typeof races]>;

    plr.CharacterAdded.Connect((char: Model) => {
        const race = buildRace<Array<RaceNames>>(plr, ...DataBuild.getTraits()) as AnyRace;

        if("punch" in race){
            race.punch()
        }
        if("feed" in race){
            race.feed()
        }
        if("compulse" in race){
            race.compulse(char);
        } 
        if("heal" in race){
            race.heal();
        }

        let traitsModel = Workspace.FindFirstChild("Traits");
        if(traitsModel){
            let children = traitsModel.GetChildren();
            for(let obj of children){
                if(obj.ClassName === "Part"){
                    (obj as Part).Touched.Connect((part)=>{
                        if(part.Parent && part.Parent.ClassName === "Model"){
                            let t = obj.Name as RaceNames;

                            DataBuild.addTraits(t)
                        }
                    })
                }
            }
        }
    })
});




