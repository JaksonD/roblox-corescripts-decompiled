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
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_withStyle_0 = v5.Core.Style.withStyle;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.BuyActionBar);
local v15 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v20 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v23 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v24 = require(l_Modules_0.LuaApp.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v26 = require(l_Modules_0.AvatarExperience.Common.Validators.ItemDataValidator);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v28 = require(l_Modules_0.AvatarExperience.Experiments.AXShareButtonOnActionBarIXP);
local v29 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AXRecentlyViewedSearchItemsIXPTest_0 = v10.Experiments.AXRecentlyViewedSearchItemsIXPTest;
local l_FFlagAXMISEnableMultiShopping_0 = v11.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesForMIS_0 = v11.FFlagAXDurablesForMIS;
local v33 = game:DefineFastFlag("BuyActionBarShouldNotUnrenderInFullscreenMode", false);
local l_ActionBarHeight_0 = v23.ActionBar.ActionBarHeight;
local v35 = nil;
local v36 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v35 = 16;
    v36 = 20;
end;
local v37 = v2.PureComponent:extend("MultiTryOnBottomBar");
v37.validateProps = v6.strictInterface({
    bottomBarRef = v6.optional(v6.table), 
    NextSelectionLeft = v6.optional(v6.table), 
    Visible = v6.optional(v6.boolean), 
    isConsoleWithGamepad = v6.optional(v6.boolean), 
    itemDetailsPeekViewRefs = v6.optional(v6.table), 
    onAbsoluteSizeChanged = if l_FFlagAXMISEnableMultiShopping_0 then v6.optional(v6.callback) else nil, 
    lastToggledItem = v6.table, 
    isPortrait = v6.boolean, 
    tryOnItems = v6.optional(v6.table), 
    itemData = v6.optional(v26), 
    itemId = v6.optional(v6.string), 
    itemType = v6.optional(v6.string), 
    boundInputs = v6.optional(v6.table), 
    currentTryOnItem = if l_FFlagAXDurablesForMIS_0 then v6.optional(v6.table) else nil, 
    fetchItemData = v6.callback, 
    networking = v6.callback, 
    appAnalytics = v6.table, 
    catalogAnalytics = v6.table, 
    localization = v6.table, 
    navigation = v6.table
});
v37.defaultProps = {
    Visible = true, 
    lastToggledItem = {}
};
v37.init = function(v38) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: l_AXRecentlyViewedSearchItemsIXPTest_0 (copy), v2 (copy)
    v38.fetchItemData = function() --[[ Line: 100 ]]
        -- upvalues: v38 (copy), l_AXRecentlyViewedSearchItemsIXPTest_0 (ref)
        local l_lastToggledItem_0 = v38.props.lastToggledItem;
        if l_AXRecentlyViewedSearchItemsIXPTest_0.isEnabled() then
            if not l_lastToggledItem_0.isUnequipped and l_lastToggledItem_0.itemId and l_lastToggledItem_0.itemType then
                v38.props.fetchItemData(v38.props.networking, v38.props.appAnalytics, l_lastToggledItem_0.itemId, l_lastToggledItem_0.itemType);
                return;
            end;
        elseif not l_lastToggledItem_0.isUnequipped then
            v38.props.fetchItemData(v38.props.networking, v38.props.appAnalytics, l_lastToggledItem_0.itemId, l_lastToggledItem_0.itemType);
        end;
    end;
    v38.state = {};
    v38.onTimedOptionSelected = function(v40) --[[ Line: 115 ]]
        -- upvalues: v38 (copy), v2 (ref)
        if not v40 then
            v38:setState({
                selectedTimedOptionDays = v2.None
            });
            return;
        else
            v38:setState({
                selectedTimedOptionDays = v40
            });
            return;
        end;
    end;
end;
v37.getGamepadBottomBarHeight = function(v41) --[[ Line: 128 ]] --[[ Name: getGamepadBottomBarHeight ]]
    -- upvalues: v7 (copy), v24 (copy)
    if v41.props.isConsoleWithGamepad and not v7.isEmpty(v41.props.boundInputs) then
        return v24.GAMEPAD_BOTTOM_BAR_SIZE;
    else
        return 0;
    end;
end;
v37.renderActionBar = function(v42) --[[ Line: 136 ]] --[[ Name: renderActionBar ]]
    -- upvalues: v2 (copy), v33 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v14 (copy), l_FFlagAXDurablesForMIS_0 (copy), v36 (ref), v35 (ref)
    local l_itemId_0 = v42.props.itemId;
    local l_itemType_0 = v42.props.itemType;
    local v45 = if v42.props.itemData and v42.props.itemData.timedOptions then v42.props.itemData.timedOptions else nil;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 1, -v42:getGamepadBottomBarHeight()), 
        AnchorPoint = Vector2.new(0, 1), 
        ZIndex = 3, 
        Visible = if v33 then v42.props.Visible else nil, 
        [v2.Change.AbsoluteSize] = if l_FFlagAXMISEnableMultiShopping_0 then v42.props.onAbsoluteSizeChanged else nil
    }, {
        BuyActionBar = v2.createElement(v14, {
            hideGradient = true, 
            itemId = l_itemId_0, 
            itemType = l_itemType_0, 
            timedOptions = v45, 
            hidePrice = v45 and true or nil, 
            selectedTimedOptionIndexInReducer = if l_FFlagAXDurablesForMIS_0 and v42.props.currentTryOnItem then v42.props.currentTryOnItem.selectedTimedOptionIndex else nil, 
            selectedTimedOptionDays = if v42.state then v42.state.selectedTimedOptionDays else nil, 
            setSelectedTimedOptionDays = v42.onTimedOptionSelected, 
            headerPadding = 24, 
            leftPadding = if l_FFlagAXMISEnableMultiShopping_0 then v36 else 10, 
            bottomPadding = 20, 
            rightPadding = if l_FFlagAXMISEnableMultiShopping_0 then v36 else 10, 
            topPadding = if l_FFlagAXMISEnableMultiShopping_0 then v35 else 10, 
            ZIndex = 1, 
            itemDetailsPeekViewRefs = v42.props.itemDetailsPeekViewRefs
        })
    });
