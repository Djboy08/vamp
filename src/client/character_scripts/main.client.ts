import Net from "@rbxts/net";
import { Players, UserInputService, Lighting, Workspace } from "@rbxts/services";
import inspect = require("@rbxts/inspect");

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
        while (plr.Character) {
            let sun_direction = Lighting.GetSunDirection();
            let root = Players.LocalPlayer.Character ? Players.LocalPlayer.Character.FindFirstChild("HumanoidRootPart") : undefined;
            if(root && root.IsA("BasePart")){
                let ray = new Ray(root.Position, sun_direction.mul(20));
                let part = Workspace.FindPartOnRayWithIgnoreList(ray, root.Parent ? root.Parent.GetChildren() : []);
                if(part[0]){
                    // blocking sun
                    print(inspect(part[0]));
                }else{
                    // not blocking sun
                    remote.SendToServer("sun_damage");
                }
            }   
            wait(3);
        }
    }
});


