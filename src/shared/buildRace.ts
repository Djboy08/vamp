import { compose, ComposeTuple } from "@rbxts/object-composer";
import * as races from "shared/races";
import { Players } from "@rbxts/services";

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
    ...raceNames: T
): ReturnType<ComposeTuple<Racify<T>>>;
export function buildRace(player: Player, ...raceNames: Array<RaceNames>) {
    return compose(races.isPerson, ...raceNames.map(r => races[r]))({ player });
}

