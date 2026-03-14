local l_script_FirstAncestor_0 = script:FindFirstAncestor("VrSpatialUi");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local _ = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.Observable);
local v4 = require(l_script_FirstAncestor_0.Constants);
local v5 = require(l_script_FirstAncestor_0.createUIGroupDragBar);
local _ = require(l_script_FirstAncestor_0.DragBar);
local v7 = require(l_script_FirstAncestor_0.UIGroupState);
local v8 = require(l_script_FirstAncestor_0.PanelManagedAnimatable);
local l_InExperienceUIVRIXP_0 = require(l_Parent_0.SharedExperimentDefinition).InExperienceUIVRIXP;
local v10 = game:DefineFastInt("SpatialUIRepositionDeviationAngle", 10);
local v11 = game:DefineFastFlag("SpatialUIEnableCameraCacheFix", false);
local v12 = math.rad(v10);
getUIGroupTypeForPanel = function(v13, v14) --[[ Line: 44 ]] --[[ Name: getUIGroupTypeForPanel ]]
    local v15 = if v14 then v13[v14] else nil;
    if v15 == nil then
        return nil;
    else
        local l_panelPositionProps_0 = v15.panelPositionProps;
        if l_panelPositionProps_0 then
            return l_panelPositionProps_0.uiGroup;
        else
            return nil;
        end;
    end;
end;
getDragBarSafely = function(v17) --[[ Line: 60 ]] --[[ Name: getDragBarSafely ]]
    if v17 and v17.dragBar and v17.draggable then
        return v17.dragBar;
    else
        return nil;
    end;
end;
isTempPanel = function(v18) --[[ Line: 68 ]] --[[ Name: isTempPanel ]]
    -- upvalues: v4 (copy)
    return v18 == v4.PanelType.ToolTipsContainer;
end;
visitAllPanels = function(v19, v20) --[[ Line: 72 ]] --[[ Name: visitAllPanels ]]
    for v21, v22 in pairs(v19) do
        v20(v21, v22);
    end;
end;
visitDraggablePanels = function(v23, v24, v25) --[[ Line: 81 ]] --[[ Name: visitDraggablePanels ]]
    visitAllPanels(v23, function(v26, v27) --[[ Line: 89 ]]
        -- upvalues: v24 (copy), v25 (copy)
        local l_panelPositionProps_1 = v27.panelPositionProps;
        if l_panelPositionProps_1 and not isTempPanel(v26) and l_panelPositionProps_1.cameraFixedPanelProp and l_panelPositionProps_1.uiGroup == v24 then
            v25(v26, l_panelPositionProps_1.cameraFixedPanelProp);
        end;
    end);
end;
connect = function(v29, v30) --[[ Line: 102 ]] --[[ Name: connect ]]
    local v31 = v29:connect(v30);
    return {
        value = v29, 
        connection = v31
    };
end;
disconnect = function(v32) --[[ Line: 110 ]] --[[ Name: disconnect ]]
    if v32.connection then
        v32.connection:disconnect();
        v32.connection = nil;
    end;
end;
setPanelParent = function(v33, v34) --[[ Line: 117 ]] --[[ Name: setPanelParent ]]
    -- upvalues: v4 (copy)
    local v35 = v34 ~= nil;
    if v33.uiType == v4.SpatialUIType.SpatialUI or v33.uiType == v4.SpatialUIType.SpatialUIRoact then
        local l_panelObject_0 = v33.panelObject;
        l_panelObject_0.Enabled = v35;
        local l_Adornee_0 = l_panelObject_0.Adornee;
        l_Adornee_0.CanCollide = false;
        l_Adornee_0.CanTouch = false;
        l_Adornee_0.Anchored = true;
        l_Adornee_0.Parent = v34;
        return;
    else
        if v33.uiType == v4.SpatialUIType.SpatialUIPartOnly then
            v33.panelObject.Parent = v34;
        end;
        return;
    end;
end;
local v38 = {};
v38.__index = v38;
v38.setTopBarVisible = function(v39, v40, v41) --[[ Line: 153 ]] --[[ Name: setTopBarVisible ]]
    v39.topBarVisibleValue = connect(v40, v41);
end;
v38.isTopBarVisible = function(v42) --[[ Line: 157 ]] --[[ Name: isTopBarVisible ]]
    return v42.topBarVisibleValue.value:get();
end;
v38.prepareGuiToggleAnimationState = function(v43, _) --[[ Line: 161 ]] --[[ Name: prepareGuiToggleAnimationState ]]
    -- upvalues: v7 (copy)
    v43:setUIGroupState(v7.GuiToggleAnimation);
