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
local l_FFlagAXAddLookTypeEnumForLogging_0 = v24.FFlagAXAddLookTypeEnumForLogging;
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local v31 = {
    HttpError = Enum.HttpError.OK
};
local v32 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Failure = "Failure", 
    PartialSuccess = "PartialSuccess"
};
local v33 = {
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
local function _(v34, v35) --[[ Line: 94 ]] --[[ Name: updateRobux ]]
    -- upvalues: v5 (copy), v19 (copy)
    local l_LocalUserId_0 = v35:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v35:dispatch(v19(v34, l_LocalUserId_0, true));
    end;
end;
local function v46(v38, v39, v40, v41, v42, v43) --[[ Line: 102 ]]
    -- upvalues: v33 (copy)
    for v44, v45 in v39 do
        if v45 == v33.Success or v45 == v33.AlreadyOwned then
            v41 = v41 + 1;
            v38:dispatch(v40(v44, true));
            if v45 == v33.Success then
                table.insert(v43, (tonumber(v44)));
            end;
        else
            v42 = v42 + 1;
        end;
    end;
    return v41, v42, v43;
end;
local function _(v47) --[[ Line: 128 ]] --[[ Name: isPlayerPremium ]]
    local l_LocalUserId_1 = v47.LocalUserId;
    return (if v47.Users[l_LocalUserId_1] then v47.Users[l_LocalUserId_1].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
end;
local function _(v50, v51) --[[ Line: 139 ]] --[[ Name: getLookTypeForLookId ]]
    local v52 = v50:getState().AvatarExperience.AvatarScene.Looks[v51];
    if v52 then
        return v52.lookType;
    else
        return nil;
    end;
end;
local function v75(v54, v55) --[[ Line: 151 ]] --[[ Name: getPurchaseInfoForLookId ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
    local v56 = false;
    local v57 = false;
    local v58 = v54:getState();
    local v59 = {};
    local v60 = {};
    local v61 = {};
    local v62 = nil;
    if l_FFlagAXDurablesSupport_0 then
        v62 = {};
    end;
    local v63 = 0;
    local l_LocalUserId_2 = v58.LocalUserId;
    local v65 = (if v58.Users[l_LocalUserId_2] then v58.Users[l_LocalUserId_2].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
    l_LocalUserId_2 = v58.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v66 = v58.AvatarExperience.AvatarScene.Looks[v55];
    if l_LocalUserId_2 == nil or v66 == nil then
        return v63, v59, v61;
    else
        for _, v68 in l_LocalUserId_2 do
            local v69 = v66.lookAssetInfos[tostring(v68.itemId)];
            local v70 = v66.lookBundleInfos[tostring(v68.itemId)];
            assert(v69 or v70, "itemInfo should not be nil");
            local v71 = v69 or v70;
            if v68.itemId ~= tostring(v12.BlockyBundleId) then
                if not v68.selectedInTryOnManager or not v71.isPurchasable or v71.quantityOwned > 0 then
                    if v68.itemType == v12.ItemType.Bundle then
                        table.insert(v60, v68.itemId);
                    elseif v68.itemType == v12.ItemType.Asset then
                        table.insert(v59, v68.itemId);
                    end;
                else
                    local v72 = nil;
                    local v73 = v54:getState().AvatarExperience.AvatarScene.Looks[v55];
                    if (if v73 then v73.lookType else nil) ~= v12.LookType.Avatar then
                        if l_FFlagAXCatalogMakeupSupport_0 then
                            v73 = v54:getState().AvatarExperience.AvatarScene.Looks[v55];
                            v57 = (if v73 then v73.lookType else nil) == v12.LookType.Makeup;
                        end;
                        if not v57 then
                            v72 = if v65 then v69.premiumPriceInRobux else v69.priceInRobux;
                            v56 = true;
                        end;
                    end;
                    if v57 or not v56 then
                        v57 = false;
                        v72 = v71.priceInRobux;
                    end;
                    v56 = false;
                    if l_FFlagAXDurablesSupport_0 and v68.selectedTimedOptionIndex and v71.timedOptions then
                        local v74 = v71.timedOptions[v68.selectedTimedOptionIndex];
                        if v74 and v74.days then
                            table.insert(v62, {
                                itemType = v68.itemType, 
                                itemId = v68.itemId, 
                                days = v74.days
                            });
                            v72 = v74.price;
                        end;
                    end;
                    v63 = v63 + v72;
                    table.insert(v61, (tonumber(v68.itemId)));
                end;
            end;
        end;
        if l_FFlagAXDurablesSupport_0 then
            return v63, v59, v60, v61, v62;
        else
            return v63, v59, v60, v61;
        end;
    end;
end;
local function _(v76) --[[ Line: 232 ]] --[[ Name: purchaseProductKeyMapper ]]
    -- upvalues: v7 (copy)
    return v7.PurchaseProductKey .. v76;
end;
return function(v78, v79, v80, v81) --[[ Line: 240 ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), l_FFlagAXDurablesSupport_0 (copy), v75 (copy), l_HttpService_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), v3 (copy), v12 (copy), v13 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v8 (copy), v32 (copy), v20 (copy), l_isEconomicRestrictionResponse_0 (copy), v4 (copy), v46 (copy), v9 (copy), v10 (copy), v33 (copy), v5 (copy), v19 (copy), v17 (copy), l_AvatarScreenProperties_0 (copy), v22 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v21 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v11 (copy), v31 (copy)
    return l_PerformFetch_0.Single(v7.PurchaseProductKey .. v79, function(v82) --[[ Line: 241 ]]
        -- upvalues: l_FFlagAXDurablesSupport_0 (ref), v75 (ref), v79 (copy), l_HttpService_0 (ref), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), v3 (ref), v80 (copy), v12 (ref), v81 (copy), v13 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v8 (ref), v78 (copy), v32 (ref), v20 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v46 (ref), v9 (ref), v10 (ref), v33 (ref), v5 (ref), v19 (ref), v17 (ref), l_AvatarScreenProperties_0 (ref), v22 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v21 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v11 (ref), v31 (ref)
        local v83 = false;
        local v84 = false;
        local v85 = nil;
        local v86 = {};
        local v87 = {};
        local v88 = {};
        local v89 = nil;
        if l_FFlagAXDurablesSupport_0 then
            v89 = {};
            local v90, v91, v92, v93, v94 = v75(v82, v79);
            v85 = v90;
            v86 = v91;
            v87 = v92;
            v88 = v93;
            v89 = v94;
        else
            local v95, v96, v97, v98 = v75(v82, v79);
            v85 = v95;
            v86 = v96;
            v87 = v97;
            v88 = v98;
        end;
        local v99 = l_HttpService_0:GenerateGUID(false);
        local v100 = nil;
        local v101 = if l_FFlagAXAddLookTypeEnumForLogging_0 then v82:getState().AvatarExperience.Common.Widgets.HydratedWidgetData else nil;
        local l_LookAnalyticsInfo_0 = v82:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
        v100 = if l_LookAnalyticsInfo_0 then v3.Dictionary.join(l_LookAnalyticsInfo_0, {
            totalRobux = v80, 
            assetIds = v88, 
            lookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v101 and v101[v12.ItemType.Look] and v101[v12.ItemType.Look][v79] then v101[v12.ItemType.Look][v79].lookType else nil
        }) else nil;
        if v100 and #v88 > 0 then
            v81.widgetInteractionV2(v100, v13.ActionType.PURCHASE_ATTEMPT);
        end;
        local v103 = nil;
        local l_v79_0 = v79;
        local v105 = v82:getState().AvatarExperience.AvatarScene.Looks[l_v79_0];
        if (if v105 then v105.lookType else nil) ~= v12.LookType.Avatar then
            if l_FFlagAXCatalogMakeupSupport_0 then
                l_v79_0 = v79;
                v105 = v82:getState().AvatarExperience.AvatarScene.Looks[l_v79_0];
                v84 = (if v105 then v105.lookType else nil) == v12.LookType.Makeup;
            end;
            if not v84 then
                v103 = v8.PurchaseLook(v78, v79, v99, v80, 0, v86);
                v83 = true;
            end;
        end;
        if v84 or not v83 then
            v84 = false;
            v103 = v8.PurchaseLookV2(v78, v79, v99, v80, 0, v86, v87, if l_FFlagAXDurablesSupport_0 and #v89 > 0 then v89 else nil);
        end;
        v83 = false;
        return v103:andThen(function(v106) --[[ Line: 311 ]]
            -- upvalues: v32 (ref), v20 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v82 (copy), v79 (ref), v12 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v46 (ref), v9 (ref), v10 (ref), v33 (ref), v78 (ref), v5 (ref), v19 (ref), v100 (ref), v17 (ref), l_AvatarScreenProperties_0 (ref), v22 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v21 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), v80 (ref), v81 (ref), v13 (ref), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v8 (ref), v11 (ref), v31 (ref)
            local v107 = false;
            local v108 = false;
            local l_responseBody_0 = v106.responseBody;
            local v110 = true;
            if l_responseBody_0.purchaseLookStatus ~= v32.Success then
                v110 = v20 and l_responseBody_0.purchaseLookStatus == v32.PartialSuccess;
            end;
            if l_isEconomicRestrictionResponse_0(l_responseBody_0) then
                return v4.reject(l_responseBody_0);
            elseif v110 and type(l_responseBody_0) == "table" then
                local l_l_responseBody_0_0 = l_responseBody_0;
                local v112 = 0;
                local v113 = 0;
                local v114 = {};
                local v115 = {};
                local l_v82_0 = v82;
                local l_v79_1 = v79;
                local v118 = l_v82_0:getState().AvatarExperience.AvatarScene.Looks[l_v79_1];
                local v119;
                if (if v118 then v118.lookType else nil) ~= v12.LookType.Avatar then
                    if l_FFlagAXCatalogMakeupSupport_0 then
                        l_v82_0 = v82;
                        l_v79_1 = v79;
                        v118 = l_v82_0:getState().AvatarExperience.AvatarScene.Looks[l_v79_1];
                        v108 = (if v118 then v118.lookType else nil) == v12.LookType.Makeup;
                    end;
                    if not v108 then
                        for v120, v121 in l_l_responseBody_0_0.itemPurchaseStatus do
                            if v121 == v33.Success or v121 == v33.AlreadyOwned then
                                v112 = v112 + 1;
                                v82:dispatch(v9(v120, true));
                                if v121 == v33.Success then
                                    table.insert(v114, (tonumber(v120)));
                                end;
                            else
                                v113 = v113 + 1;
                            end;
                        end;
                        v107 = true;
                    end;
                end;
                if v108 or not v107 then
                    v108 = false;
                    v119, l_v82_0, l_v79_1 = v46(v82, l_l_responseBody_0_0.assetPurchaseStatus, v9, v112, v113, v114);
                    v112 = v119;
                    v113 = l_v82_0;
                    v114 = l_v79_1;
                    v119, l_v82_0, l_v79_1 = v46(v82, l_l_responseBody_0_0.bundlePurchaseStatus, v10, v112, v113, v115);
                    v112 = v119;
                    v113 = l_v82_0;
                    v115 = l_v79_1;
                end;
                v107 = false;
                v119 = v78;
                l_v82_0 = v82;
                l_v79_1 = l_v82_0:getState().LocalUserId;
                v5.isNonEmptyString(l_v79_1, "Thunk.PurchaseProduct.updateRobux.localUserId");
                if typeof(l_v79_1) == "string" and l_v79_1 ~= "" then
                    l_v82_0:dispatch(v19(v119, l_v79_1, true));
                end;
                v119 = nil;
                l_v82_0 = nil;
                l_v79_1 = nil;
                local v122 = nil;
                v118 = nil;
                local v123 = v82:getState();
                if v100 then
                    v119 = v100.query;
                else
                    local v124, v125, v126, v127, v128 = v17.getAvatarsTabAnalyticsInfo(v123);
                    v119 = v124;
                    l_v82_0 = v125;
                    l_v79_1 = v126;
                    v122 = v127;
                    v118 = v128;
                end;
                pcall(function() --[[ Line: 382 ]]
                    -- upvalues: v82 (ref), l_AvatarScreenProperties_0 (ref), v22 (ref), v100 (ref), v114 (ref), v115 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v21 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), v119 (ref), v80 (ref)
                    local v129 = v82:getState().Navigation and v82:getState().Navigation.currentRoute;
                    local v130 = nil;
                    local v131 = nil;
                    if v129 and v129.params and v129.params.fromAvatarRoute then
                        v131 = v129.params.fromAvatarRoute.opaque.name;
                    elseif v129.params and v129.params.extraProps then
                        v131 = v129.params.extraProps.routeName;
                    end;
                    v130 = l_AvatarScreenProperties_0[v131];
                    local v132 = if v22 then v100 == nil else nil;
                    local v133 = nil;
                    local v134 = nil;
                    if v22 and #v114 > 0 then
                        v133 = table.concat(v114, ",");
                    end;
                    if v22 and #v115 > 0 then
                        v134 = table.concat(v115, ",");
                    end;
                    local v135 = nil;
                    v135 = if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then (if v21 then if v100 then v100.surface else nil else v100.surface) or v130 and v130.analyticsData and v130.analyticsData.unifiedLoggingSurface else if v130 and v130.analyticsData then v130.analyticsData.unifiedLoggingSurface else nil;
                    l_sendUnifiedEventForDeferredAction_0(v3.Dictionary.join(v82:getState().AvatarExperience.AnalyticsMetadata, {
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                        keyword = v119, 
                        surface = v135, 
                        organicAssetIds = if v22 and v132 then v133 else nil, 
                        organicBundleIds = if v22 and v132 then v134 else nil, 
                        organicItemPrice = if v22 and v132 then v80 else nil, 
                        assetIds = if not v22 or v132 then nil else v133, 
                        bundleIds = if not v22 or v132 then nil else v134, 
                        widgetItemPrice = if not v22 or v132 then nil else v80
                    }));
                end);
                l_l_responseBody_0_0 = v3.Dictionary.join(l_l_responseBody_0_0, {
                    successCount = v112, 
                    failureCount = v113
                });
                if v100 then
                    v100 = v3.Dictionary.join(v100, {
                        assetIds = v114
                    });
                    if #v114 > 0 or #v115 > 0 then
                        v81.widgetInteractionV2(v100, v13.ActionType.PURCHASE_SUCCESS);
                    end;
                elseif not v100 then
                    v81.avatarShopBuyItem(v79, l_ItemTypeEnum_0.Look, v80, v118, v122, v119, l_v82_0, l_v79_1, v82:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v82:getState().Navigation then v82:getState().Navigation.getParam(v12.NavigationParams.fromSurface) else nil);
                end;
                if #v114 > 0 or #v115 > 0 then
                    v8.GetLookDetailsV2(v78, v79):andThen(function(v136) --[[ Line: 476 ]]
                        -- upvalues: v82 (ref), v11 (ref), v79 (ref), v114 (ref), v115 (ref)
                        local l_look_0 = v136.responseBody.look;
                        if l_look_0 then
                            local v138 = true;
                            for _, v140 in l_look_0.items do
                                if not v140.quantityOwned or v140.quantityOwned == 0 then
                                    v138 = false;
                                    break;
                                end;
                            end;
                            v82:dispatch(v11(v79, v114, v115, v138));
                        end;
                    end);
                end;
                return v4.resolve(l_l_responseBody_0_0);
            else
                local l_v31_0 = v31;
                return v4.reject(l_v31_0);
            end;
        end, function(v142) --[[ Line: 503 ]]
            -- upvalues: v31 (ref), v4 (ref)
            if type(v142) ~= "table" or v142.HttpError == nil then
                v142 = v31;
            end;
            return v4.reject(v142);
        end);
    end);
end;