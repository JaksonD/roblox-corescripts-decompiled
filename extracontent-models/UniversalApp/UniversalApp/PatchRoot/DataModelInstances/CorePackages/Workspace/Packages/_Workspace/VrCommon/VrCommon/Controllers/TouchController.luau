local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v3 = require(l_script_FirstAncestor_0.Flags.FIntVRTouchControllerTransparency);
local v4 = {
    [Enum.UserCFrame.RightHand] = {
        Body = {
            meshId = "rbxassetid://12954883737", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        Grip = {
            meshId = "rbxassetid://12954884971", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.015, -0.078, 0.005) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(-0.01, 0.005, 0) * CFrame.Angles(0, 0, -0.12217304763960307)
        }, 
        Stick = {
            meshId = "rbxassetid://12954884012", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.056, 0.027, -0.074) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        Trigger = {
            meshId = "rbxassetid://12954885295", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.014, -0.049, -0.131) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        MenuButton = {
            meshId = "rbxassetid://12954884231", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.07, 0.017, -0.017) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        ButtonA = {
            meshId = "rbxassetid://12954884749", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(0.011, 0.014, -0.026) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }, 
        ButtonB = {
            meshId = "rbxassetid://12954884464", 
            textureId = "rbxassetid://12954905146", 
            offset = CFrame.new(-0.013, 0.015, -0.07) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }
    }, 
    [Enum.UserCFrame.LeftHand] = {
        Body = {
            meshId = "rbxassetid://12954878407", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        Grip = {
            meshId = "rbxassetid://12954878772", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.015, -0.078, 0.005) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0.0125, 0.005, 0.001)
        }, 
        Stick = {
            meshId = "rbxassetid://12954879211", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.056, 0.027, -0.074) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        Trigger = {
            meshId = "rbxassetid://12954878599", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.014, -0.049, -0.131) * CFrame.Angles(0, 3.141592653589793, 0)
        }, 
        MenuButton = {
            meshId = "rbxassetid://12954879390", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.07, 0.017, -0.017) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.001, 0)
        }, 
        ButtonX = {
            meshId = "rbxassetid://12954879064", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(-0.011, 0.013, -0.026) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }, 
        ButtonY = {
            meshId = "rbxassetid://12954878913", 
            textureId = "rbxassetid://12954905425", 
            offset = CFrame.new(0.013, 0.015, -0.07) * CFrame.Angles(0, 3.141592653589793, 0), 
            moveOffset = CFrame.new(0, -0.005, 0)
        }
    }
};
local v5 = {
    [Enum.KeyCode.ButtonL1] = "Grip", 
    [Enum.KeyCode.ButtonL2] = "Trigger", 
    [Enum.KeyCode.ButtonL3] = "Stick", 
    [Enum.KeyCode.ButtonR1] = "Grip", 
    [Enum.KeyCode.ButtonR2] = "Trigger", 
    [Enum.KeyCode.ButtonR3] = "Stick", 
    [Enum.KeyCode.Thumbstick1] = "Stick", 
    [Enum.KeyCode.Thumbstick2] = "Stick", 
    [Enum.KeyCode.ButtonSelect] = "MenuButton", 
    [Enum.KeyCode.ButtonStart] = "MenuButton", 
    [Enum.KeyCode.ButtonA] = "ButtonA", 
    [Enum.KeyCode.ButtonB] = "ButtonB", 
    [Enum.KeyCode.ButtonX] = "ButtonX", 
    [Enum.KeyCode.ButtonY] = "ButtonY"
};
local l_Granite_0 = Enum.Material.Granite;
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 119 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy), l_Create_0 (copy), v4 (copy), l_Granite_0 (copy), v3 (copy)
    local v9 = setmetatable({}, v7);
    v9.userCFrame = v8;
    v9.model = l_Create_0("Model")({
        Name = "TouchController", 
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
    for v10, v11 in pairs(v4[v8]) do
        local v12 = Vector3.new(0.03200000151991844, 0.03200000151991844, 0.03200000151991844, 0);
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
            CanTouch = false, 
            Transparency = v3 / 100
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
    v9.model.PrimaryPart = v9.origin;
    return v9;
end;
v7.setCFrame = function(v16, v17) --[[ Line: 183 ]] --[[ Name: setCFrame ]]
    if v16.userCFrame == Enum.UserCFrame.RightHand then
        v16.model:SetPrimaryPartCFrame(v17 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(-0.03, 0.08, -0.06));
        return;
    else
        v16.model:SetPrimaryPartCFrame(v17 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(0.03, 0.08, -0.06));
        return;
    end;
end;
v7.setCFrameAndScale = function(v18, v19, v20) --[[ Line: 191 ]] --[[ Name: setCFrameAndScale ]]
    -- upvalues: v4 (copy)
    local v21 = v18.userCFrame == Enum.UserCFrame.RightHand and 1 or -1;
    v18.model:SetPrimaryPartCFrame(v19 * CFrame.Angles(0.3490658503988659, 0, 0) * CFrame.new(-0.03 * v20 * v21, 0.08 * v20, -0.06 * v20));
    if v18.scale ~= v20 then
        v18.scale = v20;
        for v22, v23 in pairs(v4[v18.userCFrame]) do
            local v24 = v18.parts[v22];
            if v24 then
                local v25 = Vector3.new(0.03200000151991844, 0.03200000151991844, 0.03200000151991844, 0);
                if v23.scale then
                    v25 = v25 * v23.scale;
                end;
                local l_Mesh_0 = v24:FindFirstChild("Mesh");
                local l_Weld_0 = v24:FindFirstChild("Weld");
                local l_offset_0 = v23.offset;
                local v29 = CFrame.new(l_offset_0.p * v18.scale) * (l_offset_0 - l_offset_0.p);
                v24.CFrame = v18.origin.CFrame * v29;
                if l_Mesh_0 then
                    l_Mesh_0.Scale = v25 * v18.scale;
                end;
                if l_Weld_0 then
                    l_Weld_0.C0 = v29;
                end;
            end;
        end;
    end;
end;
v7.setButtonState = function(v30, v31, v32) --[[ Line: 224 ]] --[[ Name: setButtonState ]]
    -- upvalues: v4 (copy)
    local v33 = v4[v30.userCFrame][v31];
    if not v33 then
        return;
    else
        local l_offset_1 = v33.offset;
        local l_moveOffset_0 = v33.moveOffset;
        if l_offset_1 and l_moveOffset_0 then
            l_offset_1 = CFrame.new(l_offset_1.p * v30.scale) * (l_offset_1 - l_offset_1.p);
            l_moveOffset_0 = CFrame.new(l_moveOffset_0.p * v30.scale) * (l_moveOffset_0 - l_moveOffset_0.p);
            local v36 = v30.parts[v31];
            if v36 then
                local l_Mesh_1 = v36:FindFirstChild("Mesh");
                local l_Weld_1 = v36:FindFirstChild("Weld");
                if l_Weld_1 then
                    if v32 then
                        v36.CFrame = v30.origin.CFrame * l_offset_1 * l_moveOffset_0;
                        l_Weld_1.C0 = l_offset_1 * l_moveOffset_0;
                    else
                        v36.CFrame = v30.origin.CFrame * l_offset_1;
                        l_Weld_1.C0 = l_offset_1;
                    end;
                end;
                if l_Mesh_1 then
                    if v32 then
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
v7.setTriggerState = function(v39, v40) --[[ Line: 261 ]] --[[ Name: setTriggerState ]]
    -- upvalues: v4 (copy)
    local l_offset_2 = v4[v39.userCFrame].Trigger.offset;
    l_offset_2 = CFrame.new(l_offset_2.p * v39.scale) * (l_offset_2 - l_offset_2.p);
    local l_Trigger_0 = v39.parts.Trigger;
    local l_Weld_2 = l_Trigger_0:FindFirstChild("Weld");
    if l_Weld_2 then
        local v44 = Vector3.new(0, 0.05000000074505806, 0.02500000037252903, 0) * v39.scale;
        local v45 = v40 * 0.3490658503988659 + 0;
        local v46 = l_offset_2 * CFrame.new(v44) * CFrame.Angles(v45, 0, 0) * CFrame.new(-v44);
        l_Trigger_0.CFrame = v39.origin.CFrame * v46;
        l_Weld_2.C0 = v46;
    end;
end;
v7.setStickState = function(v47, v48) --[[ Line: 278 ]] --[[ Name: setStickState ]]
    -- upvalues: v4 (copy)
    local l_offset_3 = v4[v47.userCFrame].Stick.offset;
    l_offset_3 = CFrame.new(l_offset_3.p * v47.scale) * (l_offset_3 - l_offset_3.p);
    local l_Stick_0 = v47.parts.Stick;
    local l_Weld_3 = l_Stick_0:FindFirstChild("Weld");
    if l_Weld_3 then
        local v52 = Vector3.new(-7.999999797903001E-4, -0.026900000870227814, 0.0013000000035390258, 0) * v47.scale;
        local v53 = v48.X * 0.3490658503988659 + 0;
        local v54 = v48.Y * 0.3490658503988659 + 0;
        local v55 = l_offset_3 * CFrame.new(v52) * CFrame.Angles(v54, 0, v53) * CFrame.new(-v52);
        l_Stick_0.CFrame = v47.origin.CFrame * v55;
        l_Weld_3.C0 = v55;
    end;
end;
v7.onInputPositionChanged = function(v56, v57) --[[ Line: 296 ]] --[[ Name: onInputPositionChanged ]]
    if v56.userCFrame == Enum.UserCFrame.RightHand and v57.KeyCode == Enum.KeyCode.ButtonR2 or v56.userCFrame == Enum.UserCFrame.LeftHand and v57.KeyCode == Enum.KeyCode.ButtonL2 then
        v56:setTriggerState(v57.Position.Z);
        return;
    elseif v56.userCFrame == Enum.UserCFrame.RightHand and v57.KeyCode == Enum.KeyCode.Thumbstick2 or v56.userCFrame == Enum.UserCFrame.LeftHand and v57.KeyCode == Enum.KeyCode.Thumbstick1 then
        v56:setStickState(v57.Position);
        return;
    else
        return;
    end;
end;
v7.onButtonInputChanged = function(v58, v59, v60) --[[ Line: 314 ]] --[[ Name: onButtonInputChanged ]]
    -- upvalues: v5 (copy)
    if v58.userCFrame == Enum.UserCFrame.LeftHand and v59.KeyCode == Enum.KeyCode.ButtonL1 or v58.userCFrame == Enum.UserCFrame.RightHand and v59.KeyCode == Enum.KeyCode.ButtonR1 or v58.userCFrame == Enum.UserCFrame.LeftHand and v59.KeyCode == Enum.KeyCode.ButtonL3 or v58.userCFrame == Enum.UserCFrame.RightHand and v59.KeyCode == Enum.KeyCode.ButtonR3 or v58.userCFrame == Enum.UserCFrame.LeftHand and v59.KeyCode == Enum.KeyCode.ButtonSelect or v58.userCFrame == Enum.UserCFrame.RightHand and v59.KeyCode == Enum.KeyCode.ButtonStart or v59.KeyCode == Enum.KeyCode.ButtonA or v59.KeyCode == Enum.KeyCode.ButtonB or v59.KeyCode == Enum.KeyCode.ButtonX or v59.KeyCode == Enum.KeyCode.ButtonY then
        v58:setButtonState(v5[v59.KeyCode], v60);
    end;
end;
v7.onInputBegan = function(v61, v62) --[[ Line: 335 ]] --[[ Name: onInputBegan ]]
    v61:onButtonInputChanged(v62, true);
end;
v7.onInputChanged = function(v63, v64) --[[ Line: 339 ]] --[[ Name: onInputChanged ]]
    v63:onInputPositionChanged(v64);
end;
v7.onInputEnded = function(v65, v66) --[[ Line: 343 ]] --[[ Name: onInputEnded ]]
    v65:onInputPositionChanged(v66);
    v65:onButtonInputChanged(v66, false);
end;
v7.onTouchpadModeChanged = function(_, _, _) --[[ Line: 348 ]] --[[ Name: onTouchpadModeChanged ]]

end;
v7.destroy = function(v70) --[[ Line: 350 ]] --[[ Name: destroy ]]
    v70.model:Destroy();
end;
v7.getButtonPart = function(v71, v72) --[[ Line: 354 ]] --[[ Name: getButtonPart ]]
    -- upvalues: v5 (copy)
    local v73 = v5[v72];
    if v73 then
        return v71.parts[v73];
    else
        return nil;
    end;
end;
return v7;