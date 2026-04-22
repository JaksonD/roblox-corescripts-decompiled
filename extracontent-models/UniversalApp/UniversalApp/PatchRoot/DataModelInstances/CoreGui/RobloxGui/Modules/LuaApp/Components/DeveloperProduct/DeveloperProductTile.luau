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
local v48 = game:DefineFastFlag("ShipUnifiedPurchaseFlowToDeveloperProductEDP", false);
local l_FFlagEnableBlackbirdPageCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback;
local l_getSubscriptionPurchaseCloseCallback_0 = require(l_CorePackages_0.Workspace.Packages.RobloxSubscriptionPurchaseApp).Utils.getSubscriptionPurchaseCloseCallback;
local v51 = v2.PureComponent:extend("DeveloperProductTile");
v51.validateProps = v11.strictInterface({
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
v51.init = function(v52) --[[ Line: 106 ]] --[[ Name: init ]]
    -- upvalues: v43 (copy), v2 (copy), l_FFlagEnableBlackbirdPageCloseCallback_0 (copy), l_getSubscriptionPurchaseCloseCallback_0 (copy), v32 (copy), v37 (copy), l_Constants_0 (copy), v9 (copy), v10 (copy), v8 (copy), v5 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), v48 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy)
    if v43 then
        v52.ref = v2.createRef();
    end;
    local v53 = if l_FFlagEnableBlackbirdPageCloseCallback_0 and l_getSubscriptionPurchaseCloseCallback_0 then l_getSubscriptionPurchaseCloseCallback_0() else nil;
    v52.viewDeveloperProductDetails = function(v54) --[[ Line: 114 ]]
        -- upvalues: v32 (ref), v37 (ref), l_Constants_0 (ref), v52 (copy), v9 (ref), v10 (ref), v8 (ref), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), v53 (copy)
        return function() --[[ Line: 115 ]]
            -- upvalues: v32 (ref), v37 (ref), l_Constants_0 (ref), v52 (ref), v54 (copy), v9 (ref), v10 (ref), v8 (ref), l_FFlagEnableBlackbirdPageCloseCallback_0 (ref), v53 (ref)
            if v32() then
                v37.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.ItemClick, l_Constants_0.StoreEnums.ProductType.DeveloperProducts, l_Constants_0.StoreEnums.LocationType.Store, tonumber(v52.props.universeId), v54.productId, (tostring(v54.productId)));
            end;
            if v52.isMounted then
                v52.props.navigateDown({
                    name = v9.GenericWebPage, 
                    detail = v10.economy.info.developerProduct({
                        universeId = v52.props.universeId, 
                        productId = v54.productId
                    }), 
                    extraProps = {
                        title = v54.name, 
                        transitionAnimation = v8.SlideInFromRight, 
                        onClose = if l_FFlagEnableBlackbirdPageCloseCallback_0 then v53 else nil
                    }
                });
            end;
        end;
    end;
    v52.customPurchaseErrorHandler = function(v55) --[[ Line: 143 ]]
        -- upvalues: v52 (copy)
        if v55.errorCode == "PendingProductsLimitExceeded" then
            v52.props.openPendingProductsLimitExceededPrompt();
        end;
    end;
    v52.fetchGameDeveloperProducts = function(v56, v57, v58, v59) --[[ Line: 149 ]]
        -- upvalues: v52 (copy)
        v52.props.fetchGameDeveloperProducts(v56, v57, v58, v59);
    end;
    v52.promptPurchase = function(v60, _) --[[ Line: 153 ]]
        -- upvalues: v52 (copy), v5 (ref)
        return function() --[[ Line: 154 ]]
            -- upvalues: v52 (ref), v5 (ref), v60 (copy)
            local l_networking_0 = v52.props.networking;
            local l_userRobux_0 = v52.props.userRobux;
            local l_universeId_0 = v52.props.universeId;
            local l_rootPlaceId_0 = v52.props.rootPlaceId;
            local l_localUserId_0 = v52.props.localUserId;
            local v67 = {
                expectedCurrency = v5.Currency.Robux, 
                expectedPrice = v60.priceInRobux, 
                saleLocationId = l_universeId_0
            };
            if l_userRobux_0 < v60.priceInRobux then
                v52.props.navigateDownToRobuxUpsell(v60.priceInRobux, l_userRobux_0, v60.name, nil, function() --[[ Line: 171 ]]
                    -- upvalues: v52 (ref), l_networking_0 (copy), v60 (ref), v67 (copy), l_universeId_0 (copy), l_rootPlaceId_0 (copy), l_localUserId_0 (copy)
                    local v68 = v52.props.purchaseDeveloperProduct(l_networking_0, v60.productId, v67, v52.customPurchaseErrorHandler, v52.props.economicRestrictionErrorHandler);
                    v68:andThen(function(_) --[[ Line: 179 ]]
                        -- upvalues: v52 (ref), l_networking_0 (ref), l_universeId_0 (ref), l_rootPlaceId_0 (ref), l_localUserId_0 (ref)
                        v52.fetchGameDeveloperProducts(l_networking_0, l_universeId_0, l_rootPlaceId_0, l_localUserId_0);
                    end, function(_) --[[ Line: 181 ]]

                    end);
                    return v68;
                end, v60.productId);
                return;
            else
                v52.props.requestPurchaseDeveloperProduct(v60, l_universeId_0);
                return;
            end;
        end;
    end;
    v52.promptPurchaseWithUnifiedPurchasePrompt = function(v71, v72) --[[ Line: 192 ]]
        -- upvalues: v52 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (ref)
        local l_networking_1 = v52.props.networking;
        local l_rootPlaceId_1 = v52.props.rootPlaceId;
        local l_localUserId_1 = v52.props.localUserId;
        local function v76() --[[ Line: 196 ]] --[[ Name: onFlowComplete ]]
            -- upvalues: v52 (ref)
            v52.props.closeCentralOverlay();
        end;
        local function v78(v77) --[[ Line: 199 ]] --[[ Name: onPurchaseSuccess ]]
            -- upvalues: v52 (ref), l_networking_1 (copy), v72 (copy), l_rootPlaceId_1 (copy), l_localUserId_1 (copy)
            if v77 and v77.purchased then
                v52.props.fetchGameDeveloperProducts(l_networking_1, v72, l_rootPlaceId_1, l_localUserId_1);
            end;
        end;
        local function v79() --[[ Line: 204 ]] --[[ Name: onRobloxSubscriptionUpsellSuccess ]]
            -- upvalues: v52 (ref), v72 (copy)
            v52.props.fetchExperienceStoreProducts(v52.props.networking, v72);
        end;
        return function() --[[ Line: 207 ]]
            -- upvalues: v52 (ref), v71 (copy), v72 (copy), v76 (copy), v78 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (ref), v79 (copy)
            v52.props.requestPurchaseDeveloperProductWithUnifiedPurchasePrompt(v71, v72, v76, v78, if l_FFlagIntegrateDiscountsWithEDP_0 then v79 else nil);
        end;
    end;
    v52.onActivated = function() --[[ Line: 218 ]]
        -- upvalues: v52 (copy), v32 (ref), v37 (ref), l_Constants_0 (ref), v48 (ref), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref)
        local l_developerProduct_0 = v52.props.developerProduct;
        local l_universeId_1 = v52.props.universeId;
        if v32() then
            v37.EdpStoreAnalyticsLogger.logEvent(l_Constants_0.StoreEnums.ActionType.PurchaseAttemptClick, l_Constants_0.StoreEnums.ProductType.DeveloperProducts, l_Constants_0.StoreEnums.LocationType.Store, tonumber(l_universeId_1), l_developerProduct_0.productId, (tostring(l_developerProduct_0.productId)));
        end;
        if v48 then
            return v52.promptPurchaseWithUnifiedPurchasePrompt(l_developerProduct_0, l_universeId_1)();
        else
            return l_getIsUserEligibleForUnifiedPurchaseFlow_0(v52.props.networking):andThen(function(v82) --[[ Line: 235 ]]
                -- upvalues: v52 (ref), l_developerProduct_0 (copy), l_universeId_1 (copy)
                if v82 then
                    return v52.promptPurchaseWithUnifiedPurchasePrompt(l_developerProduct_0, l_universeId_1)();
                else
                    return v52.promptPurchase(l_developerProduct_0, l_universeId_1)();
                end;
            end):catch(function(_) --[[ Line: 242 ]]
                -- upvalues: v52 (ref), l_developerProduct_0 (copy), l_universeId_1 (copy)
                return v52.promptPurchase(l_developerProduct_0, l_universeId_1)();
            end);
        end;
    end;
