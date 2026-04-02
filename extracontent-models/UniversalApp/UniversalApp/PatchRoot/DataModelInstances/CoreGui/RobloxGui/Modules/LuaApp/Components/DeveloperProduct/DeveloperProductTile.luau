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
local v27 = require(l_Modules_0.LuaApp.Thunks.Economy.FetchExperienceStoreProducts);
local v28 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local l_UniversalEconomicRestrictionsCounter_0 = v12.Counters.EconomicRestrictionsCounter.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = v12.Counters.EconomicRestrictionsCounter.EconomicRestrictionsSurface;
local l_FFlagEnableUnifiedProductPurchaseFlow_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableUnifiedProductPurchaseFlow;
local v32 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreClickLogging);
local v33 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableEdpStoreGridPositionLogging);
local l_parseEconomicRestrictionsFailureReason_0 = v12.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v12.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v37 = require(l_CorePackages_0.Workspace.Packages.EdpStoreAnalytics);
local l_Constants_0 = v37.Constants;
local v39 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v39.UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = v39.addUnifiedEventLogging;
local l_SessionService_0 = game:GetService("SessionService");
local v43 = require(l_Modules_0.LuaApp.Flags.FFlagEnableEdpStoreUnifiedLogging);
local l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseGamepassAddProductUniverseId;
local l_FFlagUnifiedPurchaseAddSkeleton_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseAddSkeleton;
local v46 = game:DefineFastFlag("UnifiedPurchaseAddSkeletonLoadingForDeveloperProduct", false) and l_FFlagUnifiedPurchaseAddSkeleton_0;
local l_FFlagIntegrateDiscountsWithEDP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagIntegrateDiscountsWithEDP;
local v48 = v2.PureComponent:extend("DeveloperProductTile");
v48.validateProps = v11.strictInterface({
    universeId = v11.string, 
    developerProduct = v11.table, 
    developerProductThumbnail = v11.string, 
    pendingReceipts = v11.optional(v11.table), 
    gridPositionRow = if v33() then v11.optional(v11.number) else nil, 
    gridPositionColumn = if v33() then v11.optional(v11.number) else nil, 
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
    economicRestrictionErrorHandler = v11.callback, 
    fetchExperienceStoreProducts = v11.optional(v11.callback)
});
v48.init = function(v49) --[[ Line: 99 ]] --[[ Name: init ]]
    -- upvalues: v43 (copy), v2 (copy), v32 (copy), v37 (copy), l_Constants_0 (copy), v9 (copy), v10 (copy), v8 (copy), v5 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy)
    if v43 then
        v49.ref = v2.createRef();
    end;
    v49.viewDeveloperProductDetails = function(v50) --[[ Line: 103 ]]
        -- upvalues: v32 (ref), v37 (ref), l_Constants_0 (ref), v49 (copy), v9 (ref), v10 (ref), v8 (ref)
        return function() --[[ Line: 104 ]]
            -- upvalues: v32 (ref), v37 (ref), l_Constants_0 (ref), v49 (ref), v50 (copy), v9 (ref), v10 (ref), v8 (ref)
            if v32() then
                v37.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.DeveloperProducts, l_Constants_0.StoreEnums.LocationType.Store, tonumber(v49.props.universeId), v50.productId, (tostring(v50.productId)));
            end;
            if v49.isMounted then
                v49.props.navigateDown({
                    name = v9.GenericWebPage, 
                    detail = v10.economy.info.developerProduct({
                        universeId = v49.props.universeId, 
                        productId = v50.productId
                    }), 
                    extraProps = {
                        title = v50.name, 
                        transitionAnimation = v8.SlideInFromRight
                    }
                });
            end;
        end;
    end;
    v49.customPurchaseErrorHandler = function(v51) --[[ Line: 131 ]]
        -- upvalues: v49 (copy)
        if v51.errorCode == "PendingProductsLimitExceeded" then
            v49.props.openPendingProductsLimitExceededPrompt();
        end;
    end;
    v49.fetchGameDeveloperProducts = function(v52, v53, v54, v55) --[[ Line: 137 ]]
        -- upvalues: v49 (copy)
        v49.props.fetchGameDeveloperProducts(v52, v53, v54, v55);
    end;
    v49.promptPurchase = function(v56, _) --[[ Line: 141 ]]
        -- upvalues: v49 (copy), v5 (ref)
        return function() --[[ Line: 142 ]]
            -- upvalues: v49 (ref), v5 (ref), v56 (copy)
            local l_networking_0 = v49.props.networking;
            local l_userRobux_0 = v49.props.userRobux;
            local l_universeId_0 = v49.props.universeId;
            local l_rootPlaceId_0 = v49.props.rootPlaceId;
            local l_localUserId_0 = v49.props.localUserId;
            local v63 = {
                expectedCurrency = v5.Currency.Robux, 
                expectedPrice = v56.priceInRobux, 
                saleLocationId = l_universeId_0
            };
            if l_userRobux_0 < v56.priceInRobux then
                v49.props.navigateDownToRobuxUpsell(v56.priceInRobux, l_userRobux_0, v56.name, nil, function() --[[ Line: 159 ]]
                    -- upvalues: v49 (ref), l_networking_0 (copy), v56 (ref), v63 (copy), l_universeId_0 (copy), l_rootPlaceId_0 (copy), l_localUserId_0 (copy)
                    local v64 = v49.props.purchaseDeveloperProduct(l_networking_0, v56.productId, v63, v49.customPurchaseErrorHandler, v49.props.economicRestrictionErrorHandler);
                    v64:andThen(function(_) --[[ Line: 167 ]]
                        -- upvalues: v49 (ref), l_networking_0 (ref), l_universeId_0 (ref), l_rootPlaceId_0 (ref), l_localUserId_0 (ref)
                        v49.fetchGameDeveloperProducts(l_networking_0, l_universeId_0, l_rootPlaceId_0, l_localUserId_0);
                    end, function(_) --[[ Line: 169 ]]

                    end);
                    return v64;
                end, v56.productId);
                return;
            else
                v49.props.requestPurchaseDeveloperProduct(v56, l_universeId_0);
                return;
            end;
        end;
    end;
    v49.promptPurchaseWithUnifiedPurchasePrompt = function(v67, v68) --[[ Line: 180 ]]
        -- upvalues: v49 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (ref)
        local l_networking_1 = v49.props.networking;
        local l_rootPlaceId_1 = v49.props.rootPlaceId;
        local l_localUserId_1 = v49.props.localUserId;
        local function v72() --[[ Line: 184 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v49 (ref)
            v49.props.closeCentralOverlay();
        end;
        local function v74(v73) --[[ Line: 187 ]] --[[ Name: onPurchaseSuccess ]]
            -- upvalues: v49 (ref), l_networking_1 (copy), v68 (copy), l_rootPlaceId_1 (copy), l_localUserId_1 (copy)
            if v73 and v73.purchased then
                v49.props.fetchGameDeveloperProducts(l_networking_1, v68, l_rootPlaceId_1, l_localUserId_1);
            end;
        end;
        local function v75() --[[ Line: 192 ]] --[[ Name: onRobloxSubscriptionUpsellSuccess ]]
            -- upvalues: v49 (ref), v68 (copy)
            v49.props.fetchExperienceStoreProducts(v49.props.networking, v68);
        end;
        return function() --[[ Line: 195 ]]
            -- upvalues: v49 (ref), v67 (copy), v68 (copy), v72 (copy), v74 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v75 (copy)
            v49.props.requestPurchaseDeveloperProductWithUnifiedPurchasePrompt(v67, v68, v72, v74, if l_FFlagIntegrateDiscountsWithEDP_0 then v75 else nil);
        end;
    end;
    v49.onActivated = function() --[[ Line: 206 ]]
        -- upvalues: v49 (copy), v32 (ref), v37 (ref), l_Constants_0 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref)
        local l_developerProduct_0 = v49.props.developerProduct;
        local l_universeId_1 = v49.props.universeId;
        if v32() then
            v37.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.DeveloperProducts, l_Constants_0.StoreEnums.LocationType.Store, tonumber(l_universeId_1), l_developerProduct_0.productId, (tostring(l_developerProduct_0.productId)));
        end;
        return l_getIsUserEligibleForUnifiedPurchaseFlow_0(v49.props.networking):andThen(function(v78) --[[ Line: 220 ]]
            -- upvalues: v49 (ref), l_developerProduct_0 (copy), l_universeId_1 (copy)
            if v78 then
                return v49.promptPurchaseWithUnifiedPurchasePrompt(l_developerProduct_0, l_universeId_1)();
            else
                return v49.promptPurchase(l_developerProduct_0, l_universeId_1)();
            end;
        end):catch(function(_) --[[ Line: 227 ]]
            -- upvalues: v49 (ref), l_developerProduct_0 (copy), l_universeId_1 (copy)
            return v49.promptPurchase(l_developerProduct_0, l_universeId_1)();
        end);
    end;
