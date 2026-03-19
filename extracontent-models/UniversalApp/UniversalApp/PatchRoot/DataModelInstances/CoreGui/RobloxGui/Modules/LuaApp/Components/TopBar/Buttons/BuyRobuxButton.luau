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
local v10 = require(l_CorePackages_0.Packages.UIBlox);
local l_Images_0 = v10.App.ImageSet.Images;
local l_BadgeStates_0 = v10.App.Indicator.Enum.BadgeStates;
local l_UtilityActionIcon_0 = v10.App.Button.UtilityActionIcon;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local v15 = require(l_CorePackages_0.Packages.Foundation);
local l_useTokens_0 = v15.Hooks.useTokens;
local l_useIconSize_0 = v15.Hooks.useIconSize;
local l_InputSize_0 = v15.Enums.InputSize;
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsTopBar);
local v20 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v22 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v23 = require(l_Modules_0.LuaApp.Thunks.Economy.OpenPurchaseRobuxPage);
local v24 = require(l_Modules_0.LuaApp.Actions.Economy.SetBuyRobuxButtonClicked);
local v25 = require(l_Modules_0.LuaApp.Components.TopBar.Utils.useRobuxBadge);
local v26 = require(l_Modules_0.LuaApp.Flags.FFlagRobuxBadgeEnabled);
local v27 = require(l_Modules_0.LuaApp.Flags.FFlagEnableWhiteRobuxIcon);
local v28 = require(l_Modules_0.LuaApp.Flags.FFlagRobuxIconColorHotfix);
local l_FFlagEnableHeaderBarButtonsUpdate_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableHeaderBarButtonsUpdate;
local v30 = game:DefineFastFlag("EnableWhiteOrGreyRobuxIcon", false);
local v31 = if v27 then l_Images_0["icons/common/robux"] else l_Images_0["icons/common/goldrobux"];
local v37 = if l_FFlagEnableHeaderBarButtonsUpdate_0 then v9.forwardRef(function(v32, v33) --[[ Line: 49 ]]
    -- upvalues: l_useTokens_0 (copy), v30 (copy), l_useIconSize_0 (copy), l_InputSize_0 (copy), v9 (copy), v15 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy), v26 (copy)
    local v34 = l_useTokens_0();
    local v35 = if v30 then nil else l_useIconSize_0(l_InputSize_0.Medium, true, true);
    local v36 = if v30 then nil else v9.useMemo(function() --[[ Line: 54 ]]
        -- upvalues: v34 (copy)
        return {
            radius = UDim.new(0, v34.Radius.Circle), 
            offset = v34.Size.Size_150, 
            borderWidth = v34.Stroke.Thicker
        };
    end, {
        v34
    });
    return v9.createElement(v15.View, {
        tag = v30 and "auto-xy radius-circle" or "size-1000-1000 radius-circle", 
        cursor = if v30 then nil else v36, 
        ref = if v30 then nil else v33, 
        onActivated = if v30 then nil else v32.onActivated
    }, {
        Icon = if v30 then v9.createElement(v15.IconButton, {
            ZIndex = 1, 
            isCircular = true, 
            icon = v15.Enums.IconName.Robux, 
            onActivated = v32.onActivated, 
            ref = v33
        }) else v9.createElement(l_ImageSetLabel_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            BackgroundTransparency = 1, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Selectable = false, 
            Size = v35, 
            ZIndex = 1, 
            Image = l_Images_0["icons/common/goldrobux"]
        }), 
        Badge = if v26 and v32.showBadge then v9.createElement(v15.StatusIndicator, {
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0.5, v34.Size.Size_50, 0.5, -v34.Size.Size_50), 
            ZIndex = 2, 
            variant = v15.Enums.StatusIndicatorVariant.Alert
        }) else nil
    });
