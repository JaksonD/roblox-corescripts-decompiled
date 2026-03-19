local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_Modules_0.Common.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Constants);
local v5 = require(l_CorePackages_0.Packages.UIBlox);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v9 = require(l_Modules_0.LuaApp.withLocalization);
local l_withStyle_0 = v5.Style.withStyle;
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Packages.Promise);
local v13 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local v15 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_UniversalEconomicRestrictionsCounter_0 = v15.Counters.EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = v15.Counters.EconomicRestrictionsCounter.EconomicRestrictionsSurface;
local l_parseEconomicRestrictionsFailureReason_0 = v15.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v15.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v21 = require(l_Modules_0.LuaApp.Components.AlertWindow);
local v22 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts);
local v23 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v24 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.PurchaseDeveloperProduct);
local v25 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.OpenCentralOverlayForPurchaseDeveloperProductPendingProductsLimitExceeded);
local v26 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.OpenCentralOverlayForPurchaseDeveloperProductSuccess);
local v27 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local v28 = v2.PureComponent:extend("PurchaseDeveloperProductPrompt");
v28.validateProps = v11.strictInterface({
    universeId = v11.string, 
    developerProduct = v11.table, 
    containerWidth = v11.number, 
    defaultChildRef = v11.optional(v11.any), 
    focusController = v11.optional(v11.any), 
    closeCentralOverlayThunk = v11.optional(v11.callback), 
    localization = v11.any, 
    networking = v11.callback, 
    purchaseStatus = v11.optional(v11.any), 
    creatorName = v11.optional(v11.string), 
    rootPlaceId = v11.optional(v11.string), 
    localUserId = v11.optional(v11.string), 
    openPendingProductsLimitExceededPrompt = v11.callback, 
    openPurchaseDeveloperProductSuccessPrompt = v11.callback, 
    purchaseDeveloperProduct = v11.callback, 
    closePrompt = v11.callback, 
    apiFetchGameDeveloperProducts = v11.callback, 
    economicRestrictionErrorHandler = v11.callback
});
v28.init = function(v29) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), v12 (copy)
    v29.customPurchaseErrorHandler = function(v30) --[[ Line: 73 ]]
        -- upvalues: v29 (copy)
        if v30.errorCode == "PendingProductsLimitExceeded" then
            v29.props.openPendingProductsLimitExceededPrompt();
        end;
    end;
    v29.purchaseDeveloperProduct = function() --[[ Line: 79 ]]
        -- upvalues: v29 (copy), v4 (ref), v12 (ref)
        local l_networking_0 = v29.props.networking;
        local l_developerProduct_0 = v29.props.developerProduct;
        local l_productId_0 = l_developerProduct_0.productId;
        local l_universeId_0 = v29.props.universeId;
        local v35 = {
            expectedCurrency = v4.Currency.Robux, 
            expectedPrice = l_developerProduct_0.priceInRobux, 
            saleLocationId = l_universeId_0
        };
        v29.props.purchaseDeveloperProduct(l_networking_0, l_productId_0, v35, v29.customPurchaseErrorHandler, v29.props.economicRestrictionErrorHandler):finally(function(v36) --[[ Line: 99 ]]
            -- upvalues: v12 (ref), v29 (ref), l_networking_0 (copy), l_universeId_0 (copy), l_developerProduct_0 (copy)
            if v36 ~= v12.Status.Rejected and v29.isMounted then
                v29.props.apiFetchGameDeveloperProducts(l_networking_0, l_universeId_0, v29.props.rootPlaceId, v29.props.localUserId);
                v29.props.closePrompt();
                v29.props.openPurchaseDeveloperProductSuccessPrompt(l_developerProduct_0.name);
            end;
        end);
    end;
