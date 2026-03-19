local l_HttpService_0 = game:GetService("HttpService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.RoactRodux);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppLinking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppLinking;
local v10 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v11 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local l_LocaleProvider_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Locale.LocaleProvider;
local v14 = require(script.Parent.RobuxUpsellOverlay);
local v15 = require(script.Parent.mapStateToProps);
local v16 = require(script.Parent.mapDispatchToProps);
local v17 = require(script.Parent.Enum.RobuxUpsellTriggerContext);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v20 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v21 = require(l_Modules_0.LuaApp.Util.getPaymentPlatform);
local v22 = require(l_Modules_0.LuaApp.Flags.GetFFlagUADesktopPurchaseWarnings);
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagGuardTermOfUseByIsLinkAllowed);
local l_GetUpsellSuggestions_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Api.PaymentsGateway.GetUpsellSuggestions;
local v25 = require(l_Modules_0.LuaApp.Thunks.Economy.Util.PaymentPlatformUtils);
local v26 = v5.PureComponent:extend(script.Name);
local v27 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_FFlagEnableUpsellSuggestionsAnalyticsId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUpsellSuggestionsAnalyticsId;
local l_UpsellSuggestionsAPIMaxPackages_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).UpsellSuggestionsAPIMaxPackages;
v26.init = function(v30) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v17 (copy), v20 (copy), v21 (copy), v27 (copy)
    v30.state = {
        analyticId = l_HttpService_0:GenerateGUID(false)
    };
    v30.openSecuritySettings = function() --[[ Line: 59 ]]
        -- upvalues: v30 (copy)
        v30.endPurchase();
        v30.props.openSecuritySettings();
    end;
    v30.openBuyRobux = function() --[[ Line: 64 ]]
        -- upvalues: v30 (copy)
        v30.endPurchase();
        v30.props.openBuyRobux();
    end;
    v30.endPurchase = function() --[[ Line: 69 ]]
        -- upvalues: v30 (copy)
        v30.props.navigation.goBack();
        v30.props.endPurchase();
        if v30.props.onOverlayClosed then
            v30.props.onOverlayClosed();
        end;
    end;
    v30.sendAnalyticEvent = function(v31, v32, v33) --[[ Line: 77 ]]
        -- upvalues: v30 (copy)
        v30.props.analytics.EventStream:setRBXEventStream(v31, v32, v33);
    end;
    v30.sendCounter = function(v34) --[[ Line: 82 ]]
        -- upvalues: v30 (copy), v17 (ref), v20 (ref), v21 (ref)
        local l_Diag_0 = v30.props.analytics.Diag;
        local v36 = v17.toRawValue(v30.props.triggerContext);
        l_Diag_0:reportCounter(v34, 1);
        l_Diag_0:reportCounter(v36 .. v34, 1);
        local v37 = v20.toRawValue(v21());
        l_Diag_0:reportCounter(v34 .. v37, 1);
        l_Diag_0:reportCounter(v36 .. v34 .. v37, 1);
    end;
    v30.handleOpenTermsOfUseOpen = function() --[[ Line: 92 ]]
        -- upvalues: v30 (copy), v27 (ref)
        if v30.props.disableWebViewSupport == true then
            v30.props.linking:openURL(v27.static.about.terms());
            return;
        else
            v30.props.openTermsOfUse();
            return;
        end;
    end;
end;
v26.isLinkAllowed = function(_) --[[ Line: 101 ]] --[[ Name: isLinkAllowed ]]
    -- upvalues: l_UserInputService_0 (copy)
    local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
    local v40 = true;
    if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows then
        v40 = true;
        if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.OSX then
            v40 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Linux;
        end;
    end;
    return v40;
