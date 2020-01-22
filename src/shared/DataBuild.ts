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
        this.traits = DataStore2<Array<RaceNames>>("Traits7", plr);
        this.ar = this.traits.Get([]) as Array<RaceNames>;
        this.removeDuplicates();
        this.set();
    }

    removeDuplicates(){
        this.ar = [...new Set(this.ar)];
    }
    // @OVERRIDE
    toString(){
        let str: string = `Player: ${this.player.Name}\nTraits: ${this.ar.toString()}`;
        return str;
    }
    addTraits(...traits: Array<RaceNames>){
        const temp_set: Set<RaceNames> = new Set(this.ar);

        for(let i = 0; i < traits.size(); i++){
            print(`is ${traits[i]} in their traits? = ${temp_set.has(traits[i])}`)
            if(!temp_set.has(traits[i])){
                this.ar.push(traits[i]);
                warn(`Giving player ${this.player.Name} the trait ${traits[i]}`)
            }else{
                error(`Player ${this.player.Name} Already has this trait!`);
            }
        }

        this.removeDuplicates();
        this.set();
    }
    removeTraits(...traits: Array<RaceNames>){
        let temp_set: Set<RaceNames> = new Set(this.ar);
        for(let i = 0; i < traits.size(); i++){
            if(temp_set.has(traits[i])){
               temp_set.delete(traits[i]); 
            }else{
                error(`This trait can not be removed because its not in their traits list.`);
            }
        }
        this.ar = [...temp_set];
        // this.removeDuplicates();
        this.set();
    }
    set(){
        this.traits.Set(this.ar);
    }
    
    getTraits(): Array<RaceNames> {
        return this.ar;
    }
}