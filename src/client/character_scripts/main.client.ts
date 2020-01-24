import Net from "@rbxts/net";
import { Players, UserInputService, Lighting, Workspace, ReplicatedStorage, Debris, TweenService } from "@rbxts/services";
import inspect = require("@rbxts/inspect");
import { setRagdoll } from "shared/setRagdoll";
// import { Standard, Deceleration, OutElastic } from "@rbxts/easing-functions";
// import Tween, { PseudoTween } from "@rbxts/tween";

let remote = new Net.ClientEvent("movesEvent");
UserInputService.InputBegan.Connect((inputObject, gameProcessedEvent)=>{
    if(inputObject.UserInputType === Enum.UserInputType.Keyboard){
        let key = inputObject.KeyCode
        if(key === Enum.KeyCode.Q){
            print('sent');
            remote.SendToServer("server_trait_Dash_began");
        }
    }
})