end) else nil;
local v38 = v7.PureComponent:extend("BuyRobuxButton");
v38.validateProps = v6.strictInterface({
    formFactor = v6.string, 
    isCompactView = v6.boolean, 
    isSearching = v6.boolean, 
    isSecondary = v6.optional(v6.boolean), 
    setVisible = v5.isCallable, 
    cancelSearch = v5.isCallable, 
    activateSearch = v5.isCallable, 
    buttonRef = v6.optional(v6.table), 
    currentRoute = v6.table, 
    showBadge = if v26 then v6.boolean else nil, 
    openPurchaseRobuxPage = v5.isCallable, 
    dispatchBuyRobuxButtonClicked = if v26 then v5.isCallable else nil, 
    analytics = v6.any, 
    disableIAPEntryPoint = v6.boolean, 
    networking = v6.callback
});
v38.init = function(v39) --[[ Line: 126 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v26 (copy)
    v39.showBuyRobuxCallback = function() --[[ Line: 127 ]]
        -- upvalues: v39 (copy), l_HttpService_0 (ref), v26 (ref)
        local l_name_0 = v39.props.currentRoute[1].name;
        local l_disableIAPEntryPoint_0 = v39.props.disableIAPEntryPoint;
        local l_networking_0 = v39.props.networking;
        local v43 = l_HttpService_0:GenerateGUID(false);
        v39.props.openPurchaseRobuxPage(l_disableIAPEntryPoint_0, l_networking_0, v43);
        if v26 then
            v39.props.dispatchBuyRobuxButtonClicked();
        end;
        v39.props.analytics.reportRobuxButtonClick(l_name_0);
    end;
end;
local function _(v44) --[[ Line: 146 ]] --[[ Name: isVisible ]]
    return not v44.isSearching;
end;
v38.updateVisibility = function(v46, v47) --[[ Line: 150 ]] --[[ Name: updateVisibility ]]
    local v48 = not v46.props.isSearching;
    if v48 ~= v47 then
        v46.props.setVisible(v48);
    end;
end;
v38.didMount = function(v49) --[[ Line: 157 ]] --[[ Name: didMount ]]
    v49:updateVisibility(nil);
end;
v38.didUpdate = function(v50, v51, _) --[[ Line: 161 ]] --[[ Name: didUpdate ]]
    v50:updateVisibility(not v51.isSearching);
end;
v38.render = function(v53) --[[ Line: 165 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagEnableHeaderBarButtonsUpdate_0 (copy), v9 (copy), v37 (copy), v26 (copy), v7 (copy), l_UtilityActionIcon_0 (copy), v31 (copy), l_BadgeStates_0 (copy), v28 (copy), v27 (copy)
    if l_FFlagEnableHeaderBarButtonsUpdate_0 then
        return v9.createElement(v37, {
            showBadge = if v26 then v53.props.showBadge else nil, 
            onActivated = if v53.props.isSearching then v53.props.cancelSearch else v53.showBuyRobuxCallback, 
            ref = v53.props.buttonRef
        });
    else
        return v7.createElement(l_UtilityActionIcon_0, {
            icon = v31, 
            badgeValue = if v26 and v53.props.showBadge then l_BadgeStates_0.isEmpty else nil, 
            iconColor = if v28 and v27 then nil else {}, 
            onActivated = if v53.props.isSearching then v53.props.cancelSearch else v53.showBuyRobuxCallback, 
            ref = v53.props.buttonRef
        });
    end;
end;
v38 = v8.connect(function(v54, _) --[[ Line: 183 ]]
    -- upvalues: v26 (copy)
    return {
        currentRoute = v54.Navigation.history[#v54.Navigation.history], 
        showBadge = if v26 then v54.RobuxVirtualItem.showBuyRobuxButtonBadge else nil
    };
end, function(v56) --[[ Line: 188 ]]
    -- upvalues: v22 (copy), v4 (copy), v23 (copy), v26 (copy), v24 (copy)
    return {
        openPurchaseRobuxPage = function(v57, v58, v59) --[[ Line: 190 ]] --[[ Name: openPurchaseRobuxPage ]]
            -- upvalues: v56 (copy), v22 (ref), v4 (ref), v23 (ref)
            if v57 then
                v56(v22(v4.WEBVIEWS_UNAVAILABLE_TOAST));
                return;
            else
                return v56(v23(nil, v58, v59));
            end;
        end, 
        dispatchBuyRobuxButtonClicked = v26 and function() --[[ Line: 198 ]]
            -- upvalues: v56 (copy), v24 (ref)
            return v56(v24());
        end or nil
    };
end)(v38);
v38 = l_RoactServices_0.connect({
    analytics = v19, 
    networking = v20
})(v38);
v38 = l_RoactAppPolicy_0.connect(function(v60) --[[ Line: 210 ]]
    return {
        disableIAPEntryPoint = v60.getDisableIAPEntryPoint()
    };
end)(v38);
if v26 then
    local l_v38_0 = v38;
    v38 = function(v62) --[[ Line: 219 ]]
        -- upvalues: v25 (copy), v7 (copy), l_v38_0 (copy)
        v25();
        return v7.createElement(l_v38_0, v62);
    end;
end;
return v38;