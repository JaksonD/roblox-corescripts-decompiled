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
local v35 = game:DefineFastFlag("BuyActionBarShouldNotUnrenderInFullscreenMode", false);
local l_FFlagAXDurablesSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXDurablesSupport;
local l_FFlagAXHideMenuOnScroll_0 = v12.FFlagAXHideMenuOnScroll;
local l_ActionBarHeight_0 = v25.ActionBar.ActionBarHeight;
local v39 = nil;
local v40 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v39 = 16;
    v40 = 20;
end;
local v41 = v2.PureComponent:extend("MultiTryOnBottomBar");
v41.validateProps = v6.strictInterface({
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
    fetchItemData = v6.callback, 
    networking = v6.callback, 
    appAnalytics = v6.table, 
    catalogAnalytics = v6.table, 
    localization = v6.table, 
    navigation = v6.table, 
    visibilityRatioBinding = if l_FFlagAXHideMenuOnScroll_0 then v6.table else nil
});
v41.defaultProps = {
    Visible = true, 
    lastToggledItem = {}
};
v41.init = function(v42) --[[ Line: 107 ]] --[[ Name: init ]]
    -- upvalues: l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), l_FFlagAXDurablesSupport_0 (copy), v2 (copy)
    v42.fetchItemData = function() --[[ Line: 108 ]]
        -- upvalues: v42 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (ref)
        local l_lastToggledItem_0 = v42.props.lastToggledItem;
        if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then
            if not l_lastToggledItem_0.isUnequipped and l_lastToggledItem_0.itemId and l_lastToggledItem_0.itemType then
                v42.props.fetchItemData(v42.props.networking, v42.props.appAnalytics, l_lastToggledItem_0.itemId, l_lastToggledItem_0.itemType);
                return;
            end;
        elseif not l_lastToggledItem_0.isUnequipped then
            v42.props.fetchItemData(v42.props.networking, v42.props.appAnalytics, l_lastToggledItem_0.itemId, l_lastToggledItem_0.itemType);
        end;
    end;
    if l_FFlagAXDurablesSupport_0 then
        v42.state = {};
        v42.onTimedOptionSelected = function(v44) --[[ Line: 124 ]]
            -- upvalues: v42 (copy), v2 (ref)
            if not v44 then
                v42:setState({
                    selectedTimedOptionDays = v2.None
                });
                return;
            else
                v42:setState({
                    selectedTimedOptionDays = v44
                });
                return;
            end;
        end;
    end;
end;
v41.getGamepadBottomBarHeight = function(v45) --[[ Line: 138 ]] --[[ Name: getGamepadBottomBarHeight ]]
    -- upvalues: v7 (copy), v26 (copy)
    if v45.props.isConsoleWithGamepad and not v7.isEmpty(v45.props.boundInputs) then
        return v26.GAMEPAD_BOTTOM_BAR_SIZE;
    else
        return 0;
    end;
end;
v41.renderActionBar = function(v46) --[[ Line: 146 ]] --[[ Name: renderActionBar ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v2 (copy), v35 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v16 (copy), v40 (ref), v39 (ref)
    local l_itemId_0 = v46.props.itemId;
    local l_itemType_0 = v46.props.itemType;
    local v49 = nil;
    if l_FFlagAXDurablesSupport_0 then
        v49 = if v46.props.itemData and v46.props.itemData.timedOptions then v46.props.itemData.timedOptions else nil;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 1, -v46:getGamepadBottomBarHeight()), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        Visible = if v35 then v46.props.Visible else nil, 
        [v2.Change.AbsoluteSize] = if l_FFlagAXMISEnableMultiShopping_0 then v46.props.onAbsoluteSizeChanged else nil
    }, {
        BuyActionBar = v2.createElement(v16, {
            hideGradient = true, 
            itemId = l_itemId_0, 
            itemType = l_itemType_0, 
            timedOptions = if l_FFlagAXDurablesSupport_0 then v49 else nil, 
            hidePrice = l_FFlagAXDurablesSupport_0 and v49 and true or nil, 
            selectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 and v46.state then v46.state.selectedTimedOptionDays else nil, 
            setSelectedTimedOptionDays = if l_FFlagAXDurablesSupport_0 then v46.onTimedOptionSelected else nil, 
            headerPadding = 24, 
            leftPadding = if l_FFlagAXMISEnableMultiShopping_0 then v40 else 10, 
            bottomPadding = 20, 
            rightPadding = if l_FFlagAXMISEnableMultiShopping_0 then v40 else 10, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v39 else 10, 
            ZIndex = 1, 
            itemDetailsPeekViewRefs = v46.props.itemDetailsPeekViewRefs
        })
    });
