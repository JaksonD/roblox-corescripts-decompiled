local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local v6 = require(l_script_FirstAncestor_0.VRUtil);
local l_Create_0 = require(l_Parent_0.AppCommonLib).Create;
local v8 = "Panel3DRenderStep-" .. game:GetService("HttpService"):GenerateGUID();
local v9 = Vector2.new(0, 0);
local v10 = CFrame.new(0, -0.5, -5.5);
local v11 = CFrame.new(0, 0, -3);
local v12 = CFrame.new(0, 0, -0.1) * CFrame.Angles(0, 3.141592653589793, 0);
local v13 = nil;
local v14 = nil;
local v15 = 1e999;
local v16 = nil;
local l_v9_0 = v9;
local v18 = {};
local v19 = l_Create_0("ImageLabel")({
    Image = "rbxasset://textures/Cursors/Gamepad/Pointer.png", 
    ImageColor3 = Color3.new(0, 1, 0), 
    BackgroundTransparency = 1, 
    ZIndex = 1000000000
});
local v20 = l_Create_0("Folder")({
    Name = "VRCorePanelParts", 
    Archivable = false
});
local v21 = l_Create_0("Folder")({
    Name = "VRCoreEffectParts", 
    Archivable = false
});
pcall(function() --[[ Line: 57 ]]
    -- upvalues: l_GuiService_0 (copy), v20 (copy), v21 (copy)
    l_GuiService_0.CoreGuiFolder = v20;
    l_GuiService_0.CoreEffectFolder = v21;
end);
local v56 = {
    Type = {
        None = 0, 
        Standard = 1, 
        Fixed = 2, 
        HorizontalFollow = 3, 
        FixedToHead = 4, 
        NewStandard = 5, 
        WristView = 6, 
        PositionLocked = 7, 
        UIManagerManaged = 8
    }, 
    OnPanelClosed = l_Create_0("BindableEvent")({
        Name = "OnPanelClosed"
    }), 
    GetHeadLookXZ = function(v22) --[[ Line: 81 ]] --[[ Name: GetHeadLookXZ ]]
        -- upvalues: l_VRService_0 (copy)
        local l_l_VRService_0_UserCFrame_0 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local l_lookVector_0 = l_l_VRService_0_UserCFrame_0.lookVector;
        local v25 = math.atan2(-l_lookVector_0.Z, l_lookVector_0.X) - 1.5707963267948966;
        local v26 = CFrame.Angles(0, v25, 0);
        if v22 then
            v26 = v26 + l_l_VRService_0_UserCFrame_0.p;
        end;
        return v26;
    end, 
    FindContainerOf = function(v27) --[[ Line: 93 ]] --[[ Name: FindContainerOf ]]
        -- upvalues: v18 (copy)
        for _, v29 in pairs(v18) do
            if v29.gui and v29.gui:IsAncestorOf(v27) then
                return v29;
            else
                for _, v31 in pairs(v29.subpanels) do
                    if v31.gui and v31.gui:IsAncestorOf(v27) then
                        return v29;
                    end;
                end;
            end;
        end;
        return nil;
    end, 
    SetModalPanel = function(v32) --[[ Line: 107 ]] --[[ Name: SetModalPanel ]]
        -- upvalues: v13 (ref), v14 (ref)
        if v13 == v32 then
            return;
        else
            if v13 then
                v13:OnModalChanged(false);
            end;
            if v32 then
                v32:OnModalChanged(true);
            end;
            v14 = v13;
            v13 = v32;
            return;
        end;
    end, 
    RaycastOntoPanel = function(v33, v34, v35, v36) --[[ Line: 121 ]] --[[ Name: RaycastOntoPanel ]]
        -- upvalues: v6 (copy)
        local l_Size_0 = v33.Size;
        local l_Z_0 = l_Size_0.Z;
        local l_X_0 = l_Size_0.X;
        local l_Y_0 = l_Size_0.Y;
        local l_v33_RenderCFrame_0 = v33:GetRenderCFrame();
        local l_lookVector_1 = l_v33_RenderCFrame_0.lookVector;
        local v43 = l_v33_RenderCFrame_0.p + l_lookVector_1 * l_Z_0 * 0.5;
        local v44 = v6.RayPlaneIntersection(v36, l_lookVector_1, v43);
        if v44 then
            local l_X_1 = v34.AbsoluteSize.X;
            local l_Y_1 = v34.AbsoluteSize.Y;
            local v47 = l_v33_RenderCFrame_0:pointToObjectSpace(v44) * Vector3.new(-1, 1, 1, 0) + Vector3.new(l_X_0 / 2, -l_Y_0 / 2, 0);
            local v48 = Vector2.new(v47.X / l_X_0 * l_X_1, v47.Y / l_Y_0 * -l_Y_1);
            local l_X_2 = v48.X;
            local l_Y_2 = v48.Y;
            local l_X_3 = v35.AbsolutePosition.X;
            local l_Y_3 = v35.AbsolutePosition.Y;
            local l_X_4 = v35.AbsoluteSize.X;
            local l_Y_4 = v35.AbsoluteSize.Y;
            local v55 = false;
            if v34.Enabled and l_X_3 <= l_X_2 and l_X_2 <= l_X_3 + l_X_4 and l_Y_3 <= l_Y_2 and l_Y_2 <= l_Y_3 + l_Y_4 then
                v55 = true;
            end;
            return v44, v47, v48, v55;
        else
            return nil, nil, nil, false;
        end;
    end
};
local v57 = {};
v57.__index = v57;
v57.new = function(v58) --[[ Line: 169 ]] --[[ Name: new ]]
    -- upvalues: v56 (copy), v18 (copy), v57 (copy)
    local v59 = {
        name = v58, 
        part = false, 
        gui = false, 
        width = 1, 
        height = 1, 
        isVisible = false, 
        isEnabled = false, 
        panelType = v56.Type.None, 
        pixelScale = 1, 
        showCursor = true, 
        canFade = true, 
        shouldFindLookAtGuiElement = false, 
        ignoreModal = false, 
        needsPositionUpdate = false, 
        alwaysUpdatePosition = false, 
        linkedTo = false, 
        subpanels = {}, 
        transparency = 0, 
        forceShowUntilLookedAt = false, 
        forceShowUntilTick = 0, 
        isLookedAt = false, 
        isWristHeldUp = false, 
        isOffscreen = true, 
        lookAtPixel = Vector2.new(-1, -1), 
        cursorPos = Vector2.new(-1, -1), 
        lookAtDistance = 1e999, 
        lookAtGuiElement = false, 
        isClosest = true, 
        localCF = CFrame.new(), 
        originCF = CFrame.new(), 
        angleFromHorizon = false, 
        angleFromForward = false, 
        distance = 0, 
        lerpTime = 0, 
        lerpInitialCF = nil, 
        lerpScaleSize = Vector2.new(0, 0), 
        lerpInitialSize = Vector2.new(0, 0), 
        FollowView = true, 
        LastFollowCF = nil, 
        LastCameraPos = Vector3.new(0, 0, 0, 0), 
        wristTargetPosition = Vector3.new()
    };
    if v18[v58] then
        error("A panel by the name of " .. v58 .. " already exists.");
    end;
    v18[v58] = v59;
    return (setmetatable(v59, v57));