end;
v51.render = function(v84) --[[ Line: 249 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_ItemTile_0 (copy), v43 (copy), v19 (copy), l_FFlagEnableUnifiedProductPurchaseFlow_0 (copy), l_ItemTileEnums_0 (copy)
    local l_developerProduct_1 = v84.props.developerProduct;
    local l_pendingReceipts_0 = v84.props.pendingReceipts;
    local v87 = if l_pendingReceipts_0 == nil then nil else "x" .. tostring(#l_pendingReceipts_0);
    return v2.createElement(l_ItemTile_0, {
        [v2.Ref] = if v43 then v84.ref else nil, 
        name = l_developerProduct_1.name, 
        titleTextLineCount = 1, 
        thumbnail = v84.props.developerProductThumbnail, 
        onActivated = v84.viewDeveloperProductDetails(l_developerProduct_1), 
        footer = v2.createElement(v19, {
            price = l_developerProduct_1.priceInRobux, 
            onActivated = if l_FFlagEnableUnifiedProductPurchaseFlow_0 then v84.onActivated else v84.promptPurchase(l_developerProduct_1, v84.props.universeId)
        }), 
        statusText = v87, 
        statusStyle = l_ItemTileEnums_0.StatusStyle.Info
    });
end;
v51.didMount = function(v88) --[[ Line: 270 ]] --[[ Name: didMount ]]
    -- upvalues: v43 (copy), l_UnifiedEventLogEnums_0 (copy), v33 (copy), l_addUnifiedEventLogging_0 (copy), l_SessionService_0 (copy)
    v88.isMounted = true;
    if v43 then
        task.delay(0, function() --[[ Line: 273 ]]
            -- upvalues: v88 (copy), l_UnifiedEventLogEnums_0 (ref), v33 (ref), l_addUnifiedEventLogging_0 (ref), l_SessionService_0 (ref)
            local v89 = {
                universeId = tonumber(v88.props.universeId), 
                itemId = v88.props.developerProduct.productId, 
                targetId = tonumber(v88.props.developerProduct.id), 
                itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.DEVELOPER_PRODUCT
            };
            if v33() then
                v89.gridPositionRow = v88.props.gridPositionRow;
                v89.gridPositionColumn = v88.props.gridPositionColumn;
            end;
            l_addUnifiedEventLogging_0(v88.ref, v89, {
                sessionTagName = l_SessionService_0:GetSessionTag("level2a")
            });
        end);
    end;
end;
v51.willUnmount = function(v90) --[[ Line: 291 ]] --[[ Name: willUnmount ]]
    v90.isMounted = false;
end;
v51 = v3.connect(function(v91, v92) --[[ Line: 295 ]]
    local l_productId_0 = v92.developerProduct.productId;
    return {
        userRobux = v91.UserRobux[v91.LocalUserId], 
        pendingReceipts = v91.DeveloperProductStatuses[v92.universeId][tostring(l_productId_0)], 
        rootPlaceId = if v91.GameDetails and v91.GameDetails[v92.universeId] then v91.GameDetails[v92.universeId].rootPlaceId else nil, 
        localUserId = v91.LocalUserId
    };
end, function(v94) --[[ Line: 305 ]]
    -- upvalues: l_CloseCentralOverlay_0 (copy), v22 (copy), l_FFlagIntegrateDiscountsWithEDP_0 (copy), l_ProductPurchaseSurface_0 (copy), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (copy), v46 (copy), v16 (copy), v4 (copy), v17 (copy), v18 (copy), v20 (copy), v21 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v28 (copy), v27 (copy)
    return {
        closeCentralOverlay = function() --[[ Line: 307 ]] --[[ Name: closeCentralOverlay ]]
            -- upvalues: v94 (copy), l_CloseCentralOverlay_0 (ref)
            return v94(l_CloseCentralOverlay_0());
        end, 
        requestPurchaseDeveloperProductWithUnifiedPurchasePrompt = function(v95, v96, v97, v98, v99) --[[ Line: 310 ]] --[[ Name: requestPurchaseDeveloperProductWithUnifiedPurchasePrompt ]]
            -- upvalues: v94 (copy), v22 (ref), l_FFlagIntegrateDiscountsWithEDP_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 (ref), v46 (ref)
            return v94(v22({
                productPayload = {
                    kind = "Product", 
                    id = v95.productId, 
                    equipIfPurchased = false, 
                    universeId = v96
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v97, 
                    onPurchaseSuccess = v98, 
                    onRobloxSubscriptionUpsellSuccess = if l_FFlagIntegrateDiscountsWithEDP_0 then v99 else nil
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.EDP, 
                    productUniverseId = if l_FFlagUnifiedPurchaseGamepassAddProductUniverseId_0 then v96 else nil
                }, 
                purchaseOptions = if v46 then {
                    enablePreloadedPurchaseUI = true
                } else nil
            }));
        end, 
        requestPurchaseDeveloperProduct = function(v100, v101) --[[ Line: 342 ]] --[[ Name: requestPurchaseDeveloperProduct ]]
            -- upvalues: v94 (copy), v16 (ref)
            return v94(v16(v100, v101));
        end, 
        navigateDown = function(v102) --[[ Line: 345 ]] --[[ Name: navigateDown ]]
            -- upvalues: v94 (copy), v4 (ref)
            return v94(v4(v102));
        end, 
        navigateDownToRobuxUpsell = function(v103, v104, v105, v106, v107, v108) --[[ Line: 348 ]] --[[ Name: navigateDownToRobuxUpsell ]]
            -- upvalues: v94 (copy), v17 (ref), v18 (ref)
            return v94(v17(v18.UADeveloperProduct, v103, v104, v105, v106, v107, v108));
        end, 
        purchaseDeveloperProduct = function(v109, v110, v111, v112, v113) --[[ Line: 368 ]] --[[ Name: purchaseDeveloperProduct ]]
            -- upvalues: v94 (copy), v20 (ref)
            return v94(v20.Post(v109, v110, v111, v112, v113));
        end, 
        fetchGameDeveloperProducts = function(v114, v115, v116, v117) --[[ Line: 385 ]] --[[ Name: fetchGameDeveloperProducts ]]
            -- upvalues: v94 (copy), v21 (ref)
            return v94(v21(v114, v115, v116, v117));
        end, 
        economicRestrictionErrorHandler = function(v118) --[[ Line: 388 ]] --[[ Name: economicRestrictionErrorHandler ]]
            -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v94 (copy), v28 (ref)
            local v119 = l_parseEconomicRestrictionsFailureReason_0(v118);
            local v120 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v118);
            l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
                surface = l_EconomicRestrictionsSurface_0.DeveloperProduct, 
                failureReason = v119
            });
            return v94(v28(v119, v120));
        end, 
        fetchExperienceStoreProducts = function(v121, v122) --[[ Line: 397 ]] --[[ Name: fetchExperienceStoreProducts ]]
            -- upvalues: v94 (copy), v27 (ref)
            return v94(v27(v121, v122));
        end
    };
end)(v51);
return (l_RoactServices_0.connect({
    networking = v7
})(v51));