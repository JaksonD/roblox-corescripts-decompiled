local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local v3 = require(l_Modules_0.Common.Roact);
local v4 = require(l_Modules_0.Common.RoactRodux);
local v5 = require(l_Modules_0.LuaApp.Constants);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v8 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v9 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v10 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v11 = require(l_CorePackages_0.Packages.RoactAppExperiment);
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local v13 = require(l_Modules_0.LuaApp.getPurchaseErrorTypeFromErrorResponse);
local v14 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v6.Style.withStyle;
local v16 = require(l_CorePackages_0.Packages.t);
local v17 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_EconomicRestrictionsCounter_0 = v17.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_parseEconomicRestrictionsFailureReason_0 = v17.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v17.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddUnifiedPurchaseFlowTTIToEDP;
local v25 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v25.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v25.Enums.ProductPurchaseSurface;
local v29 = require(l_CorePackages_0.Packages.Promise);
local v30 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v31 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v32 = require(l_Modules_0.LuaApp.Enum.PurchaseErrors);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v34 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v35 = require(l_Modules_0.LuaApp.Thunks.Games.ApiFetchGamePasses);
local v36 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v37 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v38 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForPurchasePassInsufficientRobux);
local v39 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local v40 = require(l_Modules_0.LuaApp.Thunks.Economy.NavigateDownToRobuxUpsell);
local v41 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext);
local v42 = require(l_Modules_0.LuaApp.Thunks.Games.PurchaseGamePass);
local v43 = require(l_Modules_0.LuaApp.Thunks.SetPurchaseErrorToast);
local v44 = require(l_Modules_0.LuaApp.Flags.GamepassRobuxUpsellIXPTest);
local v45 = v3.PureComponent:extend("PurchasePassPrompt");
v45.validateProps = v16.strictInterface({
    universeId = v16.string, 
    pass = v16.table, 
    containerWidth = v16.number, 
    defaultChildRef = v16.optional(v16.any), 
    focusController = v16.optional(v16.any), 
    localization = v16.any, 
    networking = v16.callback, 
    analytics = v16.any, 
    gamepassRobuxUpsellEnabled = v16.optional(v16.boolean), 
    purchaseStatus = v16.optional(v16.any), 
    userRobux = v16.optional(v16.number), 
    setCurrentToastMessage = v16.callback, 
    navigateDownToRobuxUpsell = v16.callback, 
    openPurchasePassInsufficientRobux = v16.callback, 
    purchasePass = v16.callback, 
    economicRestrictionErrorHandler = v16.callback, 
    closePrompt = v16.callback, 
    apiFetchGamePasses = v16.callback, 
    setPurchaseErrorToast = v16.callback
});
v45.init = function(v46) --[[ Line: 93 ]] --[[ Name: init ]]
    -- upvalues: v44 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), v5 (copy), v13 (copy), v32 (copy), v29 (copy), v31 (copy)
    v46.onPurchaseFailedWithRobuxShortfall = function(_) --[[ Line: 94 ]]
        -- upvalues: v44 (ref), l_IXPService_0 (ref), l_AppUserLayers_0 (ref), v46 (copy), v5 (ref)
        if v44.isEnabled() then
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.GamepassRobuxUpsellLayer);
            local l_Diag_0 = v46.props.analytics.Diag;
            v46.props.analytics.EventStream:setRBXEventStream("ua", "GamepassRobuxUpsellIXP", {
                isVariant = v46.props.gamepassRobuxUpsellEnabled
            });
            if v46.props.gamepassRobuxUpsellEnabled then
                l_Diag_0:reportCounter("UAGamepassRobuxUpsellVariant", 1);
            else
                l_Diag_0:reportCounter("UAGamepassRobuxUpsellControl", 1);
            end;
        end;
        if v46.props.gamepassRobuxUpsellEnabled then
            local l_networking_0 = v46.props.networking;
            local l_pass_0 = v46.props.pass;
            local l_userRobux_0 = v46.props.userRobux;
            local l_purchasePass_0 = v46.props.purchasePass;
            local v53 = {
                expectedCurrency = v5.Currency.Robux, 
                expectedPrice = l_pass_0.price
            };
            v46.props.navigateDownToRobuxUpsell(l_pass_0.price, l_userRobux_0, l_pass_0.displayName, nil, function() --[[ Line: 124 ]]
                -- upvalues: l_purchasePass_0 (copy), l_networking_0 (copy), l_pass_0 (copy), v53 (copy)
                return l_purchasePass_0(l_networking_0, l_pass_0.productId, v53);
            end, l_pass_0.productId);
            return;
        else
            v46.props.openPurchasePassInsufficientRobux();
            return;
        end;
    end;
    v46.onPurchaseFailedWhenOwned = function(v54) --[[ Line: 132 ]]
        -- upvalues: v46 (copy)
        v46.props.apiFetchGamePasses(v46.props.networking, v46.props.universeId);
        v46.props.setPurchaseErrorToast(v54);
        v46.props.closePrompt();
    end;
    v46.customPurchaseErrorHandler = function(v55) --[[ Line: 143 ]]
        -- upvalues: v46 (copy), v13 (ref), v32 (ref)
        local v56 = false;
        if v46.isMounted then
            local v57 = v13(v55);
            if v57 == v32.NotEnoughRobux then
                v46.onPurchaseFailedWithRobuxShortfall(v55);
                v56 = true;
            end;
            if v57 == v32.AlreadyOwn then
                v46.onPurchaseFailedWhenOwned(v55);
                v56 = true;
            end;
        end;
        return v56;
    end;
    v46.purchasePass = function() --[[ Line: 160 ]]
        -- upvalues: v46 (copy), v5 (ref), v29 (ref), v31 (ref)
        local l_networking_1 = v46.props.networking;
        local l_pass_1 = v46.props.pass;
        local l_productId_0 = l_pass_1.productId;
        local l_universeId_0 = v46.props.universeId;
        local v62 = {
            expectedCurrency = v5.Currency.Robux, 
            expectedPrice = l_pass_1.price
        };
        v46.props.purchasePass(l_networking_1, l_productId_0, v62, v46.customPurchaseErrorHandler, v46.props.economicRestrictionErrorHandler):finally(function(v63) --[[ Line: 179 ]]
            -- upvalues: v29 (ref), v46 (ref), l_networking_1 (copy), l_universeId_0 (copy), v31 (ref)
            if v63 ~= v29.Status.Rejected and v46.isMounted then
                v46.props.apiFetchGamePasses(l_networking_1, l_universeId_0);
                local l_localization_0 = v46.props.localization;
                local v65 = l_localization_0:Format("Feature.AccountSecurityPrompt.Header.Success");
                local v66 = l_localization_0:Format("Feature.Catalog.Label.Purchased");
                v46.props.setCurrentToastMessage(v31.PurchaseMessage, v65, v66, true);
                v46.props.closePrompt();
            end;
        end);
    end;