end;
v57.GetPart = function(v60) --[[ Line: 232 ]] --[[ Name: GetPart ]]
    -- upvalues: l_Create_0 (copy), v20 (copy)
    if not v60.part then
        v60.part = l_Create_0("Part")({
            Name = v60.name, 
            Parent = v20, 
            Transparency = 1, 
            CanCollide = false, 
            CanTouch = false, 
            Anchored = true, 
            Size = Vector3.new(1, 1, 0.20000000298023224, 0)
        });
    end;
    return v60.part;
end;
v57.GetGUI = function(v61) --[[ Line: 250 ]] --[[ Name: GetGUI ]]
    -- upvalues: l_Create_0 (copy), l_CoreGui_0 (copy)
    if not v61.gui then
        local l_v61_Part_0 = v61:GetPart();
        v61.gui = l_Create_0("SurfaceGui")({
            Parent = l_CoreGui_0, 
            Name = v61.name, 
            Archivable = false, 
            Adornee = l_v61_Part_0, 
            Active = true, 
            ToolPunchThroughDistance = 1000, 
            CanvasSize = v61.CanvasSize or Vector2.new(1000, 1000), 
            Enabled = v61.isEnabled, 
            AlwaysOnTop = true
        });
    end;
    return v61.gui;
end;
v57.FindHoveredGuiElement = function(v63, v64) --[[ Line: 268 ]] --[[ Name: FindHoveredGuiElement ]]
    local l_X_5 = v63.lookAtPixel.X;
    local l_Y_5 = v63.lookAtPixel.Y;
    for v67, v68 in pairs(v64) do
        local l_AbsolutePosition_0 = v68.AbsolutePosition;
        local v70 = v68.AbsolutePosition + v68.AbsoluteSize;
        if l_AbsolutePosition_0.X <= l_X_5 and l_X_5 <= v70.X and l_AbsolutePosition_0.Y <= l_Y_5 and l_Y_5 <= v70.Y then
            return v68, v67;
        end;
    end;
end;
v57.SetPartCFrame = function(v71, v72) --[[ Line: 282 ]] --[[ Name: SetPartCFrame ]]
    -- upvalues: v12 (copy)
    v71:GetPart().CFrame = v72 * v12;
