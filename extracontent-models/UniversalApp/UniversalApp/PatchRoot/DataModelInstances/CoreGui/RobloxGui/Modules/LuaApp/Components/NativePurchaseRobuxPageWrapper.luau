local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_TelemetryService_0 = game:GetService("TelemetryService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_MemStorageService_0 = game:GetService("MemStorageService");
local v5 = require(l_Modules_0.LuaApp.Enum.MemStorageKeys);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v7 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v9 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v10 = require(l_Modules_0.LuaApp.Components.GenericNativePageWrapper);
local v11 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local v12 = require(l_Modules_0.LuaApp.Components.WebView.AppWebView);
local v13 = require(l_Modules_0.LuaApp.Enum.WebViewWindow);
local v14 = require(l_Modules_0.LuaApp.Http.Requests.EconomyAPI.GetRobuxBalance);
local v15 = require(l_Modules_0.LuaApp.Enum.NativePurchaseStatus);
local v16 = require(l_Modules_0.LuaApp.Thunks.NativePurchaseComplete);
local v17 = if game:DefineFastFlag("EnableBlackbirdRobuxPageCloseCallback", false) then require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback else nil;
local v18 = require(l_Modules_0.LuaApp.Flags.FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2);
local v19 = require(l_Modules_0.LuaApp.Components.EventReceivers.Analytics.NativePurchaseRobuxPageWrapperAnalytics);
local l_NativePurchaseRobuxPageWrapperAnalytics_0 = v19.NativePurchaseRobuxPageWrapperAnalytics;
local l_TimingData_0 = v19.TimingData;
local v22 = require(l_CorePackages_0.Packages.Roact);
local v23 = require(l_CorePackages_0.Packages.RoactRodux);
local v24 = v22.PureComponent:extend("NativePurchaseRobuxPageWrapper");
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local v26 = require(l_Modules_0.LuaApp.Flags.GetFFlagCleanUpNativePurchaseRobuxTitle);
local v27 = game:DefineFastFlag("NativePurchaseRobuxPageWrapperEnableTelemetry", false);
local v28 = require(l_Modules_0.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility);
v24.defaultProps = {
    economyGetBalance = v14, 
    memStorageService = l_MemStorageService_0
};
v24.init = function(v29) --[[ Line: 56 ]] --[[ Name: init ]]
    -- upvalues: v27 (copy), l_HttpService_0 (copy), l_TimingData_0 (copy), l_NativePurchaseRobuxPageWrapperAnalytics_0 (copy), l_TelemetryService_0 (copy), v17 (copy), v5 (copy), l_NumberLocalization_0 (copy)
    if v27 then
        local v30 = tick();
        local v31 = l_HttpService_0:GenerateGUID(false);
        v29.timingData = l_TimingData_0.new(v31, v30);
        v29.analytics = l_NativePurchaseRobuxPageWrapperAnalytics_0.new(l_TelemetryService_0);
        v29.analytics:onInit(v29.timingData);
    end;
    v29.onClose = if v17 then v17() else nil;
    v29.state = {
        localizedTitle = "--"
    };
    v29.getRobuxBalance = function() --[[ Line: 76 ]]
        -- upvalues: v27 (ref), v29 (copy), v5 (ref), l_NumberLocalization_0 (ref)
        local v32 = nil;
        if v27 and v29.timingData then
            v32 = tick();
            v29.timingData.get_robux_balance_start = v32;
            v29.analytics:onApiCall(v29.timingData, "getRobuxBalance");
        end;
        v29.props.economyGetBalance(v29.props.networking):andThen(function(v33) --[[ Line: 86 ]]
            -- upvalues: v27 (ref), v29 (ref), v32 (ref), v5 (ref), l_NumberLocalization_0 (ref)
            local v34 = v33 and v33.responseBody.robux or "--";
            if v27 and v29.timingData and v32 then
                local v35 = tick();
                v29.timingData:setApiTiming(v32, v35);
                v29.analytics:onApiResponse(v29.timingData, "getRobuxBalance", (tostring(v34)));
            end;
            v29.props.memStorageService:SetItem(v5.RobuxBalance, v34);
            local v36 = l_NumberLocalization_0.localize(v34, v29.props.localization:GetLocale()) or "--";
            local v37 = v29.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", v36);
            v29:setState({
                localizedTitle = v37
            });
        end);
    end;
end;
v24.didMount = function(v38) --[[ Line: 111 ]] --[[ Name: didMount ]]
    -- upvalues: v27 (copy), v26 (copy), v5 (copy), l_NumberLocalization_0 (copy)
    if v27 and v38.timingData then
        local v39 = tick();
        v38.timingData:setMountTime(v39);
        if v38.analytics then
            v38.analytics:onMount(v38.timingData);
        end;
    end;
    if v26() then
        v38.getRobuxBalance();
        v38.connection = v38.props.memStorageService:bind(v5.RefreshRobuxBalance, v38.getRobuxBalance);
        return;
    else
        local v40 = tick();
        if v27 then
            v38.timingData.get_robux_balance_start = v40;
            v38.analytics:onApiCall(v38.timingData, "getRobuxBalance");
        end;
        v38.props.economyGetBalance(v38.props.networking):andThen(function(v41) --[[ Line: 134 ]]
            -- upvalues: v40 (copy), v27 (ref), v38 (copy), v5 (ref), l_NumberLocalization_0 (ref)
            local v42 = tick();
            local v43 = v41 and v41.responseBody.robux or "--";
            local v44 = v42 - v40;
            if v27 then
                v38.timingData.get_robux_balance_response = v42;
                v38.timingData.api_latency_ms = v44 * 1000;
                v38.analytics:onApiResponse(v38.timingData, "getRobuxBalance", (tostring(v43)));
            end;
            v38.props.memStorageService:SetItem(v5.RobuxBalance, v43);
            local v45 = l_NumberLocalization_0.localize(v43, v38.props.localization:GetLocale()) or "--";
            local v46 = v38.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", v45);
            v38.props.memStorageService:SetItem(v5.RobuxBalanceLocalized, v46);
        end);
        v38.connection = v38.props.memStorageService:bind(v5.RefreshRobuxBalance, function(_) --[[ Line: 156 ]]
            -- upvalues: v38 (copy), v5 (ref), l_NumberLocalization_0 (ref)
            v38.props.economyGetBalance(v38.props.networking):andThen(function(v48) --[[ Line: 157 ]]
                -- upvalues: v38 (ref), v5 (ref), l_NumberLocalization_0 (ref)
                local v49 = v48 and v48.responseBody.robux or "--";
                v38.props.memStorageService:SetItem(v5.RobuxBalance, v49);
                local v50 = l_NumberLocalization_0.localize(v49, v38.props.localization:GetLocale()) or "--";
                local v51 = v38.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", v50);
                v38.props.memStorageService:SetItem(v5.RobuxBalanceLocalized, v51);
            end);
        end);
        return;
    end;
end;
v24.willUnmount = function(v52) --[[ Line: 175 ]] --[[ Name: willUnmount ]]
    if v52.connection ~= nil then
        v52.connection:Disconnect();
        v52.connection = nil;
    end;
    if v52.props.nativeProductId then
        v52.props.onNativePurchaseAttempt(v52.props.networking, v52.props.nativeProductId);
    end;
end;
v24.render = function(v53) --[[ Line: 187 ]] --[[ Name: render ]]
    -- upvalues: v27 (copy), v25 (copy), v26 (copy), v18 (copy), v22 (copy), v12 (copy), v13 (copy), v28 (copy), v10 (copy), v11 (copy)
    local v54 = tick();
    if v27 and v53.timingData then
        v53.timingData:setRenderTime(v54);
        v53.analytics:onRender(v53.timingData);
    end;
    local l_isVisible_0 = v53.props.isVisible;
    local l_DisplayOrder_0 = v53.props.DisplayOrder;
    local l_url_0 = v53.props.url;
    local l_transitionAnimation_0 = v53.props.transitionAnimation;
    if v25() then
        if v26() then
            return ((function() --[[ Line: 202 ]]
                -- upvalues: v18 (ref), v54 (copy), v27 (ref), v53 (copy), v22 (ref), v12 (ref), l_url_0 (copy), v13 (ref), l_transitionAnimation_0 (copy), v28 (ref), l_isVisible_0 (copy), l_DisplayOrder_0 (copy)
                local v59 = if v18 then v54 else tick();
                if v27 and v53.timingData then
                    v53.timingData:setWebViewLoadTime(v59);
                    v53.analytics:onWebViewLoad(v53.timingData, v54);
                end;
                return v22.createElement(v12, {
                    url = l_url_0, 
                    title = v53.state.localizedTitle, 
                    windowType = v13.Dialog, 
                    transitionAnimation = l_transitionAnimation_0, 
                    hasBackButton = not v28() and nil, 
                    windowCloseCallback = v53.onClose, 
                    overlayProps = {
                        isVisible = l_isVisible_0, 
                        DisplayOrder = l_DisplayOrder_0
                    }
                });
            end)());
        else
            return ((function() --[[ Line: 225 ]]
                -- upvalues: v18 (ref), v53 (copy), v54 (copy), v22 (ref), v12 (ref), l_url_0 (copy), v13 (ref), l_transitionAnimation_0 (copy), v28 (ref), l_isVisible_0 (copy), l_DisplayOrder_0 (copy)
                if v18 and v53.timingData then
                    v53.timingData:setWebViewLoadTime(v54);
                    v53.analytics:onWebViewLoad(v53.timingData, v54);
                end;
                return v22.createElement(v12, {
                    url = l_url_0, 
                    titleKey = "Feature.BuyRobux.Heading.Banner", 
                    windowType = v13.Dialog, 
                    transitionAnimation = l_transitionAnimation_0, 
                    hasBackButton = not v28() and nil, 
                    windowCloseCallback = v53.onClose, 
                    overlayProps = {
                        isVisible = l_isVisible_0, 
                        DisplayOrder = l_DisplayOrder_0
                    }
                });
            end)());
        end;
    else
        if v18 and v53.timingData then
            v53.timingData:setWebViewLoadTime(v54);
            v53.analytics:onWebViewLoad(v53.timingData, v54);
        end;
        return v22.createElement(v10, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0, 
            notificationType = v11.PURCHASE_ROBUX, 
            titleTextLocalizationKey = "Feature.BuyRobux.Heading.Banner", 
            transitionAnimation = l_transitionAnimation_0, 
            onClose = v53.onClose
        });
    end;
end;
v24 = l_RoactServices_0.connect({
    localization = v7, 
    networking = v9
})(v24);
return (v23.connect(function(v60, _) --[[ Line: 266 ]]
    return {
        nativeProductId = v60.NativePurchase.nativeProductId
    };
end, function(v62) --[[ Line: 270 ]]
    -- upvalues: v16 (copy), v15 (copy)
    return {
        onNativePurchaseAttempt = function(v63, v64) --[[ Line: 272 ]] --[[ Name: onNativePurchaseAttempt ]]
            -- upvalues: v62 (copy), v16 (ref), v15 (ref)
            v62(v16(v63, v64, v15.Polling));
        end
    };
end)(v24));