end;
v41.renderWithProviders = function(v50, _) --[[ Line: 187 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_ActionBarHeight_0 (copy), v35 (copy), l_FFlagAXHideMenuOnScroll_0 (copy), v2 (copy), v4 (copy)
    local v52 = v50.props.isPortrait and 1 or 0.4;
    local v53 = v50.props.isPortrait and 0 or 0.6;
    local v54 = l_ActionBarHeight_0 + 20;
    local v55 = nil;
    if v35 then
        v55 = v50:renderActionBar();
    elseif v50.props.Visible then
        v55 = v50:renderActionBar();
    end;
    local v56 = v54 + v50:getGamepadBottomBarHeight();
    local v59 = if l_FFlagAXHideMenuOnScroll_0 then v50.props.visibilityRatioBinding:map(function(v57) --[[ Line: 202 ]]
        -- upvalues: v56 (copy), v53 (copy)
        local v58 = math.floor((1 - v57) * v56);
        return UDim2.new(v53, 0, 1, -v56 + v58);
    end) else nil;
    return v2.createElement(v4.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(v52, 0, 0, v56), 
        Position = if l_FFlagAXHideMenuOnScroll_0 then v59 else UDim2.new(v53, 0, 1, -v56), 
        ZIndex = 3, 
        ref = v50.props.bottomBarRef, 
        NextSelectionLeft = v50.props.NextSelectionLeft, 
        Visible = v50.props.Visible
    }, {
        BottomBar = v55
    });
end;
v41.render = function(v60) --[[ Line: 221 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v61) --[[ Line: 222 ]]
        -- upvalues: v60 (copy)
        return v60:renderWithProviders(v61);
    end);
end;
v41.didUpdate = function(v62, v63) --[[ Line: 227 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v31 (copy), v32 (copy)
    if l_FFlagAXDurablesSupport_0 and (not v62.props.itemData or not v62.props.itemData.timedOptions) then
        v62.onTimedOptionSelected();
    end;
    if v62.props.Visible and (v62.props.lastToggledItem ~= v63.lastToggledItem and not v62.props.lastToggledItem.isUnequipped or not v63.Visible) then
        v62.fetchItemData();
    end;
    if v31.isEnabled() and v62.props.Visible and not v63.Visible and v32.logExperimentExposure then
        v32.logExperimentExposure(v31);
    end;
end;
local function v73(v64) --[[ Line: 252 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v9 (copy), v17 (copy), l_DeviceOrientationMode_0 (copy)
    local l_TryOnItems_0 = v64.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v66 = nil;
    local v67 = nil;
    local v68 = nil;
    if v9.fieldCount(l_TryOnItems_0) == 1 then
        local _, v70 = next(l_TryOnItems_0, nil);
        v68 = tostring(v70.itemId);
        v67 = v70.itemType;
        v66 = v17(v64.AvatarExperience.Common, v68, v67);
    end;
    local v71 = v64.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_LastToggledItem_0 = v64.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    return {
        isPortrait = v71, 
        tryOnItems = l_TryOnItems_0, 
        lastToggledItem = l_LastToggledItem_0, 
        itemData = v66, 
        itemId = v68, 
        itemType = v67, 
        boundInputs = v64.GamepadBottomBar.boundInputs
    };
end;
local function v79(v74) --[[ Line: 281 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy)
    return {
        fetchItemData = function(v75, v76, v77, v78) --[[ Line: 283 ]] --[[ Name: fetchItemData ]]
            -- upvalues: v74 (copy), v18 (ref)
            return v74(v18(v75, v76, v77, v78));
        end
    };
end;
v41 = l_withNavigation_0(v41, nil);
v41 = v3.connect(v73, v79)(v41);
v41 = l_RoactServices_0.connect({
    catalogAnalytics = v23, 
    appAnalytics = v21, 
    networking = v20, 
    localization = v22
})(v41);
if l_FFlagAXHideMenuOnScroll_0 then
    return function(v80) --[[ Line: 301 ]]
        -- upvalues: l_useAnimatedVisibility_0 (copy), v10 (copy), v2 (copy), v41 (ref), v7 (copy)
        local v81 = l_useAnimatedVisibility_0();
        local v82 = if v81 then v10.useSignalBinding(v81.animatedMenusStore.getVisibilityRatio) else v2.createBinding(1);
        return v2.createElement(v41, v7.Dictionary.join(v80, {
            visibilityRatioBinding = v82
        }));
    end;
else
    return v41;
end;