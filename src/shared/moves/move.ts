import NetClientEvent from "@rbxts/net/out/ClientEvent";
import raceManager from "shared/raceManager";
import NetServerEvent from "@rbxts/net/out/ServerEvent";
import buildData from "shared/DataBuild"
import * as traits from "shared/traits"
type AnyRace = ReturnType<typeof traits[keyof typeof traits]>;
export interface UserGameData {
    db: buildData;
    race: AnyRace;
}

export interface move {
    init(plr: Player, remote: NetClientEvent | NetServerEvent, mapping?: Map<string, UserGameData>): void;
}