end;
v48.render = function(v80) --[[ Line: 234 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ItemTile_0 (copy), v43 (copy), v19 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_ItemTileEnums_0 (copy)
    local l_developerProduct_1 = v80.props.developerProduct;
    local l_pendingReceipts_0 = v80.props.pendingReceipts;
    local v83 = if l_pendingReceipts_0 == nil then nil else "x" .. tostring(#l_pendingReceipts_0);
    return v2.createElement(l_ItemTile_0, {
        [v2.Ref] = if v43 then v80.ref else nil, 
        name = l_developerProduct_1.name, 
        titleTextLineCount = 1, 
        thumbnail = v80.props.developerProductThumbnail, 
        onActivated = v80.viewDeveloperProductDetails(l_developerProduct_1), 
        footer = v2.createElement(v19, {
            price = l_developerProduct_1.priceInRobux, 
            onActivated = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v80.onActivated else v80.promptPurchase(l_developerProduct_1, v80.props.universeId)
        }), 
        statusText = v83, 
        statusStyle = l_ItemTileEnums_0.StatusStyle.Info
    });
end;
v48.didMount = function(v84) --[[ Line: 255 ]] --[[ Name: didMount ]]
    -- upvalues: v43 (copy), l_UnifiedEventLogEnums_0 (copy), v33 (copy), l_addUnifiedEventLogging_0 (copy), l_SessionService_0 (copy)
    v84.isMounted = true;
    if v43 then
        task.delay(0, function() --[[ Line: 258 ]]
            -- upvalues: v84 (copy), l_UnifiedEventLogEnums_0 (ref), v33 (ref), l_addUnifiedEventLogging_0 (ref), l_SessionService_0 (ref)
            local v85 = {
                universeId = tonumber(v84.props.universeId), 
                itemId = v84.props.developerProduct.productId, 
                targetId = tonumber(v84.props.developerProduct.id), 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.DEVELOPER_PRODUCT
            };
            if v33() then
                v85.gridPositionRow = v84.props.gridPositionRow;
                v85.gridPositionColumn = v84.props.gridPositionColumn;
            end;
            l_addUnifiedEventLogging_0(v84.ref, v85, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end;
end;
v48.willUnmount = function(v86) --[[ Line: 276 ]] --[[ Name: willUnmount ]]
    v86.isMounted = false;
end;
v48 = v3.connect(function(v87, v88) --[[ Line: 280 ]]
    local l_productId_0 = v88.developerProduct.productId;
    return {
        userRobux = v87.UserRobux[v87.LocalUserId], 
        pendingReceipts = v87.DeveloperProductStatuses[v88.universeId][tostring(l_productId_0)], 
        rootPlaceId = if v87.GameDetails and v87.GameDetails[v88.universeId] then v87.GameDetails[v88.universeId].rootPlaceId else nil, 
        localUserId = v87.LocalUserId
    };
end, function(v90) --[[ Line: 290 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), v22 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), l_ProductPurchaseSurface_0 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v46 (copy), v16 (copy), v4 (copy), v17 (copy), v18 (copy), v20 (copy), v21 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v28 (copy), v27 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 292 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v90 (copy), l_CloseCentralOverlay_0 (ref)
            return v90(l_CloseCentralOverlay_0());
        end, 
        requestPurchaseDeveloperProductWithUnifiedPurchasePrompt = function(v91, v92, v93, v94, v95) --[[ Line: 295 ]] --[[ Name: requestPurchaseDeveloperProductWithUnifiedPurchasePrompt ]]
            -- upvalues: v90 (copy), v22 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v46 (ref)
            return v90(v22({
                productPayload = {
                    kind = "Product", 
                    id = v91.productId, 
                    equipIfPurchased = false, 
                    universeId = v92
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v93, 
                    onPurchaseSuccess = v94, 
                    onRobloxSubscriptionUpsellSuccess = if l_FFlagIntegrateDiscountsWithEDP_0 then v95 else nil
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.EDP, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v92 else nil
                }, 
                purchaseOptions = if v46 then {
                    enablePreloadedPurchaseUI = true
                } else nil
            }));
        end, 
        requestPurchaseDeveloperProduct = function(v96, v97) --[[ Line: 327 ]] --[[ Name: requestPurchaseDeveloperProduct ]]
            -- upvalues: v90 (copy), v16 (ref)
            return v90(v16(v96, v97));
        end, 
        navigateDown = function(v98) --[[ Line: 330 ]] --[[ Name: navigateDown ]]
            -- upvalues: v90 (copy), v4 (ref)
            return v90(v4(v98));
        end, 
        navigateDownToRobuxUpsell = function(v99, v100, v101, v102, v103, v104) --[[ Line: 333 ]] --[[ Name: navigateDownToRobuxUpsell ]]
            -- upvalues: v90 (copy), v17 (ref), v18 (ref)
            return v90(v17(v18.UADeveloperProduct, v99, v100, v101, v102, v103, v104));
        end, 
        purchaseDeveloperProduct = function(v105, v106, v107, v108, v109) --[[ Line: 353 ]] --[[ Name: purchaseDeveloperProduct ]]
            -- upvalues: v90 (copy), v20 (ref)
            return v90(v20.Post(v105, v106, v107, v108, v109));
        end, 
        fetchGameDeveloperProducts = function(v110, v111, v112, v113) --[[ Line: 370 ]] --[[ Name: fetchGameDeveloperProducts ]]
            -- upvalues: v90 (copy), v21 (ref)
            return v90(v21(v110, v111, v112, v113));
        end, 
        economicRestrictionErrorHandler = function(v114) --[[ Line: 373 ]] --[[ Name: economicRestrictionErrorHandler ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v90 (copy), v28 (ref)
            local v115 = l_parseEconomicRestrictionsFailureReason_0(v114);
            local v116 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v114);
            l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                surface = l_EconomicRestrictionsSurface_0.DeveloperProduct, 
                failureReason = v115
            });
            return v90(v28(v115, v116));
        end, 
        fetchExperienceStoreProducts = function(v117, v118) --[[ Line: 382 ]] --[[ Name: fetchExperienceStoreProducts ]]
            -- upvalues: v90 (copy), v27 (ref)
            return v90(v27(v117, v118));
        end
    };
end)(v48);
return (l_RoactServices_0.connect({
    networking = v7
})(v48));