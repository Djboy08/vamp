import { makeHello } from "shared/module";
import Net from "@rbxts/net";
import { Players } from "@rbxts/services";

(async function init(){
    let exampleClientTwo = new Net.ClientEvent("movesEvent");
    exampleClientTwo.Connect(([plr, msg])=>{
        print(plr.Name, msg);
        print("---");
    });
    // exampleClientTwo.SendToServer("testig");
})();
