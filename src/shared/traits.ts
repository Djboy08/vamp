import compose from "@rbxts/object-composer";
import NetServerEvent from "@rbxts/net/out/ServerEvent";
import { Workspace, Players, ReplicatedStorage, Debris } from "@rbxts/services";
import dataBuild from "shared/DataBuild"

export const isFeeder = ({DataBuild}: {DataBuild: dataBuild}) => {
    let asset = ReplicatedStorage.FindFirstChild("BanHammar");
    if(asset && DataBuild.player){
        let clone = asset.Clone();
        clone.Parent = DataBuild.player.FindFirstChild("Backpack");
    }
    return ({
    hunger: 100,
    // feed(npc: Model) {
    //     this.hunger--;
    //     print(`Feeding on ${npc.Name}`)
    // },
    feed(){
        print("feed");
    }
})};

export const isPerson = ({DataBuild, remote} : {DataBuild: dataBuild, remote: NetServerEvent}) => ({
    DataBuild,
    remote
});


export const isWeakAgainstSun =  ({DataBuild, remote} : {DataBuild: dataBuild, remote: NetServerEvent}) => {
    if(DataBuild.player){
        remote.SendToPlayer(DataBuild.player, DataBuild.player, "client_trait_WeakAgainstSun_began");
    }
    return ({
        sun_damage_active: false,
        sun_damage() {
            if(DataBuild.player){
                let humanoid = DataBuild.player.Character ? DataBuild.player.Character.FindFirstChildOfClass("Humanoid") : undefined;
                spawn(()=>{
                    while(this.sun_damage_active){
                        if(humanoid){
                            for(let i = 1; i < 3; i++){
                                humanoid.Health -= 5;
                                wait(1);
                            }
                        }
                        wait(1);
                    }
                })
            }
        }
})};

export const isCompulser =  ({DataBuild} : {DataBuild: dataBuild}) => {
    //init stuff here
    if(DataBuild.player && DataBuild.player.Character){
        let humanoid = DataBuild.player.Character.FindFirstChildOfClass("Humanoid");
        if(humanoid){
            humanoid.WalkSpeed = 60;
        }
    }
    return ({compulse(npc: Model) {
        print(`You have just compulsed ${npc.Name}`)
    }
})};

export const isCombatter = () => ({
    punch(){
        print("PUNCHED!")
    },
    kick(){

    }
});

export const isRegenerator = () => ({
    heal(){
        print("HEALED!!")
    }
});

export const isDasher = ({DataBuild, remote}: {DataBuild: dataBuild, remote: NetServerEvent}) => {
    
    return ({
        dash(){
            if(DataBuild.player){
                let root = DataBuild.player.Character ? DataBuild.player.Character.FindFirstChild("HumanoidRootPart") as BasePart : undefined;
                if(root){
                    let vel = new Instance("BodyVelocity") as BodyVelocity;
                    vel.Name = "BV";
                    vel.MaxForce = new Vector3(math.huge, math.huge, math.huge);
                    vel.Velocity = root.CFrame.LookVector.mul(250).add(new Vector3(0,50,0));
                    vel.Parent = root;
                    Debris.AddItem(vel, 0.05);
                    remote.SendToAllPlayers(DataBuild.player, "dashed!");
                }
            }
        }
    });
};

