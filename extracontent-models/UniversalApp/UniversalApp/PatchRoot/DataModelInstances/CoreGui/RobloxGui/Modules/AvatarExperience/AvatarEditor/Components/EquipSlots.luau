local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useFocusController_0 = v3.useFocusController;
local l_SlotTray_0 = require(l_CorePackages_0.Packages.UIBlox).App.Control.Slot.SlotTray;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v7 = require(l_CorePackages_0.Packages.React);
local v8 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v9 = require(l_CorePackages_0.Packages.t);
local l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad;
local v11 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v12 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v12.useFocusGuiObject;
local v14 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v11.FocusNavigationEventNameEnum;
local v16 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v16.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v16.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local function v21(v20) --[[ Line: 36 ]] --[[ Name: selectSlotInfo ]]
    return v20.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
end;
local function v23(v22) --[[ Line: 40 ]] --[[ Name: selectSelectedSlot ]]
    return v22.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot;
end;
local v24 = {
    [Enum.KeyCode.ButtonA] = l_FocusNavigationEventNameEnum_0.EquipSlotsSelectSlot, 
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v32(v25, v26, v27) --[[ Line: 49 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v12 (copy), v24 (copy), v7 (copy), l_FocusNavigationEventNameEnum_0 (copy), v14 (copy)
    local v28 = v12.useEventMap(v24, v25);
    local v31 = v7.useMemo(function() --[[ Line: 51 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v14 (ref), v26 (copy), v27 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.EquipSlotsSelectSlot] = {
                handler = v14.onRelease(function(_) --[[ Line: 54 ]]
                    -- upvalues: v26 (ref)
                    v26();
                end)
            }, 
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v14.onRelease(function(_) --[[ Line: 59 ]]
                    -- upvalues: v27 (ref)
                    v27();
                end)
            }
        };
    end, {
        v26, 
        v27
    });
    return v12.useEventHandlerMap(v31, v28);
end;
local v33 = v8.wrap(v9.strictInterface({
    slotsCount = v9.integer, 
    lockNavigationCallback = v9.optional(v9.callback), 
    unlockNavigationCallback = v9.optional(v9.callback), 
    onActivated = v9.optional(v9.callback), 
    LayoutOrder = v9.optional(v9.integer), 
    NextSelectionUp = v9.optional(v9.table), 
    NextSelectionDown = v9.optional(v9.table), 
    itemsListRef = v9.table, 
    forwardRef = v9.optional(v9.table), 
    onFocusChanged = v9.optional(v9.callback), 
    itemsListFocused = v9.optional(v9.boolean), 
    darkenItemsGrid = v9.optional(v9.boolean)
}));
local function v34() --[[ Line: 98 ]] --[[ Name: noOp ]]

end;
local function v65(v35) --[[ Line: 100 ]] --[[ Name: EquipSlots ]]
    -- upvalues: v33 (copy), l_useSelector_0 (copy), v21 (copy), v23 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v7 (copy), v34 (copy), l_useFocusGuiObject_0 (copy), l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 (copy), v32 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), l_Constants_0 (copy), v2 (copy), l_SlotTray_0 (copy), v3 (copy)
    assert(v33(v35));
    local v36 = l_useSelector_0(v21);
    local v37 = l_useSelector_0(v23);
    local v38 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v39 = v7.useRef(nil);
    local v40, v41 = v7.useState(nil);
    local v44 = v7.useCallback(function(v42) --[[ Line: 112 ]]
        -- upvalues: v41 (copy)
        local v43 = math.round(v42.AbsoluteSize.X);
        v41(v43);
    end);
    local v45 = v35.lockNavigationCallback or v34;
    local v46 = v35.unlockNavigationCallback or v34;
    local v47 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    local v48 = v7.useCallback(function() --[[ Line: 121 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v47 (copy), v35 (copy), v38 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v47 and v35.itemsListRef and v35.itemsListRef.current then
                v47(v35.itemsListRef.current);
                return;
            end;
        else
            v38.moveFocusTo(v35.itemsListRef);
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v47 else v38, 
        v35.itemsListRef
    });
    local v49 = v7.useCallback(function() --[[ Line: 133 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v47 (copy), v35 (copy), v38 (copy)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            if v47 and v35.NextSelectionUp and v35.NextSelectionUp.current then
                v47(v35.NextSelectionUp.current);
                return;
            end;
        else
            v38.moveFocusUp();
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v47 else v38
    });
    local v50 = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v32(nil, v48, v49) else nil;
    v7.useEffect(function() --[[ Line: 147 ]]
        -- upvalues: v39 (copy), v45 (copy)
        return function() --[[ Line: 148 ]]
            -- upvalues: v39 (ref), v45 (ref)
            if v39.current then
                v39.current = nil;
                v45();
            end;
        end;
    end, {
        v45
    });
    local v53 = v7.useCallback(function(_, v52) --[[ Line: 156 ]]
        -- upvalues: v39 (copy), v45 (copy)
        if v52.UserInputState == Enum.UserInputState.Begin then
            v39.current = v52;
            v45();
        end;
    end, {
        v45
    });
    local v56 = v7.useCallback(function(_, v55) --[[ Line: 163 ]]
        -- upvalues: v39 (copy), v46 (copy)
        if v55 == v39.current and v55.UserInputState == Enum.UserInputState.End then
            v39.current = nil;
            v46();
        end;
    end, {
        v46
    });
    local l_slotsCount_0 = v35.slotsCount;
    local v58 = {};
    local v59 = v35.itemsListFocused or v35.darkenItemsGrid;
    for v60 = 1, l_slotsCount_0 do
        local v61 = v36[v60] and v36[v60].assetId or nil;
        local v62 = v37 == v60;
        local v63 = nil;
        if v61 then
            v63 = l_getRbxthumbWithTypeSizeAndOptions_0(v61, l_Constants_0.RbxthumbTypes.Asset, 150);
        end;
        v58[v60] = {
            thumbnail = v63, 
            displayText = if v63 then nil else tostring(v60), 
            isDisabled = v59 and not v62
        };
    end;
    local l_forwardRef_0 = v35.forwardRef;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 72), 
        [v2.Change.AbsoluteSize] = v44, 
        ref = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v50 else nil
    }, {
        SlotTray = v2.createElement(l_SlotTray_0, {
            defaultSelectedSlotIndex = v37, 
            width = v40, 
            inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then nil else {
                SelectSlot = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 207 ]]
                    -- upvalues: v38 (copy), v35 (copy)
                    v38.moveFocusTo(v35.itemsListRef);
                end, {
                    key = "Feature.Avatar.Action.SelectSlot"
                }), 
                MoveToNav = v3.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 212 ]]
                    -- upvalues: v38 (copy)
                    v38.moveFocusUp();
                end)
            }, 
            slots = v58, 
            onChange = v35.onActivated, 
            onInputBegan = v53, 
            onInputEnded = v56, 
            darken = v59, 
            onFocusChanged = v35.onFocusChanged, 
            NextSelectionUp = v35.NextSelectionUp, 
            NextSelectionDown = v35.NextSelectionDown, 
            scrollingFrameRef = l_forwardRef_0
        })
    });
end;
return v2.forwardRef(function(v66, v67) --[[ Line: 231 ]]
    -- upvalues: v2 (copy), v65 (copy), v1 (copy)
    return v2.createElement(v65, v1.Dictionary.join(v66, {
        forwardRef = v67
    }));
end);