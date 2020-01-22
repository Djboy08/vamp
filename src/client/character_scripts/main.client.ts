import Net from "@rbxts/net";
import { Players, UserInputService, Lighting, Workspace, ReplicatedStorage, Debris, TweenService } from "@rbxts/services";
import inspect = require("@rbxts/inspect");
// import { Standard, Deceleration, OutElastic } from "@rbxts/easing-functions";
// import Tween, { PseudoTween } from "@rbxts/tween";


// (async function init(){
//     let exampleClientTwo = new Net.ClientEvent("movesEvent");
//     exampleClientTwo.Connect(([plr, msg])=>{
//         print(plr.Name, msg);
//         print("---");
//     });
//     // exampleClientTwo.SendToServer("testig");
// })();
let remote = new Net.ClientEvent("movesEvent");
UserInputService.InputBegan.Connect((inputObject, gameProcessedEvent)=>{
    if(inputObject.UserInputType === Enum.UserInputType.Keyboard){
        let key = inputObject.KeyCode
        if(key === Enum.KeyCode.Q){
            print('sent');
            remote.SendToServer("dash");
        }
    }
})

remote.Connect((msg: string, plr: Player)=>{
    if(msg === "sun_damage"){
        let asset = (ReplicatedStorage.FindFirstChild("Fire") as ParticleEmitter).Clone();

        while (plr.Character) {
            let sun_direction = Lighting.GetSunDirection();
            asset.Parent = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;
            let root = Players.LocalPlayer.Character ? Players.LocalPlayer.Character.FindFirstChild("HumanoidRootPart") : undefined;

            let tweenInfo = new TweenInfo(0.5,Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
            let t: Tween = TweenService.Create(asset, tweenInfo, {
                LightEmission: 0,
                Rate: 0
            });
            let t2: Tween = TweenService.Create(asset, tweenInfo, {
                LightEmission: 0.86,
                Rate: 70
            });


            if(root && root.IsA("BasePart")){
                let ray = new Ray(root.Position, sun_direction.mul(50));
                let part = Workspace.FindPartOnRayWithIgnoreList(ray, root.Parent ? root.Parent.GetChildren() : []);
                if(part[0]){
                    t.Play();
                    t.Completed.Connect((playbackState: Enum.PlaybackState)=>{
                        asset.Parent = undefined;
                    })
                }else{
                    // not blocking sun
                    t2.Play();
                    t2.Completed.Connect((playbackState: Enum.PlaybackState)=>{
                        asset.Parent = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;
                    })
                    // asset.Parent = plr.Character ? plr.Character.FindFirstChild("HumanoidRootPart") : undefined;
                    if(plr === Players.LocalPlayer){
                        remote.SendToServer("sun_damage");
                    }
                    
                    
                }
            }   
            wait(1);
        }
    }
});


