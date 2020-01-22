import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as races from "shared/races"
type RaceNames = Exclude<keyof typeof races, "isPerson">;

interface Data {
    traits: Array<RaceNames>;
    skills: Array<string>;
}

export default class buildData {
    public dataDS: DataStore2<Data>;
    public player: Player;

    public data: Data;

    constructor(plr: Player){
        this.player = plr;
        this.dataDS = DataStore2<Data>("Data3", plr);
        let d = this.dataDS.Get({
            traits: [],
            skills: ["Testing"]
        });

        this.data = {
            traits: d.traits,
            skills: d.skills
        }

        this.removeDuplicates();
        this.set();
    }

    removeDuplicates(){
        this.data.traits = [...new Set(this.data.traits)];
        this.data.skills = [...new Set(this.data.skills)];
    }
    // @OVERRIDE
    toString(){
        let str: string = `Player: ${this.player.Name}\nTraits: ${this.data.traits.toString()}\nSkills: ${this.data.skills.toString()}`;
        return str;
    }
    addTraits(...traits: Array<RaceNames>){
        const temp_set: Set<RaceNames> = new Set(this.data.traits);

        for(let i = 0; i < traits.size(); i++){
            print(`is ${traits[i]} in their traits? = ${temp_set.has(traits[i])}`)
            if(!temp_set.has(traits[i])){
                this.data.traits.push(traits[i]);
                warn(`Giving player ${this.player.Name} the trait ${traits[i]}`)
            }else{
                // error(`Player ${this.player.Name} Already has this trait!`);
            }
        }

        this.removeDuplicates();
        this.set();
    }
    removeTraits(...traits: Array<RaceNames>){
        let temp_set: Set<RaceNames> = new Set(this.data.traits);
        for(let i = 0; i < traits.size(); i++){
            if(temp_set.has(traits[i])){
               temp_set.delete(traits[i]); 
            }else{
                // error(`This trait can not be removed because its not in their traits list.`);
            }
        }
        this.data.traits = [...temp_set];
        // this.removeDuplicates();
        this.set();
    }
    set(){
        this.data = {
            traits: this.data.traits,
            skills: this.data.skills
        }
        this.dataDS.Set(this.data);
    }
    
    getTraits(): Array<RaceNames> {
        return this.data.traits;
    }
}