end;
v45.render = function(v67) --[[ Line: 202 ]] --[[ Name: render ]]
    -- upvalues: v30 (copy), l_withStyle_0 (copy), v14 (copy), l_NumberLocalization_0 (copy), v3 (copy), v34 (copy)
    local l_containerWidth_0 = v67.props.containerWidth;
    local l_purchaseStatus_0 = v67.props.purchaseStatus;
    local l_closePrompt_0 = v67.props.closePrompt;
    local l_localization_1 = v67.props.localization;
    local l_pass_2 = v67.props.pass;
    local l_displayName_0 = l_pass_2.displayName;
    local l_name_0 = l_pass_2.creator.name;
    local l_price_0 = l_pass_2.price;
    local v76 = l_purchaseStatus_0 == v30.Fetching;
    return l_withStyle_0(function(v77) --[[ Line: 213 ]]
        -- upvalues: v14 (ref), l_displayName_0 (copy), l_name_0 (copy), l_NumberLocalization_0 (ref), l_price_0 (copy), l_localization_1 (copy), v3 (ref), v34 (ref), l_containerWidth_0 (copy), v67 (copy), v76 (copy), l_closePrompt_0 (copy)
        return v14({
            buyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
            message = {
                "Feature.Catalog.Label.PurchaseConfirmation"; 
                itemName = l_displayName_0, 
                creatorName = l_name_0, 
                itemPrice = l_NumberLocalization_0.localize(l_price_0, l_localization_1:GetLocale())
            }, 
            buy = "Feature.Catalog.Action.Buy"
        })(function(v78) --[[ Line: 223 ]]
            -- upvalues: v3 (ref), v34 (ref), l_containerWidth_0 (ref), v77 (copy), v67 (ref), v76 (ref), l_closePrompt_0 (ref)
            return v3.createElement(v34, {
                containerWidth = l_containerWidth_0, 
                titleText = v78.buyItem, 
                titleFont = v77.Font.Header1.Font, 
                messageText = v78.message, 
                messageFont = v77.Font.Body.Font, 
                buttonFont = v77.Font.Header2.Font, 
                confirmButtonText = v78.buy, 
                onConfirm = v67.purchasePass, 
                isConfirming = v76, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_0
            });
        end);
    end);
