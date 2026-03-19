local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.RoactRodux);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v5 = require(l_Modules_0.LuaApp.Constants);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Enum.TransitionAnimation);
local v9 = require(l_Modules_0.LuaApp.AppPage);
local v10 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v11 = require(l_CorePackages_0.Packages.t);
local v12 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local v13 = require(l_CorePackages_0.Packages.UIBlox);
local l_ItemTile_0 = v13.Tile.ItemTile;
local l_ItemTileEnums_0 = v13.Tile.ItemTileEnums;
local v16 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.OpenCentralOverlayForPurchaseDeveloperProduct);
local v17 = require(l_Modules_0.LuaApp.Thunks.Economy.NavigateDownToRobuxUpsell);
local v18 = require(l_Modules_0.LuaApp.Components.RobuxUpsell.Enum.RobuxUpsellTriggerContext);
local v19 = require(l_Modules_0.LuaApp.Components.DeveloperProduct.DeveloperProductFooter);
local v20 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.PurchaseDeveloperProduct);
local v21 = require(l_Modules_0.LuaApp.Thunks.DeveloperProduct.ApiFetchGameDeveloperProducts);
local v22 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v23 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v23.getIsUserEligibleForUnifiedPurchaseFlow;
local l_ProductPurchaseSurface_0 = v23.Enums.ProductPurchaseSurface;
local l_CloseCentralOverlay_0 = require(l_CorePackages_0.Workspace.Packages.CentralOverlay).Thunks.CloseCentralOverlay;
local v27 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local l_UniversalEconomicRestrictionsCounter_0 = v12.Counters.EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = v12.Counters.EconomicRestrictionsCounter.EconomicRestrictionsSurface;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v31 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_parseEconomicRestrictionsFailureReason_0 = v12.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v12.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v36 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v36.Constants;
local v38 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v38.UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = v38.addUnifiedEventLogging;
local l_SessionService_0 = game:GetService("SessionService");
local v42 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local v45 = game:DefineFastFlag("UnifiedPurchaseAddSkeletonLoadingForDeveloperProduct", false) and l_FFlagUnifiedPurchaseAddSkeleton_0;
local v46 = v2.PureComponent:extend("DeveloperProductTile");
v46.validateProps = v11.strictInterface({
    universeId = v11.string, 
    developerProduct = v11.table, 
    developerProductThumbnail = v11.string, 
    pendingReceipts = v11.optional(v11.table), 
    gridPositionRow = if v32() then v11.optional(v11.number) else nil, 
    gridPositionColumn = if v32() then v11.optional(v11.number) else nil, 
    networking = v11.callback, 
    userRobux = v11.optional(v11.number), 
    rootPlaceId = v11.optional(v11.string), 
    localUserId = v11.optional(v11.string), 
    closeCentralOverlay = v11.callback, 
    requestPurchaseDeveloperProduct = v11.optional(v11.callback), 
    requestPurchaseDeveloperProductWithUnifiedPurchasePrompt = v11.optional(v11.callback), 
    navigateDownToRobuxUpsell = v11.callback, 
    navigateDown = v11.callback, 
    purchaseDeveloperProduct = v11.callback, 
    fetchGameDeveloperProducts = v11.callback, 
    economicRestrictionErrorHandler = v11.callback
});
v46.init = function(v47) --[[ Line: 95 ]] --[[ Name: init ]]
    -- upvalues: v42 (copy), v2 (copy), v31 (copy), v36 (copy), l_Constants_0 (copy), v9 (copy), v10 (copy), v8 (copy), v5 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy)
    if v42 then
        v47.ref = v2.createRef();
    end;
    v47.viewDeveloperProductDetails = function(v48) --[[ Line: 99 ]]
        -- upvalues: v31 (ref), v36 (ref), l_Constants_0 (ref), v47 (copy), v9 (ref), v10 (ref), v8 (ref)
        return function() --[[ Line: 100 ]]
            -- upvalues: v31 (ref), v36 (ref), l_Constants_0 (ref), v47 (ref), v48 (copy), v9 (ref), v10 (ref), v8 (ref)
            if v31() then
                v36.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.DeveloperProducts, l_Constants_0.StoreEnums.LocationType.Store, tonumber(v47.props.universeId), v48.productId, (tostring(v48.productId)));
            end;
            if v47.isMounted then
                v47.props.navigateDown({
                    name = v9.GenericWebPage, 
                    detail = v10.economy.info.developerProduct({
                        universeId = v47.props.universeId, 
                        productId = v48.productId
                    }), 
                    extraProps = {
                        title = v48.name, 
                        transitionAnimation = v8.SlideInFromRight
                    }
                });
            end;
        end;
    end;
    v47.customPurchaseErrorHandler = function(v49) --[[ Line: 127 ]]
        -- upvalues: v47 (copy)
        if v49.errorCode == "PendingProductsLimitExceeded" then
            v47.props.openPendingProductsLimitExceededPrompt();
        end;
    end;
    v47.fetchGameDeveloperProducts = function(v50, v51, v52, v53) --[[ Line: 133 ]]
        -- upvalues: v47 (copy)
        v47.props.fetchGameDeveloperProducts(v50, v51, v52, v53);
    end;
    v47.promptPurchase = function(v54, _) --[[ Line: 137 ]]
        -- upvalues: v47 (copy), v5 (ref)
        return function() --[[ Line: 138 ]]
            -- upvalues: v47 (ref), v5 (ref), v54 (copy)
            local l_networking_0 = v47.props.networking;
            local l_userRobux_0 = v47.props.userRobux;
            local l_universeId_0 = v47.props.universeId;
            local l_rootPlaceId_0 = v47.props.rootPlaceId;
            local l_localUserId_0 = v47.props.localUserId;
            local v61 = {
                expectedCurrency = v5.Currency.Robux, 
                expectedPrice = v54.priceInRobux, 
                saleLocationId = l_universeId_0
            };
            if l_userRobux_0 < v54.priceInRobux then
                v47.props.navigateDownToRobuxUpsell(v54.priceInRobux, l_userRobux_0, v54.name, nil, function() --[[ Line: 155 ]]
                    -- upvalues: v47 (ref), l_networking_0 (copy), v54 (ref), v61 (copy), l_universeId_0 (copy), l_rootPlaceId_0 (copy), l_localUserId_0 (copy)
                    local v62 = v47.props.purchaseDeveloperProduct(l_networking_0, v54.productId, v61, v47.customPurchaseErrorHandler, v47.props.economicRestrictionErrorHandler);
                    v62:andThen(function(_) --[[ Line: 163 ]]
                        -- upvalues: v47 (ref), l_networking_0 (ref), l_universeId_0 (ref), l_rootPlaceId_0 (ref), l_localUserId_0 (ref)
                        v47.fetchGameDeveloperProducts(l_networking_0, l_universeId_0, l_rootPlaceId_0, l_localUserId_0);
                    end, function(_) --[[ Line: 165 ]]

                    end);
                    return v62;
                end, v54.productId);
                return;
            else
                v47.props.requestPurchaseDeveloperProduct(v54, l_universeId_0);
                return;
            end;
        end;
    end;
    v47.promptPurchaseWithUnifiedPurchasePrompt = function(v65, v66) --[[ Line: 176 ]]
        -- upvalues: v47 (copy)
        local l_networking_1 = v47.props.networking;
        local l_rootPlaceId_1 = v47.props.rootPlaceId;
        local l_localUserId_1 = v47.props.localUserId;
        local function v70() --[[ Line: 180 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v47 (ref)
            v47.props.closeCentralOverlay();
        end;
        local function v72(v71) --[[ Line: 183 ]] --[[ Name: onPurchaseSuccess ]]
            -- upvalues: v47 (ref), l_networking_1 (copy), v66 (copy), l_rootPlaceId_1 (copy), l_localUserId_1 (copy)
            if v71 and v71.purchased then
                v47.props.fetchGameDeveloperProducts(l_networking_1, v66, l_rootPlaceId_1, l_localUserId_1);
            end;
        end;
        return function() --[[ Line: 189 ]]
            -- upvalues: v47 (ref), v65 (copy), v66 (copy), v70 (copy), v72 (copy)
            v47.props.requestPurchaseDeveloperProductWithUnifiedPurchasePrompt(v65, v66, v70, v72);
        end;
    end;
    v47.onActivated = function() --[[ Line: 199 ]]
        -- upvalues: v47 (copy), v31 (ref), v36 (ref), l_Constants_0 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref)
        local l_developerProduct_0 = v47.props.developerProduct;
        local l_universeId_1 = v47.props.universeId;
        if v31() then
            v36.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.DeveloperProducts, l_Constants_0.StoreEnums.LocationType.Store, tonumber(l_universeId_1), l_developerProduct_0.productId, (tostring(l_developerProduct_0.productId)));
        end;
        return l_getIsUserEligibleForUnifiedPurchaseFlow_0(v47.props.networking):andThen(function(v75) --[[ Line: 213 ]]
            -- upvalues: v47 (ref), l_developerProduct_0 (copy), l_universeId_1 (copy)
            if v75 then
                return v47.promptPurchaseWithUnifiedPurchasePrompt(l_developerProduct_0, l_universeId_1)();
            else
                return v47.promptPurchase(l_developerProduct_0, l_universeId_1)();
            end;
        end):catch(function(_) --[[ Line: 220 ]]
            -- upvalues: v47 (ref), l_developerProduct_0 (copy), l_universeId_1 (copy)
            return v47.promptPurchase(l_developerProduct_0, l_universeId_1)();
        end);
    end;
