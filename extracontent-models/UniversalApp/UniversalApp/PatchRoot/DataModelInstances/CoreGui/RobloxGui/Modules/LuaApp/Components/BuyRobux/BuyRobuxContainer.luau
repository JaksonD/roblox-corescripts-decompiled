local l_CorePackages_0 = game:GetService("CorePackages");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_withNavigation_0 = v10.withNavigation;
local l_LocaleProvider_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Locale.LocaleProvider;
local _ = require(script.Parent.RobuxPackage);
local v14 = require(script.Parent.BuyRobuxOverlay);
local v15 = require(script.Parent.mapStateToProps);
local v16 = require(script.Parent.mapDispatchToProps);
local v17 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v18 = require(script.Parent.Enum.BuyRobuxCounter);
local v19 = v3.PureComponent:extend(script.Name);
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.PaymentsProtocol).PaymentsProtocol.default;
local l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseEnablePremiumUserFeaturesAppPolicy;
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagFixRobuxBalanceUpdateOnBuyRobuxPage);
local l_FFlagEnableLeftNavOnConsole_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableLeftNavOnConsole;
v19.init = function(v24) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), l_default_0 (copy)
    v24.endPurchase = function() --[[ Line: 66 ]]
        -- upvalues: v24 (copy)
        v24.props.dispatchClearNativePurchaseResult();
    end;
    v24.sendAnalyticEvent = function(v25, v26, v27) --[[ Line: 70 ]]
        -- upvalues: v24 (copy)
        v24.props.analytics.EventStream:setRBXEventStream(v25, v26, v27);
    end;
    v24.sendCounter = function(v28) --[[ Line: 75 ]]
        -- upvalues: v24 (copy)
        v24.props.analytics.Diag:reportCounter(v28, 1);
    end;
    v24.dispatchFetchIAPPurchaseWarning = function(v29, v30) --[[ Line: 80 ]]
        -- upvalues: v24 (copy)
        return v24.props.dispatchFetchIAPPurchaseWarning(v24.props.networking, v29, v30, v24.props.isPremium);
    end;
    v24.dispatchPostAckPurchaseWarning = function(v31) --[[ Line: 88 ]]
        -- upvalues: v24 (copy)
        return v24.props.dispatchPostAckPurchaseWarning(v24.props.networking, v31);
    end;
    v24.dispatchCheckUserPurchaseSettings = function() --[[ Line: 91 ]]
        -- upvalues: v24 (copy)
        return v24.props.dispatchCheckUserPurchaseSettings(v24.props.networking);
    end;
    v24.onWillBlur = function() --[[ Line: 94 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_default_0 (ref)
        if l_FFlagEnableLeftNavOnConsole_0 then
            return;
        else
            l_default_0:isAvailable():andThen(function(v32) --[[ Line: 98 ]]
                -- upvalues: l_default_0 (ref)
                if v32 then
                    l_default_0:sendIAPEvent("BrowseProductEnd");
                end;
            end);
            return;
        end;
    end;
    v24.onWillUnmount = function() --[[ Line: 106 ]]
        -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (ref), l_default_0 (ref)
        if not l_FFlagEnableLeftNavOnConsole_0 then
            return;
        else
            l_default_0:isAvailable():andThen(function(v33) --[[ Line: 110 ]]
                -- upvalues: l_default_0 (ref)
                if v33 then
                    l_default_0:sendIAPEvent("BrowseProductEnd");
                end;
            end);
            return;
        end;
    end;
end;
v19.didMount = function(v34) --[[ Line: 119 ]] --[[ Name: didMount ]]
    -- upvalues: v17 (copy), l_default_0 (copy), v22 (copy)
    local l_props_0 = v34.props;
    if v34.props.iapProductsFetchingStatus == v17.NotStarted or v34.props.iapProductsFetchingStatus == v17.Failed then
        v34.props.dispatchFetchIAPProducts(v34.props.networking);
    end;
    if v34.props.nativeProductsFetchingStatus == v17.NotStarted or v34.props.nativeProductsFetchingStatus == v17.Failed then
        v34.props.dispatchFetchNativeIAPProducts();
    end;
    l_default_0:isAvailable():andThen(function(v36) --[[ Line: 138 ]]
        -- upvalues: l_default_0 (ref)
        if v36 then
            l_default_0:sendIAPEvent("BrowseProductStart");
        end;
    end);
    if v22() then
        l_props_0.dispatchFetchUserBalance(v34.props.networking, (tostring(v34.props.userId)));
    end;
end;
v19.didUpdate = function(v37, v38) --[[ Line: 150 ]] --[[ Name: didUpdate ]]
    -- upvalues: v17 (copy), v18 (copy), l_default_0 (copy)
    local l_props_1 = v37.props;
    if l_props_1.iapProductsFetchingStatus ~= v38.iapProductsFetchingStatus and l_props_1.iapProductsFetchingStatus == v17.Failed then
        v37.sendCounter(v18.toRawValue(v18.InvalidProducts));
    end;
    local v40 = false;
    if l_props_1.iapProductsFetchingStatus == v17.Done then
        v40 = l_props_1.nativeProductsFetchingStatus == v17.Done;
    end;
    if v40 and #l_props_1.robuxPackages == 0 then
        l_default_0:isAvailable():andThen(function(v41) --[[ Line: 163 ]]
            -- upvalues: l_default_0 (ref)
            if v41 then
                l_default_0:sendIAPEvent("ProductNotAvailable");
            end;
        end);
        v37.props.dispatchNavigateBack();
    end;
end;
v19.render = function(v42) --[[ Line: 173 ]] --[[ Name: render ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy), v3 (copy), v10 (copy), l_LocaleProvider_0 (copy), l_LocalizationService_0 (copy), v14 (copy)
    local v43 = if l_FFlagEnableLeftNavOnConsole_0 then nil else v3.createElement(v10.NavigationEvents, {
        onWillBlur = v42.onWillBlur
    });
    return v3.createElement(l_LocaleProvider_0, {
        locale = l_LocalizationService_0.RobloxLocaleId
    }, {
        navigationEvents = if l_FFlagEnableLeftNavOnConsole_0 then nil else v43, 
        BuyRobuxOverlay = v3.createElement(v14, {
            screenSize = v42.props.screenSize, 
            networking = v42.props.networking, 
            robuxBalance = v42.props.robuxBalance, 
            robuxPackages = v42.props.robuxPackages, 
            analyticId = v42.props.analyticId, 
            iapPurchase = v42.props.iapPurchase, 
            iapProductsFetchingStatus = v42.props.iapProductsFetchingStatus, 
            nativeProductsFetchingStatus = v42.props.nativeProductsFetchingStatus, 
            dispatchFetchIAPPurchaseWarning = v42.dispatchFetchIAPPurchaseWarning, 
            dispatchPostAckPurchaseWarning = v42.dispatchPostAckPurchaseWarning, 
            dispatchCentralOverlay = v42.props.dispatchCentralOverlay, 
            dispatchCheckUserPurchaseSettings = v42.dispatchCheckUserPurchaseSettings, 
            endPurchase = v42.endPurchase, 
            promptRobux = v42.props.promptRobux, 
            sendAnalyticEvent = v42.sendAnalyticEvent, 
            sendCounter = v42.sendCounter, 
            eventPrefix = "", 
            onPageClose = v42.props.dispatchNavigateBack
        })
    });
end;
v19.willUnmount = function(v44) --[[ Line: 214 ]] --[[ Name: willUnmount ]]
    -- upvalues: l_FFlagEnableLeftNavOnConsole_0 (copy)
    if l_FFlagEnableLeftNavOnConsole_0 then
        v44.onWillUnmount();
    end;
end;
v19 = v4.connect(v15, v16)(v19);
if l_GetFFlagUseEnablePremiumUserFeaturesAppPolicy_0() then
    v19 = l_RoactAppPolicy_0.connect(function(v45, _) --[[ Line: 223 ]]
        return {
            enablePremiumUserFeatures = v45.getEnablePremiumUserFeatures()
        };
    end)(v19);
end;
return (l_withNavigation_0((l_RoactServices_0.connect({
    networking = v8, 
    analytics = v9, 
    linking = l_AppLinking_0
})(v19))));