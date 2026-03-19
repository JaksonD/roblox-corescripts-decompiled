local l_VRService_0 = game:GetService("VRService");
local l_Parent_0 = script:FindFirstAncestor("VrCommon").Parent;
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v3 = {
    Body = {
        size = Vector3.new(0.39100000262260437, 0.2770000100135803, 0.7310000061988831, 0), 
        meshId = "rbxassetid://433286977", 
        textureId = "rbxassetid://433287000", 
        offset = CFrame.new(0, -0.115, 0.213)
    }, 
    RightGrip = {
        meshId = "rbxassetid://433290663", 
        textureId = "rbxassetid://433290688", 
        offset = CFrame.new(0.057, -0.047, 0.29), 
        moveOffset = CFrame.new(-0.005, 0, 0)
    }, 
    LeftGrip = {
        meshId = "rbxassetid://433289821", 
        textureId = "rbxassetid://433289832", 
        offset = CFrame.new(-0.057, -0.047, 0.29), 
        moveOffset = CFrame.new(0.005, 0, 0)
    }, 
    SystemButton = {
        meshId = "rbxassetid://433291265", 
        textureId = "rbxassetid://433291278", 
        offset = CFrame.new(0, 0.005, 0.294), 
        moveOffset = CFrame.new((Vector3.new(-0, -9.974209824576974E-4, -7.177444058470428E-5, -0)))
    }, 
    MenuButton = {
        meshId = "rbxassetid://433288124", 
        textureId = "rbxassetid://433288134", 
        offset = CFrame.new(0, 0.016, 0.068), 
        moveOffset = CFrame.new((Vector3.new(-0, -9.99877811409533E-4, 1.5630490452167578E-5, -0)))
    }, 
    Trackpad = {
        meshId = "rbxassetid://433288821", 
        textureId = "rbxassetid://433288836", 
        offset = CFrame.new(0, 0, 0.163), 
        moveOffset = CFrame.new((Vector3.new(-0, -9.935068665072322E-4, -1.13772286567837E-4, -0)))
    }, 
    Trigger = {
        meshId = "rbxassetid://433288767", 
        textureId = "rbxassetid://433288775", 
        offset = CFrame.new(0, -0.093, 0.163)
    }, 
    LED = {
        meshId = "rbxassetid://433293218", 
        textureId = "rbxassetid://433293231", 
        offset = CFrame.new(0, 0.007, 0.32)
    }, 
    ButtonA = {
        meshId = "rbxassetid://922444331", 
        textureId = "rbxasset://textures/ui/VR/ButtonA.png", 
        offset = CFrame.new(-0, 0.0115499999, 0.197307006) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }, 
    ButtonB = {
        meshId = "rbxassetid://922454202", 
        textureId = "rbxasset://textures/ui/VR/ButtonB.png", 
        offset = CFrame.new(0.0391042456, 0.0154935224, 0.161779419) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }, 
    ButtonX = {
        meshId = "rbxassetid://922453111", 
        textureId = "rbxasset://textures/ui/VR/ButtonX.png", 
        offset = CFrame.new(-0.0390719995, 0.0154770007, 0.161733001) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }, 
    ButtonY = {
        meshId = "rbxassetid://922455502", 
        textureId = "rbxasset://textures/ui/VR/ButtonY.png", 
        offset = CFrame.new(0, 0.0197229274, 0.126810834) * CFrame.Angles(0, 3.141592653589793, 0), 
        moveOffset = CFrame.new(0, -0.005, 0)
    }
};
local v4 = {
    [Enum.KeyCode.ButtonL1] = "LeftGrip", 
    [Enum.KeyCode.ButtonL2] = "Trigger", 
    [Enum.KeyCode.ButtonL3] = "Trackpad", 
    [Enum.KeyCode.ButtonR1] = "RightGrip", 
    [Enum.KeyCode.ButtonR2] = "Trigger", 
    [Enum.KeyCode.ButtonR3] = "Trackpad", 
    [Enum.KeyCode.Thumbstick1] = "Trackpad", 
    [Enum.KeyCode.Thumbstick2] = "Trackpad", 
    [Enum.KeyCode.ButtonSelect] = "MenuButton", 
    [Enum.KeyCode.ButtonStart] = "MenuButton", 
    [Enum.KeyCode.ButtonA] = "ButtonA", 
    [Enum.KeyCode.ButtonB] = "ButtonB", 
    [Enum.KeyCode.ButtonX] = "ButtonX", 
    [Enum.KeyCode.ButtonY] = "ButtonY"
};
local l_Granite_0 = Enum.Material.Granite;
local v6 = {};
v6.__index = v6;
local v7 = {
    [Enum.UserCFrame.LeftHand] = Enum.VRTouchpad.Left, 
    [Enum.UserCFrame.RightHand] = Enum.VRTouchpad.Right
};
v6.new = function(v8) --[[ Line: 109 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy), v7 (copy), l_VRService_0 (copy), l_Create_0 (copy), v3 (copy), l_Granite_0 (copy)
    local v9 = setmetatable({}, v6);
    v9.userCFrame = v8;
    v9.touchpad = v7[v9.userCFrame];
    v9.touchpadMode = l_VRService_0:GetTouchpadMode(v9.touchpad);
    v9.onTouchpadModeChangedConn = l_VRService_0.TouchpadModeChanged:connect(function(...) --[[ Line: 114 ]]
        -- upvalues: v9 (copy)
        v9:onTouchpadModeChanged(...);
    end);
    v9.model = l_Create_0("Model")({
        Name = "ViveController", 
        Archivable = false
    });
    v9.origin = l_Create_0("Part")({
        Parent = v9.model, 
        Name = "Origin", 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    v9.scale = 1;
    v9.parts = {};
    for v10, v11 in pairs(v3) do
        local v12 = Vector3.new(0.032999999821186066, 0.032999999821186066, 0.032999999821186066, 0);
        if v11.scale then
            v12 = v12 * v11.scale;
        end;
        local v13 = l_Create_0("Part")({
            Parent = v9.model, 
            Name = v10, 
            Anchored = true, 
            Material = l_Granite_0, 
            Size = v11.size or Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
            CFrame = v9.origin.CFrame * v11.offset, 
            CanCollide = false, 
            CanQuery = false, 
            CanTouch = false
        });
        local _ = l_Create_0("SpecialMesh")({
            Parent = v13, 
            Name = "Mesh", 
            MeshId = v11.meshId, 
            TextureId = v11.textureId, 
            Scale = v12
        });
        local _ = l_Create_0("Weld")({
            Parent = v13, 
            Name = "Weld", 
            Part0 = v9.origin, 
            Part1 = v13, 
            C0 = v11.offset
        });
        v9.parts[v10] = v13;
    end;
    local v16 = l_Create_0("Part")({
        Parent = v9.model, 
        Name = "TrackpadIndicator", 
        Material = Enum.Material.Neon, 
        BrickColor = BrickColor.new("Institutional white"), 
        Shape = Enum.PartType.Ball, 
        Anchored = true, 
        Transparency = 1, 
        Size = Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0), 
        CanCollide = false, 
        CanQuery = false, 
        CanTouch = false
    });
    l_Create_0("Weld")({
        Parent = v16, 
        Name = "Weld", 
        Part0 = v9.origin, 
        Part1 = v16, 
        C0 = v3.Trackpad.offset
    });
    v9.parts.TrackpadIndicator = v16;
    v9.model.PrimaryPart = v9.origin;
    v9:onTouchpadModeChanged(v9.touchpad, l_VRService_0:GetTouchpadMode(v9.touchpad));
    return v9;
end;
v6.setPartVisible = function(v17, v18, v19) --[[ Line: 200 ]] --[[ Name: setPartVisible ]]
    local v20 = v17.parts[v18];
    if v20 then
        v20.Transparency = v19 and 0 or 1;
    end;
end;
v6.setABXYEnabled = function(v21, v22) --[[ Line: 207 ]] --[[ Name: setABXYEnabled ]]
    v21:setPartVisible("ButtonA", v22);
    v21:setPartVisible("ButtonB", v22);
    v21:setPartVisible("ButtonX", v22);
    v21:setPartVisible("ButtonY", v22);
end;
v6.setCFrame = function(v23, v24) --[[ Line: 214 ]] --[[ Name: setCFrame ]]
    v23.model:SetPrimaryPartCFrame(v24);
end;
v6.setCFrameAndScale = function(v25, v26, v27) --[[ Line: 218 ]] --[[ Name: setCFrameAndScale ]]
    -- upvalues: v3 (copy)
    v25.model:SetPrimaryPartCFrame(v26);
    if v25.scale ~= v27 then
        v25.scale = v27;
        for v28, v29 in pairs(v3) do
            local v30 = v25.parts[v28];
            if v30 then
                local v31 = Vector3.new(0.032999999821186066, 0.032999999821186066, 0.032999999821186066, 0);
                if v29.scale then
                    v31 = v31 * v29.scale;
                end;
                local l_Mesh_0 = v30:FindFirstChild("Mesh");
                local l_Weld_0 = v30:FindFirstChild("Weld");
                local v34 = CFrame.new(v29.offset.p * v25.scale) * (v29.offset - v29.offset.p);
                v30.CFrame = v26 * v34;
                if l_Mesh_0 then
                    l_Mesh_0.Scale = v31 * v25.scale;
                end;
                if l_Weld_0 then
                    l_Weld_0.C0 = v34;
                end;
            end;
        end;
    end;
end;
v6.setButtonState = function(v35, v36, v37) --[[ Line: 247 ]] --[[ Name: setButtonState ]]
    -- upvalues: v3 (copy)
    local v38 = v3[v36];
    if not v38 then
        return;
    else
        local l_offset_0 = v38.offset;
        local l_moveOffset_0 = v38.moveOffset;
        if l_offset_0 and l_moveOffset_0 then
            l_offset_0 = CFrame.new(l_offset_0.p * v35.scale) * (l_offset_0 - l_offset_0.p);
            l_moveOffset_0 = CFrame.new(l_moveOffset_0.p * v35.scale) * (l_moveOffset_0 - l_moveOffset_0.p);
            local v41 = v35.parts[v36];
            if v41 then
                local l_Mesh_1 = v41:FindFirstChild("Mesh");
                local l_Weld_1 = v41:FindFirstChild("Weld");
                if l_Weld_1 then
                    if v37 then
                        v41.CFrame = v35.origin.CFrame * l_offset_0 * l_moveOffset_0;
                        l_Weld_1.C0 = l_offset_0 * l_moveOffset_0;
                    else
                        v41.CFrame = v35.origin.CFrame * l_offset_0;
                        l_Weld_1.C0 = l_offset_0;
                    end;
                end;
                if l_Mesh_1 then
                    if v37 then
                        l_Mesh_1.VertexColor = Vector3.new(0.5, 0.5, 0.5, 0);
                        return;
                    else
                        l_Mesh_1.VertexColor = Vector3.new(1, 1, 1, 0);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v6.setTriggerState = function(v44, v45) --[[ Line: 284 ]] --[[ Name: setTriggerState ]]
    -- upvalues: v3 (copy)
    local l_offset_1 = v3.Trigger.offset;
    l_offset_1 = CFrame.new(l_offset_1.p * v44.scale) * (l_offset_1 - l_offset_1.p);
    local l_Trigger_0 = v44.parts.Trigger;
    local l_Weld_2 = l_Trigger_0:FindFirstChild("Weld");
    if l_Weld_2 then
        local v49 = Vector3.new(0, 0.05 * v44.scale, -0.025 * v44.scale);
        local v50 = v45 * -0.3490658503988659 + 0;
        local v51 = l_offset_1 * CFrame.new(v49) * CFrame.Angles(v50, 0, 0) * CFrame.new(-v49);
        l_Trigger_0.CFrame = v44.origin.CFrame * v51;
        l_Weld_2.C0 = v51;
    end;
end;
v6.setTrackpadState = function(v52, v53) --[[ Line: 302 ]] --[[ Name: setTrackpadState ]]
    -- upvalues: v3 (copy)
    local l_TrackpadIndicator_0 = v52.parts.TrackpadIndicator;
    local l_Weld_3 = l_TrackpadIndicator_0:FindFirstChild("Weld");
    local l_offset_2 = v3.Trackpad.offset;
    l_offset_2 = CFrame.new(l_offset_2.p * v52.scale) * (l_offset_2 - l_offset_2.p);
    if l_Weld_3 then
        local v57 = Vector3.new(v53.X, 0, -v53.Y) * 0.055;
        local v58 = CFrame.Angles(0.11344640137963143, 0, 0) * CFrame.new(0, 0.002 * v52.scale * v53.magnitude ^ 3, 0);
        local v59 = l_offset_2 * CFrame.new(0, 0.01 * v52.scale, 0) * v58:toWorldSpace(CFrame.new(v57));
        l_TrackpadIndicator_0.CFrame = v52.origin.CFrame * v59;
        l_Weld_3.C0 = v59;
    end;
end;
v6.onButtonInputChanged = function(v60, v61, v62) --[[ Line: 318 ]] --[[ Name: onButtonInputChanged ]]
    if v60.userCFrame == Enum.UserCFrame.RightHand and v61.KeyCode == Enum.KeyCode.ButtonR3 or v60.userCFrame == Enum.UserCFrame.LeftHand and v61.KeyCode == Enum.KeyCode.ButtonL3 then
        v60:setButtonState("Trackpad", v62);
        return;
    elseif v60.userCFrame == Enum.UserCFrame.RightHand and v61.KeyCode == Enum.KeyCode.ButtonR1 or v60.userCFrame == Enum.UserCFrame.LeftHand and v61.KeyCode == Enum.KeyCode.ButtonL1 then
        v60:setButtonState("LeftGrip", v62);
        v60:setButtonState("RightGrip", v62);
        return;
    elseif v60.userCFrame == Enum.UserCFrame.RightHand and v61.KeyCode == Enum.KeyCode.ButtonStart or v60.userCFrame == Enum.UserCFrame.LeftHand and v61.KeyCode == Enum.KeyCode.ButtonSelect then
        v60:setButtonState("MenuButton", v62);
        return;
    else
        if v60.touchpadMode == Enum.VRTouchpadMode.ABXY then
            if v61.KeyCode == Enum.KeyCode.ButtonA then
                v60:setButtonState("ButtonA", v62);
                return;
            elseif v61.KeyCode == Enum.KeyCode.ButtonB then
                v60:setButtonState("ButtonB", v62);
                return;
            elseif v61.KeyCode == Enum.KeyCode.ButtonX then
                v60:setButtonState("ButtonX", v62);
                return;
            elseif v61.KeyCode == Enum.KeyCode.ButtonY then
                v60:setButtonState("ButtonY", v62);
                return;
            end;
        end;
        return;
    end;
end;
v6.onInputBegan = function(v63, v64) --[[ Line: 368 ]] --[[ Name: onInputBegan ]]
    v63:onButtonInputChanged(v64, true);
    if v63.userCFrame == Enum.UserCFrame.RightHand and v64.KeyCode == Enum.KeyCode.Thumbstick2 or v63.userCFrame == Enum.UserCFrame.LeftHand and v64.KeyCode == Enum.KeyCode.Thumbstick1 then
        v63:setPartVisible("TrackpadIndicator", true);
    end;
end;
v6.onInputChanged = function(v65, v66) --[[ Line: 378 ]] --[[ Name: onInputChanged ]]
    if v65.userCFrame == Enum.UserCFrame.RightHand and v66.KeyCode == Enum.KeyCode.ButtonR2 or v65.userCFrame == Enum.UserCFrame.LeftHand and v66.KeyCode == Enum.KeyCode.ButtonL2 then
        v65:setTriggerState(v66.Position.Z);
    end;
    if v65.userCFrame == Enum.UserCFrame.RightHand and v66.KeyCode == Enum.KeyCode.Thumbstick2 or v65.userCFrame == Enum.UserCFrame.LeftHand and v66.KeyCode == Enum.KeyCode.Thumbstick1 then
        v65:setTrackpadState(v66.Position);
    end;
end;
v6.onInputEnded = function(v67, v68) --[[ Line: 393 ]] --[[ Name: onInputEnded ]]
    v67:onButtonInputChanged(v68, false);
    if v67.userCFrame == Enum.UserCFrame.RightHand and v68.KeyCode == Enum.KeyCode.Thumbstick2 or v67.userCFrame == Enum.UserCFrame.LeftHand and v68.KeyCode == Enum.KeyCode.Thumbstick1 then
        v67:setPartVisible("TrackpadIndicator", false);
    end;
end;
v6.onTouchpadModeChanged = function(v69, v70, v71) --[[ Line: 403 ]] --[[ Name: onTouchpadModeChanged ]]
    if v70 ~= v69.touchpad then
        return;
    else
        v69.touchpadMode = v71;
        if v71 == Enum.VRTouchpadMode.ABXY then
            v69:setABXYEnabled(true);
            return;
        else
            v69:setABXYEnabled(false);
            return;
        end;
    end;
end;
v6.destroy = function(v72) --[[ Line: 417 ]] --[[ Name: destroy ]]
    if v72.onTouchpadModeChangedConn then
        v72.onTouchpadModeChangedConn:disconnect();
        v72.onTouchpadModeChangedConn = nil;
    end;
    v72.model:Destroy();
end;
v6.getButtonPart = function(v73, v74) --[[ Line: 425 ]] --[[ Name: getButtonPart ]]
    -- upvalues: v4 (copy)
    local v75 = v4[v74];
    if v75 then
        return v73.parts[v75];
    else
        return nil;
    end;
end;
return v6;