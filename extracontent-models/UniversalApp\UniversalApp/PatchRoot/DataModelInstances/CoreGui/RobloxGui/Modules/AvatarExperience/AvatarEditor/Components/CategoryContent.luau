local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.Roact);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local v9 = require(l_CorePackages_0.Packages.RoactRodux);
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local v11 = require(l_CorePackages_0.Packages.Foundation);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_withStyle_0 = v10.Style.withStyle;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v16 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v17 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v18 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v19 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v20 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v20.useFocusGuiObject;
local v22 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v19.FocusNavigationEventNameEnum;
local l_useTableWrappedCallbackRef_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXGeneralizeInventoryItemsList_0 = v25.FFlagAXGeneralizeInventoryItemsList;
local l_FFlagAXAddInventoryItemsListProps_0 = v25.FFlagAXAddInventoryItemsListProps;
local v28 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.BodyColorsFrame);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarSwitcherFrame);
local v31 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.MakeupOutfitSwitcherFrame.MakeupOutfitSwitcherFrame);
local v32 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.useAvatarSwitcherFrameProps);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarSwitcherFrameContainer);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarOutfitSwitcherFrame.AvatarOutfitSwitcherFrame);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v36 = if v35() and game:DefineFastFlag("AXRefactorEmotesPageToFunctional2", false) then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EmotesPage) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EmotesPage_DEPRECATED);
local v37 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ItemsList);
local v38 = require(l_Modules_0.AvatarExperience.SlotBasedEditor.Components.InventoryItemsList.InventoryItemsListContainer);
local v39 = if v35() and game:DefineFastFlag("AXRefactorScalesPageToFunctional2", false) then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ScalesPage) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ScalesPage_DEPRECATED);
local v40 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableNewInventoryItemsList);
local l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad;
local l_FFlagAXItemsViewContentSizeBinding_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemsViewContentSizeBinding;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXInventoryDurablesSupport_0 = v25.FFlagAXInventoryDurablesSupport;
local l_FFlagAXCustomizeMakeupSupport_0 = v25.FFlagAXCustomizeMakeupSupport;
local v46 = v6.PureComponent:extend("CategoryContent");
local v47 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v53(v48, v49) --[[ Line: 100 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v20 (copy), v47 (copy), v5 (copy), l_FocusNavigationEventNameEnum_0 (copy), v22 (copy)
    local v50 = v20.useEventMap(v47, v48);
    local v52 = v5.useMemo(function() --[[ Line: 102 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v22 (ref), v49 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v22.onRelease(function(_) --[[ Line: 105 ]]
                    -- upvalues: v49 (ref)
                    v49();
                end)
            }
        };
    end, {
        v49
    });
    return v20.useEventHandlerMap(v52, v50);
end;
v46.init = function(v54) --[[ Line: 115 ]] --[[ Name: init ]]
    -- upvalues: v6 (copy)
    v54.isMounted = false;
    v54.connections = {};
    v54.isTouched = false;
    v54.ref = v6.createRef();
    v54.state = {
        enableNavigation = true
    };
    v54.lockNavigationCallback = function() --[[ Line: 126 ]]
        -- upvalues: v54 (copy)
        if not v54.isMounted then
            return;
        else
            v54:setState({
                enableNavigation = false
            });
            return;
        end;
    end;
    v54.unlockNavigationCallback = function() --[[ Line: 136 ]]
        -- upvalues: v54 (copy)
        if not v54.isMounted then
            return;
        else
            v54:setState({
                enableNavigation = true
            });
            return;
        end;
    end;
end;
v46.renderWithProviders = function(v55, v56, v57) --[[ Line: 149 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v17 (copy), v6 (copy), v36 (copy), v39 (copy), v35 (copy), v29 (copy), l_FFlagAXItemsViewContentSizeBinding_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v34 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), v33 (copy), v30 (copy), v31 (copy), v40 (copy), l_FFlagAXGeneralizeInventoryItemsList_0 (copy), l_FFlagAXAddInventoryItemsListProps_0 (copy), v11 (copy), v38 (copy), v37 (copy), l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v7 (copy)
    local l_Theme_0 = v56.Theme;
    local l_categoryInfo_0 = v55.props.categoryInfo;
    local l_subcategoryFilter_0 = v55.props.subcategoryFilter;
    local v61 = v55.props.size or UDim2.new(1, 0, 1, -v17.PeekHeaderHeight);
    local v62 = nil;
    if l_categoryInfo_0.PageType == v17.PageType.Emotes then
        v62 = v6.createElement(v36, {
            enableNavigation = v55.state.enableNavigation, 
            lockNavigationCallback = v55.lockNavigationCallback, 
            unlockNavigationCallback = v55.unlockNavigationCallback, 
            categoryInfo = l_categoryInfo_0, 
            NextSelectionUp = v55.props.NextSelectionUp, 
            restorePreviousChildFocus = v55.props.restorePreviousChildFocus
        });
    elseif l_categoryInfo_0.PageType == v17.PageType.BodyStyle then
        v62 = v6.createElement(v39, {
            enableNavigation = v55.state.enableNavigation, 
            lockNavigationCallback = v55.lockNavigationCallback, 
            unlockNavigationCallback = v55.unlockNavigationCallback, 
            NextSelectionUp = v55.props.NextSelectionUp, 
            onCanvasPositionChanged = if v35() then v55.props.onContentScroll else nil
        });
    elseif l_categoryInfo_0.PageType == v17.PageType.BodyColors then
        v62 = v6.createElement(v29, {
            Size = if l_FFlagAXItemsViewContentSizeBinding_0 then UDim2.new(1, 0, 1, -v17.PeekHeaderHeight) else v61, 
            onContentScroll = if v35() then v55.props.onContentScroll else nil, 
            NextSelectionUp = v55.props.NextSelectionUp
        });
    elseif v35() and l_categoryInfo_0.PageType == v17.PageType.Avatars then
        v62 = v6.createElement(if l_FFlagAXCustomizeMakeupSupport_0 then v34 else if l_FFlagAXInventoryDurablesSupport_0 then v33 else v30, v55.props.avatarSwitcherProps);
    elseif l_FFlagAXCustomizeMakeupSupport_0 and l_categoryInfo_0.PageType == v17.PageType.MakeupLooks then
        v62 = v6.createElement(v31);
    elseif l_categoryInfo_0.RenderItemTiles then
        v62 = if v40() then if l_FFlagAXGeneralizeInventoryItemsList_0 then if l_FFlagAXAddInventoryItemsListProps_0 then v6.createElement(v11.View, {
            tag = "size-full bg-surface-0 padding-x-medium"
        }, {
            v6.createElement(v38, {
                categoryInfo = l_categoryInfo_0, 
                subcategoryFilter = l_subcategoryFilter_0, 
                showRecommendedItems = true, 
                onContentScroll = if v35() then v55.props.onContentScroll else nil
            })
        }) else v6.createElement(v11.View, {
            tag = "size-full bg-surface-0 padding-x-medium"
        }, {
            InventoryItemsListContainer = v6.createElement(v38)
        }) else if l_FFlagAXAddInventoryItemsListProps_0 then v6.createElement(v38, {
            categoryInfo = l_categoryInfo_0, 
            subcategoryFilter = l_subcategoryFilter_0, 
            showRecommendedItems = true, 
            onContentScroll = if v35() then v55.props.onContentScroll else nil
        }) else v6.createElement(v38) else v6.createElement(v37, {
            backToTopSignal = v55.props.backToTopSignal, 
            NextSelectionUp = v55.props.NextSelectionUp, 
            tagBasedImpressionsDetectorExtensions = {}
        });
    end;
    local v63 = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v55.props.focusNavigationRef else v55.props.frameRef;
    return v6.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        Active = true, 
        Size = if l_FFlagAXItemsViewContentSizeBinding_0 then v55.props.Size else v61, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        BackgroundTransparency = l_Theme_0.BackgroundDefault.Transparency, 
        LayoutOrder = v55.props.LayoutOrder, 
        inputBindings = if not not l_FFlagAXMigrateAXToGlobalAutofocus_0 or l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then nil else {
            NavUp = v7.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 250 ]]
                -- upvalues: v55 (copy), v57 (copy)
                if v55.props.NextSelectionUp then
                    v57.moveFocusTo(v55.props.NextSelectionUp);
                end;
            end)
        }, 
        [v6.Ref] = v63 or v55.ref
    }, {
        PageContent = v62
    });
