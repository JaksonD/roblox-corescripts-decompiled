local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRHub_0 = require(l_CorePackages_0.Workspace.Packages.VrCommon).VRHub;
local l_Parent_0 = script.Parent;
local v5 = require(l_Parent_0.Constants);
local v6 = require(l_Parent_0.Utils);
local l_PanelType_0 = v5.PanelType;
local l_SpatialUIType_0 = v5.SpatialUIType;
local v9 = require(script.Parent.createCompatPanel);
local v10 = require(script.Parent.createUIGroupDragBar);
local _ = require(l_Parent_0.DragBar);
local l_Players_0 = game:GetService("Players");
local v13 = game:DefineFastInt("FIntUIResetDelayInSec", 3);
local v14 = CFrame.Angles(-0.3141592653589793, 0.17453292519943295, 0);
local v15 = CFrame.new(-0.46666666666666673, -0.8, -2.1333333333333333);
local v16 = Vector2.new(2.666666666666667, 1.866666666666667);
local v17 = v15 * v14;
local _ = function(v18) --[[ Line: 52 ]] --[[ Name: getZAxisStablizedCFrame ]]
    local v19, v20, _ = v18:ToOrientation();
    return CFrame.new(v18.Position) * CFrame.fromOrientation(v19, v20, 0);
