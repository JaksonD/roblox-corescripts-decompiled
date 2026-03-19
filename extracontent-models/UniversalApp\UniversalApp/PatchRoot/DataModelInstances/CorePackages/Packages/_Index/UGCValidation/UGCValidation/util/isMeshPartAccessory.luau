return function(v0) --[[ Line: 1 ]] --[[ Name: isMeshPartAccessory ]]
    if v0:IsA("Accessory") then
        local l_Handle_0 = v0:FindFirstChild("Handle");
        if l_Handle_0 and l_Handle_0:IsA("MeshPart") then
            return true;
        end;
    end;
    return false;
end;