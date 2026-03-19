local l_Parent_0 = script:FindFirstAncestor("VrCommon").Parent;
local l_game_EngineFeature_0 = game:GetEngineFeature("OpenXrForWin32");
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local l_Granite_0 = Enum.Material.Granite;
local v4 = if l_game_EngineFeature_0 then Vector3.new(3.4000000953674316, 3.4000000953674316, 3.4000000953674316, 0) else Vector3.new(3.5999999046325684, 3.5999999046325684, 3.5999999046325684, 0);
local v5 = {};
v5.__index = v5;
v5.new = function(v6) --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v5 (copy), l_Create_0 (copy), l_Granite_0 (copy), v4 (copy)
    local v7 = setmetatable({}, v5);
    v7.userCFrame = v6;
    v7.model = l_Create_0("Model")({
        Name = "IndexController", 
        Archivable = false
    });
    v7.origin = l_Create_0("Part")({
        Parent = v7.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v7.parts = {};
    local v8 = l_Create_0("Part")({
        Parent = v7.model, 
        Name = "body", 
        Anchored = true, 
        Material = l_Granite_0, 
        Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
        Transparency = 0.25, 
        CFrame = v7.origin.CFrame, 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v7.mesh = l_Create_0("SpecialMesh")({
        Parent = v8, 
        Name = "Mesh", 
        MeshId = v6 == Enum.UserCFrame.LeftHand and "rbxassetid://9605099531" or "rbxassetid://9605114549", 
        TextureId = v6 == Enum.UserCFrame.LeftHand and "rbxassetid://9605099774" or "rbxassetid://9605114771", 
        Scale = v4
    });
    local _ = l_Create_0("Weld")({
        Parent = v8, 
        Name = "Weld", 
        Part0 = v7.origin, 
        Part1 = v8
    });
    v7.parts.body = v8;
    v7.model.PrimaryPart = v7.origin;
    return v7;
end;
v5.setCFrame = function(v10, v11) --[[ Line: 70 ]] --[[ Name: setCFrame ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if l_game_EngineFeature_0 then
        if v10.userCFrame == Enum.UserCFrame.RightHand then
            v10.model:SetPrimaryPartCFrame(v11 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0) * CFrame.new(-0.1, 0.08, -0.01));
            return;
        else
            v10.model:SetPrimaryPartCFrame(v11 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0) * CFrame.new(0.1, 0.08, -0.01));
            return;
        end;
    elseif v10.userCFrame == Enum.UserCFrame.RightHand then
        v10.model:SetPrimaryPartCFrame(v11 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0) * CFrame.new(-0.1, -0.03, -0.4));
        return;
    else
        v10.model:SetPrimaryPartCFrame(v11 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0) * CFrame.new(0.1, -0.03, -0.4));
        return;
    end;
end;
v5.setCFrameAndScale = function(v12, v13, v14) --[[ Line: 94 ]] --[[ Name: setCFrameAndScale ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v4 (copy)
    local v15 = v12.userCFrame == Enum.UserCFrame.RightHand and 1 or -1;
    if l_game_EngineFeature_0 then
        v12.model:SetPrimaryPartCFrame(v13 * CFrame.Angles(0.6981317007977318, 3.141592653589793, 0) * CFrame.new(-0.1 * v14 * v15, 0.08 * v14, -0.01 * v14));
    else
        v12.model:SetPrimaryPartCFrame(v13 * CFrame.Angles(0.3490658503988659, 3.141592653589793, 0) * CFrame.new(-0.1 * v14 * v15, -0.03 * v14, -0.4 * v14));
    end;
    v12.mesh.Scale = v4 * v14;
end;
v5.onButtonInputChanged = function(_, _, _) --[[ Line: 112 ]] --[[ Name: onButtonInputChanged ]]

end;
v5.onInputBegan = function(v19, v20) --[[ Line: 114 ]] --[[ Name: onInputBegan ]]
    v19:onButtonInputChanged(v20, true);
end;
v5.onInputChanged = function(_, _) --[[ Line: 118 ]] --[[ Name: onInputChanged ]]

end;
v5.onInputEnded = function(v23, v24) --[[ Line: 120 ]] --[[ Name: onInputEnded ]]
    v23:onButtonInputChanged(v24, false);
end;
v5.onTouchpadModeChanged = function(_, _, _) --[[ Line: 124 ]] --[[ Name: onTouchpadModeChanged ]]

end;
return v5;