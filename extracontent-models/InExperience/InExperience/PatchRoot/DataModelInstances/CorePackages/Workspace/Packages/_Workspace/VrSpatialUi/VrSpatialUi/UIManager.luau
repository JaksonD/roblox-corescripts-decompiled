local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Observable);
local l_VRService_0 = game:GetService("VRService");
local l_RunService_0 = game:GetService("RunService");
local l_isInExperienceUIVREnabled_0 = require(l_Parent_0.SharedExperimentDefinition).isInExperienceUIVREnabled;
local l_InExperienceUIVRIXP_0 = require(l_Parent_0.SharedExperimentDefinition).InExperienceUIVRIXP;
local v7 = nil;
if not l_isInExperienceUIVREnabled_0 then
    v7 = require(l_Parent_0.VrCommon).VRHub;
end;
local v8 = require(l_script_FirstAncestor_0.Constants);
local v9 = require(l_script_FirstAncestor_0.Utils);
local l_PanelType_0 = v8.PanelType;
local l_SpatialUIType_0 = v8.SpatialUIType;
local v12 = require(script.Parent.createCompatPanel);
local v13 = require(script.Parent.createUIGroupDragBar);
local _ = require(l_script_FirstAncestor_0.DragBar);
local v15 = nil;
local v16 = nil;
if l_isInExperienceUIVREnabled_0 then
    v15 = require(l_script_FirstAncestor_0.UIGroupHelper);
    v16 = require(l_script_FirstAncestor_0.StableCameraCache);
end;
local l_Players_0 = game:GetService("Players");
local v18 = game:DefineFastInt("FIntUIResetDelayInSec", 3);
local v19 = game:DefineFastInt("SpatialUIPanelDistance", 64);
local v20 = game:DefineFastFlag("SpatialUIEnablePanelsRefocusing", false);
local v21 = game:DefineFastFlag("SpatialUIDisableBottomBarFading", false);
local v22 = game:DefineFastFlag("SpatialUIDisableBottomBarInteractionOnAnimating", false);
local v23 = nil;
v23 = if l_isInExperienceUIVREnabled_0 then CFrame.Angles(0, 0, 0) else CFrame.Angles(-0.3141592653589793, 0.17453292519943295, 0);
local v24 = nil;
if l_isInExperienceUIVREnabled_0 then
    local v25 = math.min(math.max(v19, 0), 500) / 100;
    v24 = CFrame.new(0, 0, v25 * -1 * 3.3333333333333335);
else
    v24 = CFrame.new(-0.46666666666666673, -0.8, -2.1333333333333333);
end;
local v26 = Vector2.new(2.666666666666667, 1.866666666666667);
local v27 = v24 * v23;
local _ = function(v28) --[[ Line: 62 ]] --[[ Name: getZAxisStablizedCFrame ]]
    local v29, v30, _ = v28:ToOrientation();
    return CFrame.new(v28.Position) * CFrame.fromOrientation(v29, v30, 0);