end;
v26.render = function(v41) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_LocaleProvider_0 (copy), l_LocalizationService_0 (copy), v14 (copy), v25 (copy), v21 (copy), l_GetUpsellSuggestions_0 (copy), l_UpsellSuggestionsAPIMaxPackages_0 (copy), l_FFlagEnableUpsellSuggestionsAnalyticsId_0 (copy), v22 (copy), v23 (copy), v17 (copy)
    return v5.createElement(l_LocaleProvider_0, {
        locale = l_LocalizationService_0.RobloxLocaleId
    }, {
        RobuxUpsellOverlay = v5.createElement(v14, {
            screenSize = v41.props.screenSize, 
            networking = v41.props.networking, 
            userId = v41.props.userId, 
            fetchUpsellSuggestions = function() --[[ Line: 119 ]] --[[ Name: fetchUpsellSuggestions ]]
                -- upvalues: v25 (ref), v21 (ref), l_GetUpsellSuggestions_0 (ref), v41 (copy), l_UpsellSuggestionsAPIMaxPackages_0 (ref), l_FFlagEnableUpsellSuggestionsAnalyticsId_0 (ref)
                local v42 = v25.paymentPlatformToUpsellPlatform(v21());
                return l_GetUpsellSuggestions_0(v42, v41.props.userRobux, v41.props.priceInRobux, l_UpsellSuggestionsAPIMaxPackages_0, v41.props.itemProductId, v41.props.itemName, game.GameId, l_FFlagEnableUpsellSuggestionsAnalyticsId_0 and v41.state.analyticId or nil);
            end, 
            dispatchFetchRobuxProduct = function() --[[ Line: 133 ]] --[[ Name: dispatchFetchRobuxProduct ]]
                -- upvalues: v41 (copy)
                return v41.props.dispatchFetchRobuxProduct(v41.props.networking, v41.props.userRobux, v41.props.priceInRobux, v41.props.itemProductId, v41.props.itemName, game.GameId);
            end, 
            dispatchFetchIAPPurchaseWarning = function(v43, v44) --[[ Line: 144 ]] --[[ Name: dispatchFetchIAPPurchaseWarning ]]
                -- upvalues: v22 (ref), v41 (copy)
                if v22() then
                    return v41.props.dispatchFetchIAPPurchaseWarning(v41.props.networking, v43, v44, v41.props.isPremium);
                else
                    return v41.props.dispatchFetchIAPPurchaseWarning(v41.props.networking, v43);
                end;
            end, 
            dispatchPostAckPurchaseWarning = function(v45) --[[ Line: 157 ]] --[[ Name: dispatchPostAckPurchaseWarning ]]
                -- upvalues: v41 (copy)
                return v41.props.dispatchPostAckPurchaseWarning(v41.props.networking, v45);
            end, 
            dispatchCheckUserPurchaseSettings = function() --[[ Line: 161 ]] --[[ Name: dispatchCheckUserPurchaseSettings ]]
                -- upvalues: v41 (copy)
                return v41.props.dispatchCheckUserPurchaseSettings(v41.props.networking);
            end, 
            dispatchCentralOverlay = v41.props.dispatchCentralOverlay, 
            iapPurchase = v41.props.iapPurchase, 
            itemProductId = v41.props.itemProductId, 
            itemIcon = v41.props.itemIcon, 
            itemName = v41.props.itemName, 
            beforeRobuxBalance = v41.props.userRobux, 
            priceInRobux = v41.props.priceInRobux, 
            endPurchase = v41.endPurchase, 
            promptRobux = v41.props.promptRobux, 
            openTermsOfUse = if v23() then v41:isLinkAllowed() and v41.handleOpenTermsOfUseOpen or nil else v41.handleOpenTermsOfUseOpen, 
            openSecuritySettings = v41.openSecuritySettings, 
            openBuyRobux = v41.openBuyRobux, 
            renderChallenge = v41.props.renderChallenge, 
            purchaseItem = v41.props.purchaseItem, 
            equipItem = v41.props.equipItem, 
            openSettingsPage = v41.props.openSettingsPage, 
            sendAnalyticEvent = v41.sendAnalyticEvent, 
            sendCounter = v41.sendCounter, 
            eventPrefix = v17.toRawValue(v41.props.triggerContext), 
            analyticId = v41.state.analyticId
        })
    });
end;
v26 = v6.connect(v15, v16)(v26);
v26 = l_RoactAppPolicy_0.connect(function(v46, _) --[[ Line: 198 ]]
    return {
        disableWebViewSupport = not v46.getWebViewSupport(), 
        enablePremiumUserFeatures = v46.getEnablePremiumUserFeatures()
    };
end)(v26);
return (l_withNavigation_0((v19((v18((l_RoactServices_0.connect({
    networking = v10, 
    analytics = v11, 
    linking = l_AppLinking_0
})(v26))))))));