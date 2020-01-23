import { compose, ComposeTuple } from "@rbxts/object-composer";
import * as traits from "shared/traits";
import { Players } from "@rbxts/services";
import NetServerEvent from "@rbxts/net/out/ServerEvent";

type TraitNames = Exclude<keyof typeof traits, "isPerson">;
type Traitify<T extends Array<TraitNames>> = {
    [K in keyof T]: T[K] extends keyof typeof traits ? typeof traits[T[K]] : never;
};

/** Constructs a new race from a given set of strings for player.
 * @param player The player for whom we are building a new race.
 * @param raceNames The name of a race which player is to be a member of.
 */
export function buildRace<T extends Array<TraitNames>>(
    player: Player,
    remote: NetServerEvent,
    ...traitNames: T
): ReturnType<ComposeTuple<Traitify<T>>>;
export function buildRace(player: Player, remote: NetServerEvent, ...traitNames: Array<TraitNames>) {
    return compose(traits.isPerson, ...traitNames.map(r => traits[r]))({ player, remote });
}