end;
local _ = function(v33, v34) --[[ Line: 67 ]] --[[ Name: getCameraOffsetFromHeadRotationWithZAxisStabl ]]
    -- upvalues: l_VRService_0 (copy)
    local v35 = v34 or workspace.CurrentCamera.CFrame;
    local v36 = (v35 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(v33);
    local v37, v38, _ = v36:ToOrientation();
    return v35:ToObjectSpace(CFrame.new(v36.Position) * CFrame.fromOrientation(v37, v38, 0));
end;
local function _(v41) --[[ Line: 76 ]] --[[ Name: getPanelPart ]]
    -- upvalues: l_SpatialUIType_0 (copy)
    if v41.uiType == l_SpatialUIType_0.SpatialUI or v41.uiType == l_SpatialUIType_0.SpatialUIRoact then
        return v41.panelObject.Adornee;
    elseif v41.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
        return v41.panelObject;
    else
        return nil;
    end;
end;
local function _(v43) --[[ Line: 87 ]] --[[ Name: panelExistsInSpace ]]
    -- upvalues: l_SpatialUIType_0 (copy)
    local v44 = false;
    if v43 ~= nil then
        v44 = false;
        if v43.panelObject ~= nil then
            v44 = v43.uiType ~= l_SpatialUIType_0.ScreenUI;
        end;
    end;
    return v44;
end;
createUIGroup = function(v46, v47, v48) --[[ Line: 91 ]] --[[ Name: createUIGroup ]]
    -- upvalues: v26 (copy), v27 (copy), l_VRService_0 (copy)
    local l_uiGroupHelper_0 = v46.uiGroupHelper;
    local l_v46_0 = v46;
    local l_v47_0 = v47;
    local l_v26_0 = v26;
    local v53 = {
        uiGroupHeadRotation = v27
    };
    local l_v27_0 = v27;
    local l_CFrame_0 = workspace.CurrentCamera.CFrame;
    local v56 = (l_CFrame_0 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(l_v27_0);
    local v57, v58, _ = v56:ToOrientation();
    v53.uiGroupCameraOffSet = l_CFrame_0:ToObjectSpace(CFrame.new(v56.Position) * CFrame.fromOrientation(v57, v58, 0));
    v53.defaultGroupHeadRotation = v27;
    local v60 = l_uiGroupHelper_0:createUIGroup(l_v46_0, l_v47_0, l_v26_0, v53, v46.uiElements, v48);
    v46.uiGroups[v47] = v60;
end;
local v61 = {};
local v62 = nil;
v61.__index = v61;
v61.removeRoactPanel = function(v63, v64) --[[ Line: 125 ]] --[[ Name: removeRoactPanel ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy)
    if l_isInExperienceUIVREnabled_0 then
        v63:disconnectPanelVisibility(v64);
    end;
    v63.uiElements[v64] = nil;
end;
v61.registerRoactPanel = function(v65, v66, v67, v68) --[[ Line: 132 ]] --[[ Name: registerRoactPanel ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_InExperienceUIVRIXP_0 (copy), v2 (copy)
    v65.uiElements[v66] = v67;
    if l_isInExperienceUIVREnabled_0 then
        local v69 = v65.uiGroupHelper:checkAndGetUIGroupTypeForTempPanel(v66, v65.uiElements);
        if v69 ~= nil then
            v65:rescaleUIForCurrentHeadScale(v69, v66);
            if l_InExperienceUIVRIXP_0:isSpatialUICameraTypeFixEnabled() then
                v65:updateUIGroupsForCurCamera(v66, (v65.stableCameraCache:getCurrentStableCameraCFrame()));
            else
                v65:updateUIGroupsForCurCamera(v66);
            end;
        else
            v65:rescaleUIForCurrentHeadScale();
            v65:updateUIGroupsForCurHeadCFrame();
        end;
    else
        v65:rescaleUIForCurrentHeadScale();
        v65:updateUIGroupsForCurHeadCFrame();
    end;
    if l_isInExperienceUIVREnabled_0 then
        v65:connectPanelVisibility(v66, v68 or v2.ObservableValue.new(true));
    end;
end;
v61.createUI = function(v70, v71) --[[ Line: 169 ]] --[[ Name: createUI ]]
    -- upvalues: v12 (copy)
    local v72 = v12(v71);
    if v72 == nil then
        return nil;
    else
        v70.uiElements[v71.panelType] = v72;
        v70:updatePanelForCurHeadCFrame(v71.panelType);
        return {
            type = v72.uiType, 
            panelObject = v72.panelObject
        };
    end;
end;
v61.getPanelObject = function(v73, v74) --[[ Line: 182 ]] --[[ Name: getPanelObject ]]
    local v75 = v73.uiElements[v74];
    if v75 then
        return v75.panelObject;
    else
        return nil;
    end;
end;
v61.getPanelSizeInPixel = function(v76, v77) --[[ Line: 191 ]] --[[ Name: getPanelSizeInPixel ]]
    -- upvalues: v8 (copy)
    return v76:getScaledPartSizeInPixel(v77) * v8.VR_PANEL_RESOLUTION_MULTIPLIER;
end;
v61.getScaledPartSizeInPixel = function(_, v79) --[[ Line: 196 ]] --[[ Name: getScaledPartSizeInPixel ]]
    -- upvalues: l_PanelType_0 (copy), v8 (copy)
    if v79 == l_PanelType_0.BottomBar then
        return v8.BOTTOM_BAR_SIZE;
    else
        local l_spatialPanelProps_0 = v8.COMPAT_PANEL_PROPS_MAP[v79].spatialPanelProps;
        if not l_spatialPanelProps_0 then
            return Vector2.new(0, 0);
        else
            local l_partSize_0 = l_spatialPanelProps_0.partSize;
            return Vector2.new(l_partSize_0.X, l_partSize_0.Y);
        end;
    end;
end;
v61.connectTopBarVisibility = function(v82, v83) --[[ Line: 208 ]] --[[ Name: connectTopBarVisibility ]]
    v82.uiGroupHelper:setTopBarVisible(v83, function() --[[ Line: 209 ]]
        -- upvalues: v82 (copy)
        v82.uiGroupHelper:updateAllElements(v82.uiElements, v82.uiGroups);
    end);
end;
v61.connectPanelVisibility = function(v84, v85, v86) --[[ Line: 214 ]] --[[ Name: connectPanelVisibility ]]
    v84.uiGroupHelper:connectPanelVisibility(v85, v86, v84.uiElements, v84.uiGroups);
end;
v61.disconnectPanelVisibility = function(v87, v88) --[[ Line: 222 ]] --[[ Name: disconnectPanelVisibility ]]
    v87.uiGroupHelper:disconnectPanelVisibility(v88, v87.uiElements, v87.uiGroups);
end;
v61.updateUIGroupForCurHeadCFrame = function(v89, v90, v91) --[[ Line: 226 ]] --[[ Name: updateUIGroupForCurHeadCFrame ]]
    -- upvalues: l_VRService_0 (copy)
    local v92 = v89.uiGroups[v90];
    local l_uiGroupHeadRotation_0 = v92.positionProps.uiGroupHeadRotation;
    local l_CFrame_1 = workspace.CurrentCamera.CFrame;
    local v95 = (l_CFrame_1 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(l_uiGroupHeadRotation_0);
    local v96, v97, _ = v95:ToOrientation();
    local v99 = l_CFrame_1:ToObjectSpace(CFrame.new(v95.Position) * CFrame.fromOrientation(v96, v97, 0));
    v92.positionProps.uiGroupCameraOffSet = v99;
    l_uiGroupHeadRotation_0 = v91 or false;
    if v92.draggable and v92.dragBar and not l_uiGroupHeadRotation_0 then
        v92.dragBar:setCFrame(workspace.CurrentCamera.CFrame * v99:ToWorldSpace(v92.dragBarOffset));
    end;
    v89:updatePanelsInUIGroupForCurHeadCFrame(v90);
end;
v61.updateUIGroupsForCurHeadCFrame = function(v100) --[[ Line: 247 ]] --[[ Name: updateUIGroupsForCurHeadCFrame ]]
    for v101, _ in pairs(v100.uiGroups) do
        v100:updateUIGroupForCurHeadCFrame(v101);
    end;
end;
v61.updatePanelForCurHeadCFrame = function(v103, v104) --[[ Line: 253 ]] --[[ Name: updatePanelForCurHeadCFrame ]]
    -- upvalues: l_SpatialUIType_0 (copy), l_VRService_0 (copy)
    local v105 = v103.uiElements[v104];
    local v106 = false;
    if v105 ~= nil then
        v106 = false;
        if v105.panelObject ~= nil then
            v106 = v105.uiType ~= l_SpatialUIType_0.ScreenUI;
        end;
    end;
    if v106 and v105.panelPositionProps and v105.panelPositionProps.cameraFixedPanelProp then
        v106 = v105.panelPositionProps;
        local l_cameraFixedPanelProp_0 = v106.cameraFixedPanelProp;
        local l_uiGroupHeadRotation_1 = v103.uiGroups[v106.uiGroup].positionProps.uiGroupHeadRotation;
        local l_CFrame_2 = workspace.CurrentCamera.CFrame;
        local v110 = (l_CFrame_2 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(l_uiGroupHeadRotation_1);
        local v111, v112, _ = v110:ToOrientation();
        local v114 = l_CFrame_2:ToObjectSpace(CFrame.new(v110.Position) * CFrame.fromOrientation(v111, v112, 0));
        l_uiGroupHeadRotation_1 = if not (v105.uiType ~= l_SpatialUIType_0.SpatialUI) or v105.uiType == l_SpatialUIType_0.SpatialUIRoact then v105.panelObject.Adornee else if v105.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v105.panelObject else nil;
        if l_uiGroupHeadRotation_1 == nil then
            return;
        else
            l_uiGroupHeadRotation_1.CFrame = workspace.CurrentCamera.CFrame * v114;
            l_uiGroupHeadRotation_1.CFrame = l_uiGroupHeadRotation_1.CFrame:ToWorldSpace(l_cameraFixedPanelProp_0.uiGroupElementOffset);
        end;
    end;
end;
v61.updatePanelsInUIGroupForCurHeadCFrame = function(v115, v116) --[[ Line: 275 ]] --[[ Name: updatePanelsInUIGroupForCurHeadCFrame ]]
    for v117, v118 in pairs(v115.uiElements) do
        if v118.panelPositionProps and v118.panelPositionProps.uiGroup == v116 then
            v115:updatePanelForCurHeadCFrame(v117);
        end;
    end;
end;
v61.updatePanelsForCurHeadCFrame = function(v119) --[[ Line: 289 ]] --[[ Name: updatePanelsForCurHeadCFrame ]]
    for v120, _ in pairs(v119.uiElements) do
        v119:updatePanelForCurHeadCFrame(v120);
    end;
end;
v61.dragUiGroupStart = function(v122, v123) --[[ Line: 295 ]] --[[ Name: dragUiGroupStart ]]
    if v122.uiGroups[v123].draggable == false then
        return;
    else
        local l_dragBar_0 = v122.uiGroups[v123].dragBar;
        local v125 = workspace.CurrentCamera.CFrame:ToWorldSpace(v122.uiGroups[v123].positionProps.uiGroupCameraOffSet);
        l_dragBar_0:startDrag((l_dragBar_0:getCFrame():ToObjectSpace(v125)));
        return;
    end;
end;
v61.dragUiGroupEnd = function(v126, v127) --[[ Line: 307 ]] --[[ Name: dragUiGroupEnd ]]
    if v126.uiGroups[v127].draggable == false then
        return;
    else
        v126.uiGroups[v127].dragBar:dragEnd();
        return;
    end;
end;
v61.dragUiGroupStep = function(v128, v129) --[[ Line: 315 ]] --[[ Name: dragUiGroupStep ]]
    -- upvalues: l_VRService_0 (copy)
    if v128.uiGroups[v129].draggable == false then
        return;
    else
        local l_dragBar_1 = v128.uiGroups[v129].dragBar;
        local v131 = workspace.CurrentCamera.CFrame * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head);
        local v132 = l_dragBar_1:getCFrame();
        local v133 = Vector3.new(v131.Position.X, v131.Position.Y - 0.6666666666666667, v131.Position.Z);
        local v134, v135, _ = (CFrame.lookAt(v132.Position, v133) * CFrame.Angles(0, 3.141592653589793, 0)):ToEulerAnglesXYZ();
        local _, _, v139 = v132:ToEulerAnglesXYZ();
        local v140 = CFrame.new(v132.Position) * CFrame.Angles(v134, v135, v139);
        local v141, v142, _ = v140:ToOrientation();
        l_dragBar_1:setCFrame(CFrame.new(v140.Position) * CFrame.fromOrientation(v141, v142, 0));
        local v144 = l_dragBar_1:getCFrame():ToWorldSpace(l_dragBar_1.uiGroupOffSet);
        v128.uiGroups[v129].positionProps.uiGroupHeadRotation = v131:ToObjectSpace(v144);
        v128:updateUIGroupForCurHeadCFrame(v129, true);
        return;
    end;
end;
v61.setUpUiGroups = function(v145, v146) --[[ Line: 347 ]] --[[ Name: setUpUiGroups ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v8 (copy), v13 (copy), v27 (copy), l_VRService_0 (copy), v26 (copy), l_PanelType_0 (copy)
    if l_isInExperienceUIVREnabled_0 then
        createUIGroup(v145, v8.SpatialUIGroupType.MainUIGroup, v146);
        createUIGroup(v145, v8.SpatialUIGroupType.MenuUIGroup, v146);
        createUIGroup(v145, v8.SpatialUIGroupType.ChatUIGroup, v146);
        createUIGroup(v145, v8.SpatialUIGroupType.ChromeSubMenuUIGroup, v146);
        v145.uiGroupHelper:updateAllDragBar(v145.uiElements, v145.uiGroups);
        return;
    else
        local v160 = v13({
            name = "MainUIGroup", 
            dragFunction = function(_, _, _, _, _) --[[ Line: 359 ]] --[[ Name: dragFunction ]]
                -- upvalues: v145 (copy), v8 (ref)
                v145:dragUiGroupStep(v8.SpatialUIGroupType.MainUIGroup);
            end, 
            dragStartFunction = function(_, _, _, _, _, _, _) --[[ Line: 362 ]] --[[ Name: dragStartFunction ]]
                -- upvalues: v145 (copy), v8 (ref)
                v145:dragUiGroupStart(v8.SpatialUIGroupType.MainUIGroup);
            end, 
            dragEndFunction = function(_) --[[ Line: 365 ]] --[[ Name: dragEndFunction ]]
                -- upvalues: v145 (copy), v8 (ref)
                v145:dragUiGroupEnd(v8.SpatialUIGroupType.MainUIGroup);
            end
        });
        local v161 = {};
        local v162 = {
            uiGroupHeadRotation = v27
        };
        local l_v27_1 = v27;
        local l_CFrame_3 = workspace.CurrentCamera.CFrame;
        local v165 = (l_CFrame_3 * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToWorldSpace(l_v27_1);
        local v166, v167, _ = v165:ToOrientation();
        v162.uiGroupCameraOffSet = l_CFrame_3:ToObjectSpace(CFrame.new(v165.Position) * CFrame.fromOrientation(v166, v167, 0));
        v162.defaultGroupHeadRotation = v27;
        v161.positionProps = v162;
        v161.uiContainerSize = v26;
        v161.draggable = true;
        v161.dragBar = v160;
        v161.dragBarOffset = CFrame.new(0, v8.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[l_PanelType_0.BottomBar].Y - 0.075 - 0.06666666666666667, 0);
        v161.headScale = 1;
        v145.uiGroups[v8.SpatialUIGroupType.MainUIGroup] = v161;
        return;
    end;
end;
v61.step = function(v169) --[[ Line: 390 ]] --[[ Name: step ]]
    -- upvalues: l_VRService_0 (copy), l_SpatialUIType_0 (copy), l_PanelType_0 (copy), l_isInExperienceUIVREnabled_0 (copy), v21 (copy), v20 (copy), v18 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        for v170, v171 in pairs(v169.uiElements) do
            local v172 = false;
            if v171 ~= nil then
                v172 = false;
                if v171.panelObject ~= nil then
                    v172 = v171.uiType ~= l_SpatialUIType_0.ScreenUI;
                end;
            end;
            if v172 and v170 == l_PanelType_0.RobloxGui then
                v172 = nil;
                local v173, v174, _ = (if v171.uiType == l_SpatialUIType_0.SpatialUI then v171.panelObject.Adornee else v171.panelObject).CFrame:ToOrientation();
                local v176, v177, _ = (workspace.CurrentCamera.CFrame * l_VRService_0:GetUserCFrame(Enum.UserCFrame.Head)):ToOrientation();
                if l_isInExperienceUIVREnabled_0 and not v21 and v169.uiGroupHelper then
                    v169.uiGroupHelper:animateBottomBarOnHeadMoveIfNeeded(v169.uiElements, Vector2.new(v173, v174), Vector2.new(v176, v177));
                end;
                if l_isInExperienceUIVREnabled_0 and v20 and (math.abs(v174 - v177) > 1.7453292519943295 or math.abs(v173 - v176) > 1.7453292519943295) then
                    if v169.uiGroupsOutOfViewTimeStamp then
                        if os.clock() - v169.uiGroupsOutOfViewTimeStamp >= v18 then
                            v169:updateUIGroupsForCurHeadCFrame();
                            v169.uiGroupsOutOfViewTimeStamp = nil;
                        end;
                    else
                        v169.uiGroupsOutOfViewTimeStamp = os.clock();
                    end;
                else
                    v169.uiGroupsOutOfViewTimeStamp = nil;
                end;
            end;
        end;
        return;
    end;
end;
v61.prepareGuiToggleAnimationState = function(v179) --[[ Line: 441 ]] --[[ Name: prepareGuiToggleAnimationState ]]
    if v179.uiGroupHelper:isTopBarVisible() then
        v179.uiGroupHelper:prepareGuiToggleAnimationState(v179.uiElements);
    end;
end;
v61.onShowTopBarChanged = function(v180) --[[ Line: 447 ]] --[[ Name: onShowTopBarChanged ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), l_VRService_0 (copy), v7 (ref), l_SpatialUIType_0 (copy)
    if l_isInExperienceUIVREnabled_0 then
        return;
    elseif not l_VRService_0.VREnabled then
        return;
    elseif v7 and v7.ShowTopBar then
        for _, v182 in pairs(v180.uiGroups) do
            if v182.draggable and v182.dragBar then
                v182.dragBar:show();
            end;
        end;
        for _, v184 in pairs(v180.uiElements) do
            if v184.uiType == l_SpatialUIType_0.SpatialUI or v184.uiType == l_SpatialUIType_0.SpatialUIRoact then
                local l_panelObject_0 = v184.panelObject;
                l_panelObject_0.Enabled = true;
                l_panelObject_0.Adornee.Parent = workspace;
            elseif v184.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
                v184.panelObject.Parent = workspace;
            end;
        end;
        return;
    else
        for _, v187 in pairs(v180.uiGroups) do
            if v187.draggable and v187.dragBar then
                v187.dragBar:hide();
            end;
        end;
        for _, v189 in pairs(v180.uiElements) do
            if v189.uiType == l_SpatialUIType_0.SpatialUI or v189.uiType == l_SpatialUIType_0.SpatialUIRoact then
                local l_panelObject_1 = v189.panelObject;
                l_panelObject_1.Enabled = false;
                l_panelObject_1.Adornee.Parent = nil;
            elseif v189.uiType == l_SpatialUIType_0.SpatialUIPartOnly then
                v189.panelObject.Parent = nil;
            end;
        end;
        return;
    end;
end;
v61.updateUIGroupsForCurCamera = function(v191, v192, v193) --[[ Line: 491 ]] --[[ Name: updateUIGroupsForCurCamera ]]
    -- upvalues: l_VRService_0 (copy), l_SpatialUIType_0 (copy), l_isInExperienceUIVREnabled_0 (copy), l_InExperienceUIVRIXP_0 (copy)
    if not l_VRService_0.VREnabled then
        return;
    else
        for _, v195 in pairs(v191.uiGroups) do
            if v192 == nil and v195.draggable then
                v195.dragBar:setCFrame((v193 or workspace.CurrentCamera.CFrame) * v195.positionProps.uiGroupCameraOffSet:ToWorldSpace(v195.dragBarOffset));
            end;
        end;
        for v196, v197 in pairs(v191.uiElements) do
            if v192 == nil or v192 == v196 then
                local v198 = false;
                if v197 ~= nil then
                    v198 = false;
                    if v197.panelObject ~= nil then
                        v198 = v197.uiType ~= l_SpatialUIType_0.ScreenUI;
                    end;
                end;
                if v198 and v197.panelPositionProps and v197.panelPositionProps.cameraFixedPanelProp then
                    v198 = v197.panelPositionProps;
                    local l_cameraFixedPanelProp_1 = v198.cameraFixedPanelProp;
                    local v200 = if not (v197.uiType ~= l_SpatialUIType_0.SpatialUI) or v197.uiType == l_SpatialUIType_0.SpatialUIRoact then v197.panelObject.Adornee else if v197.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v197.panelObject else nil;
                    if v200 == nil then
                        return;
                    else
                        local v201 = v193 or workspace.CurrentCamera.CFrame;
                        if l_isInExperienceUIVREnabled_0 and not l_InExperienceUIVRIXP_0:isSpatialUICameraTypeFixEnabled() then
                            v201 = v191.uiGroupHelper:getGroupCameraCFrameIfPossible(v196, v191.uiElements);
                        end;
                        v200.CFrame = v201 * v191.uiGroups[v198.uiGroup].positionProps.uiGroupCameraOffSet:ToWorldSpace(l_cameraFixedPanelProp_1.uiGroupElementOffset);
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v61.onMouseTargetChanged = function(v202, v203) --[[ Line: 539 ]] --[[ Name: onMouseTargetChanged ]]
    for _, v205 in pairs(v202.uiGroups) do
        if v205.draggable then
            if v205.dragBar and v205.dragBar.part == v203 then
                v205.dragBar:startHover();
            elseif v205.dragBar and v205.dragBar.part ~= v203 then
                v205.dragBar:hoverEnd();
            end;
        end;
    end;
end;
v61.resetDragAndDrop = function(v206) --[[ Line: 551 ]] --[[ Name: resetDragAndDrop ]]
    for _, v208 in pairs(v206.uiGroups) do
        if v208.draggable and v208.dragBar then
            v208.dragBar:hide();
        end;
    end;
    v206:setUpUiGroups(true);
    v206:rescaleUIForCurrentHeadScale();
    v206:updateUIGroupsForCurCamera();
end;
v61.getAdditionalCameraScaleIfNeeded = function(_) --[[ Line: 564 ]] --[[ Name: getAdditionalCameraScaleIfNeeded ]]
    -- upvalues: l_VRService_0 (copy)
    if l_VRService_0.VREnabled then
        return workspace.CurrentCamera.HeadScale;
    else
        return 1;
    end;
end;
v61.rescaleUIForCurrentHeadScale = function(v210, v211, v212) --[[ Line: 568 ]] --[[ Name: rescaleUIForCurrentHeadScale ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v9 (copy), l_SpatialUIType_0 (copy)
    local v213 = if l_isInExperienceUIVREnabled_0 then v210:getAdditionalCameraScaleIfNeeded() else workspace.CurrentCamera.HeadScale;
    for _, v215 in pairs(v210.uiGroups) do
        if v211 == nil then
            local v216 = v213 / v215.headScale;
            v215.positionProps.uiGroupHeadRotation = v9.rescaleCFramePosition(v215.positionProps.uiGroupHeadRotation, v216);
            v215.positionProps.uiGroupCameraOffSet = v9.rescaleCFramePosition(v215.positionProps.uiGroupCameraOffSet, v216);
            v215.positionProps.defaultGroupHeadRotation = v9.rescaleCFramePosition(v215.positionProps.defaultGroupHeadRotation, v216);
            if v215.draggable then
                v215.dragBarOffset = v9.rescaleCFramePosition(v215.dragBarOffset, v216);
                v215.dragBar:rescale(v216);
            end;
            v215.headScale = v213;
            if l_isInExperienceUIVREnabled_0 then
                v215.lastCameraCFrame = workspace.CurrentCamera.CFrame;
            end;
        end;
    end;
    for v217, v218 in pairs(v210.uiElements) do
        if v212 == nil or v212 == v217 then
            local v219 = v213 / v218.headScale;
            if v218.uiType ~= l_SpatialUIType_0.SpatialUIRoact then
                local v220 = if not (v218.uiType ~= l_SpatialUIType_0.SpatialUI) or v218.uiType == l_SpatialUIType_0.SpatialUIRoact then v218.panelObject.Adornee else if v218.uiType == l_SpatialUIType_0.SpatialUIPartOnly then v218.panelObject else nil;
                if v220 ~= nil then
                    v220.Size = v220.Size * v219;
                end;
            end;
            local l_panelPositionProps_0 = v218.panelPositionProps;
            if l_panelPositionProps_0 and l_panelPositionProps_0.cameraFixedPanelProp then
                l_panelPositionProps_0.cameraFixedPanelProp.uiGroupElementOffset = v9.rescaleCFramePosition(l_panelPositionProps_0.cameraFixedPanelProp.uiGroupElementOffset, v219);
            end;
            v218.headScale = v213;
        end;
    end;
end;
v61.new = function() --[[ Line: 621 ]] --[[ Name: new ]]
    -- upvalues: l_isInExperienceUIVREnabled_0 (copy), v15 (ref), v16 (ref), v61 (copy), l_RunService_0 (copy), v7 (ref), l_InExperienceUIVRIXP_0 (copy), l_Players_0 (copy)
    local v222 = {
        currentMouseTarget = nil, 
        uiGroupsOutOfViewTimeStamp = nil, 
        uiElements = {}, 
        uiGroups = {}, 
        uiGroupHelper = {}, 
        stableCameraCache = {}
    };
    if l_isInExperienceUIVREnabled_0 then
        v222.uiGroupHelper = v15.new(false);
        v222.stableCameraCache = v16.new();
    end;
    setmetatable(v222, v61);
    v222:setUpUiGroups();
    v222:rescaleUIForCurrentHeadScale();
    v222:updateUIGroupsForCurCamera();
    l_RunService_0:BindToRenderStep("UIManagerRenderStep", Enum.RenderPriority.Last.Value, function() --[[ Line: 641 ]]
        -- upvalues: v222 (copy)
        v222:step();
    end);
    if not l_isInExperienceUIVREnabled_0 and v7 then
        v7.ShowTopBarChanged.Event:connect(function() --[[ Line: 647 ]]
            -- upvalues: v222 (copy)
            v222:onShowTopBarChanged();
        end);
    end;
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    l_CurrentCamera_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 654 ]]
        -- upvalues: l_isInExperienceUIVREnabled_0 (ref), l_InExperienceUIVRIXP_0 (ref), v222 (copy)
        if l_isInExperienceUIVREnabled_0 and l_InExperienceUIVRIXP_0:isSpatialUICameraTypeFixEnabled() then
            if v222.stableCameraCache:updateAndCheckCameraMoved() then
                v222:updateUIGroupsForCurCamera(nil, (v222.stableCameraCache:getCurrentStableCameraCFrame()));
                return;
            end;
        else
            v222:updateUIGroupsForCurCamera();
        end;
    end);
    l_CurrentCamera_0:GetPropertyChangedSignal("HeadScale"):Connect(function() --[[ Line: 665 ]]
        -- upvalues: v222 (copy)
        v222:rescaleUIForCurrentHeadScale();
        v222:updateUIGroupsForCurHeadCFrame();
    end);
    local l_Mouse_0 = l_Players_0.LocalPlayer:GetMouse();
    if l_Mouse_0 then
        l_Mouse_0.Move:Connect(function() --[[ Line: 673 ]]
            -- upvalues: l_Players_0 (ref), v222 (copy)
            local l_Mouse_1 = l_Players_0.LocalPlayer:GetMouse();
            if l_Mouse_1.Target ~= v222.currentMouseTarget then
                v222:onMouseTargetChanged(l_Mouse_1.Target);
                v222.currentMouseTarget = l_Mouse_1.Target;
            end;
        end);
    end;
    return v222;
end;
v61.getBottomBarVisibility = function(v226) --[[ Line: 686 ]] --[[ Name: getBottomBarVisibility ]]
    -- upvalues: v22 (copy)
    if v22 then
        return nil;
    else
        return v226.uiGroupHelper:getBottomBarVisibility();
    end;
end;
v61.isBottomBarInteractionOnAnimationSupported = function(v227) --[[ Line: 693 ]] --[[ Name: isBottomBarInteractionOnAnimationSupported ]]
    -- upvalues: v22 (copy)
    if v22 then
        return false;
    else
        return (v227.uiGroupHelper:getBottomBarVisibility():get());
    end;
end;
v61.getInstance = function() --[[ Line: 700 ]] --[[ Name: getInstance ]]
    -- upvalues: v62 (ref), v61 (copy)
    if v62 == nil then
        v62 = v61.new();
    end;
    return v62;
end;
return v61;