end;
v46.render = function(v77) --[[ Line: 227 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ItemTile_0 (copy), v42 (copy), v19 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_ItemTileEnums_0 (copy)
    local l_developerProduct_1 = v77.props.developerProduct;
    local l_pendingReceipts_0 = v77.props.pendingReceipts;
    local v80 = if l_pendingReceipts_0 == nil then nil else "x" .. tostring(#l_pendingReceipts_0);
    return v2.createElement(l_ItemTile_0, {
        [v2.Ref] = if v42 then v77.ref else nil, 
        name = l_developerProduct_1.name, 
        titleTextLineCount = 1, 
        thumbnail = v77.props.developerProductThumbnail, 
        onActivated = v77.viewDeveloperProductDetails(l_developerProduct_1), 
        footer = v2.createElement(v19, {
            price = l_developerProduct_1.priceInRobux, 
            onActivated = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v77.onActivated else v77.promptPurchase(l_developerProduct_1, v77.props.universeId)
        }), 
        statusText = v80, 
        statusStyle = l_ItemTileEnums_0.StatusStyle.Info
    });
end;
v46.didMount = function(v81) --[[ Line: 248 ]] --[[ Name: didMount ]]
    -- upvalues: v42 (copy), l_UnifiedEventLogEnums_0 (copy), v32 (copy), l_addUnifiedEventLogging_0 (copy), l_SessionService_0 (copy)
    v81.isMounted = true;
    if v42 then
        task.delay(0, function() --[[ Line: 251 ]]
            -- upvalues: v81 (copy), l_UnifiedEventLogEnums_0 (ref), v32 (ref), l_addUnifiedEventLogging_0 (ref), l_SessionService_0 (ref)
            local v82 = {
                universeId = tonumber(v81.props.universeId), 
                itemId = v81.props.developerProduct.productId, 
                targetId = tonumber(v81.props.developerProduct.id), 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.DEVELOPER_PRODUCT
            };
            if v32() then
                v82.gridPositionRow = v81.props.gridPositionRow;
                v82.gridPositionColumn = v81.props.gridPositionColumn;
            end;
            l_addUnifiedEventLogging_0(v81.ref, v82, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end;
end;
v46.willUnmount = function(v83) --[[ Line: 269 ]] --[[ Name: willUnmount ]]
    v83.isMounted = false;
end;
v46 = v3.connect(function(v84, v85) --[[ Line: 273 ]]
    local l_productId_0 = v85.developerProduct.productId;
    return {
        userRobux = v84.UserRobux[v84.LocalUserId], 
        pendingReceipts = v84.DeveloperProductStatuses[v85.universeId][tostring(l_productId_0)], 
        rootPlaceId = if v84.GameDetails and v84.GameDetails[v85.universeId] then v84.GameDetails[v85.universeId].rootPlaceId else nil, 
        localUserId = v84.LocalUserId
    };
end, function(v87) --[[ Line: 283 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), v22 (copy), l_ProductPurchaseSurface_0 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v45 (copy), v16 (copy), v4 (copy), v17 (copy), v18 (copy), v20 (copy), v21 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v27 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 285 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v87 (copy), l_CloseCentralOverlay_0 (ref)
            return v87(l_CloseCentralOverlay_0());
        end, 
        requestPurchaseDeveloperProductWithUnifiedPurchasePrompt = function(v88, v89, v90, v91) --[[ Line: 288 ]] --[[ Name: requestPurchaseDeveloperProductWithUnifiedPurchasePrompt ]]
            -- upvalues: v87 (copy), v22 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v45 (ref)
            return v87(v22({
                productPayload = {
                    kind = "Product", 
                    id = v88.productId, 
                    equipIfPurchased = false, 
                    universeId = v89
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v90, 
                    onPurchaseSuccess = v91
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.EDP, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v89 else nil
                }, 
                purchaseOptions = if v45 then {
                    enablePreloadedPurchaseUI = true
                } else nil
            }));
        end, 
        requestPurchaseDeveloperProduct = function(v92, v93) --[[ Line: 313 ]] --[[ Name: requestPurchaseDeveloperProduct ]]
            -- upvalues: v87 (copy), v16 (ref)
            return v87(v16(v92, v93));
        end, 
        navigateDown = function(v94) --[[ Line: 316 ]] --[[ Name: navigateDown ]]
            -- upvalues: v87 (copy), v4 (ref)
            return v87(v4(v94));
        end, 
        navigateDownToRobuxUpsell = function(v95, v96, v97, v98, v99, v100) --[[ Line: 319 ]] --[[ Name: navigateDownToRobuxUpsell ]]
            -- upvalues: v87 (copy), v17 (ref), v18 (ref)
            return v87(v17(v18.UADeveloperProduct, v95, v96, v97, v98, v99, v100));
        end, 
        purchaseDeveloperProduct = function(v101, v102, v103, v104, v105) --[[ Line: 339 ]] --[[ Name: purchaseDeveloperProduct ]]
            -- upvalues: v87 (copy), v20 (ref)
            return v87(v20.Post(v101, v102, v103, v104, v105));
        end, 
        fetchGameDeveloperProducts = function(v106, v107, v108, v109) --[[ Line: 356 ]] --[[ Name: fetchGameDeveloperProducts ]]
            -- upvalues: v87 (copy), v21 (ref)
            return v87(v21(v106, v107, v108, v109));
        end, 
        economicRestrictionErrorHandler = function(v110) --[[ Line: 359 ]] --[[ Name: economicRestrictionErrorHandler ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v87 (copy), v27 (ref)
            local v111 = l_parseEconomicRestrictionsFailureReason_0(v110);
            local v112 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v110);
            l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                surface = l_EconomicRestrictionsSurface_0.DeveloperProduct, 
                failureReason = v111
            });
            return v87(v27(v111, v112));
        end
    };
end)(v46);
return (l_RoactServices_0.connect({
    networking = v7
})(v46));