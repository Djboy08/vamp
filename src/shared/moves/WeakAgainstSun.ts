import { Workspace, Players, ReplicatedStorage, Lighting, TweenService } from "@rbxts/services";
import * as traits from "shared/traits"
import buildData from "shared/DataBuild"
import Net from "@rbxts/net";
import inspect from "@rbxts/inspect"
import { move } from "shared/moves/move";
import NetClientEvent from "@rbxts/net/out/ClientEvent";
import NetServerEvent from "@rbxts/net/out/ServerEvent";
import { setRagdoll } from "shared/setRagdoll";

export interface UserGameData {
    db: buildData;
    race: AnyTrait;
}
type TraitNames = Exclude<keyof typeof traits, "isPerson">;
type AnyTrait = ReturnType<typeof traits[keyof typeof traits]>;

export const client_trait_WeakAgainstSun_began: move = {
    cooldown: 15,
    tick: 0,
    init(plr: Player, remote: NetClientEvent){
        let status = false;
        if(plr !== Players.LocalPlayer) return;

        while (plr.Character) {
            let sun_direction = Lighting.GetSunDirection();
            // asset.Parent = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;
            let root = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;
            if(root && root.IsA("BasePart")){
                let ray = new Ray(root.Position, sun_direction.mul(50));
                let part = Workspace.FindPartOnRayWithIgnoreList(ray, root.Parent ? root.Parent.GetChildren() : []);
                if(part[0]){
                    if(status === true){
                        remote.SendToServer("server_trait_WeakAgainstSun_deletefire");
                        status = false;
                    }
                }else{
                    if(status === false){
                        remote.SendToServer("server_trait_WeakAgainstSun_addfire");
                        status = true;
                    }
                }
            }   
            wait(0.5);
        }
    }
}

export const client_helper_Ragdoll_true: move = {
    cooldown: 2,
    tick: 0,
    init(plr: Player, remote: NetClientEvent){
        
        if(plr && plr.Character && plr.Character.FindFirstChildOfClass("Humanoid") ){
            const humanoid = plr.Character.FindFirstChildOfClass("Humanoid") as Humanoid;
            setRagdoll(humanoid, true);
        }
    }
}
export const client_helper_Ragdoll_false: move = {
    cooldown: 2,
    tick: 0,
    init(plr: Player, remote: NetClientEvent){
        
        if(plr && plr.Character && plr.Character.FindFirstChildOfClass("Humanoid") ){
            const humanoid = plr.Character.FindFirstChildOfClass("Humanoid") as Humanoid;
            setRagdoll(humanoid, false);
        }
    }
}


export const client_trait_WeakAgainstSun_addfire: move = {
    cooldown: 0,
    tick: 0,
    init(plr: Player, remote: NetClientEvent){
        let asset = (ReplicatedStorage.FindFirstChild("Fire") as ParticleEmitter).Clone();
        let root = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;
        if(root && root.FindFirstChild("Fire")){
            asset = root.FindFirstChild("Fire") as ParticleEmitter;
        }
        asset.Enabled = true;
        asset.Parent = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;

        let tweenInfo = new TweenInfo(0.5,Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
        let t: Tween = TweenService.Create(asset, tweenInfo, {
            LightEmission: 0.86,
            Rate: 70
        });
        t.Play();
    }
}



export const server_trait_WeakAgainstSun_addfire: move = {
    cooldown: 0,
    tick: 0,
    init(plr: Player, remote: NetServerEvent, mapping?: Map<string, UserGameData>){
        if(mapping){
            const UserData = mapping.get(tostring(plr.UserId)) as UserGameData;
            if("sun_damage" in UserData.race && !UserData.race.sun_damage_active){
                UserData.race.sun_damage_active = true;
                UserData.race.sun_damage();
                remote.SendToAllPlayers(UserData.db.player, "client_trait_WeakAgainstSun_addfire")
            }
        }
    }
}

export const server_trait_WeakAgainstSun_deletefire: move = {
    cooldown: 0,
    tick: 0,
    init(plr: Player, remote: NetServerEvent, mapping?: Map<string, UserGameData>){
        if(mapping){
            const UserData = mapping.get(tostring(plr.UserId)) as UserGameData;
            if("sun_damage_active" in UserData.race && UserData.race.sun_damage_active){
                UserData.race.sun_damage_active = false;
                remote.SendToAllPlayers(UserData.db.player, "client_trait_WeakAgainstSun_deletefire");
            }
        }
    }
}

export const client_trait_WeakAgainstSun_deletefire: move = {
    cooldown: 0,
    tick: 0,
    init(plr: Player, remote: NetClientEvent){
        let asset = (ReplicatedStorage.FindFirstChild("Fire") as ParticleEmitter).Clone();
        let root = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;
        if(root && root.FindFirstChild("Fire")){
            asset = root.FindFirstChild("Fire") as ParticleEmitter;
        }
        // asset.Parent = plr.Character ? plr.Character.FindFirstChild("Fire") : undefined;

        let tweenInfo = new TweenInfo(0.5,Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
        let t: Tween = TweenService.Create(asset, tweenInfo, {
            LightEmission: 0,
            Rate: 0
        });
        t.Play();
    }
}