end;
v38.setUIGroupState = function(v45, v46) --[[ Line: 168 ]] --[[ Name: setUIGroupState ]]
    v45.uiGroupState = v46;
end;
v38.animateBottomBarOnHeadMoveIfNeeded = function(v47, _, v49, v50) --[[ Line: 172 ]] --[[ Name: animateBottomBarOnHeadMoveIfNeeded ]]
    -- upvalues: v7 (copy), v12 (copy)
    if v47.uiGroupState ~= v7.GuiToggleAnimation or v47.currentBottomBarAnimatable == nil then
        return;
    else
        local l_X_0 = v49.X;
        local l_Y_0 = v49.Y;
        local l_X_1 = v50.X;
        local l_Y_1 = v50.Y;
        local v55 = math.abs(l_X_0 - l_X_1);
        local v56 = math.abs(l_Y_0 - l_Y_1);
        local v57 = true;
        if v12 >= v55 then
            v57 = v12 < v56;
        end;
        if v57 then
            v47.currentBottomBarAnimatable:animateHideIfNeeded(false);
            return;
        else
            v47.currentBottomBarAnimatable:animateShowIfNeeded();
            return;
        end;
    end;
end;
v38.updateAllElements = function(v58, v59, v60) --[[ Line: 193 ]] --[[ Name: updateAllElements ]]
    -- upvalues: v7 (copy), v4 (copy), v8 (copy)
    local v61 = v58:isTopBarVisible();
    if v61 then
        v58:setUIGroupState(v7.Default);
        if v58.currentBottomBarAnimatable then
            v58.currentBottomBarAnimatable:reset();
            v58.currentBottomBarAnimatable = nil;
        end;
    end;
    v58:updateAllDragBar(v59, v60);
    visitAllPanels(v59, function(v62, v63) --[[ Line: 207 ]]
        -- upvalues: v4 (ref), v61 (copy), v58 (copy), v7 (ref), v8 (ref)
        local v64 = v62 == v4.PanelType.BottomBar;
        if v61 then
            setPanelParent(v63, workspace);
            return;
        else
            if v58.uiGroupState == v7.GuiToggleAnimation and v64 then
                if not v58.currentBottomBarAnimatable then
                    v58.currentBottomBarAnimatable = v8.create(v63.panelObject, v58.bottomBarVisibility);
                    if v58.currentBottomBarAnimatable then
                        v58.currentBottomBarAnimatable:hideAndBlockAnimationUntilLookBackAgain();
                        return;
                    end;
                end;
            else
                setPanelParent(v63, nil);
            end;
            return;
        end;
    end);
end;
v38.connectPanelVisibility = function(v65, v66, v67, v68, v69) --[[ Line: 227 ]] --[[ Name: connectPanelVisibility ]]
    if isTempPanel(v66) then
        return;
    else
        v65:disconnectPanelVisibility(v66, v68, v69);
        local v70 = getUIGroupTypeForPanel(v68, v66);
        if not v70 then
            return;
        else
            v65.uiGroupVisibilityMap[v70] = connect(v67, function() --[[ Line: 242 ]]
                -- upvalues: v65 (copy), v66 (copy), v68 (copy), v69 (copy)
                v65:updateDragBar(v66, v68, v69);
            end);
            v65:updateDragBar(v66, v68, v69);
            return;
        end;
    end;
end;
v38.disconnectPanelVisibility = function(v71, v72, v73, v74) --[[ Line: 248 ]] --[[ Name: disconnectPanelVisibility ]]
    if isTempPanel(v72) then
        return;
    else
        local v75 = getUIGroupTypeForPanel(v73, v72);
        local v76 = if v75 then v71.uiGroupVisibilityMap[v75] else nil;
        if v76 then
            disconnect(v76);
            v71.uiGroupVisibilityMap[v75] = nil;
            v71:updateDragBar(v72, v73, v74);
        end;
        return;
    end;
end;
v38.updateDragBar = function(v77, v78, v79, v80) --[[ Line: 268 ]] --[[ Name: updateDragBar ]]
    local v81 = getUIGroupTypeForPanel(v79, v78);
    local v82 = if v81 then v80[v81] else nil;
    if not v82 or not v82.dragBar or not v82.draggable or isTempPanel(v78) then
        return;
    else
        local v83 = v77:isTopBarVisible();
        local v84 = v77.uiGroupVisibilityMap[v81];
        if if v84 then v83 and v84.value:get() else false then
            v82.dragBar:show();
            return;
        else
            v82.dragBar:hide();
            return;
        end;
    end;