end;
v57.SetEnabled = function(v73, v74) --[[ Line: 286 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v20 (copy)
    if v73.isEnabled == v74 then
        return;
    else
        v73.isEnabled = v74;
        if v74 then
            v73:GetPart().Parent = v20;
            v73:GetGUI().Enabled = true;
            for _, v76 in pairs(v73.subpanels) do
                v76:SetEnabled(v76:GetEnabled());
            end;
        else
            v73:GetPart().Parent = nil;
            v73:GetGUI().Enabled = false;
            for _, v78 in pairs(v73.subpanels) do
                v78:SetEnabled(v78:GetEnabled());
            end;
        end;
        v73:OnEnabled(v74);
        return;
    end;
end;
v57.StartLerp = function(v79, v80) --[[ Line: 309 ]] --[[ Name: StartLerp ]]
    -- upvalues: v56 (copy)
    if v79.panelType == v56.Type.UIManagerManaged then
        return;
    else
        v79.lerpInitialCF = v79:GetPart().CFrame * CFrame.new(0, -1.5, 0);
        v79.lerpTime = 1;
        v79.lerpInitialSize = Vector2.new(v79.width, v79.height);
        v79.lerpScaleSize = v80 and v80 or Vector2.new(0, 0);
        return;
    end;
end;
v57.EvaluatePositioning = function(v81, v82, v83, v84, v85) --[[ Line: 320 ]] --[[ Name: EvaluatePositioning ]]
    -- upvalues: v56 (copy), v10 (copy), l_VRService_0 (copy), v11 (copy), v6 (copy)
    if v81.panelType == v56.Type.UIManagerManaged then
        return;
    else
        if v81.panelType == v56.Type.Fixed then
            v81:SetPartCFrame(v82 * (v81.localCF - v81.localCF.p + v81.localCF.p * workspace.CurrentCamera.HeadScale));
        elseif v81.panelType == v56.Type.HorizontalFollow then
            local l_lookVector_2 = v84.lookVector;
            v81:SetPartCFrame(v82 * (CFrame.new(v84.p, v84.p + l_lookVector_2 * Vector3.new(1, 0, 1, 0)) * v81.angleFromForward * v81.angleFromHorizon * CFrame.new(0, 0, workspace.CurrentCamera.HeadScale * -v81.distance)));
        elseif v81.panelType == v56.Type.FixedToHead then
            v81:SetPartCFrame(v83 * (v81.localCF - v81.localCF.p + v81.localCF.p * workspace.CurrentCamera.HeadScale));
        elseif v81.panelType == v56.Type.Standard then
            if v81.needsPositionUpdate or v81.alwaysUpdatePosition then
                v81.needsPositionUpdate = false;
                local v87 = v56.GetHeadLookXZ(true);
                local v88 = v10.Position * workspace.CurrentCamera.HeadScale;
                v81.originCF = v87 * CFrame.new(v88);
            end;
            v81:SetPartCFrame(v82 * v81.originCF * v81.localCF);
        elseif v81.panelType == v56.Type.NewStandard then
            if v81.needsPositionUpdate or v81.alwaysUpdatePosition then
                v81.needsPositionUpdate = false;
                local l_l_VRService_0_UserCFrame_1 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                local v90 = v11.Position * workspace.CurrentCamera.HeadScale;
                v81.originCF = l_l_VRService_0_UserCFrame_1 * CFrame.new(v90);
            end;
            v81:SetPartCFrame(v82 * v81.originCF * v81.localCF);
        elseif v81.panelType == v56.Type.WristView then
            if l_VRService_0:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) then
                if v81.needsPositionUpdate or v81.alwaysUpdatePosition then
                    v81.needsPositionUpdate = false;
                    local v91 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand).Position * workspace.CurrentCamera.HeadScale;
                    v81.originCF = CFrame.new(v91);
                end;
                local v92 = v82 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
                local l_Position_0 = (v82 * v81.originCF).Position;
                if v81.distance > 0 then
                    l_Position_0 = Vector3.new(l_Position_0.x, v92.Position.y - 0.33, l_Position_0.z);
                    local v94 = math.clamp((l_Position_0 - v92.Position).Magnitude, v81.distance - 0.5, v81.distance + 0.5);
                    local v95 = (l_Position_0 - v92.Position).Unit * v94;
                    l_Position_0 = v92.Position + v95;
                end;
                local v96 = Vector3.new(v92.Position.x, l_Position_0.y, v92.Position.z);
                local v97 = CFrame.new(l_Position_0, v96);
                v81:GetPart().CFrame = v97;
            else
                v81:SetPartCFrame(v82 * (v81.localCF - v81.localCF.p + v81.localCF.p * workspace.CurrentCamera.HeadScale));
            end;
        elseif v81.panelType == v56.Type.PositionLocked then
            local v98 = v6.GetUserCFrameWorldSpace(Enum.UserCFrame.Head);
            if not v81.LastFollowCF then
                v81.LastFollowCF = v98;
            end;
            if (v81.LastCameraPos - v82.Position).Magnitude > 0.1 then
                v81.LastFollowCF = v98;
            end;
            v81.LastCameraPos = v82.Position;
            if v81.LastFollowCF.LookVector:Dot(v98.LookVector) < 0.85 then
                v81.FollowView = true;
            elseif v81.LastFollowCF.LookVector:Dot(v98.LookVector) > 0.99 then
                v81.FollowView = false;
            end;
            if v81.FollowView then
                v81.LastFollowCF = v81.LastFollowCF:Lerp(v98, 0.1);
            end;
            local v99 = v98.Position + v81.LastFollowCF.LookVector * (v81.distance * workspace.CurrentCamera.HeadScale + 0.1);
            v99 = Vector3.new(v99.X, v98.Position.Y - 0.5 * workspace.CurrentCamera.HeadScale, v99.Z);
            local v100 = Vector3.new(v98.Position.x, v99.y, v98.Position.z);
            local v101 = CFrame.new(v99, v100);
            v81:GetPart().CFrame = v101;
        end;
        if v81.lerpInitialCF and v81.lerpTime > 0 then
            local l_CFrame_0 = v81:GetPart().CFrame;
            v81.lerpTime = v81.lerpTime - v85 * 4;
            local v103 = math.clamp(1 - v81.lerpTime, 0, 1);
            l_CFrame_0 = v81.lerpInitialCF:Lerp(l_CFrame_0, v103);
            v81:GetPart().CFrame = l_CFrame_0;
            if v81.lerpScaleSize.x > 0 or v81.lerpScaleSize.y > 0 then
                local v104 = v81.lerpInitialSize:Lerp(v81.lerpScaleSize, v103);
                v81:ResizeStuds(v104.x, v104.y, v81.pixelsPerStud);
            end;
        end;
        return;
    end;
end;
v57.SetLookedAt = function(v105, v106) --[[ Line: 462 ]] --[[ Name: SetLookedAt ]]
    if not v105.isLookedAt and v106 then
        v105.isLookedAt = true;
        v105:OnMouseEnter(v105.lookAtPixel.X, v105.lookAtPixel.Y);
        if v105.forceShowUntilLookedAt then
            v105.forceShowUntilLookedAt = false;
            return;
        end;
    elseif v105.isLookedAt and not v106 then
        v105.isLookedAt = false;
        v105:OnMouseLeave(v105.lookAtPixel.X, v105.lookAtPixel.Y);
    end;