end;
local _ = function(v23) --[[ Line: 57 ]] --[[ Name: getCameraOffsetFromHeadRotationWithZAxisStabl ]]
    -- upvalues: l_VRService_0 (copy)
    local l_CFrame_0 = workspace.CurrentCamera.CFrame;
    local v25 = (l_CFrame_0 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(v23);
    local v26, v27, _ = v25:ToOrientation();
    return l_CFrame_0:ToObjectSpace(CFrame.new(v25.Position) * CFrame.fromOrientation(v26, v27, 0));
end;
local function _(v30) --[[ Line: 66 ]] --[[ Name: getPanelPart ]]
    -- upvalues: l_SpatialUIType_0 (copy)
    if v30.uiType == l_SpatialUIType_0.SpatialUI or v30.uiType == l_SpatialUIType_0.SpatialUIRoact then
        return v30.panelObject.Adornee;
    elseif v30.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
        return v30.panelObject;
    else
        return nil;
    end;
end;
local function _(v32) --[[ Line: 77 ]] --[[ Name: panelExistsInSpace ]]
    -- upvalues: l_SpatialUIType_0 (copy)
    local v33 = false;
    if v32 ~= nil then
        v33 = false;
        if v32.panelObject ~= nil then
            v33 = v32.uiType ~= l_SpatialUIType_0.ScreenUI;
        end;
    end;
    return v33;
end;
local v35 = {};
local v36 = nil;
v35.__index = v35;
v35.removeRoactPanel = function(v37, v38) --[[ Line: 97 ]] --[[ Name: removeRoactPanel ]]
    v37.uiElements[v38] = nil;
end;
v35.registerRoactPanel = function(v39, v40, v41) --[[ Line: 101 ]] --[[ Name: registerRoactPanel ]]
    v39.uiElements[v40] = v41;
    v39:rescaleUIForCurrentHeadScale();
    v39:updateUIGroupsForCurHeadCFrame();
end;
v35.createUI = function(v42, v43) --[[ Line: 113 ]] --[[ Name: createUI ]]
    -- upvalues: v9 (copy)
    local v44 = v9(v43);
    if v44 == nil then
        return nil;
    else
        v42.uiElements[v43.panelType] = v44;
        v42:updatePanelForCurHeadCFrame(v43.panelType);
        return {
            type = v44.uiType, 
            panelObject = v44.panelObject
        };
    end;
end;
v35.updateUIGroupForCurHeadCFrame = function(v45, v46, v47) --[[ Line: 126 ]] --[[ Name: updateUIGroupForCurHeadCFrame ]]
    -- upvalues: l_VRService_0 (copy)
    local v48 = v45.uiGroups[v46];
    local l_uiGroupHeadRotation_0 = v48.positionProps.uiGroupHeadRotation;
    local l_CFrame_1 = workspace.CurrentCamera.CFrame;
    local v51 = (l_CFrame_1 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(l_uiGroupHeadRotation_0);
    local v52, v53, _ = v51:ToOrientation();
    local v55 = l_CFrame_1:ToObjectSpace(CFrame.new(v51.Position) * CFrame.fromOrientation(v52, v53, 0));
    v48.positionProps.uiGroupCameraOffSet = v55;
    l_uiGroupHeadRotation_0 = v47 or false;
    if v48.draggable and v48.dragBar and not l_uiGroupHeadRotation_0 then
        v48.dragBar:setCFrame(workspace.CurrentCamera.CFrame * v55:ToWorldSpace(v48.dragBarOffset));
    end;
    v45:updatePanelsInUIGroupForCurHeadCFrame(v46);
end;
v35.updateUIGroupsForCurHeadCFrame = function(v56) --[[ Line: 147 ]] --[[ Name: updateUIGroupsForCurHeadCFrame ]]
    for v57, _ in pairs(v56.uiGroups) do
        v56:updateUIGroupForCurHeadCFrame(v57);
    end;
end;
v35.updatePanelForCurHeadCFrame = function(v59, v60) --[[ Line: 153 ]] --[[ Name: updatePanelForCurHeadCFrame ]]
    -- upvalues: l_SpatialUIType_0 (copy), l_VRService_0 (copy)
    local v61 = v59.uiElements[v60];
    local v62 = false;
    if v61 ~= nil then
        v62 = false;
        if v61.panelObject ~= nil then
            v62 = v61.uiType ~= l_SpatialUIType_0.ScreenUI;
        end;
    end;
    if v62 and v61.panelPositionProps and v61.panelPositionProps.cameraFixedPanelProp then
        v62 = v61.panelPositionProps;
        local l_cameraFixedPanelProp_0 = v62.cameraFixedPanelProp;
        local l_uiGroupHeadRotation_1 = v59.uiGroups[v62.uiGroup].positionProps.uiGroupHeadRotation;
        local l_CFrame_2 = workspace.CurrentCamera.CFrame;
        local v66 = (l_CFrame_2 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(l_uiGroupHeadRotation_1);
        local v67, v68, _ = v66:ToOrientation();
        local v70 = l_CFrame_2:ToObjectSpace(CFrame.new(v66.Position) * CFrame.fromOrientation(v67, v68, 0));
        l_uiGroupHeadRotation_1 = if not (v61.uiType ~= l_SpatialUIType_0.SpatialUI) or v61.uiType == l_SpatialUIType_0.SpatialUIRoact then v61.panelObject.Adornee else if v61.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v61.panelObject else nil;
        if l_uiGroupHeadRotation_1 == nil then
            return;
        else
            l_uiGroupHeadRotation_1.CFrame = workspace.CurrentCamera.CFrame * v70;
            l_uiGroupHeadRotation_1.CFrame = l_uiGroupHeadRotation_1.CFrame:ToWorldSpace(l_cameraFixedPanelProp_0.uiGroupElementOffset);
        end;
    end;
end;
v35.updatePanelsInUIGroupForCurHeadCFrame = function(v71, v72) --[[ Line: 175 ]] --[[ Name: updatePanelsInUIGroupForCurHeadCFrame ]]
    for v73, v74 in pairs(v71.uiElements) do
        if v74.panelPositionProps and v74.panelPositionProps.uiGroup == v72 then
            v71:updatePanelForCurHeadCFrame(v73);
        end;
    end;
end;
v35.updatePanelsForCurHeadCFrame = function(v75) --[[ Line: 189 ]] --[[ Name: updatePanelsForCurHeadCFrame ]]
    for v76, _ in pairs(v75.uiElements) do
        v75:updatePanelForCurHeadCFrame(v76);
    end;
end;
v35.dragUiGroupStart = function(v78, v79) --[[ Line: 195 ]] --[[ Name: dragUiGroupStart ]]
    if v78.uiGroups[v79].draggable == false then
        return;
    else
        local l_dragBar_0 = v78.uiGroups[v79].dragBar;
        local v81 = workspace.CurrentCamera.CFrame:ToWorldSpace(v78.uiGroups[v79].positionProps.uiGroupCameraOffSet);
        l_dragBar_0:startDrag((l_dragBar_0:getCFrame():ToObjectSpace(v81)));
        return;
    end;
end;
v35.dragUiGroupEnd = function(v82, v83) --[[ Line: 207 ]] --[[ Name: dragUiGroupEnd ]]
    if v82.uiGroups[v83].draggable == false then
        return;
    else
        v82.uiGroups[v83].dragBar:dragEnd();
        return;
    end;
end;
v35.dragUiGroupStep = function(v84, v85) --[[ Line: 215 ]] --[[ Name: dragUiGroupStep ]]
    -- upvalues: l_VRService_0 (copy)
    if v84.uiGroups[v85].draggable == false then
        return;
    else
        local l_dragBar_1 = v84.uiGroups[v85].dragBar;
        local v87 = workspace.CurrentCamera.CFrame * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local v88 = l_dragBar_1:getCFrame();
        local v89 = Vector3.new(v87.Position.X, v87.Position.Y - 0.6666666666666667, v87.Position.Z);
        local v90, v91, _ = (CFrame.lookAt(v88.Position, v89) * CFrame.Angles(0, 3.141592653589793, 0)):ToEulerAnglesXYZ();
        local _, _, v95 = v88:ToEulerAnglesXYZ();
        local v96 = CFrame.new(v88.Position) * CFrame.Angles(v90, v91, v95);
        local v97, v98, _ = v96:ToOrientation();
        l_dragBar_1:setCFrame(CFrame.new(v96.Position) * CFrame.fromOrientation(v97, v98, 0));
        local v100 = l_dragBar_1:getCFrame():ToWorldSpace(l_dragBar_1.uiGroupOffSet);
        v84.uiGroups[v85].positionProps.uiGroupHeadRotation = v87:ToObjectSpace(v100);
        v84:updateUIGroupForCurHeadCFrame(v85, true);
        return;
    end;
end;
v35.setUpUiGroups = function(v101) --[[ Line: 247 ]] --[[ Name: setUpUiGroups ]]
    -- upvalues: v10 (copy), v5 (copy), v17 (copy), l_VRService_0 (copy), v16 (copy), l_PanelType_0 (copy)
    local v115 = v10({
        name = "MainUIGroup", 
        dragFunction = function(_, _, _, _, _) --[[ Line: 251 ]] --[[ Name: dragFunction ]]
            -- upvalues: v101 (copy), v5 (ref)
            v101:dragUiGroupStep(v5.SpatialUIGroupType.MainUIGroup);
        end, 
        dragStartFunction = function(_, _, _, _, _, _, _) --[[ Line: 254 ]] --[[ Name: dragStartFunction ]]
            -- upvalues: v101 (copy), v5 (ref)
            v101:dragUiGroupStart(v5.SpatialUIGroupType.MainUIGroup);
        end, 
        dragEndFunction = function(_) --[[ Line: 257 ]] --[[ Name: dragEndFunction ]]
            -- upvalues: v101 (copy), v5 (ref)
            v101:dragUiGroupEnd(v5.SpatialUIGroupType.MainUIGroup);
        end
    });
    local v116 = {};
    local v117 = {
        uiGroupHeadRotation = v17
    };
    local l_v17_0 = v17;
    local l_CFrame_3 = workspace.CurrentCamera.CFrame;
    local v120 = (l_CFrame_3 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(l_v17_0);
    local v121, v122, _ = v120:ToOrientation();
    v117.uiGroupCameraOffSet = l_CFrame_3:ToObjectSpace(CFrame.new(v120.Position) * CFrame.fromOrientation(v121, v122, 0));
    v117.defaultGroupHeadRotation = v17;
    v116.positionProps = v117;
    v116.uiContainerSize = v16;
    v116.draggable = true;
    v116.dragBar = v115;
    v116.dragBarOffset = CFrame.new(0, v5.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[l_PanelType_0.BottomBar].Y - 0.075 - 0.06666666666666667, 0);
    v116.headScale = 1;
    v101.uiGroups[v5.SpatialUIGroupType.MainUIGroup] = v116;
end;
v35.step = function(v124) --[[ Line: 282 ]] --[[ Name: step ]]
    -- upvalues: l_VRService_0 (copy), l_SpatialUIType_0 (copy), l_PanelType_0 (copy), v13 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        for v125, v126 in pairs(v124.uiElements) do
            local v127 = false;
            if v126 ~= nil then
                v127 = false;
                if v126.panelObject ~= nil then
                    v127 = v126.uiType ~= l_SpatialUIType_0.ScreenUI;
                end;
            end;
            if v127 and v125 == l_PanelType_0.RobloxGui then
                v127 = nil;
                local v128, v129, _ = (if v126.uiType == l_SpatialUIType_0.SpatialUI then v126.panelObject.Adornee else v126.panelObject).CFrame:ToOrientation();
                local v131, v132, _ = (workspace.CurrentCamera.CFrame * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation();
                if math.abs(v129 - v132) > 1.7453292519943295 or math.abs(v128 - v131) > 1.7453292519943295 then
                    if v124.uiGroupsOutOfViewTimeStamp then
                        if os.clock() - v124.uiGroupsOutOfViewTimeStamp >= v13 then
                            v124:updateUIGroupsForCurHeadCFrame();
                            v124.uiGroupsOutOfViewTimeStamp = nil;
                        end;
                    else
                        v124.uiGroupsOutOfViewTimeStamp = os.clock();
                    end;
                else
                    v124.uiGroupsOutOfViewTimeStamp = nil;
                end;
            end;
        end;
        return;
    end;
end;
v35.onShowTopBarChanged = function(v134) --[[ Line: 321 ]] --[[ Name: onShowTopBarChanged ]]
    -- upvalues: l_VRService_0 (copy), l_VRHub_0 (copy), l_SpatialUIType_0 (copy)
    if not l_VRService_0.VREnabled then
        return;
    elseif l_VRHub_0.ShowTopBar then
        for _, v136 in pairs(v134.uiGroups) do
            if v136.draggable and v136.dragBar then
                v136.dragBar:show();
            end;
        end;
        for _, v138 in pairs(v134.uiElements) do
            if v138.uiType == l_SpatialUIType_0.SpatialUI or v138.uiType == l_SpatialUIType_0.SpatialUIRoact then
                local l_panelObject_0 = v138.panelObject;
                l_panelObject_0.Enabled = true;
                l_panelObject_0.Adornee.Parent = workspace;
            elseif v138.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
                v138.panelObject.Parent = workspace;
            end;
        end;
        return;
    else
        for _, v141 in pairs(v134.uiGroups) do
            if v141.draggable and v141.dragBar then
                v141.dragBar:hide();
            end;
        end;
        for _, v143 in pairs(v134.uiElements) do
            if v143.uiType == l_SpatialUIType_0.SpatialUI or v143.uiType == l_SpatialUIType_0.SpatialUIRoact then
                local l_panelObject_1 = v143.panelObject;
                l_panelObject_1.Enabled = false;
                l_panelObject_1.Adornee.Parent = nil;
            elseif v143.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
                v143.panelObject.Parent = nil;
            end;
        end;
        return;
    end;
end;
v35.updateUIGroupsForCurCamera = function(v145) --[[ Line: 362 ]] --[[ Name: updateUIGroupsForCurCamera ]]
    -- upvalues: l_VRService_0 (copy), l_SpatialUIType_0 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        for _, v147 in pairs(v145.uiGroups) do
            if v147.draggable then
                v147.dragBar:setCFrame(workspace.CurrentCamera.CFrame * v147.positionProps.uiGroupCameraOffSet:ToWorldSpace(v147.dragBarOffset));
            end;
        end;
        for _, v149 in pairs(v145.uiElements) do
            local v150 = false;
            if v149 ~= nil then
                v150 = false;
                if v149.panelObject ~= nil then
                    v150 = v149.uiType ~= l_SpatialUIType_0.ScreenUI;
                end;
            end;
            if v150 and v149.panelPositionProps and v149.panelPositionProps.cameraFixedPanelProp then
                v150 = v149.panelPositionProps;
                local l_cameraFixedPanelProp_1 = v150.cameraFixedPanelProp;
                local v152 = if not (v149.uiType ~= l_SpatialUIType_0.SpatialUI) or v149.uiType == l_SpatialUIType_0.SpatialUIRoact then v149.panelObject.Adornee else if v149.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v149.panelObject else nil;
                if v152 == nil then
                    return;
                else
                    v152.CFrame = workspace.CurrentCamera.CFrame * v145.uiGroups[v150.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(l_cameraFixedPanelProp_1.uiGroupElementOffset);
                end;
            end;
        end;
        return;
    end;
end;
v35.onMouseTargetChanged = function(v153, v154) --[[ Line: 398 ]] --[[ Name: onMouseTargetChanged ]]
    for _, v156 in pairs(v153.uiGroups) do
        if v156.draggable then
            if v156.dragBar and v156.dragBar.part == v154 then
                v156.dragBar:startHover();
            elseif v156.dragBar and v156.dragBar.part ~= v154 then
                v156.dragBar:hoverEnd();
            end;
        end;
    end;
end;
v35.rescaleUIForCurrentHeadScale = function(v157) --[[ Line: 410 ]] --[[ Name: rescaleUIForCurrentHeadScale ]]
    -- upvalues: v6 (copy), l_SpatialUIType_0 (copy)
    local l_HeadScale_0 = workspace.CurrentCamera.HeadScale;
    for _, v160 in pairs(v157.uiGroups) do
        local v161 = l_HeadScale_0 / v160.headScale;
        v160.positionProps.uiGroupHeadRotation = v6.rescaleCFramePosition(v160.positionProps.uiGroupHeadRotation, v161);
        v160.positionProps.uiGroupCameraOffSet = v6.rescaleCFramePosition(v160.positionProps.uiGroupCameraOffSet, v161);
        v160.positionProps.defaultGroupHeadRotation = v6.rescaleCFramePosition(v160.positionProps.defaultGroupHeadRotation, v161);
        if v160.draggable then
            v160.dragBarOffset = v6.rescaleCFramePosition(v160.dragBarOffset, v161);
            v160.dragBar:rescale(v161);
        end;
        v160.headScale = l_HeadScale_0;
    end;
    for _, v163 in pairs(v157.uiElements) do
        local v164 = l_HeadScale_0 / v163.headScale;
        if v163.uiType ~= l_SpatialUIType_0.SpatialUIRoact then
            local v165 = if not (v163.uiType ~= l_SpatialUIType_0.SpatialUI) or v163.uiType == l_SpatialUIType_0.SpatialUIRoact then v163.panelObject.Adornee else if v163.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v163.panelObject else nil;
            if v165 ~= nil then
                v165.Size = v165.Size * v164;
            end;
        end;
        local l_panelPositionProps_0 = v163.panelPositionProps;
        if l_panelPositionProps_0 and l_panelPositionProps_0.cameraFixedPanelProp then
            l_panelPositionProps_0.cameraFixedPanelProp.uiGroupElementOffset = v6.rescaleCFramePosition(l_panelPositionProps_0.cameraFixedPanelProp.uiGroupElementOffset, v164);
        end;
        v163.headScale = l_HeadScale_0;
    end;
end;
v35.new = function() --[[ Line: 450 ]] --[[ Name: new ]]
    -- upvalues: v35 (copy), l_RunService_0 (copy), l_VRHub_0 (copy), l_Players_0 (copy)
    local v167 = {
        currentMouseTarget = nil, 
        uiGroupsOutOfViewTimeStamp = nil, 
        uiElements = {}, 
        uiGroups = {}
    };
    setmetatable(v167, v35);
    v167:setUpUiGroups();
    v167:rescaleUIForCurrentHeadScale();
    v167:updateUIGroupsForCurCamera();
    l_RunService_0:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function() --[[ Line: 465 ]]
        -- upvalues: v167 (copy)
        v167:step();
    end);
    l_VRHub_0.ShowTopBarChanged.Event:connect(function() --[[ Line: 469 ]]
        -- upvalues: v167 (copy)
        v167:onShowTopBarChanged();
    end);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    l_CurrentCamera_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 474 ]]
        -- upvalues: v167 (copy)
        v167:updateUIGroupsForCurCamera();
    end);
    l_CurrentCamera_0:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ Line: 478 ]]
        -- upvalues: v167 (copy)
        v167:rescaleUIForCurrentHeadScale();
        v167:updateUIGroupsForCurHeadCFrame();
    end);
    local l_Mouse_0 = l_Players_0.LocalPlayer:GetMouse();
    if l_Mouse_0 then
        l_Mouse_0.Move:Connect(function() --[[ Line: 486 ]]
            -- upvalues: l_Players_0 (ref), v167 (copy)
            local l_Mouse_1 = l_Players_0.LocalPlayer:GetMouse();
            if l_Mouse_1.Target ~= v167.currentMouseTarget then
                v167:onMouseTargetChanged(l_Mouse_1.Target);
                v167.currentMouseTarget = l_Mouse_1.Target;
            end;
        end);
    end;
    return v167;
end;
v35.getInstance = function() --[[ Line: 499 ]] --[[ Name: getInstance ]]
    -- upvalues: v36 (ref), v35 (copy)
    if v36 == nil then
        v36 = v35.new();
    end;
    return v36;
end;
return v35;