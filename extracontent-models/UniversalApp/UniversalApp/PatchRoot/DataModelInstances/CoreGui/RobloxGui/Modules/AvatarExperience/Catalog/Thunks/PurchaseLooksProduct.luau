local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v7 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v8 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v9 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v10 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v11 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_WidgetConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog).WidgetConstants;
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v14.UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = v14.sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v18 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
local v21 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v22 = game:DefineFastFlag("EnablePartialPurchaseForLooksSupport", false);
local v23 = game:DefineFastFlag("AXAnalyticsInfoCheck", false);
local v24 = game:DefineFastFlag("AXUnifiedSubsetOfLook", false);
local v25 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_CartIdService_0 = v14.Lib.CartIdService;
local l_UnifiedSelectionListStore_0 = v14.Store.UnifiedSelectionListStore;
local v28 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v25.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 = v25.FFlagAXAvatarSortInDiscoveryUnifiedPurchase;
local l_FFlagAXCatalogMakeupSupport_0 = v28.FFlagAXCatalogMakeupSupport;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v28.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v28.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 = v28.FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess;
local l_FFlagUseNavigationSelectors_0 = v25.FFlagUseNavigationSelectors;
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local v37 = {
    HttpError = Enum.HttpError.OK
};
local v38 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Failure = "Failure", 
    PartialSuccess = "PartialSuccess"
};
local v39 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Throttled = "Throttled", 
    ExceptionOccured = "ExceptionOccured", 
    ExpectedPriceIncreased = "ExpectedPriceIncreased", 
    TwoStepVerificationRequired = "TwoStepVerificationRequired", 
    AlreadyOwned = "AlreadyOwned", 
    InsufficientFunds = "InsufficientFunds", 
    InsufficientMembership = "InsufficientMembership", 
    NotForSale = "NotForSale", 
    PriceChanged = "PriceChanged", 
    NotAttempted = "NotAttempted", 
    SaleExpired = "SaleExpired", 
    SupplyExausted = "SupplyExausted", 
    ContentRatingRestricted = "ContentRatingRestricted", 
    UnknownBirthday = "UnknownBirthday", 
    AffiliateSalesDisabled = "AffiliateSalesDisabled", 
    BadAffiliateSaleProduct = "BadAffiliateSaleProduct", 
    IOSOnlyItem = "IOSOnlyItem", 
    InvalidArguments = "InvalidArguments", 
    Unauthorized = "Unauthorized", 
    AccountRestrictionsRestricted = "AccountRestrictionsRestricted", 
    PendingTransactionAlreadyExists = "PendingTransactionAlreadyExists", 
    SaleUnavailableAtSaleLocation = "SaleUnavailableAtSaleLocation", 
    UnexpectedSeller = "UnexpectedSeller", 
    EconomyDisabled = "EconomyDisabled"
};
local function _(v40, v41) --[[ Line: 102 ]] --[[ Name: updateRobux ]]
    -- upvalues: v5 (copy), v21 (copy)
    local l_LocalUserId_0 = v41:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v41:dispatch(v21(v40, l_LocalUserId_0, true));
    end;
end;
local function v52(v44, v45, v46, v47, v48, v49) --[[ Line: 110 ]]
    -- upvalues: v39 (copy)
    for v50, v51 in v45 do
        if v51 == v39.Success or v51 == v39.AlreadyOwned then
            v47 = v47 + 1;
            v44:dispatch(v46(v50, true));
            if v51 == v39.Success then
                table.insert(v49, (tonumber(v50)));
            end;
        else
            v48 = v48 + 1;
        end;
    end;
    return v47, v48, v49;