end;
v57.EvaluateGaze = function(v107, v108, v109, _, _, v112) --[[ Line: 475 ]] --[[ Name: EvaluateGaze ]]
    -- upvalues: v9 (copy), v56 (copy), l_v9_0 (ref), v16 (ref), l_VRService_0 (copy), v15 (ref)
    v107.isClosest = false;
    v107.lookAtPixel = v9;
    v107.lookAtDistance = 1e999;
    local v113 = nil;
    local v114 = 0;
    for _, v116 in pairs(v107.subpanels) do
        if v116.part and v116.guiElement then
            local v117, _, v119, v120 = v56.RaycastOntoPanel(v116.part, v116.gui, v116.guiElement, v112);
            if v117 then
                v116.lookAtPixel = v119;
                v116.cursorPos = v119;
                if v120 and v114 < v116.depthOffset then
                    v113 = v116;
                    v114 = v116.depthOffset;
                end;
            end;
        end;
    end;
    if v113 and v113.depthOffset > 0 then
        l_v9_0 = v113.cursorPos;
        v16 = v113;
        for _, v122 in pairs(v107.subpanels) do
            if v122 ~= v113 then
                v122:SetLookedAt(false);
            end;
        end;
        v113:SetLookedAt(true);
    end;
    if v107.panelType == v56.Type.WristView then
        v107.isWristHeldUp = false;
        local l_l_VRService_0_UserCFrame_2 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.LeftHand);
        local v124 = l_l_VRService_0_UserCFrame_2.Position * workspace.CurrentCamera.HeadScale;
        local v125 = v108 * CFrame.new(v124);
        if v107.distance == 0 then
            local v126 = v108 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
            local l_Position_1 = v125.Position;
            l_Position_1 = Vector3.new(l_Position_1.x, v126.Position.y - 0.33, l_Position_1.z);
            local v128 = math.clamp((l_Position_1 - v126.Position).Magnitude, 0.5, 1);
            local v129 = (l_Position_1 - v126.Position).Unit * v128;
            v107.isWristHeldUp = (v126.Position + v129 - v125.Position).Magnitude < 0.25;
        else
            local l_l_VRService_0_UserCFrame_3 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.RightHand);
            local v131 = l_l_VRService_0_UserCFrame_2.Position - l_l_VRService_0_UserCFrame_3.Position;
            local v132 = l_l_VRService_0_UserCFrame_3.LookVector:Dot(v131);
            local v133 = l_l_VRService_0_UserCFrame_3.Position + l_l_VRService_0_UserCFrame_3.LookVector * v132;
            if (l_l_VRService_0_UserCFrame_2.Position - v133).Magnitude < 0.5 then
                v107.isWristHeldUp = true;
            end;
        end;
    end;
    local l_v107_GUI_0 = v107:GetGUI();
    local v135, _, v137, v138 = v56.RaycastOntoPanel(v107:GetPart(), l_v107_GUI_0, l_v107_GUI_0, v112);
    if v135 then
        v107.isOffscreen = false;
        v107.lookAtPixel = v137;
        v107.cursorPos = v137;
        v107:SetLookedAt(v138);
        v107.lookAtDistance = (v135 - v109.p).magnitude;
        if v107.isLookedAt and v107.lookAtDistance < v15 and v107.showCursor then
            v15 = v107.lookAtDistance;
            v16 = v107;
            if not v113 then
                l_v9_0 = v107.cursorPos;
                return;
            end;
        end;
    else
        v107.isOffscreen = true;
        if v107.lookedAt then
            v107.lookedAt = false;
            v107:OnMouseLeave(v107.lookAtPixel.X, v107.lookAtPixel.Y);
        end;
    end;
end;
v57.EvaluateTransparency = function(v139) --[[ Line: 581 ]] --[[ Name: EvaluateTransparency ]]
    -- upvalues: v56 (copy)
    if v139.panelType == v56.Type.UIManagerManaged then
        v139.transparency = 1;
        return;
    elseif v139.forceShowUntilLookedAt or not v139.canFade or v139.forceShowUntilTick > tick() then
        v139.transparency = 0;
        return;
    elseif v139.isLookedAt then
        v139.transparency = 0;
        return;
    elseif v139.isOffscreen then
        v139.transparency = 1;
        return;
    else
        v139.transparency = v139:CalculateTransparency();
        return;
    end;
end;
v57.Update = function(v140, v141, v142, v143, v144, v145, v146) --[[ Line: 607 ]] --[[ Name: Update ]]
    -- upvalues: v13 (ref)
    if (v140.forceShowUntilLookedAt or v140.forceShowUntilTick > tick()) and not v140.part then
        v140:GetPart();
        v140:GetGUI();
    end;
    if not v140.part then
        return;
    else
        local v147 = v13 == v140 or v140.linkedTo and v140.linkedTo == v13;
        if v13 and not v147 then
            v140:SetEnabled(false);
            return;
        else
            v140:PreUpdate(v141, v142, v143, v144, v146);
            if v140.isVisible then
                v140:EvaluatePositioning(v141, v142, v143, v146);
                for _, v149 in pairs(v140.subpanels) do
                    v149:Update();
                end;
                v140:EvaluateGaze(v141, v142, v143, v144, v145);
                v140:EvaluateTransparency(v141, v142);
                return;
            else
                if v140.alwaysUpdatePosition then
                    v140:EvaluatePositioning(v141, v142, v143, v146);
                end;
                return;
            end;
        end;
    end;
end;
v57.PreUpdate = function(_, _, _, _, _, _) --[[ Line: 644 ]] --[[ Name: PreUpdate ]]

end;
v57.OnUpdate = function(_, _) --[[ Line: 647 ]] --[[ Name: OnUpdate ]]

end;
v57.OnMouseEnter = function(_, _, _) --[[ Line: 650 ]] --[[ Name: OnMouseEnter ]]

end;
v57.OnMouseLeave = function(_, _, _) --[[ Line: 653 ]] --[[ Name: OnMouseLeave ]]

end;
v57.OnEnabled = function(_, _) --[[ Line: 656 ]] --[[ Name: OnEnabled ]]

end;
v57.OnModalChanged = function(_, _) --[[ Line: 659 ]] --[[ Name: OnModalChanged ]]

end;
v57.OnVisibilityChanged = function(_, _) --[[ Line: 662 ]] --[[ Name: OnVisibilityChanged ]]

