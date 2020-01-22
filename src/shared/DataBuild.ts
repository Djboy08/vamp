import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"
type RaceNames = Exclude<keyof typeof races, "isPerson">;

export default class buildData {
    public ar: Array<RaceNames>;
    public traits: DataStore2<Array<RaceNames>>;
    private player: Player;
    constructor(plr: Player){
        this.player = plr;
        this.traits = DataStore2<Array<RaceNames>>("Traits6", plr);
        this.ar = this.traits.Get([]) as Array<RaceNames>;
        
        this.removeDuplicates();
        this.set();
    }

    removeDuplicates(){
        this.ar = this.ar.filter(function(elem, index, self) {
            return index === self.indexOf(elem);
        })
    }
    // @OVERRIDE
    toString(){
        let str: string = `Player: ${this.player.Name}\nTraits: ${this.ar.toString()}`;
        return str;
    }
    addTraits(...traits: Array<RaceNames>){
        for(let i = 0; i < traits.size(); i++){
            this.ar.push(traits[i]);
            warn(`Giving player ${this.player.Name} the trait ${traits[i]}`)
        }

        this.removeDuplicates();
        this.set();
    }
    removeTraits(...traits: Array<RaceNames>){
        for(let i = 0; i < traits.size(); i++){
            this.ar.push(traits[i]);
            warn(`Giving player ${this.player.Name} the trait ${traits[i]}`)
        }

        this.removeDuplicates();
        this.set();
    }
    set(){
        this.traits.Set(this.ar);
    }
    
    getTraits(): Array<RaceNames> {
        return this.ar;
    }
}