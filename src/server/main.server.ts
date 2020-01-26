import * as traits from "shared/traits"
import { buildRace } from "shared/buildRace";
import { Workspace, Players, ReplicatedStorage, CollectionService } from "@rbxts/services";
import buildData from "shared/DataBuild"
import traitManager from "shared/traitsManager";
import Net from "@rbxts/net";
import inspect from "@rbxts/inspect"
import { setRagdoll } from "shared/setRagdoll"

// const sharedd = require(ReplicatedStorage.FindFirstChild("shared")!.FindFirstChild("luaonly")!.FindFirstChild("Ragdoll")! as ModuleScript);
// if(sharedd && "Ragdoll" in sharedd){
//     sharedd.Ragdoll()
// }

type TraitNames = Exclude<keyof typeof traits, "isPerson">;
type AnyTrait = ReturnType<typeof traits[keyof typeof traits]>;


const remote = new Net.ServerEvent("movesEvent");
const trait_manager = new traitManager();

Players.PlayerAdded.Connect(plr => {
    const DataBuild = new buildData(plr);
    plr.CharacterAdded.Connect((char: Model) => {
        waitForObjectParent(char, plr)
        const race: AnyTrait = buildRace<Array<TraitNames>>(plr, remote, ...DataBuild.combineTraitsAndRace()) as AnyTrait;
        trait_manager.add({race, player: plr, DataBuild});
        // mapping.set(tostring(plr.UserId), {db: DataBuild, race});
        warn(DataBuild.toString())
        
        //Manages them reloading if they die.
        let humanoid = char.FindFirstChildOfClass("Humanoid")!;
        if(humanoid){
            let connection = humanoid.HealthChanged.Connect((health: number)=>{
                if(health < 20){
                    remote.SendToPlayer(plr, plr, "client_helper_Ragdoll_true", char);
                }
            })
            let connection2: RBXScriptConnection;
            connection2 = humanoid.Died.Connect(()=>{
                trait_manager.delete({player: plr});
                plr.LoadCharacter();
                humanoid.Destroy();
                connection.Disconnect()
                connection2.Disconnect();
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
                    if(P){
                        let humanoid = P.Character ? P.Character.FindFirstChildOfClass("Humanoid") as Humanoid : undefined;
                        let User = traitManager.mapping.get(tostring(P.UserId));
                        if(User){
                            switch(split[1]){
                                case "add":
                                    print("Adding")
                                    User.db.addTraits(t)
                                    if(humanoid) humanoid.Health = 0;
                                    break;
                                case "rem":
                                    print("removing")
                                    User.db.removeTraits(t)
                                    if(humanoid) humanoid.Health = 0;
                                    break;
                            }
                        }
                    }
                }
            })
        }
    }
}
