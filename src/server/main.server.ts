import compose from "@rbxts/object-composer";
import * as races from "shared/races"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import buildData from "shared/DataBuild"
import raceManager from "shared/raceManager";

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;

Players.PlayerAdded.Connect(plr => {
    const DataBuild = new buildData(plr);
    // dataStore.Set(ar2);

    plr.CharacterAdded.Connect((char: Model) => {
        const race = buildRace<Array<RaceNames>>(plr, ...DataBuild.getTraits()) as AnyRace;
        warn(DataBuild.toString())
        const race_manager = new raceManager({race, player: plr});


        let traitsModel = Workspace.FindFirstChild("Traits");
        if(traitsModel){
            let children = traitsModel.GetChildren();
            for(let obj of children){
                if(obj.ClassName === "Part"){
                    (obj as Part).Touched.Connect((part)=>{
                        if(part.Parent && part.Parent.ClassName === "Model"){
                            let split = obj.Name.split(`:`);
                            let t = split[0] as RaceNames;
                            switch(split[1]){
                                case "add":
                                    print("Adding")
                                    DataBuild.addTraits(t);
                                    break;
                                case "rem":
                                    print("removing")
                                    DataBuild.removeTraits(t);
                                    break;
                            }
                        }
                    })
                }
            }
        }
    })
});




