import compose from "@rbxts/object-composer";
import NetServerEvent from "@rbxts/net/out/ServerEvent";
import { Workspace, Players, ReplicatedStorage, Debris } from "@rbxts/services";

export const isFeeder = ({player}: {player: Player}) => {
    let asset = ReplicatedStorage.FindFirstChild("BanHammar");
    if(asset){
        let clone = asset.Clone();
        clone.Parent = player.FindFirstChild("Backpack");
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

export const isPerson = ({player, remote} : {player: Player, remote: NetServerEvent}) => ({
    player,
    remote
});


export const isWeakAgainstSun =  ({player, remote} : {player: Player, remote: NetServerEvent}) => {
    //init stuff here
    // wait(1)
    print("sending to all players!")
    remote.SendToAllPlayers("sun_damage", player);
    print("sent to all players!")
    return ({sun_damage() {
        let humanoid = player.Character ? player.Character.FindFirstChildOfClass("Humanoid") : undefined;
        if(humanoid){
            for(let i = 1; i < 3; i++){
                humanoid.Health -= 5;
                wait(1);
            }
        }
    }
})};

export const isCompulser =  ({player} : {player: Player}) => {
    //init stuff here
    if(player.Character){
        let humanoid = player.Character.FindFirstChildOfClass("Humanoid");
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

export const isDasher = ({player, remote}: {player: Player, remote: NetServerEvent}) => {
    
    return ({
        dash(){
            let root = player.Character ? player.Character.FindFirstChild("HumanoidRootPart") as BasePart : undefined;
            if(root){
                let vel = new Instance("BodyVelocity") as BodyVelocity;
                vel.Name = "BV";
                vel.MaxForce = new Vector3(math.huge, math.huge, math.huge);
                vel.Velocity = root.CFrame.LookVector.mul(250).add(new Vector3(0,50,0));
                vel.Parent = root;
                Debris.AddItem(vel, 0.05);
                remote.SendToAllPlayers("dashed!");
            }
        }
    });
};

