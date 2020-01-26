import { Players, TweenService } from "@rbxts/services";

const plr = Players.LocalPlayer;
if(plr.Character && plr.Character.FindFirstChildOfClass("Humanoid")){
    const char = plr.Character;
    const humanoid = char.FindFirstChildOfClass("Humanoid") as Humanoid;
    const LowerTorso = char.WaitForChild("LowerTorso");
    const UpperTorso = char.WaitForChild("UpperTorso");
    const Root = LowerTorso.FindFirstChildOfClass("Motor6D");
    const Waist = UpperTorso.FindFirstChildOfClass("Motor6D");
    if(LowerTorso.IsA("BasePart") 
        && Root?.IsA("Motor6D") 
        && humanoid.GetState() !== Enum.HumanoidStateType.Freefall
        && UpperTorso.IsA("BasePart")
        && Waist?.IsA("Motor6D")) {

        const root_c1 = Root.C1;
        const waist_c1 = Waist.C1;
        while(plr.Character){
            const yvel = (char.FindFirstChild("HumanoidRootPart") as BasePart)!.RotVelocity!.Y!;
            const tweeninfoo = new TweenInfo(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0);
            const properties: {[key: string]: CFrame} = {};
            const val = (-math.rad(yvel)*3)/2;
            const CoordinateFrame_root = CFrame.Angles(0,0,(math.clamp(val,-0.5,0.5)));
            const CoordinateFrame_waist = CFrame.Angles(0,0,(math.clamp(val,-0.5,0.5)));
            properties["C1"] = root_c1.mul(CoordinateFrame_root);
            const tween_root = TweenService.Create(Root, tweeninfoo, properties)
            properties["C1"] = waist_c1.mul(CoordinateFrame_waist);
            const tween_waist = TweenService.Create(Waist, tweeninfoo, properties)
            tween_root.Play()
            tween_waist.Play()
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