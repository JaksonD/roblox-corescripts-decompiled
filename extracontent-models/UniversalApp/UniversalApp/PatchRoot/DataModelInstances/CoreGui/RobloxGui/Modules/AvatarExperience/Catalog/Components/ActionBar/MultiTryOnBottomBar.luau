local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.RoactGamepad);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v9 = require(l_CorePackages_0.Packages.tutils);
local v10 = require(l_CorePackages_0.Packages.SignalsReact);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v12 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar);
local v17 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v20 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v21 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v22 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v25 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v26 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v28 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_useAnimatedVisibility_0 = v13.Stores.AnimatedVisibilityStore.useAnimatedVisibility;
local v31 = require(l_Modules_0.AvatarExperience.Experiments.AXShareButtonOnActionBarIXP);
local v32 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v11.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_FFlagAXMISEnableMultiShopping_0 = v12.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesForMIS_0 = v12.FFlagAXDurablesForMIS;
local v36 = game:DefineFastFlag("BuyActionBarShouldNotUnrenderInFullscreenMode", false);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXHideMenuOnScroll_0 = v12.FFlagAXHideMenuOnScroll;
local l_ActionBarHeight_0 = v25.ActionBar.ActionBarHeight;
local v40 = nil;
local v41 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v40 = 16;
    v41 = 20;
end;
local v42 = v2.PureComponent:extend("MultiTryOnBottomBar");
v42.validateProps = v6.strictInterface({
    bottomBarRef = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    Visible = v6.optional(v6.boolean), 
    isConsoleWithGamepad = v6.optional(v6.boolean), 
    itemDetailsPeekViewRefs = v6.optional(v6.table), 
    onAbsoluteSizeChanged = if l_FFlagAXMISEnableMultiShopping_0 then v6.optional(v6.callback) else nil, 
    lastToggledItem = v6.table, 
    isPortrait = v6.boolean, 
    tryOnItems = v6.optional(v6.table), 
    itemData = v6.optional(v28), 
    itemId = v6.optional(v6.string), 
    itemType = v6.optional(v6.string), 
    boundInputs = v6.optional(v6.table), 
    currentTryOnItem = if l_FFlagAXDurablesForMIS_0 then v6.optional(v6.table) else nil, 
    fetchItemData = v6.callback, 
    networking = v6.callback, 
    appAnalytics = v6.table, 
    catalogAnalytics = v6.table, 
    localization = v6.table, 
    navigation = v6.table, 
    visibilityRatioBinding = if l_FFlagAXHideMenuOnScroll_0 then v6.table else nil
});
v42.defaultProps = {
    Visible = true, 
    lastToggledItem = {}
};
v42.init = function(v43) --[[ Line: 109 ]] --[[ Name: init ]]
    -- upvalues: l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_FFlagAXDurablesSupport_0 (copy), v2 (copy)
    v43.fetchItemData = function() --[[ Line: 110 ]]
        -- upvalues: v43 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (ref)
        local l_lastToggledItem_0 = v43.props.lastToggledItem;
        if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then
            if not l_lastToggledItem_0.isUnequipped and l_lastToggledItem_0.itemId and l_lastToggledItem_0.itemType then
                v43.props.fetchItemData(v43.props.networking, v43.props.appAnalytics, l_lastToggledItem_0.itemId, l_lastToggledItem_0.itemType);
                return;
            end;
        elseif not l_lastToggledItem_0.isUnequipped then
            v43.props.fetchItemData(v43.props.networking, v43.props.appAnalytics, l_lastToggledItem_0.itemId, l_lastToggledItem_0.itemType);
        end;
    end;
    if l_FFlagAXDurablesSupport_0 then
        v43.state = {};
        v43.onTimedOptionSelected = function(v45) --[[ Line: 126 ]]
            -- upvalues: v43 (copy), v2 (ref)
            if not v45 then
                v43:setState({
                    selectedTimedOptionDays = v2.None
                });
                return;
            else
                v43:setState({
                    selectedTimedOptionDays = v45
                });
                return;
            end;
        end;
    end;
end;
v42.getGamepadBottomBarHeight = function(v46) --[[ Line: 140 ]] --[[ Name: getGamepadBottomBarHeight ]]
    -- upvalues: v7 (copy), v26 (copy)
    if v46.props.isConsoleWithGamepad and not v7.isEmpty(v46.props.boundInputs) then
        return v26.GAMEPAD_BOTTOM_BAR_SIZE;
    else
        return 0;
    end;
end;
v42.renderActionBar = function(v47) --[[ Line: 148 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v2 (copy), v36 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v16 (copy), l_FFlagAXDurablesForMIS_0 (copy), v41 (ref), v40 (ref)
    local l_itemId_0 = v47.props.itemId;
    local l_itemType_0 = v47.props.itemType;
    local v50 = nil;
    if l_FFlagAXDurablesSupport_0 then
        v50 = if v47.props.itemData and v47.props.itemData.timedOptions then v47.props.itemData.timedOptions else nil;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 1, -v47:getGamepadBottomBarHeight()), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        Visible = if v36 then v47.props.Visible else nil, 
        [v2.Change.AbsoluteSize] = if l_FFlagAXMISEnableMultiShopping_0 then v47.props.onAbsoluteSizeChanged else nil
    }, {
        BuyActionBar = v2.createElement(v16, {
            hideGradient = true, 
            itemId = l_itemId_0, 
            itemType = l_itemType_0, 
            timedOptions = if l_FFlagAXDurablesSupport_0 then v50 else nil, 
            hidePrice = l_FFlagAXDurablesSupport_0 and v50 and true or nil, 
            selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 and v47.props.currentTryOnItem then v47.props.currentTryOnItem.selectedTimedOptionIndex else nil, 
            selectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 and v47.state then v47.state.selectedTimedOptionDays else nil, 
            setSelectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 then v47.onTimedOptionSelected else nil, 
            headerPadding = 24, 
            leftPadding = if l_FFlagAXMISEnableMultiShopping_0 then v41 else 10, 
            bottomPadding = 20, 
            rightPadding = if l_FFlagAXMISEnableMultiShopping_0 then v41 else 10, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v40 else 10, 
            ZIndex = 1, 
            itemDetailsPeekViewRefs = v47.props.itemDetailsPeekViewRefs
        })
    });
