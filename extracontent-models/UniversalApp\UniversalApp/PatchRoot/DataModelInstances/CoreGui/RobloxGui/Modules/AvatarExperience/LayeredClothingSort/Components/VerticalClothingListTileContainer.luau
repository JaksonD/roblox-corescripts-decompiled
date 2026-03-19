local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v8 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local v9 = require(l_CorePackages_0.Packages.InputHandlers);
local l_useFocusGuiObject_0 = v8.useFocusGuiObject;
local l_FocusNavigationEventNameEnum_0 = v7.FocusNavigationEventNameEnum;
local l_useDescendantHasFocus_0 = v7.useDescendantHasFocus;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Components.VerticalClothingListTile);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local function v24(v17, v18, v19) --[[ Line: 37 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v8 (copy), v4 (copy), l_FocusNavigationEventNameEnum_0 (copy), v9 (copy)
    local v20 = v8.useEventMap(v18, v17);
    local v23 = v4.useMemo(function() --[[ Line: 40 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v9 (ref), v19 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.SelectClothingTile] = {
                handler = v9.onRelease(v19.onSelect)
            }, 
            [l_FocusNavigationEventNameEnum_0.Confirm] = {
                handler = v9.onRelease(v19.onConfirm)
            }, 
            [l_FocusNavigationEventNameEnum_0.MoveClothingTileUpOne] = if v19.onMoveTileUpOne then {
                handler = v9.onRelease(v19.onMoveTileUpOne)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.MoveClothingTileDownOne] = if v19.onMoveTileDownOne then {
                handler = v9.onRelease(v19.onMoveTileDownOne)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.CancelAndReset] = if v19.onCancelAndReset then {
                handler = v9.onRelease(function(v21) --[[ Line: 60 ]]
                    -- upvalues: v19 (ref)
                    v21.cancelled = true;
                    v19.onCancelAndReset();
                end)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.RemoveClothingTile] = if v19.onRemoveClothingTile then {
                handler = v9.onRelease(v19.onRemoveClothingTile)
            } else nil, 
            [l_FocusNavigationEventNameEnum_0.MoveClothingTile] = if v19.displayMoveIcon then {
                handler = v9.onRelease(function(_) --[[ Line: 73 ]]

                end)
            } else nil
        };
    end, {
        v19.onSelect, 
        v19.onConfirm, 
        v19.onMoveTileUpOne, 
        v19.onMoveTileDownOne, 
        v19.onCancelAndReset, 
        v19.onRemoveClothingTile, 
        v19.displayMoveIcon
    });
    return v8.useEventHandlerMap(v23, v20);
end;
return (v5.forwardRef(function(v25, v26) --[[ Line: 93 ]]
    -- upvalues: v4 (copy), l_useFocusGuiObject_0 (copy), l_FocusNavigationEventNameEnum_0 (copy), v24 (copy), l_useTableWrappedCallbackRef_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useDescendantHasFocus_0 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy), v5 (copy), v15 (copy), v6 (copy)
    local v27 = v4.useRef(false);
    local v28 = l_useFocusGuiObject_0();
    local v29 = v4.useMemo(function() --[[ Line: 98 ]]
        -- upvalues: v25 (copy), l_FocusNavigationEventNameEnum_0 (ref)
        return {
            [Enum.KeyCode.ButtonA] = if v25.selectedAssetId == nil then l_FocusNavigationEventNameEnum_0.SelectClothingTile else l_FocusNavigationEventNameEnum_0.Confirm, 
            [Enum.KeyCode.DPadUp] = l_FocusNavigationEventNameEnum_0.MoveClothingTileUpOne, 
            [Enum.KeyCode.DPadDown] = l_FocusNavigationEventNameEnum_0.MoveClothingTileDownOne, 
            [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.CancelAndReset, 
            [Enum.KeyCode.ButtonY] = l_FocusNavigationEventNameEnum_0.RemoveClothingTile, 
            [Enum.KeyCode.Thumbstick1] = l_FocusNavigationEventNameEnum_0.MoveClothingTile
        };
    end, {
        v25.selectedAssetId
    });
    local v30 = v4.useCallback(function() --[[ Line: 111 ]]
        -- upvalues: v25 (copy)
        v25.onSelectTile(v25.asset);
    end, {
        v25.onSelectTile, 
        v25.asset
    });
    local v31 = v4.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v25 (copy)
        v25.onConfirmTile();
    end, {
        v25.onConfirmTile
    });
    local v32 = v4.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: v25 (copy)
        v25.onMoveTileUpOne(v25.tileIndex, v25.asset);
    end, {
        v25.onMoveTileUpOne, 
        v25.tileIndex, 
        v25.asset
    });
    local v33 = v4.useCallback(function() --[[ Line: 123 ]]
        -- upvalues: v25 (copy)
        v25.onMoveTileDownOne(v25.tileIndex, v25.asset);
    end, {
        v25.onMoveTileDownOne, 
        v25.tileIndex, 
        v25.asset
    });
    local v34 = v4.useCallback(function() --[[ Line: 127 ]]
        -- upvalues: v25 (copy)
        v25.onCancelAndReset();
    end, {
        v25.onCancelAndReset
    });
    local v35 = v4.useCallback(function() --[[ Line: 131 ]]
        -- upvalues: v25 (copy)
        v25.onRemoveClothingTile(v25.asset);
    end, {
        v25.onRemoveClothingTile, 
        v25.asset
    });
    local v36 = v25.selectedAssetId == v25.asset.id;
    local v37 = v24(v26, v29, {
        onSelect = v30, 
        onConfirm = v31, 
        onMoveTileUpOne = if v36 then v32 else nil, 
        onMoveTileDownOne = if v36 then v33 else nil, 
        onCancelAndReset = if v36 then v34 else nil, 
        onRemoveClothingTile = if v36 then v35 else nil, 
        displayMoveIcon = v36
    });
    local v38 = l_useTableWrappedCallbackRef_0(v37);
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        v4.useEffect(function() --[[ Line: 148 ]]
            -- upvalues: v25 (copy), v27 (copy), v28 (copy), v38 (copy)
            if v25.lastInputIsGamepad and v25.tileIndex == 1 and not v27.current then
                v28(v38.current);
            end;
            v27.current = true;
        end, {
            v25.lastInputIsGamepad, 
            v25.tileIndex, 
            v28
        });
    else
        v4.useEffect(function() --[[ Line: 157 ]]
            -- upvalues: v25 (copy), v27 (copy), v38 (copy)
            if v25.tileIndex == 1 and not v27.current then
                v25.focusController.moveFocusTo(v38);
            end;
            v27.current = true;
        end, {
            v25.focusController, 
            v25.tileIndex
        });
    end;
    local v39 = l_useDescendantHasFocus_0(v38.current);
    v4.useEffect(function() --[[ Line: 169 ]]
        -- upvalues: v39 (copy), l_RunService_0 (ref), v25 (copy), l_UserInputService_0 (ref)
        if not v39 then
            return;
        else
            local v40 = nil;
            local v42 = l_RunService_0.Heartbeat:Connect(function(_) --[[ Line: 175 ]]
                -- upvalues: v40 (ref), v25 (ref)
                if v40 and v40.KeyCode == Enum.KeyCode.Thumbstick1 and v25.selectedAssetId == v25.asset.id then
                    v25.onMoveThumbstickInput(v40, v25.tileIndex, v25.asset);
                end;
            end);
            local v45 = l_UserInputService_0.InputChanged:Connect(function(v43, _) --[[ Line: 184 ]]
                -- upvalues: v40 (ref)
                if v43.KeyCode == Enum.KeyCode.Thumbstick1 then
                    if v43.UserInputState == Enum.UserInputState.Change then
                        v40 = v43;
                        return;
                    elseif v43.UserInputState == Enum.UserInputState.End then
                        v40 = nil;
                    end;
                end;
            end);
            return function() --[[ Line: 194 ]]
                -- upvalues: v42 (copy), v45 (copy)
                if v42 then
                    v42:Disconnect();
                end;
                if v45 then
                    v45:Disconnect();
                end;
            end;
        end;
    end, {
        v25.onMoveThumbstickInput, 
        v25.tileIndex, 
        v25.asset, 
        v25.selectedAssetId, 
        v39
    });
    return v5.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v15 else v6.Focusable[v15], {
        asset = v25.asset, 
        selectedAssetId = v25.selectedAssetId, 
        positionYOffset = v25.positionYOffset, 
        dragging = v25.dragging, 
        positionBinding = v25.positionBinding, 
        isTileSelected = v25.isTileSelected, 
        tileIndex = v25.tileIndex, 
        contextualOptionsVisible = v25.contextualOptionsVisible, 
        updateContextualOptionsVisible = v25.updateContextualOptionsVisible, 
        resetSelectedTile = v25.resetSelectedTile, 
        initializeDrag = v25.initializeDrag, 
        onEndClick = v25.onEndClick, 
        tileRef = v25.tileRef, 
        lastInputIsGamepad = v25.lastInputIsGamepad, 
        onFocusGained = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v25.onFocusGained, 
        [v5.Ref] = v38, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v25.NextSelectionDown, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v25.NextSelectionUp, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v25.NextSelectionLeft, 
        NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v25.NextSelectionRight
    });
end));