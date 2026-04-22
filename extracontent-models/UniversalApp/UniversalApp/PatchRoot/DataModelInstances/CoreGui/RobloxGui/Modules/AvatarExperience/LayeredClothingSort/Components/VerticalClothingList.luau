local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_RunService_0 = game:GetService("RunService");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local v7 = require(l_CorePackages_0.Packages.t);
local v8 = require(l_CorePackages_0.Packages.Cryo);
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local v10 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v12 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v12.Style.withStyle;
local l_withTooltip_0 = v12.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = v12.App.Dialog.Enum.TooltipOrientation;
local l_withNavigation_0 = v10.withNavigation;
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v22 = require(l_Modules_0.LuaApp.mutedError);
local v23 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Selectors.selectEquippedLCAccessoriesOrdered);
local v24 = require(l_Modules_0.AvatarExperience.LayeredMakeupSort.Selectors.selectEquippedLayeredMakeupOrdered);
local v25 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.DismissMenuBackground);
local v26 = require(l_Modules_0.AvatarExperience.AvatarRefinement.Constants);
local v27 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local l_GamepadUtils_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).Gamepad.GamepadUtils;
local v29 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v30 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v31 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v32 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingListTile);
local v33 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingListTileContainer);
local v34 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local l_logOnOverlayClosed_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v37 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v38 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local l_avatarLastEquippedStateStore_0 = v17.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateVerticalClothingListToFocusNavigation;
local l_FFlagAXCustomizeMakeupSupport_0 = v18.FFlagAXCustomizeMakeupSupport;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v18.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v45 = UDim.new(0, 10);
local v46 = UDim2.new(1, -v26.RightMargin, 0, 0);
local v47 = v5.PureComponent:extend("VerticalClothingList");
v47.validateProps = v7.strictInterface({
    lastInputIsGamepad = v7.boolean, 
    topBarRef = v7.optional(v7.table), 
    focusControllerProp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.table, 
    onDragChange = v7.optional(v7.callback), 
    focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v7.callback else nil, 
    currentSort = v7.optional(v7.table), 
    equippedAssets = v7.table, 
    equippedLayeredAssetIdsOrdered = v7.table, 
    tryOnItems = v7.table, 
    currentPage = if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then v7.string else nil, 
    setOrder = v7.callback, 
    setOrderForTryOns = v7.callback, 
    setCurrentSort = v7.callback, 
    sendAnalytics = v7.callback, 
    avatarRoute = v7.table, 
    navigation = v7.table, 
    forwardRef = v7.optional(v7.table), 
    analytics = v7.table, 
    NextSelectionLeft = v7.optional(v7.table), 
    NextSelectionRight = v7.optional(v7.table), 
    NextSelectionDown = v7.optional(v7.table), 
    NextSelectionUp = v7.optional(v7.table)
});
v47.defaultProps = {
    lastInputIsGamepad = false
};
v47.isVisible = function(v48) --[[ Line: 121 ]] --[[ Name: isVisible ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    return v48.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort;
end;
v47.init = function(v49) --[[ Line: 128 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v9 (copy), v26 (copy), l_IsVRAppBuild_0 (copy), l_AppStorageService_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_AvatarScreen_0 (copy), l_logOnOverlayClosed_0 (copy), l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 (copy)
    v49.listRef = v49.props.forwardRef or v5.createRef();
    v49.scrollingFrameRef = v5.createRef();
    v49.toolTipFrameRef = v5.createRef();
    v49.rootRefCache = v9.createRefCache();
    v49.tileRefCache = v9.createRefCache();
    v49.dragStartPosition = nil;
    v49.frameStartPositionYOffset = nil;
    v49.canvasStartHeight = nil;
    v49.dragging = false;
    v49.stickNeedsToReset = false;
    v49.moveConnection = nil;
    v49.focusLostConnection = nil;
    v49.releaseConnection = nil;
    v49.clickAndHoldConn = nil;
    v49.scrollConnection = nil;
    local v50, v51 = v5.createBinding(Vector2.new(0, 0));
    v49.canvasPosition = v50;
    v49.updateCanvasPosition = v51;
    v50, v51 = v5.createBinding(UDim2.fromOffset(v26.Tile.Padding, 0));
    v49.draggedTilePos = v50;
    v49.updateDraggedTilePos = v51;
    v50, v51 = v5.createBinding(false);
    v49.contextualOptionsVisible = v50;
    v49.updateContextualOptionsVisible = v51;
    v49:setState({
        draggingTileOrdering = v49.props.equippedLayeredAssetIdsOrdered, 
        orderingOnSelectWithGamepad = v49.props.equippedLayeredAssetIdsOrdered, 
        triggerSize = Vector2.new(0, 0), 
        showToolTip = not l_IsVRAppBuild_0() and l_AppStorageService_0:GetItem("ShowTooltipLCSortPage") == "true"
    });
    v49.onToolTipSizeChange = function(v52) --[[ Line: 171 ]]
        -- upvalues: v49 (copy)
        v49:setState({
            triggerSize = v52.AbsoluteSize
        });
    end;
    v49.onTooltipDismiss = function() --[[ Line: 177 ]]
        -- upvalues: v49 (copy), l_AppStorageService_0 (ref)
        v49:setState({
            showToolTip = false
        });
        l_AppStorageService_0:SetItem("ShowTooltipLCSortPage", "false");
        l_AppStorageService_0:flush();
    end;
    v49.isExceedingBottomThresh = function(v53) --[[ Line: 189 ]]
        -- upvalues: v49 (copy), v26 (ref)
        local v54 = v49.tileRefCache[v53]:getValue();
        local v55 = v49.scrollingFrameRef:getValue();
        if not v54 or not v55 then
            return false;
        else
            return (v55 and v55.AbsolutePosition.Y + v55.AbsoluteWindowSize.Y or 0) < v54.AbsolutePosition.Y + v26.Tile.Size;
        end;
    end;
    v49.isExceedingTopThresh = function(v56) --[[ Line: 206 ]]
        -- upvalues: v49 (copy)
        local v57 = v49.tileRefCache[v56]:getValue();
        local v58 = v49.scrollingFrameRef:getValue();
        if not v57 or not v58 then
            return false;
        else
            return v58.AbsolutePosition.Y > v57.AbsolutePosition.Y;
        end;
    end;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v49.onFocusGained = function(v59) --[[ Line: 223 ]]
            -- upvalues: v49 (copy), v26 (ref)
            local v60 = v49.tileRefCache[v59]:getValue();
            local v61 = v49.scrollingFrameRef:getValue();
            if v49.isExceedingTopThresh(v59) then
                local v62 = v61.AbsolutePosition.Y - v60.AbsolutePosition.Y + v26.Tile.Padding;
                v49.updateCanvasPosition(Vector2.new(0, v61.CanvasPosition.Y - v62));
                return;
            else
                if v49.isExceedingBottomThresh(v59) then
                    local v63 = if v61 then v61.AbsolutePosition.Y + v61.AbsoluteWindowSize.Y else 0;
                    local v64 = v60.AbsolutePosition.Y + v26.Tile.Size - v63 + v26.Tile.Padding;
                    v49.updateCanvasPosition(Vector2.new(0, v61.CanvasPosition.Y + v64));
                end;
                return;
            end;
        end;
    end;
    v49.resetSelectedTile = function() --[[ Line: 245 ]]
        -- upvalues: v49 (copy), v5 (ref)
        v49:setState({
            selectedAssetId = v5.None
        });
    end;
    v49.selectTile = function(v65) --[[ Line: 256 ]]
        -- upvalues: v49 (copy), v26 (ref)
        local v66 = v49:getTileOffsetsTable(v49.state.draggingTileOrdering)[v65.id];
        v49.updateDraggedTilePos(UDim2.fromOffset(v26.Tile.Padding + v26.Tile.Size / 2, v66 + v26.Tile.Size / 2));
        v49:setState({
            selectedAssetId = v65.id
        });
        if v49.state.showToolTip then
            v49.onTooltipDismiss();
        end;
    end;
    v49.initializeDrag = function(v67, v68, v69, v70, v71) --[[ Line: 274 ]]
        -- upvalues: v49 (copy)
        v71 = v71 or 0;
        v49.frameStartPositionYOffset = v67.Position.Y.Offset - v71;
        v49.dragStartPosition = v68.Position;
        v49.canvasStartHeight = v49.scrollingFrameRef:getValue().CanvasPosition.Y;
        v49.inputObject = v68;
        v49:startListeningForDrag(v69, v70);
    end;
    v49.onDismiss = function() --[[ Line: 288 ]]
        -- upvalues: v49 (copy)
        v49.updateContextualOptionsVisible(false);
        v49.resetSelectedTile();
    end;
    v49.onOverlayClosed = function(_) --[[ Line: 293 ]]
        -- upvalues: v49 (copy), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_logOnOverlayClosed_0 (ref)
        return function() --[[ Line: 294 ]]
            -- upvalues: v49 (ref), l_AvatarScreen_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_logOnOverlayClosed_0 (ref)
            local v73 = v49.props.lastInputIsGamepad and v49.props.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredClothingSort;
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v73 then
                l_logOnOverlayClosed_0("LayeredClothingSort");
                v49.props.focusControllerProp.captureFocus();
            end;
        end;
    end;
    if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then
        v49.onSelectTile = function(v74) --[[ Line: 306 ]]
            -- upvalues: v49 (copy)
            v49.selectTile(v74);
            v49:setState({
                orderingOnSelectWithGamepad = v49.props.equippedLayeredAssetIdsOrdered
            });
        end;
        v49.onConfirmTile = function() --[[ Line: 312 ]]
            -- upvalues: v49 (copy)
            v49.resetSelectedTile();
            v49:confirmAndSetOrder();
        end;
        v49.onMoveTileUpOne = function(v75, v76) --[[ Line: 316 ]]
            -- upvalues: v49 (copy)
            v49:moveTileUpOneGamepad(v75, v76);
        end;
        v49.onMoveTileDownOne = function(v77, v78) --[[ Line: 319 ]]
            -- upvalues: v49 (copy)
            v49:moveTileDownOneGamepad(v77, v78);
        end;
        v49.onCancelAndReset = function() --[[ Line: 322 ]]
            -- upvalues: v49 (copy)
            v49.resetSelectedTile();
            v49:setState({
                draggingTileOrdering = v49.state.orderingOnSelectWithGamepad
            });
        end;
        v49.onRemoveClothingTile = function(v79) --[[ Line: 328 ]]
            -- upvalues: v49 (copy), l_AvatarScreen_0 (ref)
            v49.props.navigation.navigate(l_AvatarScreen_0.RemoveItemPrompt, {
                onOverlayClosed = v49.onOverlayClosed(), 
                asset = v79, 
                onUnequip = v49.resetSelectedTile
            });
        end;
        v49.onMoveThumbstickInput = function(v80, v81, v82) --[[ Line: 335 ]]
            -- upvalues: v49 (copy)
            v49:handleThumbstickInput(v80, v81, v82);
        end;
    end;
end;
v47.getTileOrderingAfterMove = function(_, v84, v85, v86, v87, v88) --[[ Line: 346 ]] --[[ Name: getTileOrderingAfterMove ]]
    local v89 = {};
    for v90, v91 in v88 do
        if v90 ~= v84 then
            table.insert(v89, v91);
        end;
    end;
    table.insert(v89, math.max(1, (math.min(v84 + v85 * v86, #v88))), v87);
    return v89;
end;
v47.updateDraggingTileOrdering = function(v92, v93) --[[ Line: 363 ]] --[[ Name: updateDraggingTileOrdering ]]
    if v93 and v92:shouldUpdateOrder(v93) then
        v92:setState({
            draggingTileOrdering = v93
        });
    end;
end;
v47.moveTileDownOneGamepad = function(v94, v95, v96) --[[ Line: 374 ]] --[[ Name: moveTileDownOneGamepad ]]
    -- upvalues: v26 (copy)
    v94:updateDraggingTileOrdering((v94:getTileOrderingAfterMove(v95, 1, 1, v96, v94.state.draggingTileOrdering)));
    local v97 = v94.tileRefCache[v96.id]:getValue();
    local v98 = v94.scrollingFrameRef:getValue();
    local v99 = v98 and v98.AbsolutePosition.Y + v98.AbsoluteWindowSize.Y or 0;
    local v100 = v97.AbsolutePosition.Y + v26.Tile.SelectedSize + v26.Tile.Size + v26.Tile.Padding;
    if v97 and v98 and v99 < v100 then
        local l_Y_0 = v98.CanvasPosition.Y;
        local v102 = v100 - v99 + v26.Tile.Padding;
        v94.updateCanvasPosition(Vector2.new(0, l_Y_0 + v102));
    end;
end;
v47.moveTileUpOneGamepad = function(v103, v104, v105) --[[ Line: 394 ]] --[[ Name: moveTileUpOneGamepad ]]
    -- upvalues: v26 (copy)
    v103:updateDraggingTileOrdering((v103:getTileOrderingAfterMove(v104, 1, -1, v105, v103.state.draggingTileOrdering)));
    local v106 = v103.tileRefCache[v105.id]:getValue();
    local v107 = v103.scrollingFrameRef:getValue();
    local l_Y_1 = v107.AbsolutePosition.Y;
    local v109 = v106.AbsolutePosition.Y - v26.Tile.Size - v26.Tile.Padding;
    if v106 and v107 and v109 < l_Y_1 then
        local l_Y_2 = v107.CanvasPosition.Y;
        local v111 = v109 - l_Y_1 - v26.Tile.Padding;
        v103.updateCanvasPosition(Vector2.new(0, l_Y_2 + v111));
    end;
end;
v47.handleThumbstickInput = function(v112, v113, v114, v115) --[[ Line: 412 ]] --[[ Name: handleThumbstickInput ]]
    -- upvalues: l_GamepadUtils_0 (copy)
    local l_Position_0 = v113.Position;
    local v117 = l_GamepadUtils_0.normalizeStickByDeadzone(l_Position_0, 0.6);
    if v117.Y > 0 and not v112.stickNeedsToReset then
        v112:moveTileUpOneGamepad(v114, v115);
        v112.stickNeedsToReset = true;
        return;
    elseif v117.Y < 0 and not v112.stickNeedsToReset then
        v112:moveTileDownOneGamepad(v114, v115);
        v112.stickNeedsToReset = true;
        return;
    else
        if v117.Y == 0 and v112.stickNeedsToReset then
            v112.stickNeedsToReset = false;
        end;
        return;
    end;
end;
v47.getTileOffsetsTable = function(_, v119) --[[ Line: 431 ]] --[[ Name: getTileOffsetsTable ]]
    -- upvalues: v26 (copy)
    local v120 = {};
    for v121, v122 in v119 do
        v120[v122.id] = (v121 - 1) * (v26.Tile.Size + v26.Tile.Padding);
    end;
    return v120;
end;
v47.shouldUpdateOrder = function(v123, v124) --[[ Line: 444 ]] --[[ Name: shouldUpdateOrder ]]
    if #v124 ~= #v123.state.draggingTileOrdering then
        return true;
    else
        for v125 = 1, #v124 do
            if v124[v125].id ~= v123.state.draggingTileOrdering[v125].id then
                return true;
            end;
        end;
        return false;
    end;
end;
v47.normalizeDraggedPosition = function(v126, v127) --[[ Line: 462 ]] --[[ Name: normalizeDraggedPosition ]]
    -- upvalues: v26 (copy), v22 (copy)
    local v128 = #v126.state.draggingTileOrdering;
    local v129 = v128 * (v26.Tile.Size + v26.Tile.Padding);
    local v130 = -v26.VerticalList.Padding;
    local v131 = v129 - v26.Tile.Size;
    if v131 < v130 then
        v22(string.format("VerticalClothingList invalid argument #3 to 'clamp' (max must be greater than or equal to min)\n  numTiles: %s, canvasHeight(maxDragHeight): %s, AbsoluteCanvasSize: %s, maximumDragHeight: %s", tostring(v128), tostring(v129), tostring(v126.scrollingFrameRef:getValue().AbsoluteCanvasSize.Y), (tostring(v131))));
        return v127;
    else
        return (math.clamp(v127, v130, v131));
    end;
end;
v47.createScrollConnection = function(v132, v133) --[[ Line: 488 ]] --[[ Name: createScrollConnection ]]
    -- upvalues: l_RunService_0 (copy), v26 (copy)
    if not v132.scrollingFrameRef:getValue() then
        return;
    else
        v132.scrollConnection = l_RunService_0.RenderStepped:connect(function(v134) --[[ Line: 493 ]]
            -- upvalues: v132 (copy), v133 (copy), v26 (ref)
            local v135 = v132.scrollingFrameRef:getValue();
            if not v135 then
                v132.scrollConnection:Disconnect();
                v132.scrollConnection = nil;
                return;
            else
                local l_Y_3 = v135.CanvasPosition.Y;
                if l_Y_3 < v135.AbsoluteCanvasSize.Y - v135.AbsoluteWindowSize.Y and v133 == 1 or l_Y_3 > 0 and v133 == -1 then
                    v132.updateDraggedTilePos(UDim2.fromOffset(v26.Tile.Padding + v26.Tile.Size / 2, v132:normalizeDraggedPosition(v132.draggedTilePos:getValue().Y.Offset + math.ceil(50 * v134) * v133)));
                    v132.updateCanvasPosition(Vector2.new(0, l_Y_3 + math.ceil(50 * v134) * v133));
                end;
                return;
            end;
        end);
        return;
    end;
end;
v47.processDrag = function(v137, v138, v139, v140) --[[ Line: 523 ]] --[[ Name: processDrag ]]
    -- upvalues: v26 (copy)
    local v141 = v137.scrollingFrameRef:getValue();
    if not v141 then
        return;
    else
        local l_Y_4 = v141.CanvasPosition.Y;
        local v143 = v138.y - v137.dragStartPosition.Y + (l_Y_4 - v137.canvasStartHeight);
        local v144 = v137.frameStartPositionYOffset + v143;
        local l_id_0 = v139.id;
        local l_equippedLayeredAssetIdsOrdered_0 = v137.props.equippedLayeredAssetIdsOrdered;
        local v147 = v26.Tile.Size / 2 + v26.Tile.Padding;
        local v148 = math.floor((math.abs(v143) - v147) / (v26.Tile.Size + v26.Tile.Padding)) + 1;
        local v149 = v147 < v143 and 1 or -1;
        if v147 < math.abs(v143) then
            l_equippedLayeredAssetIdsOrdered_0 = v137:getTileOrderingAfterMove(v140, v148, v149, v139, v137.props.equippedLayeredAssetIdsOrdered);
        end;
        v137:updateDraggingTileOrdering(l_equippedLayeredAssetIdsOrdered_0);
        v137.updateDraggedTilePos(UDim2.fromOffset(v26.Tile.Padding + v26.Tile.Size / 2, v137:normalizeDraggedPosition(v144) + v26.Tile.Size / 2));
        if v137.isExceedingTopThresh(l_id_0) or v137.isExceedingBottomThresh(l_id_0) then
            if not v137.scrollConnection then
                v137:createScrollConnection(v137.isExceedingBottomThresh(l_id_0) and 1 or -1);
                return;
            end;
        elseif v137.scrollConnection ~= nil then
            v137.scrollConnection:Disconnect();
            v137.scrollConnection = nil;
        end;
        return;
    end;
end;
v47.removeConnections = function(v150) --[[ Line: 580 ]] --[[ Name: removeConnections ]]
    if v150.moveConnection ~= nil then
        v150.moveConnection:Disconnect();
        v150.moveConnection = nil;
    end;
    if v150.releaseConnection ~= nil then
        v150.releaseConnection:Disconnect();
        v150.releaseConnection = nil;
    end;
    if v150.focusLostConnection ~= nil then
        v150.focusLostConnection:Disconnect();
        v150.focusLostConnection = nil;
    end;
    if v150.scrollConnection ~= nil then
        v150.scrollConnection:Disconnect();
        v150.scrollConnection = nil;
    end;
end;
v47.confirmAndSetOrder = function(v151) --[[ Line: 603 ]] --[[ Name: confirmAndSetOrder ]]
    -- upvalues: v27 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_AvatarScreen_0 (copy), v8 (copy), l_avatarLastEquippedStateStore_0 (copy)
    local v152, v153 = v27.formatForSetOrderWithTryOns(v151.state.draggingTileOrdering, v151.props.equippedAssets, v151.props.tryOnItems);
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 and v151.props.currentPage == l_AvatarScreen_0.LayeredMakeupSort and #v8.Dictionary.keys(v151.props.tryOnItems) > 0 then
        l_avatarLastEquippedStateStore_0.setChangedLayeredMakeupSorting(true);
    end;
    v151.props.setOrder(v152);
    v151.props.setOrderForTryOns(v153);
    v151.props.setCurrentSort(v151.state.draggingTileOrdering);
    v151.props.sendAnalytics(v151.props.analytics.avatarRefineAutosaved);
end;
v47.stopListeningForDrag = function(v154, _) --[[ Line: 630 ]] --[[ Name: stopListeningForDrag ]]
    v154.dragging = false;
    if v154.props.onDragChange then
        v154.props.onDragChange(false);
    end;
    v154.inputObject = nil;
    v154:removeConnections();
    v154.resetSelectedTile();
    v154:confirmAndSetOrder();
end;
v47.startListeningForDrag = function(v156, v157, v158) --[[ Line: 646 ]] --[[ Name: startListeningForDrag ]]
    -- upvalues: l_UserInputService_0 (copy)
    if v156.rootRefCache[v157.id]:getValue() == nil then
        return;
    elseif v156.dragging then
        return;
    else
        if v156.props.onDragChange then
            v156.props.onDragChange(true);
        end;
        v156.dragging = true;
        v156.updateContextualOptionsVisible(false);
        v156.moveConnection = l_UserInputService_0.InputChanged:Connect(function(v159) --[[ Line: 663 ]]
            -- upvalues: v156 (copy), v157 (copy), v158 (copy)
            if not v156.dragging then
                return;
            else
                local l_UserInputType_0 = v159.UserInputType;
                if l_UserInputType_0 ~= Enum.UserInputType.MouseMovement and l_UserInputType_0 ~= Enum.UserInputType.Touch then
                    return;
                elseif v159.UserInputState ~= Enum.UserInputState.Change then
                    return;
                elseif v159 ~= v156.inputObject and l_UserInputType_0 == Enum.UserInputType.Touch then
                    return;
                else
                    v156:processDrag(v159.Position, v157, v158);
                    return;
                end;
            end;
        end);
        v156.releaseConnection = l_UserInputService_0.InputEnded:Connect(function(v161) --[[ Line: 685 ]]
            -- upvalues: v156 (copy), v157 (copy)
            local l_UserInputType_1 = v161.UserInputType;
            if l_UserInputType_1 ~= Enum.UserInputType.MouseButton1 and l_UserInputType_1 ~= Enum.UserInputType.Touch then
                return;
            elseif v161 ~= v156.inputObject and l_UserInputType_1 == Enum.UserInputType.Touch then
                return;
            else
                v156:stopListeningForDrag(v157);
                return;
            end;
        end);
        v156.focusLostConnection = l_UserInputService_0.WindowFocusReleased:Connect(function() --[[ Line: 702 ]]
            -- upvalues: v156 (copy), v157 (copy)
            v156:stopListeningForDrag(v157);
        end);
        v156.selectTile(v157);
        return;
    end;
end;
v47.getInputBindings = function(v163, v164, v165, v166) --[[ Line: 710 ]] --[[ Name: getInputBindings ]]
    -- upvalues: v9 (copy), l_AvatarScreen_0 (copy)
    return {
        ToggleSelect = v9.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 712 ]]
            -- upvalues: v163 (copy), v164 (copy)
            if v163.state.selectedAssetId == nil then
                v163.selectTile(v164);
                v163:setState({
                    orderingOnSelectWithGamepad = v163.props.equippedLayeredAssetIdsOrdered
                });
                return;
            else
                v163.resetSelectedTile();
                v163:confirmAndSetOrder();
                return;
            end;
        end, {
            key = v163.state.selectedAssetId == nil and "Feature.Avatar.Action.Select" or "CommonUI.Controls.Action.Confirm"
        }), 
        SelectedTile = v163.state.selectedAssetId == v164.id and v9.Input.onStep(Enum.KeyCode.Thumbstick1, function(v167, _) --[[ Line: 727 ]]
            -- upvalues: v163 (copy), v165 (copy), v164 (copy)
            v163:handleThumbstickInput(v167, v165, v164);
        end, {
            axes = {
                vertical = {
                    key = "Feature.Avatar.Title.Move"
                }
            }
        }) or nil, 
        MoveSelectedTileUp = v163.state.selectedAssetId == v164.id and v9.Input.onBegin(Enum.KeyCode.DPadUp, function() --[[ Line: 738 ]]
            -- upvalues: v163 (copy), v165 (copy), v164 (copy)
            v163:moveTileUpOneGamepad(v165, v164);
        end) or nil, 
        MoveSelectedTileDown = v163.state.selectedAssetId == v164.id and v9.Input.onBegin(Enum.KeyCode.DPadDown, function() --[[ Line: 743 ]]
            -- upvalues: v163 (copy), v165 (copy), v164 (copy)
            v163:moveTileDownOneGamepad(v165, v164);
        end) or nil, 
        UnselectAndReset = v163.state.selectedAssetId == v164.id and v9.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 748 ]]
            -- upvalues: v163 (copy)
            v163.resetSelectedTile();
            v163:setState({
                draggingTileOrdering = v163.state.orderingOnSelectWithGamepad
            });
        end, {
            key = "Feature.Catalog.Action.Cancel"
        }) or nil, 
        OpenUnequipPrompt = v163.state.selectedAssetId == v164.id and v9.Input.onBegin(Enum.KeyCode.ButtonY, function() --[[ Line: 758 ]]
            -- upvalues: v163 (copy), l_AvatarScreen_0 (ref), v166 (copy), v164 (copy)
            v163.props.navigation.navigate(l_AvatarScreen_0.RemoveItemPrompt, {
                onOverlayClosed = v163.onOverlayClosed(v166), 
                asset = v164, 
                onUnequip = v163.resetSelectedTile
            });
        end, {
            key = "Feature.Catalog.Action.Remove"
        }) or nil
    };
end;
v47.render = function(v169) --[[ Line: 771 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withStyle_0(function(v170) --[[ Line: 772 ]]
        -- upvalues: l_withLocalization_0 (ref), v169 (copy)
        return l_withLocalization_0({
            tooltipText = "Feature.Avatar.Message.LCSortListTooltip"
        })(function(v171) --[[ Line: 775 ]]
            -- upvalues: v169 (ref), v170 (copy)
            return v169:renderWithProviders(v170, v171);
        end);
    end);
end;
v47.renderWithProviders = function(v172, v173, v174, v175) --[[ Line: 781 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 (copy), v5 (copy), v33 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v9 (copy), v32 (copy), v26 (copy), l_TooltipOrientation_0 (copy), l_CoreGui_0 (copy), l_IsVRAppBuild_0 (copy), v46 (copy), l_withTooltip_0 (copy), v45 (copy), v25 (copy)
    local l_Theme_0 = v173.Theme;
    local v177 = {};
    local v178 = v172:getTileOffsetsTable(v172.state.draggingTileOrdering);
    for v179, v180 in v172.state.draggingTileOrdering do
        local v181 = if v172.state.selectedAssetId == nil and v179 ~= #v172.state.draggingTileOrdering then v172.rootRefCache[v172.state.draggingTileOrdering[v179 + 1].id] else nil;
        local v182 = if v172.state.selectedAssetId == nil and v179 ~= 1 then v172.rootRefCache[v172.state.draggingTileOrdering[v179 - 1].id] else nil;
        if l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then
            v177[v180.id] = v5.createElement(v33, {
                asset = v180, 
                selectedAssetId = v172.state.selectedAssetId, 
                positionYOffset = v178[v180.id], 
                dragging = v172.dragging, 
                positionBinding = v172.draggedTilePos, 
                isTileSelected = v172.state.selectedAssetId == v180.id, 
                tileIndex = v179, 
                contextualOptionsVisible = v172.contextualOptionsVisible, 
                updateContextualOptionsVisible = v172.updateContextualOptionsVisible, 
                resetSelectedTile = v172.resetSelectedTile, 
                initializeDrag = v172.initializeDrag, 
                onEndClick = v172.selectTile, 
                tileRef = v172.tileRefCache[v180.id], 
                focusController = v172.props.focusControllerProp, 
                lastInputIsGamepad = v172.props.lastInputIsGamepad, 
                onFocusGained = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else function() --[[ Line: 815 ]]
                    -- upvalues: v172 (copy), v180 (copy)
                    v172.onFocusGained(v180.id);
                end, 
                [v5.Ref] = v172.rootRefCache[v180.id], 
                NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v181, 
                NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v182, 
                NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v172.props.NextSelectionLeft or v172.rootRefCache[v180.id], 
                NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v172.rootRefCache[v180.id], 
                onSelectTile = v172.onSelectTile, 
                onConfirmTile = v172.onConfirmTile, 
                onMoveTileUpOne = v172.onMoveTileUpOne, 
                onMoveTileDownOne = v172.onMoveTileDownOne, 
                onCancelAndReset = v172.onCancelAndReset, 
                onRemoveClothingTile = v172.onRemoveClothingTile, 
                onMoveThumbstickInput = v172.onMoveThumbstickInput
            });
        else
            v177[v180.id] = v5.createElement(v9.Focusable[v32], {
                asset = v180, 
                selectedAssetId = v172.state.selectedAssetId, 
                positionYOffset = v178[v180.id], 
                dragging = v172.dragging, 
                positionBinding = v172.draggedTilePos, 
                isTileSelected = v172.state.selectedAssetId == v180.id, 
                tileIndex = v179, 
                contextualOptionsVisible = v172.contextualOptionsVisible, 
                updateContextualOptionsVisible = v172.updateContextualOptionsVisible, 
                resetSelectedTile = v172.resetSelectedTile, 
                initializeDrag = v172.initializeDrag, 
                onEndClick = v172.selectTile, 
                tileRef = v172.tileRefCache[v180.id], 
                lastInputIsGamepad = v172.props.lastInputIsGamepad, 
                onFocusGained = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else function() --[[ Line: 853 ]]
                    -- upvalues: v172 (copy), v180 (copy)
                    v172.onFocusGained(v180.id);
                end, 
                [v5.Ref] = v172.rootRefCache[v180.id], 
                NextSelectionDown = v181, 
                NextSelectionUp = v182, 
                NextSelectionLeft = v172.props.NextSelectionLeft or v172.rootRefCache[v180.id], 
                NextSelectionRight = v172.rootRefCache[v180.id], 
                inputBindings = v172:getInputBindings(v180, v179, v175)
            });
        end;
    end;
    local v183 = if not (#v172.state.draggingTileOrdering ~= 0) or l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then nil else v172.rootRefCache[v172.state.draggingTileOrdering[1].id];
    local v184 = #v172.state.draggingTileOrdering;
    local v185 = v184 * (v26.Tile.Size + v26.Tile.Padding);
    local v186 = #v172.props.equippedLayeredAssetIdsOrdered > 0;
    local v187 = v186 and v9.Focusable.Frame or "Frame";
    local v188 = {
        bodyText = v174.tooltipText, 
        useLargeDropShadow = true
    };
    local v189 = {
        preferredOrientation = l_TooltipOrientation_0.Left, 
        guiTarget = l_CoreGui_0, 
        triggerPointName = "RoundedFrame", 
        active = v172.state.showToolTip and v172:isVisible()
    };
    local v190 = v26.VerticalList.Width + v26.Tile.ContextWidth;
    return v5.createFragment({
        VerticalClothingList = v5.createElement(v187, {
            AnchorPoint = if l_IsVRAppBuild_0() then Vector2.new(1, 0) else Vector2.new(1, 0), 
            Position = if l_IsVRAppBuild_0() then UDim2.new(1, 0, 0, v26.Tile.MoreIconSize + v26.VerticalList.Padding) else v46, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, v190, v26.VerticalList.HeightScale, 0), 
            ClipsDescendants = true, 
            Visible = v184 > 0, 
            ZIndex = 3, 
            [v5.Ref] = v172.listRef, 
            defaultChild = if not v186 or l_FFlagAXMigrateVerticalClothingListToFocusNavigation_0 then nil else v183, 
            restorePreviousChildFocus = v186 and true or nil
        }, {
            RoundedFrame = l_withTooltip_0(v188, v189, function(v191) --[[ Line: 913 ]]
                -- upvalues: v5 (ref), l_IsVRAppBuild_0 (ref), v26 (ref), v172 (copy), l_Theme_0 (copy), v185 (copy), v45 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v177 (copy), v25 (ref)
                local l_createElement_0 = v5.createElement;
                local v193 = "Frame";
                local v194 = {
                    AnchorPoint = if l_IsVRAppBuild_0() then Vector2.new(1, 0) else Vector2.new(1, 0), 
                    Position = if l_IsVRAppBuild_0() then UDim2.fromScale(1, 0) else UDim2.fromScale(1, 0), 
                    Size = UDim2.new(0, v26.VerticalList.Width, 1, 0), 
                    BackgroundTransparency = v172.state.selectedAssetId == nil and 0.2 or 0.5, 
                    BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                    ZIndex = 1, 
                    [v5.Change.AbsoluteSize] = v191, 
                    [v5.Change.AbsolutePosition] = v191
                };
                local v195 = {
                    UISizeConstraint = v5.createElement("UISizeConstraint", {
                        MaxSize = Vector2.new(v26.VerticalList.Width, v185 + v26.VerticalList.Padding)
                    }), 
                    UICorner = v5.createElement("UICorner", {
                        CornerRadius = v45
                    })
                };
                local l_createElement_1 = v5.createElement;
                local v197 = "ScrollingFrame";
                local v198 = {
                    Size = UDim2.new(1, 0, 1, 0), 
                    CanvasPosition = v172.canvasPosition, 
                    CanvasSize = UDim2.new(1, 0, 0, v185 + v26.VerticalList.Padding), 
                    BackgroundTransparency = 1, 
                    ScrollBarThickness = 0, 
                    ScrollingDirection = Enum.ScrollingDirection.Y
                };
                local v199 = false;
                if v172.state.selectedAssetId == nil then
                    v199 = not v172.props.lastInputIsGamepad;
                end;
                v198.ScrollingEnabled = v199;
                v198[v5.Ref] = v172.scrollingFrameRef;
                v198.ClipsDescendants = false;
                v198.Selectable = not l_FFlagAXMigrateAXToGlobalAutofocus_0 and nil;
                v195.ScrollingFrame = l_createElement_1(v197, v198, {
                    UIPadding = v5.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, v26.VerticalList.Padding), 
                        PaddingTop = UDim.new(0, v26.VerticalList.Padding)
                    }), 
                    LCTiles = v5.createFragment(v177), 
                    DismissMenuBackgroundScrollingFrame = v5.createElement(v25, {
                        Visible = v172.contextualOptionsVisible, 
                        ZIndex = v172.state.selectedAssetId == nil and 1 or 5, 
                        onDismiss = v172.onDismiss
                    })
                });
                return l_createElement_0(v193, v194, v195);
            end)
        }), 
        DismissMenuBackgroundPage = v5.createElement(v25, {
            Visible = v172.contextualOptionsVisible, 
            ZIndex = 2, 
            onDismiss = v172.onDismiss
        })
    });
end;
v47.didUpdate = function(v200, v201, v202) --[[ Line: 973 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    if v200.props.currentSort ~= v201.currentSort and v200:shouldUpdateOrder(v200.props.currentSort) then
        v200:setState({
            draggingTileOrdering = v200.props.currentSort
        });
    end;
    if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v200.state.selectedAssetId ~= v202.selectedAssetId then
        if v200.state.selectedAssetId then
            v200.onFocusGained(v200.state.selectedAssetId);
            if v200.props.lastInputIsGamepad and not v202.selectedAssetId then
                v200.props.focusControllerProp.moveFocusTo(v200.rootRefCache[v200.state.selectedAssetId]);
            end;
        else
            v200.onFocusGained(v202.selectedAssetId);
        end;
    end;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 and v200.state.selectedAssetId ~= v202.selectedAssetId then
        if v200.state.selectedAssetId then
            v200.props.focusGuiObject(v200.rootRefCache[v200.state.selectedAssetId].current);
            return;
        else
            v200.props.focusGuiObject(v200.rootRefCache[v202.selectedAssetId].current);
        end;
    end;
end;
v47.willUnmount = function(v203) --[[ Line: 1006 ]] --[[ Name: willUnmount ]]
    v203:removeConnections();
end;
v47 = v34((l_withNavigation_0(v6.connect(function(v204, v205) --[[ Line: 1010 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: l_FFlagAXCustomizeMakeupSupport_0 (copy), l_AvatarScreen_0 (copy), v24 (copy), v23 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy)
    local v206 = nil;
    if l_FFlagAXCustomizeMakeupSupport_0 then
        v206 = if v205.avatarRoute.opaque.name == l_AvatarScreen_0.LayeredMakeupSort then v24(v204) else v23(v204);
    end;
    return {
        equippedAssets = v204.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        equippedLayeredAssetIdsOrdered = if l_FFlagAXCustomizeMakeupSupport_0 then v206 else v23(v204), 
        currentSort = v204.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList, 
        tryOnItems = v204.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems, 
        currentPage = if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then v205.avatarRoute.opaque.name else nil
    };
end, function(v207) --[[ Line: 1035 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v29 (copy), v30 (copy), v31 (copy), v38 (copy)
    return {
        setOrder = function(v208) --[[ Line: 1037 ]] --[[ Name: setOrder ]]
            -- upvalues: v207 (copy), v29 (ref)
            v207(v29(v208));
        end, 
        setOrderForTryOns = function(v209) --[[ Line: 1040 ]] --[[ Name: setOrderForTryOns ]]
            -- upvalues: v207 (copy), v30 (ref)
            v207(v30(v209));
        end, 
        setCurrentSort = function(v210) --[[ Line: 1043 ]] --[[ Name: setCurrentSort ]]
            -- upvalues: v207 (copy), v31 (ref)
            v207(v31(v210));
        end, 
        sendAnalytics = function(v211) --[[ Line: 1046 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v207 (copy), v38 (ref)
            v207(v38(v211));
        end
    };
end)(v47), nil)));
v47 = l_RoactServices_0.connect({
    analytics = v37
})(v47);
return v5.forwardRef(function(v212, v213) --[[ Line: 1061 ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v5 (copy), v47 (ref), v8 (copy)
    local v214 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    return v5.createElement(v47, v8.Dictionary.join(v212, {
        forwardRef = v213, 
        focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v214 else nil
    }));
end);