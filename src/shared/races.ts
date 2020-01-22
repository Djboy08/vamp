import compose from "@rbxts/object-composer";
import NetServerEvent from "@rbxts/net/out/ServerEvent";
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";

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

export const isCompulser =  ({player} : {player: Player}) => {
    //init stuff here
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

export const isVampire = compose(
    isFeeder,
    isCompulser
)

