local l_HttpService_0 = game:GetService("HttpService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_CorePackages_0.Packages.Dash);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Roact);
local v8 = require(l_CorePackages_0.Packages.RoactRodux);
local v9 = require(l_CorePackages_0.Packages.React);
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v11 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v11.App.ImageSet.Images;
local l_BadgeStates_0 = v11.App.Indicator.Enum.BadgeStates;
local l_UtilityActionIcon_0 = v11.App.Button.UtilityActionIcon;
local l_ImageSetLabel_0 = v11.Core.ImageSet.ImageSetLabel;
local v16 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v16.Hooks.useTokens;
local l_useIconSize_0 = v16.Hooks.useIconSize;
local l_InputSize_0 = v16.Enums.InputSize;
local v20 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local v21 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v23 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v24 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local v25 = require(l_Modules_0.LuaApp.Actions.Economy.SetBuyRobuxButtonClicked);
local v26 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.useRobuxBadge);
local v27 = require(l_Modules_0.LuaApp.Flags.FFlagRobuxBadgeEnabled);
local v28 = require(l_Modules_0.LuaApp.Flags.FFlagEnableWhiteRobuxIcon);
local v29 = require(l_Modules_0.LuaApp.Flags.FFlagRobuxIconColorHotfix);
local v30 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagEnableHeaderBarButtonsUpdate_0 = v30.FFlagEnableHeaderBarButtonsUpdate;
local l_FFlagUseNavigationSelectors_0 = v30.FFlagUseNavigationSelectors;
local v33 = game:DefineFastFlag("EnableWhiteOrGreyRobuxIcon", false);
local v34 = if v28 then l_Images_0["icons/common/robux"] else l_Images_0["icons/common/goldrobux"];
local v40 = if l_FFlagEnableHeaderBarButtonsUpdate_0 then v9.forwardRef(function(v35, v36) --[[ Line: 51 ]]
    -- upvalues: l_useTokens_0 (copy), v33 (copy), l_useIconSize_0 (copy), l_InputSize_0 (copy), v9 (copy), v16 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v27 (copy)
    local v37 = l_useTokens_0();
    local v38 = if v33 then nil else l_useIconSize_0(l_InputSize_0.Medium, true, true);
    local v39 = if v33 then nil else v9.useMemo(function() --[[ Line: 56 ]]
        -- upvalues: v37 (copy)
        return {
            radius = UDim.new(0, v37.Radius.Circle), 
            offset = v37.Size.Size_150, 
            borderWidth = v37.Stroke.Thicker
        };
    end, {
        v37
    });
    return v9.createElement(v16.View, {
        tag = v33 and "auto-xy radius-circle" or "size-1000-1000 radius-circle", 
        cursor = if v33 then nil else v39, 
        ref = if v33 then nil else v36, 
        onActivated = if v33 then nil else v35.onActivated
    }, {
        Icon = if v33 then v9.createElement(v16.IconButton, {
            ZIndex = 1, 
            isCircular = true, 
            icon = v16.Enums.IconName.Robux, 
            onActivated = v35.onActivated, 
            ref = v36
        }) else v9.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Selectable = false, 
            Size = v38, 
            ZIndex = 1, 
            Image = l_Images_0["icons/common/goldrobux"]
        }), 
        Badge = if v27 and v35.showBadge then v9.createElement(v16.StatusIndicator, {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0.5, v37.Size.Size_50, 0.5, -v37.Size.Size_50), 
            ZIndex = 2, 
            variant = v16.Enums.StatusIndicatorVariant.Alert
        }) else nil
    });
