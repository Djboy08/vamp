import Net from "@rbxts/net";
import { Players, UserInputService, Lighting, Workspace, ReplicatedStorage, TweenService } from "@rbxts/services";
import inspect = require("@rbxts/inspect");
import moveManager from "shared/movesManager"

let remote = new Net.ClientEvent("movesEvent");


const moves_manager = new moveManager(remote);



