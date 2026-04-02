local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.flags.getEngineFeatureEngineSplitHumanoidRigDescriptionInUpload);
local v2 = require(l_Parent_0.util.SplitHumanoidRigDescriptionForUpload);
return function(v3) --[[ Line: 15 ]] --[[ Name: fixUpPreValidation ]]
    -- upvalues: v1 (copy), v2 (copy)
    v3 = v3:Clone();
    if v1() then
        v2.fixUploadInstance(v3);
    end;
    local l_v3_Descendants_0 = v3:GetDescendants();
    table.insert(l_v3_Descendants_0, v3);
    for _, v6 in l_v3_Descendants_0 do
        if v6.Parent ~= nil and (v6:IsA("Motor6D") or v6.Name == "OriginalSize" or v6.Name == "OriginalPosition" or v6:IsA("Weld") and v6.Name == "AccessoryWeld" or v1() and (v6:IsA("Constraint") or v6:isA("NoCollisionConstraint"))) then
            v6:Destroy();
        else
            if v6:IsA("BasePart") then
                v6.Velocity = Vector3.new(0, 0, 0, 0);
                v6.RotVelocity = Vector3.new(0, 0, 0, 0);
            end;
            local v7 = if v6.Parent then v6.Parent:IsA("Accessory") else false;
            if v6:IsA("MeshPart") and not v7 and v6.TextureID == "" and not v6:FindFirstChildWhichIsA("SurfaceAppearance") then
                Instance.new("SurfaceAppearance").Parent = v6;
            end;
        end;
    end;
    return v3;
end;