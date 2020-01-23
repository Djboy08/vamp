import * as traits from "shared/traits"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import buildData from "shared/DataBuild"
import raceManager from "shared/traitsManager";
import Net from "@rbxts/net";
import inspect from "@rbxts/inspect"


type TraitNames = Exclude<keyof typeof traits, "isPerson">;
type AnyTrait = ReturnType<typeof traits[keyof typeof traits]>;


const remote = new Net.ServerEvent("movesEvent");
const race_manager = new raceManager();

Players.PlayerAdded.Connect(plr => {
    const DataBuild = new buildData(plr);
    plr.CharacterAdded.Connect((char: Model) => {
        waitForObjectParent(char, plr)
        const race: AnyTrait = buildRace<Array<TraitNames>>(plr, remote, ...DataBuild.combineTraitsAndRace()) as AnyTrait;
        race_manager.add({race, player: plr, DataBuild});
        // mapping.set(tostring(plr.UserId), {db: DataBuild, race});
        warn(DataBuild.toString())
        
        

        //Manages them reloading if they die.
        let humanoid = char.FindFirstChildOfClass("Humanoid");
        if(humanoid){
            humanoid.Died.Connect(()=>{
                race_manager.delete({player: plr});
                plr.LoadCharacter();
            })
        }
    })

    plr.LoadCharacter();

});

const waitForObjectParent =<T extends Instance> (obj: T, p: Player) => {
    if(!obj.IsDescendantOf(game)){
        obj.AncestryChanged.Wait();
    }
}

// buttons for giving people or removing traits
let traitsModel = Workspace.FindFirstChild("Traits");
if(traitsModel){
    let children = traitsModel.GetChildren();
    for(let obj of children){
        if(obj.IsA("Part")){
            obj.Touched.Connect((part)=>{
                if(part.Parent && part.Parent.IsA("Model")){
                    let split = obj.Name.split(`:`);
                    let t = split[0] as TraitNames;
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
