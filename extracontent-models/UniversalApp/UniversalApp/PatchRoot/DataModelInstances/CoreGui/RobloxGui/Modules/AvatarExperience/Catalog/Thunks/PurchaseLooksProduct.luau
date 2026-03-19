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
local v13 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v17 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v19 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v20 = game:DefineFastFlag("EnablePartialPurchaseForLooksSupport", false);
local v21 = game:DefineFastFlag("AXAnalyticsInfoCheck", false);
local v22 = game:DefineFastFlag("AXUnifiedSubsetOfLook", false);
local v23 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDurablesSupport_0 = v24.FFlagAXDurablesSupport;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v23.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 = v23.FFlagAXAvatarSortInDiscoveryUnifiedPurchase;
local l_FFlagAXCatalogMakeupSupport_0 = v24.FFlagAXCatalogMakeupSupport;
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local v30 = {
    HttpError = Enum.HttpError.OK
};
local v31 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Failure = "Failure", 
    PartialSuccess = "PartialSuccess"
};
local v32 = {
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
local function _(v33, v34) --[[ Line: 93 ]] --[[ Name: updateRobux ]]
    -- upvalues: v5 (copy), v19 (copy)
    local l_LocalUserId_0 = v34:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v34:dispatch(v19(v33, l_LocalUserId_0, true));
    end;
end;
local function v45(v37, v38, v39, v40, v41, v42) --[[ Line: 101 ]]
    -- upvalues: v32 (copy)
    for v43, v44 in v38 do
        if v44 == v32.Success or v44 == v32.AlreadyOwned then
            v40 = v40 + 1;
            v37:dispatch(v39(v43, true));
            if v44 == v32.Success then
                table.insert(v42, (tonumber(v43)));
            end;
        else
            v41 = v41 + 1;
        end;
    end;
    return v40, v41, v42;
end;
local function _(v46) --[[ Line: 127 ]] --[[ Name: isPlayerPremium ]]
    local l_LocalUserId_1 = v46.LocalUserId;
    return (if v46.Users[l_LocalUserId_1] then v46.Users[l_LocalUserId_1].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
end;
local function _(v49, v50) --[[ Line: 138 ]] --[[ Name: getLookTypeForLookId ]]
    local v51 = v49:getState().AvatarExperience.AvatarScene.Looks[v50];
    if v51 then
        return v51.lookType;
    else
        return nil;
    end;
end;
local function v74(v53, v54) --[[ Line: 150 ]] --[[ Name: getPurchaseInfoForLookId ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
    local v55 = false;
    local v56 = false;
    local v57 = v53:getState();
    local v58 = {};
    local v59 = {};
    local v60 = {};
    local v61 = nil;
    if l_FFlagAXDurablesSupport_0 then
        v61 = {};
    end;
    local v62 = 0;
    local l_LocalUserId_2 = v57.LocalUserId;
    local v64 = (if v57.Users[l_LocalUserId_2] then v57.Users[l_LocalUserId_2].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
    l_LocalUserId_2 = v57.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v65 = v57.AvatarExperience.AvatarScene.Looks[v54];
    if l_LocalUserId_2 == nil or v65 == nil then
        return v62, v58, v60;
    else
        for _, v67 in l_LocalUserId_2 do
            local v68 = v65.lookAssetInfos[tostring(v67.itemId)];
            local v69 = v65.lookBundleInfos[tostring(v67.itemId)];
            assert(v68 or v69, "itemInfo should not be nil");
            local v70 = v68 or v69;
            if v67.itemId ~= tostring(v12.BlockyBundleId) then
                if not v67.selectedInTryOnManager or not v70.isPurchasable or v70.quantityOwned > 0 then
                    if v67.itemType == v12.ItemType.Bundle then
                        table.insert(v59, v67.itemId);
                    elseif v67.itemType == v12.ItemType.Asset then
                        table.insert(v58, v67.itemId);
                    end;
                else
                    local v71 = nil;
                    local v72 = v53:getState().AvatarExperience.AvatarScene.Looks[v54];
                    if (if v72 then v72.lookType else nil) ~= v12.LookType.Avatar then
                        if l_FFlagAXCatalogMakeupSupport_0 then
                            v72 = v53:getState().AvatarExperience.AvatarScene.Looks[v54];
                            v56 = (if v72 then v72.lookType else nil) == v12.LookType.Makeup;
                        end;
                        if not v56 then
                            v71 = if v64 then v68.premiumPriceInRobux else v68.priceInRobux;
                            v55 = true;
                        end;
                    end;
                    if v56 or not v55 then
                        v56 = false;
                        v71 = v70.priceInRobux;
                    end;
                    v55 = false;
                    if l_FFlagAXDurablesSupport_0 and v67.selectedTimedOptionIndex and v70.timedOptions then
                        local v73 = v70.timedOptions[v67.selectedTimedOptionIndex];
                        if v73 and v73.days then
                            table.insert(v61, {
                                itemType = v67.itemType, 
                                itemId = v67.itemId, 
                                days = v73.days
                            });
                            v71 = v73.price;
                        end;
                    end;
                    v62 = v62 + v71;
                    table.insert(v60, (tonumber(v67.itemId)));
                end;
            end;
        end;
        if l_FFlagAXDurablesSupport_0 then
            return v62, v58, v59, v60, v61;
        else
            return v62, v58, v59, v60;
        end;
    end;
end;
local function _(v75) --[[ Line: 231 ]] --[[ Name: purchaseProductKeyMapper ]]
    -- upvalues: v7 (copy)
    return v7.PurchaseProductKey .. v75;
end;
return function(v77, v78, v79, v80) --[[ Line: 239 ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), l_FFlagAXDurablesSupport_0 (copy), v74 (copy), l_HttpService_0 (copy), v3 (copy), v13 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v8 (copy), v31 (copy), v20 (copy), l_isEconomicRestrictionResponse_0 (copy), v4 (copy), v45 (copy), v9 (copy), v10 (copy), v32 (copy), v5 (copy), v19 (copy), v17 (copy), l_AvatarScreenProperties_0 (copy), v22 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v21 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v11 (copy), v30 (copy)
    return l_PerformFetch_0.Single(v7.PurchaseProductKey .. v78, function(v81) --[[ Line: 240 ]]
        -- upvalues: l_FFlagAXDurablesSupport_0 (ref), v74 (ref), v78 (copy), l_HttpService_0 (ref), v3 (ref), v79 (copy), v80 (copy), v13 (ref), v12 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v8 (ref), v77 (copy), v31 (ref), v20 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v45 (ref), v9 (ref), v10 (ref), v32 (ref), v5 (ref), v19 (ref), v17 (ref), l_AvatarScreenProperties_0 (ref), v22 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v21 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v11 (ref), v30 (ref)
        local v82 = false;
        local v83 = false;
        local v84 = nil;
        local v85 = {};
        local v86 = {};
        local v87 = {};
        local v88 = nil;
        if l_FFlagAXDurablesSupport_0 then
            v88 = {};
            local v89, v90, v91, v92, v93 = v74(v81, v78);
            v84 = v89;
            v85 = v90;
            v86 = v91;
            v87 = v92;
            v88 = v93;
        else
            local v94, v95, v96, v97 = v74(v81, v78);
            v84 = v94;
            v85 = v95;
            v86 = v96;
            v87 = v97;
        end;
        local v98 = l_HttpService_0:GenerateGUID(false);
        local v99 = nil;
        local l_LookAnalyticsInfo_0 = v81:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
        v99 = if l_LookAnalyticsInfo_0 then v3.Dictionary.join(l_LookAnalyticsInfo_0, {
            totalRobux = v79, 
            assetIds = v87
        }) else nil;
        if v99 and #v87 > 0 then
            v80.widgetInteractionV2(v99, v13.ActionType.PURCHASE_ATTEMPT);
        end;
        local v101 = nil;
        local l_v78_0 = v78;
        local v103 = v81:getState().AvatarExperience.AvatarScene.Looks[l_v78_0];
        if (if v103 then v103.lookType else nil) ~= v12.LookType.Avatar then
            if l_FFlagAXCatalogMakeupSupport_0 then
                l_v78_0 = v78;
                v103 = v81:getState().AvatarExperience.AvatarScene.Looks[l_v78_0];
                v83 = (if v103 then v103.lookType else nil) == v12.LookType.Makeup;
            end;
            if not v83 then
                v101 = v8.PurchaseLook(v77, v78, v98, v79, 0, v85);
                v82 = true;
            end;
        end;
        if v83 or not v82 then
            v83 = false;
            v101 = v8.PurchaseLookV2(v77, v78, v98, v79, 0, v85, v86, if l_FFlagAXDurablesSupport_0 and #v88 > 0 then v88 else nil);
        end;
        v82 = false;
        return v101:andThen(function(v104) --[[ Line: 298 ]]
            -- upvalues: v31 (ref), v20 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v81 (copy), v78 (ref), v12 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v45 (ref), v9 (ref), v10 (ref), v32 (ref), v77 (ref), v5 (ref), v19 (ref), v99 (ref), v17 (ref), l_AvatarScreenProperties_0 (ref), v22 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v21 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), v79 (ref), v80 (ref), v13 (ref), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v8 (ref), v11 (ref), v30 (ref)
            local v105 = false;
            local v106 = false;
            local l_responseBody_0 = v104.responseBody;
            local v108 = true;
            if l_responseBody_0.purchaseLookStatus ~= v31.Success then
                v108 = v20 and l_responseBody_0.purchaseLookStatus == v31.PartialSuccess;
            end;
            if l_isEconomicRestrictionResponse_0(l_responseBody_0) then
                return v4.reject(l_responseBody_0);
            elseif v108 and type(l_responseBody_0) == "table" then
                local l_l_responseBody_0_0 = l_responseBody_0;
                local v110 = 0;
                local v111 = 0;
                local v112 = {};
                local v113 = {};
                local l_v81_0 = v81;
                local l_v78_1 = v78;
                local v116 = l_v81_0:getState().AvatarExperience.AvatarScene.Looks[l_v78_1];
                local v117;
                if (if v116 then v116.lookType else nil) ~= v12.LookType.Avatar then
                    if l_FFlagAXCatalogMakeupSupport_0 then
                        l_v81_0 = v81;
                        l_v78_1 = v78;
                        v116 = l_v81_0:getState().AvatarExperience.AvatarScene.Looks[l_v78_1];
                        v106 = (if v116 then v116.lookType else nil) == v12.LookType.Makeup;
                    end;
                    if not v106 then
                        for v118, v119 in l_l_responseBody_0_0.itemPurchaseStatus do
                            if v119 == v32.Success or v119 == v32.AlreadyOwned then
                                v110 = v110 + 1;
                                v81:dispatch(v9(v118, true));
                                if v119 == v32.Success then
                                    table.insert(v112, (tonumber(v118)));
                                end;
                            else
                                v111 = v111 + 1;
                            end;
                        end;
                        v105 = true;
                    end;
                end;
                if v106 or not v105 then
                    v106 = false;
                    v117, l_v81_0, l_v78_1 = v45(v81, l_l_responseBody_0_0.assetPurchaseStatus, v9, v110, v111, v112);
                    v110 = v117;
                    v111 = l_v81_0;
                    v112 = l_v78_1;
                    v117, l_v81_0, l_v78_1 = v45(v81, l_l_responseBody_0_0.bundlePurchaseStatus, v10, v110, v111, v113);
                    v110 = v117;
                    v111 = l_v81_0;
                    v113 = l_v78_1;
                end;
                v105 = false;
                v117 = v77;
                l_v81_0 = v81;
                l_v78_1 = l_v81_0:getState().LocalUserId;
                v5.isNonEmptyString(l_v78_1, "Thunk.PurchaseProduct.updateRobux.localUserId");
                if typeof(l_v78_1) == "string" and l_v78_1 ~= "" then
                    l_v81_0:dispatch(v19(v117, l_v78_1, true));
                end;
                v117 = nil;
                l_v81_0 = nil;
                l_v78_1 = nil;
                local v120 = nil;
                v116 = nil;
                local v121 = v81:getState();
                if v99 then
                    v117 = v99.query;
                else
                    local v122, v123, v124, v125, v126 = v17.getAvatarsTabAnalyticsInfo(v121);
                    v117 = v122;
                    l_v81_0 = v123;
                    l_v78_1 = v124;
                    v120 = v125;
                    v116 = v126;
                end;
                pcall(function() --[[ Line: 369 ]]
                    -- upvalues: v81 (ref), l_AvatarScreenProperties_0 (ref), v22 (ref), v99 (ref), v112 (ref), v113 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v21 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), v117 (ref), v79 (ref)
                    local v127 = v81:getState().Navigation and v81:getState().Navigation.currentRoute;
                    local v128 = nil;
                    local v129 = nil;
                    if v127 and v127.params and v127.params.fromAvatarRoute then
                        v129 = v127.params.fromAvatarRoute.opaque.name;
                    elseif v127.params and v127.params.extraProps then
                        v129 = v127.params.extraProps.routeName;
                    end;
                    v128 = l_AvatarScreenProperties_0[v129];
                    local v130 = if v22 then v99 == nil else nil;
                    local v131 = nil;
                    local v132 = nil;
                    if v22 and #v112 > 0 then
                        v131 = table.concat(v112, ",");
                    end;
                    if v22 and #v113 > 0 then
                        v132 = table.concat(v113, ",");
                    end;
                    local v133 = nil;
                    v133 = if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then (if v21 then if v99 then v99.surface else nil else v99.surface) or v128 and v128.analyticsData and v128.analyticsData.unifiedLoggingSurface else if v128 and v128.analyticsData then v128.analyticsData.unifiedLoggingSurface else nil;
                    l_sendUnifiedEventForDeferredAction_0(v3.Dictionary.join(v81:getState().AvatarExperience.AnalyticsMetadata, {
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                        keyword = v117, 
                        surface = v133, 
                        organicAssetIds = if v22 and v130 then v131 else nil, 
                        organicBundleIds = if v22 and v130 then v132 else nil, 
                        organicItemPrice = if v22 and v130 then v79 else nil, 
                        assetIds = if not v22 or v130 then nil else v131, 
                        bundleIds = if not v22 or v130 then nil else v132, 
                        widgetItemPrice = if not v22 or v130 then nil else v79
                    }));
                end);
                l_l_responseBody_0_0 = v3.Dictionary.join(l_l_responseBody_0_0, {
                    successCount = v110, 
                    failureCount = v111
                });
                if v99 then
                    v99 = v3.Dictionary.join(v99, {
                        assetIds = v112
                    });
                    if #v112 > 0 or #v113 > 0 then
                        v80.widgetInteractionV2(v99, v13.ActionType.PURCHASE_SUCCESS);
                    end;
                elseif not v99 then
                    v80.avatarShopBuyItem(v78, l_ItemTypeEnum_0.Look, v79, v116, v120, v117, l_v81_0, l_v78_1, v81:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v81:getState().Navigation then v81:getState().Navigation.getParam(v12.NavigationParams.fromSurface) else nil);
                end;
                if #v112 > 0 or #v113 > 0 then
                    v8.GetLookDetailsV2(v77, v78):andThen(function(v134) --[[ Line: 463 ]]
                        -- upvalues: v81 (ref), v11 (ref), v78 (ref), v112 (ref), v113 (ref)
                        local l_look_0 = v134.responseBody.look;
                        if l_look_0 then
                            local v136 = true;
                            for _, v138 in l_look_0.items do
                                if not v138.quantityOwned or v138.quantityOwned == 0 then
                                    v136 = false;
                                    break;
                                end;
                            end;
                            v81:dispatch(v11(v78, v112, v113, v136));
                        end;
                    end);
                end;
                return v4.resolve(l_l_responseBody_0_0);
            else
                local l_v30_0 = v30;
                return v4.reject(l_v30_0);
            end;
        end, function(v140) --[[ Line: 490 ]]
            -- upvalues: v30 (ref), v4 (ref)
            if type(v140) ~= "table" or v140.HttpError == nil then
                v140 = v30;
            end;
            return v4.reject(v140);
        end);
    end);
end;