import { Players, TweenService } from "@rbxts/services";

const plr = Players.LocalPlayer;
if(plr.Character && plr.Character.FindFirstChildOfClass("Humanoid")){
    const char = plr.Character;
    const humanoid = char.FindFirstChildOfClass("Humanoid") as Humanoid;
    const LowerTorso = char.WaitForChild("LowerTorso");
    const Root = LowerTorso.FindFirstChildOfClass("Motor6D");
    if(LowerTorso.IsA("BasePart") && Root?.IsA("Motor6D") && humanoid.GetState() !== Enum.HumanoidStateType.Freefall){
        const copy = Root.C1;
        while(plr.Character){
            const yvel = (char.FindFirstChild("HumanoidRootPart") as BasePart)!.RotVelocity!.Y!;
            const tweeninfoo = new TweenInfo(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
            const properties: {[key: string]: CFrame} = {};
            const CoordinateFrame = CFrame.Angles(0,0,(math.clamp(-math.rad(yvel)*3,-0.5,0.5)));
            properties["C1"] = copy.mul(CoordinateFrame);
            const tween = TweenService.Create(Root, tweeninfoo, properties)
            tween.Play()
            wait()
        }  
    }
}





// local copy = game.Players.LocalPlayer.Character.LowerTorso.Root.C1
// while true do
// 	local char = game.Players.LocalPlayer.Character
// 	if char and char:FindFirstChild("LowerTorso") and char.LowerTorso:FindFirstChild("Root") and char:FindFirstChild("Humanoid") and char.Humanoid:GetState() ~= Enum.HumanoidStateType.Freefall then
// 		local yvel= game.Players.LocalPlayer.Character.HumanoidRootPart.RotVelocity.Y
// 		local tweeninfoo = TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
// 		local properties = {};
// 		properties["C1"] = copy*CFrame.Angles(0,0,math.clamp((-math.rad(yvel)*3),-0.5,0.5))
// 		local t = TweenService:Create(game.Players.LocalPlayer.Character.LowerTorso.Root, tweeninfoo, properties)
// 		t:Play()		
// 	end
// 	wait()
// end