end;
v28.render = function(v37) --[[ Line: 117 ]] --[[ Name: render ]]
    -- upvalues: v13 (copy), l_withStyle_0 (copy), v9 (copy), l_NumberLocalization_0 (copy), v2 (copy), v21 (copy)
    local l_containerWidth_0 = v37.props.containerWidth;
    local l_purchaseStatus_0 = v37.props.purchaseStatus;
    local l_closePrompt_0 = v37.props.closePrompt;
    local l_localization_0 = v37.props.localization;
    local l_developerProduct_1 = v37.props.developerProduct;
    local l_name_0 = l_developerProduct_1.name;
    local l_creatorName_0 = v37.props.creatorName;
    local l_priceInRobux_0 = l_developerProduct_1.priceInRobux;
    local v46 = l_purchaseStatus_0 == v13.Fetching;
    return l_withStyle_0(function(v47) --[[ Line: 128 ]]
        -- upvalues: v9 (ref), l_name_0 (copy), l_creatorName_0 (copy), l_NumberLocalization_0 (ref), l_priceInRobux_0 (copy), l_localization_0 (copy), v2 (ref), v21 (ref), l_containerWidth_0 (copy), v37 (copy), v46 (copy), l_closePrompt_0 (copy)
        return v9({
            buyItem = "IAPExperience.PurchasePrompt.Title.BuyItem", 
            message = {
                "Feature.Catalog.Label.PurchaseConfirmation"; 
                itemName = l_name_0, 
                creatorName = l_creatorName_0, 
                itemPrice = l_NumberLocalization_0.localize(l_priceInRobux_0, l_localization_0:GetLocale())
            }, 
            buy = "Feature.Catalog.Action.Buy"
        })(function(v48) --[[ Line: 138 ]]
            -- upvalues: v2 (ref), v21 (ref), l_containerWidth_0 (ref), v47 (copy), v37 (ref), v46 (ref), l_closePrompt_0 (ref)
            return v2.createElement(v21, {
                containerWidth = l_containerWidth_0, 
                titleText = v48.buyItem, 
                titleFont = v47.Font.Header1.Font, 
                messageText = v48.message, 
                messageFont = v47.Font.Body.Font, 
                buttonFont = v47.Font.Header2.Font, 
                confirmButtonText = v48.buy, 
                onConfirm = v37.purchaseDeveloperProduct, 
                isConfirming = v46, 
                hasCancelButton = true, 
                onCancel = l_closePrompt_0
            });
        end);
    end);
end;
v28.didMount = function(v49) --[[ Line: 156 ]] --[[ Name: didMount ]]
    v49.isMounted = true;
end;
v28.willUnmount = function(v50) --[[ Line: 160 ]] --[[ Name: willUnmount ]]
    v50.isMounted = false;
end;
v28 = v3.connect(function(v51, v52) --[[ Line: 164 ]]
    -- upvalues: v24 (copy)
    return {
        purchaseStatus = v24.GetPostingStatus(v51, v52.developerProduct.productId), 
        creatorName = v51.GameDetails[v52.universeId].creator.name, 
        rootPlaceId = v51.GameDetails[v52.universeId].rootPlaceId, 
        localUserId = v51.LocalUserId
    };
end, function(v53) --[[ Line: 171 ]]
    -- upvalues: v25 (copy), v26 (copy), v24 (copy), v23 (copy), v22 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v27 (copy)
    return {
        openPendingProductsLimitExceededPrompt = function() --[[ Line: 173 ]] --[[ Name: openPendingProductsLimitExceededPrompt ]]
            -- upvalues: v53 (copy), v25 (ref)
            return v53(v25());
        end, 
        openPurchaseDeveloperProductSuccessPrompt = function(v54) --[[ Line: 176 ]] --[[ Name: openPurchaseDeveloperProductSuccessPrompt ]]
            -- upvalues: v53 (copy), v26 (ref)
            return v53(v26(v54));
        end, 
        purchaseDeveloperProduct = function(v55, v56, v57, v58, v59) --[[ Line: 179 ]] --[[ Name: purchaseDeveloperProduct ]]
            -- upvalues: v53 (copy), v24 (ref)
            return v53(v24.Post(v55, v56, v57, v58, v59));
        end, 
        closePrompt = function() --[[ Line: 196 ]] --[[ Name: closePrompt ]]
            -- upvalues: v53 (copy), v23 (ref)
            return v53(v23());
        end, 
        apiFetchGameDeveloperProducts = function(v60, v61, v62, v63) --[[ Line: 199 ]] --[[ Name: apiFetchGameDeveloperProducts ]]
            -- upvalues: v53 (copy), v22 (ref)
            return v53(v22(v60, v61, v62, v63));
        end, 
        economicRestrictionErrorHandler = function(v64) --[[ Line: 202 ]] --[[ Name: economicRestrictionErrorHandler ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v53 (copy), v23 (ref), v27 (ref)
            local v65 = l_parseEconomicRestrictionsFailureReason_0(v64);
            local v66 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v64);
            l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                surface = l_EconomicRestrictionsSurface_0.DeveloperProduct, 
                failureReason = v65
            });
            v53(v23());
            return v53(v27(v65, v66));
        end
    };
end)(v28);
return (l_RoactServices_0.connect({
    networking = v7, 
    localization = v8
})(v28));