local l_Parent_0 = script:FindFirstAncestor("VrCommon").Parent;
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local l_Granite_0 = Enum.Material.Granite;
local v3 = {};
v3.__index = v3;
v3.new = function(v4) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_Create_0 (copy), l_Granite_0 (copy)
    local v5 = setmetatable({}, v3);
    v5.userCFrame = v4;
    v5.model = l_Create_0("Model")({
        Name = "RiftController", 
        Archivable = false
    });
    v5.origin = l_Create_0("Part")({
        Parent = v5.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v5.parts = {};
    local v6 = l_Create_0("Part")({
        Parent = v5.model, 
        Name = "body", 
        Anchored = true, 
        Material = l_Granite_0, 
        Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
        Transparency = 0.25, 
        CFrame = v5.origin.CFrame, 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v5.mesh = l_Create_0("SpecialMesh")({
        Parent = v6, 
        Name = "Mesh", 
        MeshId = v4 == Enum.UserCFrame.LeftHand and "rbxassetid://9597097835" or "rbxassetid://9597101144", 
        TextureId = "rbxassetid://9597123835", 
        Scale = Vector3.new(0.03200000151991844, 0.03200000151991844, 0.03200000151991844, 0)
    });
    local _ = l_Create_0("Weld")({
        Parent = v6, 
        Name = "Weld", 
        Part0 = v5.origin, 
        Part1 = v6
    });
    v5.parts.body = v6;
    v5.model.PrimaryPart = v5.origin;
    return v5;
end;
v3.setCFrame = function(v8, v9) --[[ Line: 68 ]] --[[ Name: setCFrame ]]
    v8.model:SetPrimaryPartCFrame(v9 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(0, -0.03, 0.06));
end;
v3.setCFrameAndScale = function(v10, v11, v12) --[[ Line: 72 ]] --[[ Name: setCFrameAndScale ]]
    v10.model:SetPrimaryPartCFrame(v11 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(0, -0.03 * v12, 0.06 * v12));
    v10.mesh.Scale = Vector3.new(0.03200000151991844, 0.03200000151991844, 0.03200000151991844, 0) * v12;
end;
v3.onButtonInputChanged = function(_, _, _) --[[ Line: 79 ]] --[[ Name: onButtonInputChanged ]]

end;
v3.onInputBegan = function(v16, v17) --[[ Line: 81 ]] --[[ Name: onInputBegan ]]
    v16:onButtonInputChanged(v17, true);
end;
v3.onInputChanged = function(_, _) --[[ Line: 85 ]] --[[ Name: onInputChanged ]]

end;
v3.onInputEnded = function(v20, v21) --[[ Line: 87 ]] --[[ Name: onInputEnded ]]
    v20:onButtonInputChanged(v21, false);
end;
v3.onTouchpadModeChanged = function(_, _, _) --[[ Line: 91 ]] --[[ Name: onTouchpadModeChanged ]]

end;
return v3;