end;
v38.updateAllDragBar = function(v85, v86, v87) --[[ Line: 293 ]] --[[ Name: updateAllDragBar ]]
    for v88, _ in pairs(v86) do
        v85:updateDragBar(v88, v86, v87);
    end;
end;
v38.createUIGroup = function(v90, v91, v92, v93, v94, v95, v96) --[[ Line: 303 ]] --[[ Name: createUIGroup ]]
    -- upvalues: v4 (copy), v5 (copy), l_InExperienceUIVRIXP_0 (copy)
    local v97 = v4.UIGROUP_INITITIAL_ROTATION_MAP[v92];
    local v98 = v90.uiGroups[v92];
    local v99 = getDragBarSafely(v98);
    if v96 and v97 and v99 and v99:isEverDragged() then
        visitDraggablePanels(v95, v92, function(_, v101) --[[ Line: 319 ]]
            -- upvalues: v98 (copy), v97 (copy)
            v98.dragBarOffset = v98.dragBarOffset * v97;
            v101.uiGroupElementOffset = v101.uiGroupElementOffset * v97;
        end);
    end;
    local v102 = nil;
    local v103 = nil;
    v103 = v5({
        name = v92, 
        dragFunction = function(_, _, _, _, _) --[[ Line: 328 ]] --[[ Name: dragFunction ]]
            -- upvalues: v91 (copy), v92 (copy)
            v91:dragUiGroupStep(v92);
        end, 
        dragStartFunction = function(_, _, _, _, _, _, _) --[[ Line: 331 ]] --[[ Name: dragStartFunction ]]
            -- upvalues: v97 (copy), v102 (ref), v103 (ref), v95 (copy), v92 (copy), v91 (copy)
            if v97 and v102 and v103 and not v103:isEverDragged() then
                v103:setCFrame(v103:getCFrame() * v97:Inverse());
                v102.dragBarOffset = v102.dragBarOffset * v97:Inverse();
                visitDraggablePanels(v95, v92, function(_, v117) --[[ Line: 340 ]]
                    -- upvalues: v97 (ref)
                    v117.uiGroupElementOffset = v117.uiGroupElementOffset * v97:Inverse();
                end);
            end;
            v91:dragUiGroupStart(v92);
        end, 
        dragEndFunction = function(_) --[[ Line: 348 ]] --[[ Name: dragEndFunction ]]
            -- upvalues: v91 (copy), v92 (copy)
            v91:dragUiGroupEnd(v92);
        end, 
        dragBarPartSize = v4.DRAG_BAR_SIZE
    });
    v103:hide();
    v102 = {
        positionProps = v94, 
        uiContainerSize = v93, 
        draggable = l_InExperienceUIVRIXP_0:isDraggingAllowed(), 
        dragBar = v103, 
        dragBarOffset = v4.UIGROUP_DRAGBAR_OFFSET_MAP[v92], 
        headScale = 1
    };
    v90.uiGroups[v92] = v102;
    return v102;
end;
v38.checkAndGetUIGroupTypeForTempPanel = function(_, v120, v121) --[[ Line: 366 ]] --[[ Name: checkAndGetUIGroupTypeForTempPanel ]]
    if isTempPanel(v120) then
        return (getUIGroupTypeForPanel(v121, v120));
    else
        return nil;
    end;
end;
v38.getGroupCameraCFrameIfPossible = function(v122, v123, v124) --[[ Line: 377 ]] --[[ Name: getGroupCameraCFrameIfPossible ]]
    -- upvalues: v11 (copy)
    local l_CFrame_0 = workspace.CurrentCamera.CFrame;
    if v11 and isTempPanel(v123) then
        local v126 = getUIGroupTypeForPanel(v124, v123);
        if v126 ~= nil and v122.uiGroups[v126].lastCameraCFrame then
            l_CFrame_0 = v122.uiGroups[v126].lastCameraCFrame;
        end;
    end;
    return l_CFrame_0;
end;
v38.getBottomBarVisibility = function(v127) --[[ Line: 393 ]] --[[ Name: getBottomBarVisibility ]]
    return v127.bottomBarVisibility;
end;
v38.new = function(v128) --[[ Line: 397 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), v7 (copy), v38 (copy)
    local v129 = {
        uiGroupVisibilityMap = {}, 
        topBarVisibleValue = {
            value = v3.ObservableValue.new(v128)
        }, 
        uiGroups = {}, 
        uiGroupState = v7.Default, 
        bottomBarVisibility = v3.ObservableValue.new(true), 
        currentBottomBarAnimatable = nil
    };
    setmetatable(v129, v38);
    return v129;
end;
return v38;