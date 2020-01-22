import { compose, ComposeTuple } from "@rbxts/object-composer";
import * as races from "shared/traits";
import { Players } from "@rbxts/services";
import NetServerEvent from "@rbxts/net/out/ServerEvent";

type RaceNames = Exclude<keyof typeof races, "isPerson">;
type Racify<T extends Array<RaceNames>> = {
    [K in keyof T]: T[K] extends keyof typeof races ? typeof races[T[K]] : never;
};

/** Constructs a new race from a given set of strings for player.
 * @param player The player for whom we are building a new race.
 * @param raceNames The name of a race which player is to be a member of.
 */
export function buildRace<T extends Array<RaceNames>>(
    player: Player,
    remote: NetServerEvent,
    ...raceNames: T
): ReturnType<ComposeTuple<Racify<T>>>;
export function buildRace(player: Player, remote: NetServerEvent, ...raceNames: Array<RaceNames>) {
    return compose(races.isPerson, ...raceNames.map(r => races[r]))({ player, remote });
}