end;
v45.didMount = function(v79) --[[ Line: 241 ]] --[[ Name: didMount ]]
    -- upvalues: l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy)
    v79.isMounted = true;
    if l_FFlagAddUnifiedPurchaseFlowTTIToEDP_0 then
        local v80 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.EDP);
        l_TimeToInteractiveTracker_0.trackEnd(v80);
    end;
end;
v45.willUnmount = function(v81) --[[ Line: 249 ]] --[[ Name: willUnmount ]]
    v81.isMounted = false;
end;
v45 = v4.connect(function(v82, v83) --[[ Line: 253 ]]
    -- upvalues: v42 (copy)
    return {
        purchaseStatus = v42.GetPostingStatus(v82, v83.pass.productId), 
        userRobux = v82.UserRobux[v82.LocalUserId]
    };
end, function(v84) --[[ Line: 258 ]]
    -- upvalues: v36 (copy), v38 (copy), v37 (copy), v40 (copy), v41 (copy), v42 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v39 (copy), v35 (copy), v43 (copy)
    return {
        setCurrentToastMessage = function(v85, v86, v87, v88) --[[ Line: 260 ]] --[[ Name: setCurrentToastMessage ]]
            -- upvalues: v84 (copy), v36 (ref)
            return v84(v36({
                toastType = v85, 
                toastMessage = v86, 
                toastSubMessage = v87, 
                isLocalized = v88
            }));
        end, 
        openPurchasePassInsufficientRobux = function() --[[ Line: 268 ]] --[[ Name: openPurchasePassInsufficientRobux ]]
            -- upvalues: v84 (copy), v38 (ref)
            return v84(v38());
        end, 
        navigateDownToRobuxUpsell = function(v89, v90, v91, v92, v93, v94) --[[ Line: 271 ]] --[[ Name: navigateDownToRobuxUpsell ]]
            -- upvalues: v84 (copy), v37 (ref), v40 (ref), v41 (ref)
            v84(v37());
            return v84(v40(v41.UAGamepass, v89, v90, v91, v92, v93, v94));
        end, 
        purchasePass = function(v95, v96, v97, v98, v99) --[[ Line: 292 ]] --[[ Name: purchasePass ]]
            -- upvalues: v84 (copy), v42 (ref)
            return v84(v42.Post(v95, v96, v97, v98, v99));
        end, 
        economicRestrictionErrorHandler = function(v100) --[[ Line: 309 ]] --[[ Name: economicRestrictionErrorHandler ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v84 (copy), v37 (ref), v39 (ref)
            local v101 = l_parseEconomicRestrictionsFailureReason_0(v100);
            local v102 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v100);
            l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                surface = l_EconomicRestrictionsSurface_0.Gamepass, 
                failureReason = v101
            });
            v84(v37());
            return v84(v39(v101, v102));
        end, 
        closePrompt = function() --[[ Line: 319 ]] --[[ Name: closePrompt ]]
            -- upvalues: v84 (copy), v37 (ref)
            return v84(v37());
        end, 
        apiFetchGamePasses = function(v103, v104) --[[ Line: 322 ]] --[[ Name: apiFetchGamePasses ]]
            -- upvalues: v84 (copy), v35 (ref)
            return v84(v35(v103, v104));
        end, 
        setPurchaseErrorToast = function(v105) --[[ Line: 325 ]] --[[ Name: setPurchaseErrorToast ]]
            -- upvalues: v84 (copy), v43 (ref)
            return v84(v43(v105));
        end
    };
end)(v45);
v45 = l_RoactServices_0.connect({
    networking = v8, 
    localization = v10, 
    analytics = v9
})(v45);
if v44.isEnabled() then
    v45 = v11.connectUserLayer({
        l_AppUserLayers_0.GamepassRobuxUpsellLayer
    }, function(v106, _) --[[ Line: 340 ]]
        -- upvalues: v44 (copy)
        return {
            gamepassRobuxUpsellEnabled = v44.isUserEnrolled(v106)
        };
    end, false)(v45);
end;
return v45;