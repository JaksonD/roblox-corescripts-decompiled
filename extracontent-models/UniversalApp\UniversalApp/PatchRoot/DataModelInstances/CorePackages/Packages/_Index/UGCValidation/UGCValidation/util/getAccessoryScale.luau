local l_Players_0 = game:GetService("Players");
local v1 = game:DefineFastFlag("HumanoidParentNil", false);
local v2 = {};
local v3 = nil;
local v4 = nil;
if not v1 then
    v3 = if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15) else l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
    v4 = v3:FindFirstChildOfClass("Humanoid");
    assert(v4, "Humanoid must exist in character model");
    local l_BodyTypeScale_0 = v4:FindFirstChild("BodyTypeScale");
    local l_BodyProportionScale_0 = v4:FindFirstChild("BodyProportionScale");
    l_BodyTypeScale_0.Value = 0;
    l_BodyProportionScale_0.Value = 0;
    for _, v8 in pairs(v3:GetDescendants()) do
        if v8:IsA("BasePart") then
            for _, v10 in v8:GetChildren() do
                if v10:IsA("Attachment") then
                    v2[v10.Name] = v4:GetBodyPartR15(v8);
                end;
            end;
        end;
    end;
end;
return function(v11, v12) --[[ Line: 43 ]]
    -- upvalues: v1 (copy), v3 (ref), l_Players_0 (copy), v4 (ref), v2 (copy)
    if v1 and v3 == nil then
        if game:GetEngineFeature("AsyncRenamesUsedInLuaApps") then
            v3 = l_Players_0:CreateHumanoidModelFromDescriptionAsync(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
        else
            v3 = l_Players_0:CreateHumanoidModelFromDescription(Instance.new("HumanoidDescription"), Enum.HumanoidRigType.R15);
        end;
        v4 = v3:FindFirstChildOfClass("Humanoid");
        assert(v4, "Humanoid must exist in character model");
        local l_BodyTypeScale_1 = v4:FindFirstChild("BodyTypeScale");
        local l_BodyProportionScale_1 = v4:FindFirstChild("BodyProportionScale");
        l_BodyTypeScale_1.Value = 0;
        l_BodyProportionScale_1.Value = 0;
        for _, v16 in pairs(v3:GetDescendants()) do
            if v16:IsA("BasePart") then
                for _, v18 in v16:GetChildren() do
                    if v18:IsA("Attachment") then
                        v2[v18.Name] = v4:GetBodyPartR15(v16);
                    end;
                end;
            end;
        end;
    end;
    if v4 == nil then
        return (Vector3.new(1, 1, 1, 0));
    else
        return v4:GetAccessoryHandleScale(v11, v2[v12.Name]);
    end;
end;