end;
v46.render = function(v64) --[[ Line: 262 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy)
    return l_withStyle_0(function(v65) --[[ Line: 263 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v64 (copy), v7 (ref)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            return v64:renderWithProviders(v65);
        else
            return v7.withFocusController(function(v66) --[[ Line: 267 ]]
                -- upvalues: v64 (ref), v65 (copy)
                return v64:renderWithProviders(v65, v66);
            end);
        end;
    end);
end;
v46.didMount = function(v67) --[[ Line: 273 ]] --[[ Name: didMount ]]
    v67.isMounted = true;
end;
v46.willUnmount = function(v68) --[[ Line: 277 ]] --[[ Name: willUnmount ]]
    v68.isMounted = false;
    v68:disconnectListeners();
end;
v46.disconnectListeners = function(v69) --[[ Line: 282 ]] --[[ Name: disconnectListeners ]]
    for _, v71 in v69.connections do
        v71:disconnect();
    end;
    v69.connections = {};
    v69.isTouched = false;
end;
v46.didUpdate = function(v72, v73, _) --[[ Line: 291 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), l_UserInputService_0 (copy)
    local l_name_0 = v72.props.avatarRoute.current.name;
    local l_name_1 = v73.avatarRoute.current.name;
    if l_name_0 == l_AvatarScreen_0.AvatarEditor and l_name_0 ~= l_name_1 then
        local v77 = l_UserInputService_0.TouchMoved:Connect(function(...) --[[ Line: 296 ]]
            -- upvalues: v72 (copy)
            v72:onTouchMoved(...);
        end);
        local v78 = l_UserInputService_0.TouchSwipe:Connect(function(...) --[[ Line: 299 ]]
            -- upvalues: v72 (copy)
            v72:onTouchSwipe(...);
        end);
        v72.connections[#v72.connections + 1] = v77;
        v72.connections[#v72.connections + 1] = v78;
        return;
    else
        if l_name_1 == l_AvatarScreen_0.AvatarEditor and l_name_0 ~= l_AvatarScreen_0.AvatarEditor and l_name_0 ~= l_name_1 then
            v72:disconnectListeners();
        end;
        return;
    end;
end;
v46.onTouchMoved = function(v79, v80, _) --[[ Line: 313 ]] --[[ Name: onTouchMoved ]]
    -- upvalues: l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 (copy)
    v79.isTouched = false;
    local v82 = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v79.props.focusNavigationRef else v79.props.frameRef;
    local v83 = v82 and v82.current or v79.ref.current;
    if not v83 or not v79.state.enableNavigation then
        return;
    else
        local l_AbsolutePosition_0 = v83.AbsolutePosition;
        local l_AbsoluteSize_0 = v83.AbsoluteSize;
        local v86 = Vector2.new(l_AbsolutePosition_0.X + l_AbsoluteSize_0.X, l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y);
        if v80.Position.X > v83.AbsolutePosition.X and v80.Position.Y > v83.AbsolutePosition.Y and v80.Position.X < v86.X and v80.Position.Y < v86.Y then
            v79.isTouched = true;
        end;
        return;
    end;
end;
v46.onTouchSwipe = function(v87, v88, v89, _) --[[ Line: 340 ]] --[[ Name: onTouchSwipe ]]
    if v89 ~= 1 then
        return;
    elseif not v87.isTouched or not v87.state.enableNavigation then
        return;
    else
        if v88 == Enum.SwipeDirection.Right then
            if v87.props.navigateLeft then
                v87.props.navigateLeft();
                return;
            end;
        elseif v88 == Enum.SwipeDirection.Left and v87.props.navigateRight then
            v87.props.navigateRight();
        end;
        return;
    end;
end;
v46 = l_RoactServices_0.connect({
    avatarExperienceAnalytics = v16
})(v46);
v46 = v28((v9.connect(function(v91, _) --[[ Line: 364 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v18 (copy), l_FFlagAXGeneralizeInventoryItemsList_0 (copy)
    local v93 = v18.getAvatarEditorCategoryInfoFromState(v91);
    local v94 = if l_FFlagAXGeneralizeInventoryItemsList_0 then v18.getAvatarEditorSubcategoryFilterFromState(v91) else nil;
    return {
        categoryInfo = v93, 
        subcategoryFilter = v94, 
        deviceOrientation = v91.DeviceOrientation, 
        screenSize = v91.ScreenSize
    };
end, nil)(v46)));
if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then
    return function(v95) --[[ Line: 383 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_useFocusGuiObject_0 (copy), v5 (copy), l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v35 (copy), v32 (copy), v53 (copy), l_useTableWrappedCallbackRef_0 (copy), v46 (ref), v4 (copy)
        local v96 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
        local v97 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
        local v98 = v5.useCallback(function() --[[ Line: 387 ]]
            -- upvalues: v95 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v97 (copy), v96 (copy)
            if v95.NextSelectionUp then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v97 and v95.NextSelectionUp.current then
                        v97(v95.NextSelectionUp.current);
                        return;
                    end;
                else
                    v96.moveFocusTo(v95.NextSelectionUp);
                end;
            end;
        end, {
            v95.NextSelectionUp, 
            v95.buttonBInputRef, 
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v97 else v96
        });
        local v99 = if not (not not l_FFlagAXInventoryDurablesSupport_0 or l_FFlagAXCustomizeMakeupSupport_0) and v35() then v32() else nil;
        local v100 = v53(v95.frameRef, v98);
        local v101 = l_useTableWrappedCallbackRef_0(v100);
        return v5.createElement(v46, v4.Dictionary.join(v95, {
            avatarSwitcherProps = if not not l_FFlagAXInventoryDurablesSupport_0 or l_FFlagAXCustomizeMakeupSupport_0 then nil else v99, 
            focusNavigationRef = v101
        }));
    end;
elseif v35() then
    return function(v102) --[[ Line: 429 ]]
        -- upvalues: l_FFlagAXInventoryDurablesSupport_0 (copy), l_FFlagAXCustomizeMakeupSupport_0 (copy), v5 (copy), v46 (ref), v32 (copy), v4 (copy)
        if l_FFlagAXInventoryDurablesSupport_0 or l_FFlagAXCustomizeMakeupSupport_0 then
            return v5.createElement(v46, v102);
        else
            local v103 = v32();
            return v5.createElement(v46, v4.Dictionary.join(v102, {
                avatarSwitcherProps = v103
            }));
        end;
    end;
else
    return v46;
end;