return function(v0) --[[ Line: 8 ]] --[[ Name: fixUpPreValidation ]]
    v0 = v0:Clone();
    local l_v0_Descendants_0 = v0:GetDescendants();
    table.insert(l_v0_Descendants_0, v0);
    for _, v3 in l_v0_Descendants_0 do
        if v3.Parent ~= nil and (v3:IsA("Motor6D") or v3.Name == "OriginalSize" or v3.Name == "OriginalPosition" or v3:IsA("Weld") and v3.Name == "AccessoryWeld") then
            v3:Destroy();
        else
            if v3:IsA("BasePart") then
                v3.Velocity = Vector3.new(0, 0, 0, 0);
                v3.RotVelocity = Vector3.new(0, 0, 0, 0);
            end;
            local v4 = if v3.Parent then v3.Parent:IsA("Accessory") else false;
            if v3:IsA("MeshPart") and not v4 and v3.TextureID == "" and not v3:FindFirstChildWhichIsA("SurfaceAppearance") then
                Instance.new("SurfaceAppearance").Parent = v3;
            end;
        end;
    end;
    return v0;
end;