import compose from "@rbxts/object-composer";
import * as races from "shared/races"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import buildData from "shared/DataBuild"
import raceManager from "shared/raceManager";
import Net from "@rbxts/net";

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type AnyRace = ReturnType<typeof races[keyof typeof races]>;


const remote = new Net.ServerEvent("movesEvent");
const race_manager = new raceManager();

Players.PlayerAdded.Connect(plr => {
    const DataBuild = new buildData(plr);
    plr.CharacterAdded.Connect((char: Model) => {
        const race = buildRace<Array<RaceNames>>(plr, remote, ...DataBuild.getTraits()) as AnyRace;
        race_manager.add({race, player: plr, DataBuild});
        // mapping.set(tostring(plr.UserId), {db: DataBuild, race});
        warn(DataBuild.toString())
        
        

        //Manages them reloading if they die.
        let humanoid = char.FindFirstChildOfClass("Humanoid");
        if(humanoid){
            humanoid.Died.Connect(()=>{
                plr.LoadCharacter();
            })
        }
    })

    plr.LoadCharacter();
});



let traitsModel = Workspace.FindFirstChild("Traits");
if(traitsModel){
    let children = traitsModel.GetChildren();
    for(let obj of children){
        if(obj.IsA("Part")){
            obj.Touched.Connect((part)=>{
                if(part.Parent && part.Parent.IsA("Model")){
                    let split = obj.Name.split(`:`);
                    let t = split[0] as RaceNames;
                    let P = Players.GetPlayerFromCharacter(part.Parent) as Player;
                    switch(split[1]){
                        case "add":
                            print("Adding")
                            raceManager.mapping.get(tostring(P.UserId))?.db.addTraits(t)
                            P.LoadCharacter();
                            break;
                        case "rem":
                            print("removing")
                            raceManager.mapping.get(tostring(P.UserId))?.db.removeTraits(t)
                            P.LoadCharacter();
                            break;
                    }
                }
            })
        }
    }
}