end;
v57.CalculateTransparency = function(v170) --[[ Line: 665 ]] --[[ Name: CalculateTransparency ]]
    if not v170.canFade then
        return 0;
    else
        local l_X_6 = v170.gui.AbsoluteSize.X;
        local l_Y_6 = v170.gui.AbsoluteSize.Y;
        local l_X_7 = v170.lookAtPixel.X;
        local l_Y_7 = v170.lookAtPixel.Y;
        local v175 = l_X_7 < 0 and -l_X_7 or l_X_7 - l_X_6;
        local v176 = l_Y_7 < 0 and -l_Y_7 or l_Y_7 - l_Y_6;
        if l_X_7 > 0 and l_X_7 < l_X_6 then
            v175 = 0;
        end;
        if l_Y_7 > 0 and l_Y_7 < l_Y_6 then
            v176 = 0;
        end;
        return (math.max(0, (math.min(1, (math.sqrt(v175 ^ 2 + v176 ^ 2) - 10) / 20))));
    end;
end;
v57.ResizeStuds = function(v177, v178, v179, v180) --[[ Line: 695 ]] --[[ Name: ResizeStuds ]]
    -- upvalues: v56 (copy)
    if v177.panelType == v56.Type.UIManagerManaged then
        return;
    else
        v180 = v180 or 64;
        v177.width = v178;
        v177.height = v179;
        v177.pixelScale = v180 / 64;
        local l_v177_Part_0 = v177:GetPart();
        l_v177_Part_0.Size = Vector3.new(v177.width * workspace.CurrentCamera.HeadScale, v177.height * workspace.CurrentCamera.HeadScale, 0.2);
        local l_v177_GUI_0 = v177:GetGUI();
        l_v177_GUI_0.CanvasSize = Vector2.new(v180 * v177.width, v180 * v177.height);
        for _, v184 in pairs(v177.subpanels) do
            if v184.part then
                v184.part.Size = l_v177_Part_0.Size;
            end;
            if v184.gui then
                v184.gui.CanvasSize = l_v177_GUI_0.CanvasSize;
            end;
        end;
        return;
    end;
end;
v57.ResizePixels = function(v185, v186, v187, v188) --[[ Line: 726 ]] --[[ Name: ResizePixels ]]
    v188 = v188 or 64;
    v185:ResizeStuds(v186 / v188, v187 / v188, v188);
end;
v57.OnHeadScaleChanged = function(v189) --[[ Line: 734 ]] --[[ Name: OnHeadScaleChanged ]]
    local v190 = v189.pixelScale * 64;
    v189:ResizeStuds(v189.width, v189.height, v190);
end;
v57.SetType = function(v191, v192, v193) --[[ Line: 739 ]] --[[ Name: SetType ]]
    -- upvalues: v56 (copy)
    v191.panelType = v192;
    v191.localCF = CFrame.new();
    v191.angleFromHorizon = false;
    v191.angleFromForward = false;
    v191.distance = 0;
    if not v193 then
        v193 = {};
    end;
    if v192 == v56.Type.None then
        return;
    elseif v192 == v56.Type.Standard then
        v191.localCF = v193.CFrame or CFrame.new();
        return;
    elseif v192 == v56.Type.Fixed then
        v191.localCF = v193.CFrame or CFrame.new();
        return;
    elseif v192 == v56.Type.HorizontalFollow then
        v191.angleFromHorizon = CFrame.Angles(v193.angleFromHorizon or 0, 0, 0);
        v191.angleFromForward = CFrame.Angles(0, v193.angleFromForward or 0, 0);
        v191.distance = v193.distance or 5;
        return;
    elseif v192 == v56.Type.FixedToHead then
        v191.localCF = v193.CFrame or CFrame.new();
        return;
    elseif v192 == v56.Type.NewStandard then
        v191.localCF = v193.CFrame or CFrame.new();
        return;
    elseif v192 == v56.Type.WristView then
        v191.localCF = v193.CFrame or CFrame.new();
        v191.distance = 0;
        return;
    elseif v192 == v56.Type.PositionLocked then
        v191.localCF = v193.CFrame or CFrame.new();
        return;
    elseif v192 == v56.Type.UIManagerManaged then
        v191.part = v193.uiManagerPanelPart;
        return;
    else
        error("Invalid Panel type");
        return;
    end;
end;
v57.IsUIManagerManagedType = function(v194) --[[ Line: 781 ]] --[[ Name: IsUIManagerManagedType ]]
    -- upvalues: v56 (copy)
    return v194.panelType == v56.Type.UIManagerManaged;
end;
v57.IsPositionLockedType = function(v195) --[[ Line: 785 ]] --[[ Name: IsPositionLockedType ]]
    -- upvalues: v56 (copy)
    return v195.panelType == v56.Type.PositionLocked;
end;
v57.SetVisible = function(v196, v197, v198) --[[ Line: 789 ]] --[[ Name: SetVisible ]]
    -- upvalues: v56 (copy), l_VRService_0 (copy), v11 (copy), v13 (ref), v14 (ref)
    if v197 ~= v196.isVisible then
        v196:OnVisibilityChanged(v197);
        if not v197 then
            v56.OnPanelClosed:Fire(v196.name);
        else
            v196.needsPositionUpdate = true;
            if v196.panelType == v56.Type.WristView then
                v196.originCF = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head) * v11;
            end;
        end;
    end;
    v196.isVisible = v197;
    v196:SetEnabled(v197);
    if v197 and v198 then
        v56.SetModalPanel(v196);
    end;
    if not v197 and v13 == v196 then
        if v198 then
            v56.SetModalPanel(v14);
        else
            v56.SetModalPanel(nil);
            if v14 == v196 then
                v14 = nil;
            end;
        end;
    end;
    if not v197 and v196.forceShowUntilLookedAt then
        v196.forceShowUntilLookedAt = false;
    end;
end;
v57.IsVisible = function(v199) --[[ Line: 829 ]] --[[ Name: IsVisible ]]
    return v199.isVisible;
end;
v57.LinkTo = function(v200, v201) --[[ Line: 833 ]] --[[ Name: LinkTo ]]
    -- upvalues: v56 (copy)
    if type(v201) == "string" then
        v200.linkedTo = v56.Get(v201);
        return;
    else
        v200.linkedTo = v201;
        return;
    end;
