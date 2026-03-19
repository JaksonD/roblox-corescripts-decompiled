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
local v17 = require(l_Modules_0.LuaApp.Flags.FFlagNativePurchaseRobuxPageWrapperEnableTelemetryV2);
local v18 = require(l_Modules_0.LuaApp.Components.EventReceivers.Analytics.NativePurchaseRobuxPageWrapperAnalytics);
local l_NativePurchaseRobuxPageWrapperAnalytics_0 = v18.NativePurchaseRobuxPageWrapperAnalytics;
local l_TimingData_0 = v18.TimingData;
local v21 = require(l_CorePackages_0.Packages.Roact);
local v22 = require(l_CorePackages_0.Packages.RoactRodux);
local v23 = v21.PureComponent:extend("NativePurchaseRobuxPageWrapper");
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableUnifiedStaticWebViews);
local v25 = require(l_Modules_0.LuaApp.Flags.GetFFlagCleanUpNativePurchaseRobuxTitle);
local v26 = game:DefineFastFlag("NativePurchaseRobuxPageWrapperEnableTelemetry", false);
local v27 = require(l_Modules_0.LuaApp.Flags.GetFFlagWebViewServiceHasBackButtonVisibility);
v23.defaultProps = {
    economyGetBalance = v14, 
    memStorageService = l_MemStorageService_0
};
v23.init = function(v28) --[[ Line: 51 ]] --[[ Name: init ]]
    -- upvalues: v26 (copy), l_HttpService_0 (copy), l_TimingData_0 (copy), l_NativePurchaseRobuxPageWrapperAnalytics_0 (copy), l_TelemetryService_0 (copy), v5 (copy), l_NumberLocalization_0 (copy)
    if v26 then
        local v29 = tick();
        local v30 = l_HttpService_0:GenerateGUID(false);
        v28.timingData = l_TimingData_0.new(v30, v29);
        v28.analytics = l_NativePurchaseRobuxPageWrapperAnalytics_0.new(l_TelemetryService_0);
        v28.analytics:onInit(v28.timingData);
    end;
    v28.state = {
        localizedTitle = "--"
    };
    v28.getRobuxBalance = function() --[[ Line: 69 ]]
        -- upvalues: v26 (ref), v28 (copy), v5 (ref), l_NumberLocalization_0 (ref)
        local v31 = nil;
        if v26 and v28.timingData then
            v31 = tick();
            v28.timingData.get_robux_balance_start = v31;
            v28.analytics:onApiCall(v28.timingData, "getRobuxBalance");
        end;
        v28.props.economyGetBalance(v28.props.networking):andThen(function(v32) --[[ Line: 79 ]]
            -- upvalues: v26 (ref), v28 (ref), v31 (ref), v5 (ref), l_NumberLocalization_0 (ref)
            local v33 = v32 and v32.responseBody.robux or "--";
            if v26 and v28.timingData and v31 then
                local v34 = tick();
                v28.timingData:setApiTiming(v31, v34);
                v28.analytics:onApiResponse(v28.timingData, "getRobuxBalance", (tostring(v33)));
            end;
            v28.props.memStorageService:SetItem(v5.RobuxBalance, v33);
            local v35 = l_NumberLocalization_0.localize(v33, v28.props.localization:GetLocale()) or "--";
            local v36 = v28.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", v35);
            v28:setState({
                localizedTitle = v36
            });
        end);
    end;
end;
v23.didMount = function(v37) --[[ Line: 104 ]] --[[ Name: didMount ]]
    -- upvalues: v26 (copy), v25 (copy), v5 (copy), l_NumberLocalization_0 (copy)
    if v26 and v37.timingData then
        local v38 = tick();
        v37.timingData:setMountTime(v38);
        if v37.analytics then
            v37.analytics:onMount(v37.timingData);
        end;
    end;
    if v25() then
        v37.getRobuxBalance();
        v37.connection = v37.props.memStorageService:bind(v5.RefreshRobuxBalance, v37.getRobuxBalance);
        return;
    else
        local v39 = tick();
        if v26 then
            v37.timingData.get_robux_balance_start = v39;
            v37.analytics:onApiCall(v37.timingData, "getRobuxBalance");
        end;
        v37.props.economyGetBalance(v37.props.networking):andThen(function(v40) --[[ Line: 127 ]]
            -- upvalues: v39 (copy), v26 (ref), v37 (copy), v5 (ref), l_NumberLocalization_0 (ref)
            local v41 = tick();
            local v42 = v40 and v40.responseBody.robux or "--";
            local v43 = v41 - v39;
            if v26 then
                v37.timingData.get_robux_balance_response = v41;
                v37.timingData.api_latency_ms = v43 * 1000;
                v37.analytics:onApiResponse(v37.timingData, "getRobuxBalance", (tostring(v42)));
            end;
            v37.props.memStorageService:SetItem(v5.RobuxBalance, v42);
            local v44 = l_NumberLocalization_0.localize(v42, v37.props.localization:GetLocale()) or "--";
            local v45 = v37.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", v44);
            v37.props.memStorageService:SetItem(v5.RobuxBalanceLocalized, v45);
        end);
        v37.connection = v37.props.memStorageService:bind(v5.RefreshRobuxBalance, function(_) --[[ Line: 149 ]]
            -- upvalues: v37 (copy), v5 (ref), l_NumberLocalization_0 (ref)
            v37.props.economyGetBalance(v37.props.networking):andThen(function(v47) --[[ Line: 150 ]]
                -- upvalues: v37 (ref), v5 (ref), l_NumberLocalization_0 (ref)
                local v48 = v47 and v47.responseBody.robux or "--";
                v37.props.memStorageService:SetItem(v5.RobuxBalance, v48);
                local v49 = l_NumberLocalization_0.localize(v48, v37.props.localization:GetLocale()) or "--";
                local v50 = v37.props.localization:Format("Purchasing.RobloxProducts.Label.RobuxBalance", v49);
                v37.props.memStorageService:SetItem(v5.RobuxBalanceLocalized, v50);
            end);
        end);
        return;
    end;