end;
v42.renderWithProviders = function(v51, _) --[[ Line: 192 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_ActionBarHeight_0 (copy), v36 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), v2 (copy), v4 (copy)
    local v53 = v51.props.isPortrait and 1 or 0.4;
    local v54 = v51.props.isPortrait and 0 or 0.6;
    local v55 = l_ActionBarHeight_0 + 20;
    local v56 = nil;
    if v36 then
        v56 = v51:renderActionBar();
    elseif v51.props.Visible then
        v56 = v51:renderActionBar();
    end;
    local v57 = v55 + v51:getGamepadBottomBarHeight();
    local v60 = if l_FFlagAXHideMenuOnScroll_0 then v51.props.visibilityRatioBinding:map(function(v58) --[[ Line: 207 ]]
        -- upvalues: v57 (copy), v54 (copy)
        local v59 = math.floor((1 - v58) * v57);
        return UDim2.new(v54, 0, 1, -v57 + v59);
    end) else nil;
    return v2.createElement(v4.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(v53, 0, 0, v57), 
        Position = if l_FFlagAXHideMenuOnScroll_0 then v60 else UDim2.new(v54, 0, 1, -v57), 
        ZIndex = 3, 
        ref = v51.props.bottomBarRef, 
        NextSelectionLeft = v51.props.NextSelectionLeft, 
        Visible = v51.props.Visible
    }, {
        BottomBar = v56
    });
end;
v42.render = function(v61) --[[ Line: 226 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v62) --[[ Line: 227 ]]
        -- upvalues: v61 (copy)
        return v61:renderWithProviders(v62);
    end);
end;
v42.didUpdate = function(v63, v64) --[[ Line: 232 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v31 (copy), v32 (copy)
    if l_FFlagAXDurablesSupport_0 and (not v63.props.itemData or not v63.props.itemData.timedOptions) then
        v63.onTimedOptionSelected();
    end;
    if v63.props.Visible and (v63.props.lastToggledItem ~= v64.lastToggledItem and not v63.props.lastToggledItem.isUnequipped or not v64.Visible) then
        v63.fetchItemData();
    end;
    if v31.isEnabled() and v63.props.Visible and not v64.Visible and v32.logExperimentExposure then
        v32.logExperimentExposure(v31);
    end;
end;
local function v75(v65) --[[ Line: 257 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v9 (copy), l_FFlagAXDurablesForMIS_0 (copy), v17 (copy), l_DeviceOrientationMode_0 (copy)
    local l_TryOnItems_0 = v65.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    local v70 = nil;
    if v9.fieldCount(l_TryOnItems_0) == 1 then
        local _, v72 = next(l_TryOnItems_0, nil);
        if l_FFlagAXDurablesForMIS_0 then
            v70 = v72;
        end;
        v69 = tostring(v72.itemId);
        v68 = v72.itemType;
        v67 = v17(v65.AvatarExperience.Common, v69, v68);
    end;
    local v73 = v65.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_LastToggledItem_0 = v65.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    return {
        isPortrait = v73, 
        tryOnItems = l_TryOnItems_0, 
        lastToggledItem = l_LastToggledItem_0, 
        currentTryOnItem = if l_FFlagAXDurablesForMIS_0 then v70 else nil, 
        itemData = v67, 
        itemId = v69, 
        itemType = v68, 
        boundInputs = v65.GamepadBottomBar.boundInputs
    };
end;
local function v81(v76) --[[ Line: 292 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy)
    return {
        fetchItemData = function(v77, v78, v79, v80) --[[ Line: 294 ]] --[[ Name: fetchItemData ]]
            -- upvalues: v76 (copy), v18 (ref)
            return v76(v18(v77, v78, v79, v80));
        end
    };
end;
v42 = l_withNavigation_0(v42, nil);
v42 = v3.connect(v75, v81)(v42);
v42 = l_RoactServices_0.connect({
    catalogAnalytics = v23, 
    appAnalytics = v21, 
    networking = v20, 
    localization = v22
})(v42);
if l_FFlagAXHideMenuOnScroll_0 then
    return function(v82) --[[ Line: 312 ]]
        -- upvalues: l_useAnimatedVisibility_0 (copy), v10 (copy), v2 (copy), v42 (ref), v7 (copy)
        local v83 = l_useAnimatedVisibility_0();
        local v84 = if v83 then v10.useSignalBinding(v83.animatedMenusStore.getVisibilityRatio) else v2.createBinding(1);
        return v2.createElement(v42, v7.Dictionary.join(v82, {
            visibilityRatioBinding = v84
        }));
    end;
else
    return v42;
end;