end;
v57.ForceShowUntilLookedAt = function(v202, v203) --[[ Line: 841 ]] --[[ Name: ForceShowUntilLookedAt ]]
    v202:GetPart();
    v202:GetGUI();
    v202:SetVisible(true, v203);
    v202:RequestPositionUpdate();
    v202.forceShowUntilLookedAt = true;
end;
v57.ForceShowForSeconds = function(v204, v205) --[[ Line: 851 ]] --[[ Name: ForceShowForSeconds ]]
    v204:GetPart();
    v204:GetGUI();
    v204:SetVisible(true);
    if v204.forceShowUntilTick < tick() then
        v204:RequestPositionUpdate();
    end;
    v204.forceShowUntilTick = tick() + v205;
end;
v57.SetCanFade = function(v206, v207) --[[ Line: 862 ]] --[[ Name: SetCanFade ]]
    v206.canFade = v207;
end;
v57.RequestPositionUpdate = function(v208) --[[ Line: 866 ]] --[[ Name: RequestPositionUpdate ]]
    v208.needsPositionUpdate = true;
end;
v57.ForcePositionUpdate = function(v209, v210) --[[ Line: 870 ]] --[[ Name: ForcePositionUpdate ]]
    v209.alwaysUpdatePosition = v210;
end;
v57.GetGuiPositionInPanelSpace = function(v211, v212) --[[ Line: 874 ]] --[[ Name: GetGuiPositionInPanelSpace ]]
    local v213 = Vector2.new(v211.part.Size.X, v211.part.Size.Y);
    local l_AbsoluteSize_0 = v211.gui.AbsoluteSize;
    local v215 = (v212 - l_AbsoluteSize_0 / 2) / l_AbsoluteSize_0 * v213;
    return (Vector3.new(v215.X, v215.Y, 0.1));
end;
v57.GetCFrameInCameraSpace = function(v216) --[[ Line: 885 ]] --[[ Name: GetCFrameInCameraSpace ]]
    -- upvalues: v56 (copy)
    if v216.panelType == v56.Type.Standard or v216.panelType == v56.Type.NewStandard then
        return v216.originCF * v216.localCF;
    else
        return v216.localCF or CFrame.new();
    end;
end;
local v217 = {};
v217.__index = v217;
v217.new = function(v218, v219) --[[ Line: 896 ]] --[[ Name: new ]]
    -- upvalues: v217 (copy)
    local v220 = {
        parentPanel = v218, 
        guiElement = v219, 
        lastParent = v219.Parent, 
        ancestryConn = nil, 
        changedConn = nil, 
        lookAtPixel = Vector2.new(-1, -1), 
        cursorPos = Vector2.new(-1, -1), 
        lookedAt = false, 
        isEnabled = true, 
        part = nil, 
        gui = nil, 
        guiSurrogate = nil, 
        depthOffset = 0
    };
    setmetatable(v220, v217);
    v220:GetGUI();
    v220:UpdateSurrogate();
    v220:WatchParent(v220.lastParent);
    v219.Parent = v220.guiSurrogate;
    local function v221(_, v223) --[[ Line: 924 ]] --[[ Name: ancestryCallback ]]
        -- upvalues: v220 (copy), v219 (copy), v221 (copy)
        v220:GetGUI().Enabled = v220.parentPanel:GetGUI():IsAncestorOf(v220.lastParent);
        if not v220:GetGUI().Enabled then
            v220:GetPart().Parent = nil;
        else
            v220:GetPart().Parent = workspace.CurrentCamera;
        end;
        if v223 == v219 then
            v220.ancestryConn:disconnect();
            v220.lastParent = v219.Parent;
            v219.Parent = v220.guiSurrogate;
            v220:WatchParent(v220.lastParent);
            v220.ancestryConn = v219.AncestryChanged:connect(v221);
        end;
    end;
    v220.ancestryConn = v219.AncestryChanged:connect(v221);
    return v220;
end;
v217.Cleanup = function(v224) --[[ Line: 948 ]] --[[ Name: Cleanup ]]
    v224.guiElement.Parent = v224.lastParent;
    if v224.part then
        v224.part:Destroy();
        v224.part = nil;
    end;
    spawn(function() --[[ Line: 954 ]]
        -- upvalues: v224 (copy)
        wait();
        if v224.gui then
            v224.gui:Destroy();
            v224.gui = nil;
        end;
    end);
    if v224.ancestryConn then
        v224.ancestryConn:disconnect();
        v224.ancestryConn = nil;
    end;
    if v224.changedConn then
        v224.changedConn:disconnect();
        v224.changedConn = nil;
    end;
    v224.lastParent = nil;
    v224.parentPanel = nil;
    v224.guiElement = nil;
    v224.guiSurrogate = nil;
end;
v217.OnMouseEnter = function(_, _, _) --[[ Line: 975 ]] --[[ Name: OnMouseEnter ]]

end;
v217.OnMouseLeave = function(_, _, _) --[[ Line: 976 ]] --[[ Name: OnMouseLeave ]]

end;
v217.SetLookedAt = function(v231, v232) --[[ Line: 978 ]] --[[ Name: SetLookedAt ]]
    if v232 and not v231.lookedAt then
        v231:OnMouseEnter(v231.lookAtPixel.X, v231.lookAtPixel.Y);
    elseif not v232 and v231.lookedAt then
        v231:OnMouseLeave(v231.lookAtPixel.X, v231.lookAtPixel.Y);
    end;
    v231.lookedAt = v232;
end;
v217.WatchParent = function(v233, v234) --[[ Line: 987 ]] --[[ Name: WatchParent ]]
    if v233.changedConn then
        v233.changedConn:disconnect();
    end;
    v233.changedConn = v234.Changed:connect(function(v235) --[[ Line: 991 ]]
        -- upvalues: v233 (copy)
        if v235 == "AbsolutePosition" or v235 == "AbsoluteSize" or v235 == "Parent" then
            v233:UpdateSurrogate();
        end;
    end);