end) else nil;
local v41 = v7.PureComponent:extend("BuyRobuxButton");
v41.validateProps = v6.strictInterface({
    formFactor = v6.string, 
    isCompactView = v6.boolean, 
    isSearching = v6.boolean, 
    isSecondary = v6.optional(v6.boolean), 
    setVisible = v5.isCallable, 
    cancelSearch = v5.isCallable, 
    activateSearch = v5.isCallable, 
    buttonRef = v6.optional(v6.table), 
    currentRoute = v6.table, 
    showBadge = if v27 then v6.boolean else nil, 
    openPurchaseRobuxPage = v5.isCallable, 
    dispatchBuyRobuxButtonClicked = if v27 then v5.isCallable else nil, 
    analytics = v6.any, 
    disableIAPEntryPoint = v6.boolean, 
    networking = v6.callback
});
v41.init = function(v42) --[[ Line: 128 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v27 (copy)
    v42.showBuyRobuxCallback = function() --[[ Line: 129 ]]
        -- upvalues: v42 (copy), l_HttpService_0 (ref), v27 (ref)
        local l_name_0 = v42.props.currentRoute[1].name;
        local l_disableIAPEntryPoint_0 = v42.props.disableIAPEntryPoint;
        local l_networking_0 = v42.props.networking;
        local v46 = l_HttpService_0:GenerateGUID(false);
        v42.props.openPurchaseRobuxPage(l_disableIAPEntryPoint_0, l_networking_0, v46);
        if v27 then
            v42.props.dispatchBuyRobuxButtonClicked();
        end;
        v42.props.analytics.reportRobuxButtonClick(l_name_0);
    end;
end;
local function _(v47) --[[ Line: 148 ]] --[[ Name: isVisible ]]
    return not v47.isSearching;
end;
v41.updateVisibility = function(v49, v50) --[[ Line: 152 ]] --[[ Name: updateVisibility ]]
    local v51 = not v49.props.isSearching;
    if v51 ~= v50 then
        v49.props.setVisible(v51);
    end;
end;
v41.didMount = function(v52) --[[ Line: 159 ]] --[[ Name: didMount ]]
    v52:updateVisibility(nil);
end;
v41.didUpdate = function(v53, v54, _) --[[ Line: 163 ]] --[[ Name: didUpdate ]]
    v53:updateVisibility(not v54.isSearching);
end;
v41.render = function(v56) --[[ Line: 167 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v9 (copy), v40 (copy), v27 (copy), v7 (copy), l_UtilityActionIcon_0 (copy), v34 (copy), l_BadgeStates_0 (copy), v29 (copy), v28 (copy)
    if l_FFlagEnableHeaderBarButtonsUpdate_0 then
        return v9.createElement(v40, {
            showBadge = if v27 then v56.props.showBadge else nil, 
            onActivated = if v56.props.isSearching then v56.props.cancelSearch else v56.showBuyRobuxCallback, 
            ref = v56.props.buttonRef
        });
    else
        return v7.createElement(l_UtilityActionIcon_0, {
            icon = v34, 
            badgeValue = if v27 and v56.props.showBadge then l_BadgeStates_0.isEmpty else nil, 
            iconColor = if v29 and v28 then nil else {}, 
            onActivated = if v56.props.isSearching then v56.props.cancelSearch else v56.showBuyRobuxCallback, 
            ref = v56.props.buttonRef
        });
    end;
end;
v41 = v8.connect(function(v57, _) --[[ Line: 185 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v27 (copy)
    return {
        currentRoute = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v57) else v57.Navigation.history[#v57.Navigation.history], 
        showBadge = if v27 then v57.RobuxVirtualItem.showBuyRobuxButtonBadge else nil
    };
end, function(v59) --[[ Line: 192 ]]
    -- upvalues: v23 (copy), v4 (copy), v24 (copy), v27 (copy), v25 (copy)
    return {
        openPurchaseRobuxPage = function(v60, v61, v62) --[[ Line: 194 ]] --[[ Name: openPurchaseRobuxPage ]]
            -- upvalues: v59 (copy), v23 (ref), v4 (ref), v24 (ref)
            if v60 then
                v59(v23(v4.WEBVIEWS_UNAVAILABLE_TOAST));
                return;
            else
                return v59(v24(nil, v61, v62));
            end;
        end, 
        dispatchBuyRobuxButtonClicked = v27 and function() --[[ Line: 202 ]]
            -- upvalues: v59 (copy), v25 (ref)
            return v59(v25());
        end or nil
    };
end)(v41);
v41 = l_RoactServices_0.connect({
    analytics = v20, 
    networking = v21
})(v41);
v41 = l_RoactAppPolicy_0.connect(function(v63) --[[ Line: 214 ]]
    return {
        disableIAPEntryPoint = v63.getDisableIAPEntryPoint()
    };
end)(v41);
if v27 then
    local l_v41_0 = v41;
    v41 = function(v65) --[[ Line: 223 ]]
        -- upvalues: v26 (copy), v7 (copy), l_v41_0 (copy)
        v26();
        return v7.createElement(l_v41_0, v65);
    end;
end;
return v41;