end;
local function _(v53) --[[ Line: 136 ]] --[[ Name: isPlayerPremium ]]
    local l_LocalUserId_1 = v53.LocalUserId;
    return (if v53.Users[l_LocalUserId_1] then v53.Users[l_LocalUserId_1].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
end;
local function _(v56, v57) --[[ Line: 147 ]] --[[ Name: getLookTypeForLookId ]]
    local v58 = v56:getState().AvatarExperience.AvatarScene.Looks[v57];
    if v58 then
        return v58.lookType;
    else
        return nil;
    end;
end;
local function v81(v60, v61) --[[ Line: 159 ]] --[[ Name: getPurchaseInfoForLookId ]]
    -- upvalues: v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
    local v62 = false;
    local v63 = false;
    local v64 = v60:getState();
    local v65 = {};
    local v66 = {};
    local v67 = {};
    local v68 = {};
    local v69 = 0;
    local l_LocalUserId_2 = v64.LocalUserId;
    local v71 = (if v64.Users[l_LocalUserId_2] then v64.Users[l_LocalUserId_2].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
    l_LocalUserId_2 = v64.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v72 = v64.AvatarExperience.AvatarScene.Looks[v61];
    if l_LocalUserId_2 == nil or v72 == nil then
        return v69, v65, v67;
    else
        for _, v74 in l_LocalUserId_2 do
            local v75 = v72.lookAssetInfos[tostring(v74.itemId)];
            local v76 = v72.lookBundleInfos[tostring(v74.itemId)];
            assert(v75 or v76, "itemInfo should not be nil");
            local v77 = v75 or v76;
            if v74.itemId ~= tostring(v12.BlockyBundleId) then
                if not v74.selectedInTryOnManager or not v77.isPurchasable or v77.quantityOwned > 0 then
                    if v74.itemType == v12.ItemType.Bundle then
                        table.insert(v66, v74.itemId);
                    elseif v74.itemType == v12.ItemType.Asset then
                        table.insert(v65, v74.itemId);
                    end;
                else
                    local v78 = nil;
                    local v79 = v60:getState().AvatarExperience.AvatarScene.Looks[v61];
                    if (if v79 then v79.lookType else nil) ~= v12.LookType.Avatar then
                        if l_FFlagAXCatalogMakeupSupport_0 then
                            v79 = v60:getState().AvatarExperience.AvatarScene.Looks[v61];
                            v63 = (if v79 then v79.lookType else nil) == v12.LookType.Makeup;
                        end;
                        if not v63 then
                            v78 = if v71 then v75.premiumPriceInRobux else v75.priceInRobux;
                            v62 = true;
                        end;
                    end;
                    if v63 or not v62 then
                        v63 = false;
                        v78 = v77.priceInRobux;
                    end;
                    v62 = false;
                    if v74.selectedTimedOptionIndex and v77.timedOptions then
                        local v80 = v77.timedOptions[v74.selectedTimedOptionIndex];
                        if v80 and v80.days then
                            table.insert(v68, {
                                itemType = v74.itemType, 
                                itemId = v74.itemId, 
                                days = v80.days
                            });
                            v78 = v80.price;
                        end;
                    end;
                    v69 = v69 + v78;
                    table.insert(v67, (tonumber(v74.itemId)));
                end;
            end;
        end;
        return v69, v65, v66, v67, v68;
    end;
end;
local function _(v82) --[[ Line: 233 ]] --[[ Name: purchaseProductKeyMapper ]]
    -- upvalues: v7 (copy)
    return v7.PurchaseProductKey .. v82;
end;
return function(v84, v85, v86, v87) --[[ Line: 241 ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), v81 (copy), l_HttpService_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v12 (copy), v3 (copy), l_WidgetConstants_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v8 (copy), v38 (copy), v22 (copy), l_isEconomicRestrictionResponse_0 (copy), v4 (copy), v52 (copy), v9 (copy), v10 (copy), v39 (copy), v5 (copy), v21 (copy), v18 (copy), l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), l_AvatarScreenProperties_0 (copy), v24 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v23 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_CartIdService_0 (copy), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (copy), l_UnifiedSelectionListStore_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), l_ItemTypeEnum_0 (copy), v11 (copy), v37 (copy)
    return l_PerformFetch_0.Single(v7.PurchaseProductKey .. v85, function(v88) --[[ Line: 242 ]]
        -- upvalues: v81 (ref), v85 (copy), l_HttpService_0 (ref), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v12 (ref), v3 (ref), v86 (copy), v87 (copy), l_WidgetConstants_0 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v8 (ref), v84 (copy), v38 (ref), v22 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v52 (ref), v9 (ref), v10 (ref), v39 (ref), v5 (ref), v21 (ref), v18 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreenProperties_0 (ref), v24 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v23 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_CartIdService_0 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), l_UnifiedSelectionListStore_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ItemTypeEnum_0 (ref), v11 (ref), v37 (ref)
        local v89 = false;
        local v90 = false;
        local v91 = nil;
        local v92 = {};
        local v93 = {};
        local v94 = {};
        local v95 = {};
        local v96, v97, v98, v99, v100 = v81(v88, v85);
        v91 = v96;
        v92 = v97;
        v93 = v98;
        v94 = v99;
        v95 = v100;
        v96 = l_HttpService_0:GenerateGUID(false);
        v97 = nil;
        v98 = if l_FFlagAXAddLookTypeEnumForLogging_0 then v88:getState().AvatarExperience.Common.Widgets.HydratedWidgetData else nil;
        v99 = v88:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and v88:getState().AvatarExperience.AvatarScene.Looks[v85].lookType == v12.LookType.Makeup then
            v99 = v88:getState().AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo;
        end;
        v97 = if v99 then v3.Dictionary.join(v99, {
            totalRobux = v86, 
            assetIds = v94, 
            lookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v98 and v98[v12.ItemType.Look] and v98[v12.ItemType.Look][v85] then v98[v12.ItemType.Look][v85].lookType else nil
        }) else nil;
        if v97 and #v94 > 0 then
            v87.widgetInteractionV2(v97, l_WidgetConstants_0.ActionType.PURCHASE_ATTEMPT);
        end;
        v100 = nil;
        local l_v85_0 = v85;
        local v102 = v88:getState().AvatarExperience.AvatarScene.Looks[l_v85_0];
        if (if v102 then v102.lookType else nil) ~= v12.LookType.Avatar then
            if l_FFlagAXCatalogMakeupSupport_0 then
                l_v85_0 = v85;
                v102 = v88:getState().AvatarExperience.AvatarScene.Looks[l_v85_0];
                v90 = (if v102 then v102.lookType else nil) == v12.LookType.Makeup;
            end;
            if not v90 then
                v100 = v8.PurchaseLook(v84, v85, v96, v86, 0, v92);
                v89 = true;
            end;
        end;
        if v90 or not v89 then
            v90 = false;
            v100 = v8.PurchaseLookV2(v84, v85, v96, v86, 0, v92, v93, if #v95 > 0 then v95 else nil);
        end;
        v89 = false;
        return v100:andThen(function(v103) --[[ Line: 311 ]]
            -- upvalues: v38 (ref), v22 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v88 (copy), v85 (ref), v12 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v52 (ref), v9 (ref), v10 (ref), v39 (ref), v84 (ref), v5 (ref), v21 (ref), v97 (ref), v18 (ref), l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), l_AvatarScreenProperties_0 (ref), v24 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v23 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_CartIdService_0 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), v86 (ref), l_UnifiedSelectionListStore_0 (ref), v87 (ref), l_WidgetConstants_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), l_ItemTypeEnum_0 (ref), v8 (ref), v11 (ref), v37 (ref)
            local v104 = false;
            local v105 = false;
            local l_responseBody_0 = v103.responseBody;
            local v107 = true;
            if l_responseBody_0.purchaseLookStatus ~= v38.Success then
                v107 = v22 and l_responseBody_0.purchaseLookStatus == v38.PartialSuccess;
            end;
            if l_isEconomicRestrictionResponse_0(l_responseBody_0) then
                return v4.reject(l_responseBody_0);
            elseif v107 and type(l_responseBody_0) == "table" then
                local l_l_responseBody_0_0 = l_responseBody_0;
                local v109 = 0;
                local v110 = 0;
                local v111 = {};
                local v112 = {};
                local l_v88_0 = v88;
                local l_v85_1 = v85;
                local v115 = l_v88_0:getState().AvatarExperience.AvatarScene.Looks[l_v85_1];
                local v116;
                if (if v115 then v115.lookType else nil) ~= v12.LookType.Avatar then
                    if l_FFlagAXCatalogMakeupSupport_0 then
                        l_v88_0 = v88;
                        l_v85_1 = v85;
                        v115 = l_v88_0:getState().AvatarExperience.AvatarScene.Looks[l_v85_1];
                        v105 = (if v115 then v115.lookType else nil) == v12.LookType.Makeup;
                    end;
                    if not v105 then
                        for v117, v118 in l_l_responseBody_0_0.itemPurchaseStatus do
                            if v118 == v39.Success or v118 == v39.AlreadyOwned then
                                v109 = v109 + 1;
                                v88:dispatch(v9(v117, true));
                                if v118 == v39.Success then
                                    table.insert(v111, (tonumber(v117)));
                                end;
                            else
                                v110 = v110 + 1;
                            end;
                        end;
                        v104 = true;
                    end;
                end;
                if v105 or not v104 then
                    v105 = false;
                    v116, l_v88_0, l_v85_1 = v52(v88, l_l_responseBody_0_0.assetPurchaseStatus, v9, v109, v110, v111);
                    v109 = v116;
                    v110 = l_v88_0;
                    v111 = l_v85_1;
                    v116, l_v88_0, l_v85_1 = v52(v88, l_l_responseBody_0_0.bundlePurchaseStatus, v10, v109, v110, v112);
                    v109 = v116;
                    v110 = l_v88_0;
                    v112 = l_v85_1;
                end;
                v104 = false;
                v116 = v84;
                l_v88_0 = v88;
                l_v85_1 = l_v88_0:getState().LocalUserId;
                v5.isNonEmptyString(l_v85_1, "Thunk.PurchaseProduct.updateRobux.localUserId");
                if typeof(l_v85_1) == "string" and l_v85_1 ~= "" then
                    l_v88_0:dispatch(v21(v116, l_v85_1, true));
                end;
                v116 = nil;
                l_v88_0 = nil;
                l_v85_1 = nil;
                local v119 = nil;
                v115 = nil;
                local v120 = v88:getState();
                if v97 then
                    v116 = v97.query;
                else
                    local v121, v122, v123, v124, v125 = v18.getAvatarsTabAnalyticsInfo(v120);
                    v116 = v121;
                    l_v88_0 = v122;
                    l_v85_1 = v123;
                    v119 = v124;
                    v115 = v125;
                end;
                pcall(function() --[[ Line: 382 ]]
                    -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v88 (ref), l_AvatarScreenProperties_0 (ref), v24 (ref), v97 (ref), v111 (ref), v112 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v23 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_CartIdService_0 (ref), v85 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), v116 (ref), v86 (ref)
                    local v126 = nil;
                    if l_FFlagUseNavigationSelectors_0 then
                        local v127 = l_Selectors_0.selectCurrentRoactNavigationRoute(v88:getState());
                        if v127.params and v127.params.fromAvatarRoute then
                            v126 = v127.params.fromAvatarRoute.opaque.name;
                        elseif v127.params and v127.params.extraProps then
                            v126 = v127.params.extraProps.routeName;
                        end;
                    else
                        local v128 = v88:getState().Navigation and v88:getState().Navigation.currentRoute;
                        if v128 and v128.params and v128.params.fromAvatarRoute then
                            v126 = v128.params.fromAvatarRoute.opaque.name;
                        elseif v128.params and v128.params.extraProps then
                            v126 = v128.params.extraProps.routeName;
                        end;
                    end;
                    local v129 = l_AvatarScreenProperties_0[v126];
                    local v130 = if v24 then v97 == nil else nil;
                    local v131 = nil;
                    local v132 = nil;
                    if v24 and #v111 > 0 then
                        v131 = table.concat(v111, ",");
                    end;
                    if v24 and #v112 > 0 then
                        v132 = table.concat(v112, ",");
                    end;
                    local v133 = nil;
                    v133 = if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then (if v23 then if v97 then v97.surface else nil else v97.surface) or v129 and v129.analyticsData and v129.analyticsData.unifiedLoggingSurface else if v129 and v129.analyticsData then v129.analyticsData.unifiedLoggingSurface else nil;
                    l_sendUnifiedEventForDeferredAction_0(v3.Dictionary.join(v88:getState().AvatarExperience.AnalyticsMetadata, {
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                        cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
                        itemId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then v85 else nil, 
                        itemType = if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else nil, 
                        keyword = v116, 
                        surface = v133, 
                        organicAssetIds = if v24 and v130 then v131 else nil, 
                        organicBundleIds = if v24 and v130 then v132 else nil, 
                        organicItemPrice = if v24 and v130 then v86 else nil, 
                        assetIds = if not v24 or v130 then nil else v131, 
                        bundleIds = if not v24 or v130 then nil else v132, 
                        widgetItemPrice = if not v24 or v130 then nil else v86
                    }));
                end);
                if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                    l_CartIdService_0.refreshCartId();
                    l_UnifiedSelectionListStore_0.clearSelectionList();
                end;
                l_l_responseBody_0_0 = v3.Dictionary.join(l_l_responseBody_0_0, {
                    successCount = v109, 
                    failureCount = v110
                });
                if v97 then
                    v97 = v3.Dictionary.join(v97, {
                        assetIds = v111
                    });
                    if #v111 > 0 or #v112 > 0 then
                        v87.widgetInteractionV2(v97, l_WidgetConstants_0.ActionType.PURCHASE_SUCCESS);
                    end;
                elseif not v97 then
                    local v134 = nil;
                    if l_FFlagAXFixPurchaseSurfaceLogging_0 then
                        if l_FFlagUseNavigationSelectors_0 then
                            local v135 = l_Selectors_0.selectCurrentRoactNavigationRoute(v88:getState());
                            if v135 and v135.params then
                                v134 = v135.params[v12.NavigationParams.fromSurface];
                            end;
                        elseif v88:getState().Navigation then
                            v134 = v88:getState().Navigation.getParam(v12.NavigationParams.fromSurface);
                        end;
                    end;
                    v87.avatarShopBuyItem(v85, l_ItemTypeEnum_0.Look, v86, v115, v119, v116, l_v88_0, l_v85_1, v88:getState().AvatarExperience.AnalyticsMetadata, v134);
                end;
                if #v111 > 0 or #v112 > 0 then
                    v8.GetLookDetailsV2(v84, v85):andThen(function(v136) --[[ Line: 509 ]]
                        -- upvalues: v88 (ref), v11 (ref), v85 (ref), v111 (ref), v112 (ref)
                        local l_look_0 = v136.responseBody.look;
                        if l_look_0 then
                            local v138 = true;
                            for _, v140 in l_look_0.items do
                                if not v140.quantityOwned or v140.quantityOwned == 0 then
                                    v138 = false;
                                    break;
                                end;
                            end;
                            v88:dispatch(v11(v85, v111, v112, v138));
                        end;
                    end);
                end;
                return v4.resolve(l_l_responseBody_0_0);
            else
                local l_v37_0 = v37;
                return v4.reject(l_v37_0);
            end;
        end, function(v142) --[[ Line: 536 ]]
            -- upvalues: v37 (ref), v4 (ref)
            if type(v142) ~= "table" or v142.HttpError == nil then
                v142 = v37;
            end;
            return v4.reject(v142);
        end);
    end);
end;