end;
v217.UpdateSurrogate = function(v236) --[[ Line: 998 ]] --[[ Name: UpdateSurrogate ]]
    local l_lastParent_0 = v236.lastParent;
    v236.guiSurrogate.Position = UDim2.new(0, l_lastParent_0.AbsolutePosition.X, 0, l_lastParent_0.AbsolutePosition.Y);
    v236.guiSurrogate.Size = UDim2.new(0, l_lastParent_0.AbsoluteSize.X, 0, l_lastParent_0.AbsoluteSize.Y);
end;
v217.GetPart = function(v238) --[[ Line: 1004 ]] --[[ Name: GetPart ]]
    -- upvalues: v20 (copy)
    if v238.part then
        return v238.part;
    else
        v238.part = v238.parentPanel:GetPart():Clone();
        v238.part.Parent = v20;
        return v238.part;
    end;
end;
v217.GetGUI = function(v239) --[[ Line: 1014 ]] --[[ Name: GetGUI ]]
    -- upvalues: l_Create_0 (copy), l_CoreGui_0 (copy)
    if v239.gui then
        return v239.gui;
    else
        v239.gui = l_Create_0("SurfaceGui")({
            Parent = l_CoreGui_0, 
            Adornee = v239:GetPart(), 
            Active = true, 
            ToolPunchThroughDistance = 1000, 
            CanvasSize = v239.parentPanel:GetGUI().CanvasSize, 
            Enabled = v239.parentPanel.isEnabled, 
            AlwaysOnTop = true
        });
        v239.guiSurrogate = l_Create_0("Frame")({
            Parent = v239.gui, 
            Active = false, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1
        });
        return v239.gui;
    end;
end;
v217.SetDepthOffset = function(v240, v241) --[[ Line: 1041 ]] --[[ Name: SetDepthOffset ]]
    v240.depthOffset = v241;
end;
v217.Update = function(v242) --[[ Line: 1045 ]] --[[ Name: Update ]]
    local l_v242_Part_0 = v242:GetPart();
    local l_Part_0 = v242.parentPanel:GetPart();
    if l_v242_Part_0 and l_Part_0 then
        l_v242_Part_0.CFrame = l_Part_0.CFrame * CFrame.new(0, 0, -v242.depthOffset);
    end;
end;
v217.SetEnabled = function(v245, v246) --[[ Line: 1054 ]] --[[ Name: SetEnabled ]]
    -- upvalues: v20 (copy)
    v245.isEnabled = v246;
    if v246 and v245.parentPanel.isEnabled then
        v245:GetPart().Parent = v20;
        v245:GetGUI().Enabled = true;
        return;
    else
        v245:GetPart().Parent = nil;
        v245:GetGUI().Enabled = false;
        return;
    end;
end;
v217.GetEnabled = function(v247) --[[ Line: 1067 ]] --[[ Name: GetEnabled ]]
    return v247.isEnabled;
end;
v217.GetPixelScale = function(v248) --[[ Line: 1071 ]] --[[ Name: GetPixelScale ]]
    return v248.parentPanel:GetPixelScale();
end;
v57.GetPixelScale = function(v249) --[[ Line: 1074 ]] --[[ Name: GetPixelScale ]]
    return v249.pixelScale;
end;
v57.AddSubpanel = function(v250, v251) --[[ Line: 1078 ]] --[[ Name: AddSubpanel ]]
    -- upvalues: v217 (copy)
    local v252 = v217.new(v250, v251);
    v250.subpanels[v251] = v252;
    return v252;
end;
v57.RemoveSubpanel = function(v253, v254) --[[ Line: 1084 ]] --[[ Name: RemoveSubpanel ]]
    local v255 = v253.subpanels[v254];
    if v255 then
        v255:Cleanup();
    end;
    v253.subpanels[v254] = nil;
end;
v57.SetSubpanelDepth = function(v256, v257, v258) --[[ Line: 1092 ]] --[[ Name: SetSubpanelDepth ]]
    local v259 = v256.subpanels[v257];
    if v258 == 0 then
        if v259 then
            v256:RemoveSubpanel(v257);
        end;
        return nil;
    else
        if not v259 then
            v259 = v256:AddSubpanel(v257);
        end;
        v259:SetDepthOffset(v258);
        return v259;
    end;
end;
v56.Get = function(v260) --[[ Line: 1114 ]] --[[ Name: Get ]]
    -- upvalues: v18 (copy), v57 (copy)
    local v261 = v18[v260];
    if not v18[v260] then
        v18[v260] = v57.new(v260);
        v261 = v18[v260];
    end;
    return v261;