end;
v23.willUnmount = function(v51) --[[ Line: 168 ]] --[[ Name: willUnmount ]]
    if v51.connection ~= nil then
        v51.connection:Disconnect();
        v51.connection = nil;
    end;
    if v51.props.nativeProductId then
        v51.props.onNativePurchaseAttempt(v51.props.networking, v51.props.nativeProductId);
    end;
end;
v23.render = function(v52) --[[ Line: 180 ]] --[[ Name: render ]]
    -- upvalues: v26 (copy), v24 (copy), v25 (copy), v17 (copy), v21 (copy), v12 (copy), v13 (copy), v27 (copy), v10 (copy), v11 (copy)
    local v53 = tick();
    if v26 and v52.timingData then
        v52.timingData:setRenderTime(v53);
        v52.analytics:onRender(v52.timingData);
    end;
    local l_isVisible_0 = v52.props.isVisible;
    local l_DisplayOrder_0 = v52.props.DisplayOrder;
    local l_url_0 = v52.props.url;
    local l_transitionAnimation_0 = v52.props.transitionAnimation;
    if v24() then
        if v25() then
            return ((function() --[[ Line: 196 ]]
                -- upvalues: v17 (ref), v53 (copy), v26 (ref), v52 (copy), v21 (ref), v12 (ref), l_url_0 (copy), v13 (ref), l_transitionAnimation_0 (copy), v27 (ref), l_isVisible_0 (copy), l_DisplayOrder_0 (copy)
                local v58 = if v17 then v53 else tick();
                if v26 and v52.timingData then
                    v52.timingData:setWebViewLoadTime(v58);
                    v52.analytics:onWebViewLoad(v52.timingData, v53);
                end;
                return v21.createElement(v12, {
                    url = l_url_0, 
                    title = v52.state.localizedTitle, 
                    windowType = v13.Dialog, 
                    transitionAnimation = l_transitionAnimation_0, 
                    hasBackButton = not v27() and nil, 
                    overlayProps = {
                        isVisible = l_isVisible_0, 
                        DisplayOrder = l_DisplayOrder_0
                    }
                });
            end)());
        else
            return ((function() --[[ Line: 218 ]]
                -- upvalues: v17 (ref), v52 (copy), v53 (copy), v21 (ref), v12 (ref), l_url_0 (copy), v13 (ref), l_transitionAnimation_0 (copy), v27 (ref), l_isVisible_0 (copy), l_DisplayOrder_0 (copy)
                if v17 and v52.timingData then
                    v52.timingData:setWebViewLoadTime(v53);
                    v52.analytics:onWebViewLoad(v52.timingData, v53);
                end;
                return v21.createElement(v12, {
                    url = l_url_0, 
                    titleKey = "Feature.BuyRobux.Heading.Banner", 
                    windowType = v13.Dialog, 
                    transitionAnimation = l_transitionAnimation_0, 
                    hasBackButton = not v27() and nil, 
                    overlayProps = {
                        isVisible = l_isVisible_0, 
                        DisplayOrder = l_DisplayOrder_0
                    }
                });
            end)());
        end;
    else
        if v17 and v52.timingData then
            v52.timingData:setWebViewLoadTime(v53);
            v52.analytics:onWebViewLoad(v52.timingData, v53);
        end;
        return v21.createElement(v10, {
            isVisible = l_isVisible_0, 
            DisplayOrder = l_DisplayOrder_0, 
            notificationType = v11.PURCHASE_ROBUX, 
            titleTextLocalizationKey = "Feature.BuyRobux.Heading.Banner", 
            transitionAnimation = l_transitionAnimation_0
        });
    end;
end;
v23 = l_RoactServices_0.connect({
    localization = v7, 
    networking = v9
})(v23);
return (v22.connect(function(v59, _) --[[ Line: 257 ]]
    return {
        nativeProductId = v59.NativePurchase.nativeProductId
    };
end, function(v61) --[[ Line: 261 ]]
    -- upvalues: v16 (copy), v15 (copy)
    return {
        onNativePurchaseAttempt = function(v62, v63) --[[ Line: 263 ]] --[[ Name: onNativePurchaseAttempt ]]
            -- upvalues: v61 (copy), v16 (ref), v15 (ref)
            v61(v16(v62, v63, v15.Polling));
        end
    };
end)(v23));