end;
v37.renderWithProviders = function(v46, _) --[[ Line: 175 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: l_ActionBarHeight_0 (copy), v33 (copy), v2 (copy), v4 (copy)
    local v48 = v46.props.isPortrait and 1 or 0.4;
    local v49 = v46.props.isPortrait and 0 or 0.6;
    local v50 = l_ActionBarHeight_0 + 20;
    local v51 = nil;
    if v33 then
        v51 = v46:renderActionBar();
    elseif v46.props.Visible then
        v51 = v46:renderActionBar();
    end;
    local v52 = v50 + v46:getGamepadBottomBarHeight();
    return v2.createElement(v4.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(v48, 0, 0, v52), 
        Position = UDim2.new(v49, 0, 1, -v52), 
        ZIndex = 3, 
        ref = v46.props.bottomBarRef, 
        NextSelectionLeft = v46.props.NextSelectionLeft, 
        Visible = v46.props.Visible
    }, {
        BottomBar = v51
    });
end;
v37.render = function(v53) --[[ Line: 202 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy)
    return l_withStyle_0(function(v54) --[[ Line: 203 ]]
        -- upvalues: v53 (copy)
        return v53:renderWithProviders(v54);
    end);
end;
v37.didUpdate = function(v55, v56) --[[ Line: 208 ]] --[[ Name: didUpdate ]]
    -- upvalues: v28 (copy), v29 (copy)
    if not v55.props.itemData or not v55.props.itemData.timedOptions then
        v55.onTimedOptionSelected();
    end;
    if v55.props.Visible and (v55.props.lastToggledItem ~= v56.lastToggledItem and not v55.props.lastToggledItem.isUnequipped or not v56.Visible) then
        v55.fetchItemData();
    end;
    if v28.isEnabled() and v55.props.Visible and not v56.Visible and v29.logExperimentExposure then
        v29.logExperimentExposure(v28);
    end;
end;
local function v67(v57) --[[ Line: 233 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v9 (copy), l_FFlagAXDurablesForMIS_0 (copy), v15 (copy), l_DeviceOrientationMode_0 (copy)
    local l_TryOnItems_0 = v57.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v59 = nil;
    local v60 = nil;
    local v61 = nil;
    local v62 = nil;
    if v9.fieldCount(l_TryOnItems_0) == 1 then
        local _, v64 = next(l_TryOnItems_0, nil);
        if l_FFlagAXDurablesForMIS_0 then
            v62 = v64;
        end;
        v61 = tostring(v64.itemId);
        v60 = v64.itemType;
        v59 = v15(v57.AvatarExperience.Common, v61, v60);
    end;
    local v65 = v57.DeviceOrientation == l_DeviceOrientationMode_0.Portrait;
    local l_LastToggledItem_0 = v57.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    return {
        isPortrait = v65, 
        tryOnItems = l_TryOnItems_0, 
        lastToggledItem = l_LastToggledItem_0, 
        currentTryOnItem = if l_FFlagAXDurablesForMIS_0 then v62 else nil, 
        itemData = v59, 
        itemId = v61, 
        itemType = v60, 
        boundInputs = v57.GamepadBottomBar.boundInputs
    };
end;
local function v73(v68) --[[ Line: 268 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v16 (copy)
    return {
        fetchItemData = function(v69, v70, v71, v72) --[[ Line: 270 ]] --[[ Name: fetchItemData ]]
            -- upvalues: v68 (copy), v16 (ref)
            return v68(v16(v69, v70, v71, v72));
        end
    };
end;
v37 = l_withNavigation_0(v37, nil);
v37 = v3.connect(v67, v73)(v37);
return (l_RoactServices_0.connect({
    catalogAnalytics = v21, 
    appAnalytics = v19, 
    networking = v18, 
    localization = v20
})(v37));