end;
local v262 = tick();
local function v286() --[[ Line: 1126 ]] --[[ Name: onRenderStep ]]
    -- upvalues: l_VRService_0 (copy), v262 (ref), v16 (ref), v15 (ref), v18 (copy), v13 (ref), l_v9_0 (ref), v19 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        local v263 = tick();
        local v264 = v263 - v262;
        v262 = v263;
        v16 = nil;
        v15 = 1e999;
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local l_CFrame_1 = l_CurrentCamera_0.CFrame;
        local l_l_CurrentCamera_0_RenderCFrame_0 = l_CurrentCamera_0:GetRenderCFrame();
        local l_l_VRService_0_UserCFrame_4 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local v269 = Ray.new(l_l_CurrentCamera_0_RenderCFrame_0.p, l_l_CurrentCamera_0_RenderCFrame_0.lookVector);
        local l_GuiInputUserCFrame_0 = l_VRService_0.GuiInputUserCFrame;
        local v271 = l_CFrame_1 * l_VRService_0:GetUserCFrame(l_GuiInputUserCFrame_0);
        local v272 = Ray.new(v271.p, v271.lookVector);
        for _, v274 in pairs(v18) do
            v274:Update(l_CFrame_1, l_l_CurrentCamera_0_RenderCFrame_0, l_l_VRService_0_UserCFrame_4, v269, v272, v264);
        end;
        local v275 = {};
        for _, v277 in pairs(v18) do
            if not v275[v277] and v277.linkedTo and v277.isVisible and v277.linkedTo.isVisible then
                v275[v277] = true;
                v275[v277.linkedTo] = true;
                local v278 = math.min(v277.transparency, v277.linkedTo.transparency);
                v277.transparency = v278;
                v277.linkedTo.transparency = v278;
            end;
        end;
        for _, v280 in pairs(v18) do
            if v280.part and v280.gui then
                local v281 = v13 == v280 or v280.linkedTo and v280.linkedTo == v13;
                local l_isVisible_0 = v280.isVisible;
                if not v281 and v13 then
                    l_isVisible_0 = false;
                end;
                if v280.transparency >= 1 then
                    l_isVisible_0 = false;
                end;
                if v280.forceShowUntilLookedAt then
                    l_isVisible_0 = true;
                end;
                if not v280.canFade and v280.isVisible then
                    l_isVisible_0 = true;
                end;
                v280:SetEnabled(l_isVisible_0);
            end;
            v280:OnUpdate(v264);
        end;
        if v16 then
            local l_X_8 = l_v9_0.X;
            local l_Y_8 = l_v9_0.Y;
            local l_v16_PixelScale_0 = v16:GetPixelScale();
            v19.Size = UDim2.new(0, 3 * l_v16_PixelScale_0, 0, 3 * l_v16_PixelScale_0);
            v19.Position = UDim2.new(0, l_X_8 - v19.AbsoluteSize.x * 0.5, 0, l_Y_8 - v19.AbsoluteSize.y * 0.5);
            return;
        else
            v19.Parent = nil;
            return;
        end;
    end;
end;
local v287 = true;
local function _(v288) --[[ Line: 1212 ]] --[[ Name: putFoldersIn ]]
    -- upvalues: v20 (copy), v21 (copy)
    v20.Parent = v288;
    v21.Parent = v288;
end;
local v290 = nil;
local function v293() --[[ Line: 1218 ]] --[[ Name: onHeadScaleChanged ]]
    -- upvalues: v18 (copy)
    for _, v292 in pairs(v18) do
        v292:OnHeadScaleChanged();
    end;
end;
local v294 = nil;
local function v305() --[[ Line: 1225 ]] --[[ Name: onCameraCFrameChanged ]]
    -- upvalues: l_VRService_0 (copy), v18 (copy)
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local l_CFrame_2 = l_CurrentCamera_1.CFrame;
    local l_l_CurrentCamera_1_RenderCFrame_0 = l_CurrentCamera_1:GetRenderCFrame();
    local l_l_VRService_0_UserCFrame_5 = l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
    local v299 = Ray.new(l_l_CurrentCamera_1_RenderCFrame_0.p, l_l_CurrentCamera_1_RenderCFrame_0.lookVector);
    local l_GuiInputUserCFrame_1 = l_VRService_0.GuiInputUserCFrame;
    local v301 = l_CFrame_2 * l_VRService_0:GetUserCFrame(l_GuiInputUserCFrame_1);
    local v302 = Ray.new(v301.p, v301.lookVector);
    for _, v304 in pairs(v18) do
        v304:Update(l_CFrame_2, l_l_CurrentCamera_1_RenderCFrame_0, l_l_VRService_0_UserCFrame_5, v299, v302, 0);
    end;
end;
local function v309() --[[ Line: 1241 ]] --[[ Name: onCurrentCameraChanged ]]
    -- upvalues: v18 (copy), v290 (ref), v293 (copy), v294 (ref), v305 (copy), l_VRService_0 (copy), v287 (ref), v20 (copy), v21 (copy)
    for _, v307 in pairs(v18) do
        v307:OnHeadScaleChanged();
    end;
    if v290 then
        v290:disconnect();
    end;
    v290 = workspace.CurrentCamera:GetPropertyChangedSignal("HeadScale"):Connect(v293);
    if v294 then
        v294:disconnect();
    end;
    v294 = workspace.CurrentCamera:GetPropertyChangedSignal("CFrame"):Connect(v305);
    if l_VRService_0.VREnabled and v287 then
        local l_CurrentCamera_2 = workspace.CurrentCamera;
        v20.Parent = l_CurrentCamera_2;
        v21.Parent = l_CurrentCamera_2;
    end;
end;
local v310 = nil;
local v311 = false;
local function v313() --[[ Line: 1264 ]] --[[ Name: onVREnabledChanged ]]
    -- upvalues: l_VRService_0 (copy), v287 (ref), v309 (copy), v310 (ref), v20 (copy), v21 (copy), v311 (ref), l_RunService_0 (copy), v8 (copy), v286 (copy)
    if l_VRService_0.VREnabled then
        while not v287 do
            wait();
        end;
        if workspace.CurrentCamera then
            v309();
        end;
        v310 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v309);
        local l_CurrentCamera_3 = workspace.CurrentCamera;
        v20.Parent = l_CurrentCamera_3;
        v21.Parent = l_CurrentCamera_3;
        if not v311 then
            l_RunService_0:BindToRenderStep(v8, Enum.RenderPriority.Last.Value, v286);
            v311 = true;
            return;
        end;
    else
        if v310 then
            v310:disconnect();
            v310 = nil;
        end;
        v20.Parent = nil;
        v21.Parent = nil;
        if v311 then
            l_RunService_0:UnbindFromRenderStep(v8);
            v311 = false;
        end;
    end;
end;
l_VRService_0:GetPropertyChangedSignal("VREnabled"):connect(v313);
spawn(v313);
coroutine.wrap(function() --[[ Line: 1297 ]]
    -- upvalues: v287 (ref)
    while true do
        if not workspace.CurrentCamera then
            wait();
            continue;
        end;
        if workspace.CurrentCamera.CameraSubject == nil and workspace.CurrentCamera.CameraType ~= Enum.CameraType.Scriptable then
            workspace.CurrentCamera.Changed:Wait();
        else
            break;
        end;
    end;
    v287 = true;
end)();
return v56;