import { makeHello } from "shared/module";
import Net from "@rbxts/net";

(async function init(){
    let exampleClientTwo = new Net.ClientEvent("EventName");
    exampleClientTwo.Connect((e: string)=>{
        print("wow recieved something! " + e);
    });
    exampleClientTwo.SendToServer("testig");
})();
