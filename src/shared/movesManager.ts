import { Workspace, Players, ReplicatedStorage, Lighting, TweenService, RunService } from "@rbxts/services";
import * as traits from "shared/traits"
import buildData from "shared/DataBuild"
import Net from "@rbxts/net";
import inspect from "@rbxts/inspect"

import * as moves from "shared/moves"
import NetClientEvent from "@rbxts/net/out/ClientEvent";
import NetServerEvent from "@rbxts/net/out/ServerEvent";
import { UserGameData } from "./moves/move";

type Moves = keyof typeof moves;

// let remote = new Net.ClientEvent("movesEvent");

export default class movesManager {
    public remote: NetClientEvent | NetServerEvent;

    constructor(remote: NetClientEvent | NetServerEvent, mapping?: Map<string, UserGameData>){
        this.remote = remote;
        if(RunService.IsClient()){
            this.remote = this.remote as NetClientEvent;
            this.remote.Connect((plr: Player, msg: Moves)=>{
                this.startMove(msg, plr);
            });
        }else{
            if(mapping){
                this.remote = remote as NetServerEvent;
                this.remote.Connect((plr: Player, ...[msg])=>{
                    this.startMove(msg as Moves, plr, mapping);
                });
            }
        }

    }
    
    startMove(move: Moves, plr: Player, mapping?: Map<string, UserGameData>){
        print(move);
        if(moves[move]){
            if( (tick() - moves[move].tick) > moves[move].cooldown){
                moves[move].tick = tick();
                if(mapping){
                    //server
                    moves[move].init(plr, this.remote, mapping);
                }else{
                    //client
                    moves[move].init(plr, this.remote);
                }
            }
        }else{
            warn(`${move} does not exist in moves`);
        }
    }
}