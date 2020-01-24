
import { Workspace, Players, ReplicatedStorage } from "@rbxts/services";

export const setRagdoll = (humanoid: Humanoid, setRagdoll: boolean) => {

    if(humanoid){
        let state = setRagdoll ? Enum.HumanoidStateType.Physics : Enum.HumanoidStateType.Physics;
        humanoid.ChangeState(state);
    }

    // const e = setRagdoll ? Enum.HumanoidStateType.Physics : Enum.HumanoidStateType.GettingUp;
    // if(humanoid && humanoid.Parent){
    //     humanoid.SetStateEnabled(Enum.HumanoidStateType.Physics, true);
    //     const setEnabled = humanoid.GetState() != Enum.HumanoidStateType.Physics;
    //     humanoid.ChangeState(setEnabled ? Enum.HumanoidStateType.Physics : Enum.HumanoidStateType.GettingUp)

    //     const ragdollConstraints = humanoid.Parent.FindFirstChild("RagdollConstraints") ? humanoid.Parent.FindFirstChild("RagdollConstraints")?.GetChildren() : undefined;
    //     if(ragdollConstraints){
    //         for(let i = 0; i < ragdollConstraints.size(); i++){
    //             const constraint = ragdollConstraints[i] as Constraint;
    //             if(constraint.IsA("Constraint")){
    //                 let rigidJoint = constraint.FindFirstChild("RigidJoint");
    //                 if(rigidJoint && rigidJoint.IsA("ObjectValue")){
    //                     let Value = rigidJoint.Value as Motor6D;
    //                     if(constraint.Attachment1){
    //                         let expectedValue = !setRagdoll ? constraint.Attachment1.Parent as BasePart : undefined;
    //                         if(Value.Part1 !== expectedValue){
    //                             Value.Part1 = expectedValue;
    //                         }
    //                     }
    //                 }
    //             }
    //         }
    //     }
    // }
}

// function setRagdollEnabled(humanoid, isEnabled)
// 	local ragdollConstraints = humanoid.Parent:FindFirstChild("RagdollConstraints")
	
// 	for _,constraint in pairs(ragdollConstraints:GetChildren()) do
// 		if constraint:IsA("Constraint") then
// 			local rigidJoint = constraint.RigidJoint.Value
// 			local expectedValue = (not isEnabled) and constraint.Attachment1.Parent or nil
			
// 			if rigidJoint.Part1 ~= expectedValue then
// 				rigidJoint.Part1 = expectedValue 
// 			end
// 		end
// 	end
// end