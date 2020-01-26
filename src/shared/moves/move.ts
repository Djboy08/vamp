import NetClientEvent from "@rbxts/net/out/ClientEvent";
import raceManager from "shared/traitsManager";
import NetServerEvent from "@rbxts/net/out/ServerEvent";
import buildData from "shared/DataBuild"
import * as traits from "shared/traits"
type AnyTrait = ReturnType<typeof traits[keyof typeof traits]>;

// let moves_information = new Map<string, MovesInfo>();
// moves_information.set();



export interface UserGameData {
    db: buildData;
    race: AnyTrait;
    // movesInfo: Map<string, MovesInfo>
}

// export interface MovesInfo {
//     cooldown: number; // How long to wait until it is able to be used again
//     active: boolean;  // If the move is being used or not.

// }

export interface move {
    init({plr, remote, mapping, char}: {plr: Player, remote: NetClientEvent | NetServerEvent, mapping?: Map<string, UserGameData>, char?: Model}): void;
    cooldown: number;
    tick: number; // The tick() when the move started
}