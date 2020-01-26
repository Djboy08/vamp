import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";
import DataStore2 = require("@rbxts/datastore2");
import * as traits from "shared/traits"
import { getRaceTraits } from "shared/races";
type RaceNames = Exclude<keyof typeof traits, "isPerson">;

interface Data {
    traits: Array<RaceNames>;
    skills: Array<string>;
    race: string;
}

export default class buildData {
    public dataDS?: DataStore2<Data>;
    public player?: Player;
    public character?: Model;

    public data: Data;

    constructor({plr, char}: {plr?: Player, char?: Model}){
        this.data = {
            traits: [],
            skills: [],
            race: ""
        }

        if(plr){
            this.player = plr;
            this.dataDS = DataStore2<Data>("Data7", plr);
            let d = this.dataDS.Get({
                traits: [],
                skills: [],
                race: "Human"
            });
    
            this.data = {
                traits: d.traits,
                skills: d.skills,
                race: d.race
            }
    
            this.removeDuplicates();
            this.set();
        }else if(char){
            
        }
    }

    removeDuplicates(){
        this.data.traits = [...new Set(this.data.traits)];
        this.data.skills = [...new Set(this.data.skills)];
    }
    // @OVERRIDE
    toString(){
        let str: string = `Player: ${this.player}
Traits: ${this.data.traits.toString()}
Skills: ${this.data.skills.toString()}
Race:   "${this.data.race}"
CombinedTraits: ${this.combineTraitsAndRace().toString()}`;
        return str;
    }
    addTraits(...traits: Array<RaceNames>){
        const temp_set: Set<RaceNames> = new Set(this.data.traits);

        for(let i = 0; i < traits.size(); i++){
            print(`is ${traits[i]} in their traits? = ${temp_set.has(traits[i])}`)
            if(!temp_set.has(traits[i])){
                this.data.traits.push(traits[i]);
                warn(`Giving player ${this.player} the trait ${traits[i]}`)
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
        if(this.dataDS){
            this.data = {
                traits: this.data.traits,
                skills: this.data.skills,
                race: this.data.race
            }
            this.dataDS.Set(this.data);
        }
    }
    
    getTraits(): Array<RaceNames> {
        return this.data.traits;
    }

    combineTraitsAndRace(): Array<RaceNames> {
        if(this.data.race === "") return this.getTraits();
        let race = this.data.race;
        let race_traits = getRaceTraits(race);
        if(race_traits !== undefined){
            let new_traits = [...new Set(race_traits.concat(this.getTraits()))];
            return new_traits;
        }else{
            return this.getTraits();
        }
    }
}


