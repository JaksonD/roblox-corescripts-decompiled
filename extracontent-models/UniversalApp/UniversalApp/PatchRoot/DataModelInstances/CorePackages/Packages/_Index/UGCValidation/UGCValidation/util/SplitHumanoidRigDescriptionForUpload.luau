local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Constants);
return {
    fixUploadInstance = function(v2) --[[ Line: 17 ]] --[[ Name: fixUploadInstance ]]
        -- upvalues: v1 (copy)
        local l_HumanoidRigDescription_0 = v2:FindFirstChildWhichIsA("HumanoidRigDescription");
        if not l_HumanoidRigDescription_0 then
            return;
        else
            for _, v5 in v1.R15_BODY_PARTS do
                local l_v2_FirstChild_0 = v2:FindFirstChild(v5);
                if l_v2_FirstChild_0 then
                    local v7 = nil;
                    local l_HumanoidRigDescription_1 = l_v2_FirstChild_0:FindFirstChildWhichIsA("HumanoidRigDescription");
                    if l_HumanoidRigDescription_1 == nil then
                        v7 = Instance.new("HumanoidRigDescription");
                        v7.Parent = l_v2_FirstChild_0;
                    else
                        v7 = l_HumanoidRigDescription_1;
                    end;
                    if l_v2_FirstChild_0.Name == "LowerTorso" then
                        v7.OriginOffset = l_HumanoidRigDescription_0.OriginOffset;
                    end;
                    for _, v10 in v7:GetContainedJointLabels(v5) do
                        local l_l_HumanoidRigDescription_0_Joint_0 = l_HumanoidRigDescription_0:GetJoint(v10);
                        if l_l_HumanoidRigDescription_0_Joint_0 then
                            if l_l_HumanoidRigDescription_0_Joint_0:IsA("AnimationConstraint") then
                                if l_l_HumanoidRigDescription_0_Joint_0.Attachment0 and l_l_HumanoidRigDescription_0_Joint_0.Attachment0:IsDescendantOf(l_v2_FirstChild_0) then
                                    v7:SetJoint(v10, l_l_HumanoidRigDescription_0_Joint_0.Attachment0);
                                elseif l_l_HumanoidRigDescription_0_Joint_0.Attachment1 and l_l_HumanoidRigDescription_0_Joint_0.Attachment1:IsDescendantOf(l_v2_FirstChild_0) then
                                    v7:SetJoint(v10, l_l_HumanoidRigDescription_0_Joint_0.Attachment1);
                                else
                                    continue;
                                end;
                            else
                                v7:SetJoint(v10, l_l_HumanoidRigDescription_0_Joint_0);
                            end;
                            v7:SetTposeAdjustment(v10, l_HumanoidRigDescription_0:GetTposeAdjustment(v10));
                            v7:SetJointSize(v10, l_HumanoidRigDescription_0:GetJointSize(v10));
                            v7:SetJointRangeMin(v10, l_HumanoidRigDescription_0:GetJointRangeMin(v10));
                            v7:SetJointRangeMax(v10, l_HumanoidRigDescription_0:GetJointRangeMax(v10));
                        end;
                    end;
                end;
            end;
            local l_LeftHand_0 = v2:FindFirstChild("LeftHand");
            local l_RightHand_0 = v2:FindFirstChild("RightHand");
            for _, v15 in l_HumanoidRigDescription_0:GetChildren() do
                if v15:IsA("DigitsRigDescription") then
                    if v15.Side == Enum.DigitsRigDescriptionSide.Left and l_LeftHand_0 then
                        v15:Clone().Parent = l_LeftHand_0;
                    elseif v15.Side == Enum.DigitsRigDescriptionSide.Right and l_RightHand_0 then
                        v15:Clone().Parent = l_RightHand_0;
                    end;
                end;
            end;
            return;
        end;
    end
};