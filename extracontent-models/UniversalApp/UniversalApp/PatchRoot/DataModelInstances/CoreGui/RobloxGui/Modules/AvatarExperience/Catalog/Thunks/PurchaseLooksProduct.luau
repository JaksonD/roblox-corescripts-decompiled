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
local v14 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v14.UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = v14.sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v18 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v20 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v21 = game:DefineFastFlag("EnablePartialPurchaseForLooksSupport", false);
local v22 = game:DefineFastFlag("AXAnalyticsInfoCheck", false);
local v23 = game:DefineFastFlag("AXUnifiedSubsetOfLook", false);
local v24 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXDurablesSupport_0 = v25.FFlagAXDurablesSupport;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v24.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 = v24.FFlagAXAvatarSortInDiscoveryUnifiedPurchase;
local l_FFlagAXCatalogMakeupSupport_0 = v25.FFlagAXCatalogMakeupSupport;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v25.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 = v25.FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess;
local l_isEconomicRestrictionResponse_0 = require(l_CorePackages_0.Workspace.Packages.IAPExperience).Utility.isEconomicRestrictionResponse;
local v33 = {
    HttpError = Enum.HttpError.OK
};
local v34 = {
    Unspecified = "Unspecified", 
    Success = "Success", 
    Failure = "Failure", 
    PartialSuccess = "PartialSuccess"
};
local v35 = {
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
local function _(v36, v37) --[[ Line: 96 ]] --[[ Name: updateRobux ]]
    -- upvalues: v5 (copy), v20 (copy)
    local l_LocalUserId_0 = v37:getState().LocalUserId;
    v5.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v37:dispatch(v20(v36, l_LocalUserId_0, true));
    end;
end;
local function v48(v40, v41, v42, v43, v44, v45) --[[ Line: 104 ]]
    -- upvalues: v35 (copy)
    for v46, v47 in v41 do
        if v47 == v35.Success or v47 == v35.AlreadyOwned then
            v43 = v43 + 1;
            v40:dispatch(v42(v46, true));
            if v47 == v35.Success then
                table.insert(v45, (tonumber(v46)));
            end;
        else
            v44 = v44 + 1;
        end;
    end;
    return v43, v44, v45;
end;
local function _(v49) --[[ Line: 130 ]] --[[ Name: isPlayerPremium ]]
    local l_LocalUserId_1 = v49.LocalUserId;
    return (if v49.Users[l_LocalUserId_1] then v49.Users[l_LocalUserId_1].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
end;
local function _(v52, v53) --[[ Line: 141 ]] --[[ Name: getLookTypeForLookId ]]
    local v54 = v52:getState().AvatarExperience.AvatarScene.Looks[v53];
    if v54 then
        return v54.lookType;
    else
        return nil;
    end;
end;
local function v77(v56, v57) --[[ Line: 153 ]] --[[ Name: getPurchaseInfoForLookId ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy)
    local v58 = false;
    local v59 = false;
    local v60 = v56:getState();
    local v61 = {};
    local v62 = {};
    local v63 = {};
    local v64 = nil;
    if l_FFlagAXDurablesSupport_0 then
        v64 = {};
    end;
    local v65 = 0;
    local l_LocalUserId_2 = v60.LocalUserId;
    local v67 = (if v60.Users[l_LocalUserId_2] then v60.Users[l_LocalUserId_2].membership else Enum.MembershipType.None) == Enum.MembershipType.Premium;
    l_LocalUserId_2 = v60.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    local v68 = v60.AvatarExperience.AvatarScene.Looks[v57];
    if l_LocalUserId_2 == nil or v68 == nil then
        return v65, v61, v63;
    else
        for _, v70 in l_LocalUserId_2 do
            local v71 = v68.lookAssetInfos[tostring(v70.itemId)];
            local v72 = v68.lookBundleInfos[tostring(v70.itemId)];
            assert(v71 or v72, "itemInfo should not be nil");
            local v73 = v71 or v72;
            if v70.itemId ~= tostring(v12.BlockyBundleId) then
                if not v70.selectedInTryOnManager or not v73.isPurchasable or v73.quantityOwned > 0 then
                    if v70.itemType == v12.ItemType.Bundle then
                        table.insert(v62, v70.itemId);
                    elseif v70.itemType == v12.ItemType.Asset then
                        table.insert(v61, v70.itemId);
                    end;
                else
                    local v74 = nil;
                    local v75 = v56:getState().AvatarExperience.AvatarScene.Looks[v57];
                    if (if v75 then v75.lookType else nil) ~= v12.LookType.Avatar then
                        if l_FFlagAXCatalogMakeupSupport_0 then
                            v75 = v56:getState().AvatarExperience.AvatarScene.Looks[v57];
                            v59 = (if v75 then v75.lookType else nil) == v12.LookType.Makeup;
                        end;
                        if not v59 then
                            v74 = if v67 then v71.premiumPriceInRobux else v71.priceInRobux;
                            v58 = true;
                        end;
                    end;
                    if v59 or not v58 then
                        v59 = false;
                        v74 = v73.priceInRobux;
                    end;
                    v58 = false;
                    if l_FFlagAXDurablesSupport_0 and v70.selectedTimedOptionIndex and v73.timedOptions then
                        local v76 = v73.timedOptions[v70.selectedTimedOptionIndex];
                        if v76 and v76.days then
                            table.insert(v64, {
                                itemType = v70.itemType, 
                                itemId = v70.itemId, 
                                days = v76.days
                            });
                            v74 = v76.price;
                        end;
                    end;
                    v65 = v65 + v74;
                    table.insert(v63, (tonumber(v70.itemId)));
                end;
            end;
        end;
        if l_FFlagAXDurablesSupport_0 then
            return v65, v61, v62, v63, v64;
        else
            return v65, v61, v62, v63;
        end;
    end;
end;
local function _(v78) --[[ Line: 234 ]] --[[ Name: purchaseProductKeyMapper ]]
    -- upvalues: v7 (copy)
    return v7.PurchaseProductKey .. v78;
end;
return function(v80, v81, v82, v83) --[[ Line: 242 ]]
    -- upvalues: l_PerformFetch_0 (copy), v7 (copy), l_FFlagAXDurablesSupport_0 (copy), v77 (copy), l_HttpService_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), v3 (copy), v12 (copy), v13 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v8 (copy), v34 (copy), v21 (copy), l_isEconomicRestrictionResponse_0 (copy), v4 (copy), v48 (copy), v9 (copy), v10 (copy), v35 (copy), v5 (copy), v20 (copy), v18 (copy), l_AvatarScreenProperties_0 (copy), v23 (copy), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (copy), v22 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v11 (copy), v33 (copy)
    return l_PerformFetch_0.Single(v7.PurchaseProductKey .. v81, function(v84) --[[ Line: 243 ]]
        -- upvalues: l_FFlagAXDurablesSupport_0 (ref), v77 (ref), v81 (copy), l_HttpService_0 (ref), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), v3 (ref), v82 (copy), v12 (ref), v83 (copy), v13 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v8 (ref), v80 (copy), v34 (ref), v21 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v48 (ref), v9 (ref), v10 (ref), v35 (ref), v5 (ref), v20 (ref), v18 (ref), l_AvatarScreenProperties_0 (ref), v23 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v22 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v11 (ref), v33 (ref)
        local v85 = false;
        local v86 = false;
        local v87 = nil;
        local v88 = {};
        local v89 = {};
        local v90 = {};
        local v91 = nil;
        if l_FFlagAXDurablesSupport_0 then
            v91 = {};
            local v92, v93, v94, v95, v96 = v77(v84, v81);
            v87 = v92;
            v88 = v93;
            v89 = v94;
            v90 = v95;
            v91 = v96;
        else
            local v97, v98, v99, v100 = v77(v84, v81);
            v87 = v97;
            v88 = v98;
            v89 = v99;
            v90 = v100;
        end;
        local v101 = l_HttpService_0:GenerateGUID(false);
        local v102 = nil;
        local v103 = if l_FFlagAXAddLookTypeEnumForLogging_0 then v84:getState().AvatarExperience.Common.Widgets.HydratedWidgetData else nil;
        local l_LookAnalyticsInfo_0 = v84:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
        v102 = if l_LookAnalyticsInfo_0 then v3.Dictionary.join(l_LookAnalyticsInfo_0, {
            totalRobux = v82, 
            assetIds = v90, 
            lookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v103 and v103[v12.ItemType.Look] and v103[v12.ItemType.Look][v81] then v103[v12.ItemType.Look][v81].lookType else nil
        }) else nil;
        if v102 and #v90 > 0 then
            v83.widgetInteractionV2(v102, v13.ActionType.PURCHASE_ATTEMPT);
        end;
        local v105 = nil;
        local l_v81_0 = v81;
        local v107 = v84:getState().AvatarExperience.AvatarScene.Looks[l_v81_0];
        if (if v107 then v107.lookType else nil) ~= v12.LookType.Avatar then
            if l_FFlagAXCatalogMakeupSupport_0 then
                l_v81_0 = v81;
                v107 = v84:getState().AvatarExperience.AvatarScene.Looks[l_v81_0];
                v86 = (if v107 then v107.lookType else nil) == v12.LookType.Makeup;
            end;
            if not v86 then
                v105 = v8.PurchaseLook(v80, v81, v101, v82, 0, v88);
                v85 = true;
            end;
        end;
        if v86 or not v85 then
            v86 = false;
            v105 = v8.PurchaseLookV2(v80, v81, v101, v82, 0, v88, v89, if l_FFlagAXDurablesSupport_0 and #v91 > 0 then v91 else nil);
        end;
        v85 = false;
        return v105:andThen(function(v108) --[[ Line: 313 ]]
            -- upvalues: v34 (ref), v21 (ref), l_isEconomicRestrictionResponse_0 (ref), v4 (ref), v84 (copy), v81 (ref), v12 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v48 (ref), v9 (ref), v10 (ref), v35 (ref), v80 (ref), v5 (ref), v20 (ref), v102 (ref), v18 (ref), l_AvatarScreenProperties_0 (ref), v23 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v22 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), v82 (ref), v83 (ref), v13 (ref), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v8 (ref), v11 (ref), v33 (ref)
            local v109 = false;
            local v110 = false;
            local l_responseBody_0 = v108.responseBody;
            local v112 = true;
            if l_responseBody_0.purchaseLookStatus ~= v34.Success then
                v112 = v21 and l_responseBody_0.purchaseLookStatus == v34.PartialSuccess;
            end;
            if l_isEconomicRestrictionResponse_0(l_responseBody_0) then
                return v4.reject(l_responseBody_0);
            elseif v112 and type(l_responseBody_0) == "table" then
                local l_l_responseBody_0_0 = l_responseBody_0;
                local v114 = 0;
                local v115 = 0;
                local v116 = {};
                local v117 = {};
                local l_v84_0 = v84;
                local l_v81_1 = v81;
                local v120 = l_v84_0:getState().AvatarExperience.AvatarScene.Looks[l_v81_1];
                local v121;
                if (if v120 then v120.lookType else nil) ~= v12.LookType.Avatar then
                    if l_FFlagAXCatalogMakeupSupport_0 then
                        l_v84_0 = v84;
                        l_v81_1 = v81;
                        v120 = l_v84_0:getState().AvatarExperience.AvatarScene.Looks[l_v81_1];
                        v110 = (if v120 then v120.lookType else nil) == v12.LookType.Makeup;
                    end;
                    if not v110 then
                        for v122, v123 in l_l_responseBody_0_0.itemPurchaseStatus do
                            if v123 == v35.Success or v123 == v35.AlreadyOwned then
                                v114 = v114 + 1;
                                v84:dispatch(v9(v122, true));
                                if v123 == v35.Success then
                                    table.insert(v116, (tonumber(v122)));
                                end;
                            else
                                v115 = v115 + 1;
                            end;
                        end;
                        v109 = true;
                    end;
                end;
                if v110 or not v109 then
                    v110 = false;
                    v121, l_v84_0, l_v81_1 = v48(v84, l_l_responseBody_0_0.assetPurchaseStatus, v9, v114, v115, v116);
                    v114 = v121;
                    v115 = l_v84_0;
                    v116 = l_v81_1;
                    v121, l_v84_0, l_v81_1 = v48(v84, l_l_responseBody_0_0.bundlePurchaseStatus, v10, v114, v115, v117);
                    v114 = v121;
                    v115 = l_v84_0;
                    v117 = l_v81_1;
                end;
                v109 = false;
                v121 = v80;
                l_v84_0 = v84;
                l_v81_1 = l_v84_0:getState().LocalUserId;
                v5.isNonEmptyString(l_v81_1, "Thunk.PurchaseProduct.updateRobux.localUserId");
                if typeof(l_v81_1) == "string" and l_v81_1 ~= "" then
                    l_v84_0:dispatch(v20(v121, l_v81_1, true));
                end;
                v121 = nil;
                l_v84_0 = nil;
                l_v81_1 = nil;
                local v124 = nil;
                v120 = nil;
                local v125 = v84:getState();
                if v102 then
                    v121 = v102.query;
                else
                    local v126, v127, v128, v129, v130 = v18.getAvatarsTabAnalyticsInfo(v125);
                    v121 = v126;
                    l_v84_0 = v127;
                    l_v81_1 = v128;
                    v124 = v129;
                    v120 = v130;
                end;
                pcall(function() --[[ Line: 384 ]]
                    -- upvalues: v84 (ref), l_AvatarScreenProperties_0 (ref), v23 (ref), v102 (ref), v116 (ref), v117 (ref), l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 (ref), v22 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v3 (ref), l_UnifiedEventLogEnums_0 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), v121 (ref), v82 (ref)
                    local v131 = v84:getState().Navigation and v84:getState().Navigation.currentRoute;
                    local v132 = nil;
                    local v133 = nil;
                    if v131 and v131.params and v131.params.fromAvatarRoute then
                        v133 = v131.params.fromAvatarRoute.opaque.name;
                    elseif v131.params and v131.params.extraProps then
                        v133 = v131.params.extraProps.routeName;
                    end;
                    v132 = l_AvatarScreenProperties_0[v133];
                    local v134 = if v23 then v102 == nil else nil;
                    local v135 = nil;
                    local v136 = nil;
                    if v23 and #v116 > 0 then
                        v135 = table.concat(v116, ",");
                    end;
                    if v23 and #v117 > 0 then
                        v136 = table.concat(v117, ",");
                    end;
                    local v137 = nil;
                    v137 = if l_FFlagAXAvatarSortInDiscoveryUnifiedPurchase_0 then (if v22 then if v102 then v102.surface else nil else v102.surface) or v132 and v132.analyticsData and v132.analyticsData.unifiedLoggingSurface else if v132 and v132.analyticsData then v132.analyticsData.unifiedLoggingSurface else nil;
                    l_sendUnifiedEventForDeferredAction_0(v3.Dictionary.join(v84:getState().AvatarExperience.AnalyticsMetadata, {
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                        itemType = if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else nil, 
                        keyword = v121, 
                        surface = v137, 
                        organicAssetIds = if v23 and v134 then v135 else nil, 
                        organicBundleIds = if v23 and v134 then v136 else nil, 
                        organicItemPrice = if v23 and v134 then v82 else nil, 
                        assetIds = if not v23 or v134 then nil else v135, 
                        bundleIds = if not v23 or v134 then nil else v136, 
                        widgetItemPrice = if not v23 or v134 then nil else v82
                    }));
                end);
                l_l_responseBody_0_0 = v3.Dictionary.join(l_l_responseBody_0_0, {
                    successCount = v114, 
                    failureCount = v115
                });
                if v102 then
                    v102 = v3.Dictionary.join(v102, {
                        assetIds = v116
                    });
                    if #v116 > 0 or #v117 > 0 then
                        v83.widgetInteractionV2(v102, v13.ActionType.PURCHASE_SUCCESS);
                    end;
                elseif not v102 then
                    v83.avatarShopBuyItem(v81, l_ItemTypeEnum_0.Look, v82, v120, v124, v121, l_v84_0, l_v81_1, v84:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v84:getState().Navigation then v84:getState().Navigation.getParam(v12.NavigationParams.fromSurface) else nil);
                end;
                if #v116 > 0 or #v117 > 0 then
                    v8.GetLookDetailsV2(v80, v81):andThen(function(v138) --[[ Line: 481 ]]
                        -- upvalues: v84 (ref), v11 (ref), v81 (ref), v116 (ref), v117 (ref)
                        local l_look_0 = v138.responseBody.look;
                        if l_look_0 then
                            local v140 = true;
                            for _, v142 in l_look_0.items do
                                if not v142.quantityOwned or v142.quantityOwned == 0 then
                                    v140 = false;
                                    break;
                                end;
                            end;
                            v84:dispatch(v11(v81, v116, v117, v140));
                        end;
                    end);
                end;
                return v4.resolve(l_l_responseBody_0_0);
            else
                local l_v33_0 = v33;
                return v4.reject(l_v33_0);
            end;
        end, function(v144) --[[ Line: 508 ]]
            -- upvalues: v33 (ref), v4 (ref)
            if type(v144) ~= "table" or v144.HttpError == nil then
                v144 = v33;
            end;
            return v4.reject(v144);
        end);
    end);
end;