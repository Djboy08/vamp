import { makeHello } from "shared/module";
import Net from "@rbxts/net";
import { Players, UserInputService } from "@rbxts/services";

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

remote.Connect((msg: string)=>{
    print(msg, "doin effects yo!");
});