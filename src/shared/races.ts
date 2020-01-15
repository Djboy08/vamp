import compose from "@rbxts/object-composer";

export const isFeeder = () => ({
    hunger: 100,
    feed(npc: Model) {
        this.hunger--;
        print(`Feeding on ${npc.Name}`)
    },
});

export const isPerson = ({player} : {player: Player}) => ({
    player
});

export const isCompulser = () => ({
    compulse(npc: Model) {
        print(`You have just compulsed ${npc.Name}`)
    },
});

export const isCombatter = () => ({
    punch(){
        print("PUNCHED!")
    },
    kick(){

    }
});

export const isRegenerator = () => ({
    heal(){
        print("PUNCHED!")
    }
});

export const isVampire = compose(
    isFeeder,
    isCompulser
)

