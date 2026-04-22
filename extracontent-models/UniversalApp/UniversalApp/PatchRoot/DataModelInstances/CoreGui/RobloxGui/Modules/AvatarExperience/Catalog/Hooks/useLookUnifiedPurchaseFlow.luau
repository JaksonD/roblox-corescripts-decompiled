local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Packages.Promise);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v9 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v11 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v11.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v11.AvatarRoute.Hooks.useAvatarRoute;
local v14 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v15 = require(l_Modules_0.AvatarExperience.Common.Constants);
local l_WidgetConstants_0 = v2.WidgetConstants;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local v18 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v20 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local l_CartIdService_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Lib.CartIdService;
local v22 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v23 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLoggingUtils_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Utils.UnifiedEventLoggingUtils;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_ProductPurchaseSurface_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXAddLookTypeEnumForLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddLookTypeEnumForLogging;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v35 = require(l_Modules_0.AvatarExperience.Common.Util.LookUtils);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleLooksPurchaseSuccess);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local v40 = game:DefineFastFlag("AXFixUnifiedPurchaseFlowSessionTag", false);
local l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXUnifiedPurchasePromptTimedOptionsInLooks;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXRenameBackToAddToAvatar_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRenameBackToAddToAvatar;
local l_FFlagAXBlackbirdRoot_0 = v10.FFlagAXBlackbirdRoot;
local function _(v45, v46) --[[ Line: 72 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v33 (copy)
    local v47 = v33();
    local v48 = nil;
    local v49 = nil;
    for v50, v51 in v47 do
        if v51.Name == v45 then
            v48 = v50;
            if v46 and v51.Subcategories then
                for v52, v53 in v51.Subcategories do
                    if v53.Name == v46 then
                        return v48, v52;
                    end;
                end;
                return v48, v49;
            else
                break;
            end;
        end;
    end;
    return v48, v49;
end;
return function(v55) --[[ Line: 115 ]] --[[ Name: useLookUnifiedPurchaseFlow ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v9 (copy), v18 (copy), v19 (copy), v20 (copy), l_useAvatarSaveContext_0 (copy), v4 (copy), v35 (copy), v5 (copy), l_WidgetConstants_0 (copy), v23 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), v40 (copy), l_UnifiedEventLogEnums_0 (copy), l_CartIdService_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogConstants_0 (copy), v37 (copy), v36 (copy), l_FFlagAXBlackbirdRoot_0 (copy), v6 (copy), l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v14 (copy), v22 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_FFlagAXRenameBackToAddToAvatar_0 (copy), l_ProductPurchaseSurface_0 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v15 (copy), v34 (copy), v33 (copy), l_AvatarScreen_0 (copy), l_NavigateWithLock_0 (copy)
    local v56 = l_useDispatch_0();
    local v57 = l_useNavigation_0();
    local v58 = l_useAvatarRoute_0();
    local v59 = v9(v18);
    local v60 = v9(v19);
    local v61 = v9(v20);
    local v62 = l_useAvatarSaveContext_0();
    local v71 = v4.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v35 (ref), v55 (copy), v5 (ref), v60 (copy), l_WidgetConstants_0 (ref)
        local v63 = nil;
        local v64 = nil;
        local v65 = nil;
        local v66 = {};
        local v67, v68, v69, v70 = v35.getPurchaseInfoForLookId(v55.tryOnItems, v55.lookDetailsObj, v55.lookId);
        v63 = v67;
        v64 = v68;
        v65 = v69;
        v66 = v70;
        v67 = if v55.lookAnalyticsInfo then v5.Dictionary.join(v55.lookAnalyticsInfo, {
            totalRobux = v55.totalPrice, 
            assetIds = v66
        }) else nil;
        if v67 and #v66 > 0 then
            v60.widgetInteractionV2(v67, l_WidgetConstants_0.ActionType.PURCHASE_ATTEMPT);
        end;
    end, {
        v55.tryOnItems, 
        v55.lookDetailsObj, 
        v55.lookId, 
        v55.lookAnalyticsInfo, 
        v55.totalPrice, 
        v60
    });
    local v72 = v4.useCallback(function() --[[ Line: 150 ]]
        -- upvalues: v56 (copy), v23 (ref)
        v56(v23());
    end, {
        v56
    });
    local v77 = v4.useCallback(function(v73) --[[ Line: 155 ]]
        -- upvalues: l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), v55 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), v40 (ref), v5 (ref), l_UnifiedEventLogEnums_0 (ref), l_CartIdService_0 (ref), l_UnifiedEventLoggingUtils_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and not v55.lookAnalyticsInfo then
            v55.lookAnalyticsInfo = {};
        end;
        if v73 and v55.lookAnalyticsInfo then
            local v74 = {
                current = v73
            };
            local v75 = nil;
            local v76 = if l_FFlagAXAddLookTypeEnumForLogging_0 and v55.lookId and v55.lookDetailsObj and v55.lookDetailsObj[v55.lookId] then v55.lookDetailsObj[v55.lookId].lookType else nil;
            if v40 then
                v75 = v5.Dictionary.join(v55.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v55.lookAnalyticsInfo.widgetType) and v76 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v76) else nil, 
                    widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v55.lookAnalyticsInfo.widgetType and v76 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v76) else nil, 
                    widgetItemPrice = if v55.lookAnalyticsInfo.widgetType then v55.totalPrice else nil, 
                    organicItemPrice = if v55.lookAnalyticsInfo.widgetType then nil else v55.totalPrice
                });
                l_addUnifiedEventLogging_0(v74, v75, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                return;
            else
                v75 = v5.Dictionary.join(v55.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    cartId = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_CartIdService_0.getCartId() else nil, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v55.lookAnalyticsInfo.widgetType) and v76 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v76) else nil, 
                    widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v55.lookAnalyticsInfo.widgetType and v76 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v76) else nil, 
                    widgetItemPrice = if v55.lookAnalyticsInfo.widgetType then v55.totalPrice else nil, 
                    organicItemPrice = if v55.lookAnalyticsInfo.widgetType then nil else v55.totalPrice, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                }, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                l_addUnifiedEventLogging_0(v74, v75);
            end;
        end;
    end, {
        v55.totalPrice, 
        v55.lookAnalyticsInfo, 
        if l_FFlagAXAddLookTypeEnumForLogging_0 then v55.lookDetailsObj else nil, 
        if l_FFlagAXAddLookTypeEnumForLogging_0 then v55.lookId else nil
    });
    local v90 = v4.useCallback(function(v78, v79) --[[ Line: 227 ]]
        -- upvalues: v37 (ref), v55 (copy), v35 (ref), v5 (ref), v56 (copy), v36 (ref), v59 (copy), v62 (copy), v57 (copy), v60 (copy), v61 (copy), v58 (copy)
        local v80 = v37.getOwnedTryOnItems(v55.tryOnItems, v55.lookDetailsObj, v55.lookId);
        local l_isTryOnFromOutsideAX_0 = v55.isTryOnFromOutsideAX;
        local v82 = nil;
        local v83 = nil;
        local v84 = nil;
        local v85 = {};
        local v86, v87, v88, v89 = v35.getPurchaseInfoForLookId(v55.tryOnItems, v55.lookDetailsObj, v55.lookId);
        v82 = v86;
        v83 = v87;
        v84 = v88;
        v85 = v89;
        v86 = if v55.lookAnalyticsInfo then v5.Dictionary.join(v55.lookAnalyticsInfo, {
            totalRobux = v55.totalPrice, 
            assetIds = v85
        }) else nil;
        v56(v36(v78, v79, v59, v55.lookId, v55.totalPrice, v55.tryOnItems, v80, v62, l_isTryOnFromOutsideAX_0, v86, v57, v60, v61, v58));
    end, {
        v56, 
        v59, 
        v55.lookId, 
        v55.lookAnalyticsInfo, 
        v55.totalPrice, 
        v55.tryOnItems, 
        v62, 
        v57, 
        v60, 
        v61, 
        v55.lookDetailsObj, 
        v58, 
        v55.isTryOnFromOutsideAX
    });
    local v94 = if l_FFlagAXBlackbirdRoot_0 then v4.useCallback(function() --[[ Line: 279 ]]
        -- upvalues: v55 (copy), v6 (ref)
        local v91 = {};
        local v92 = if v55.lookId and v55.lookDetailsObj[v55.lookId] and v55.lookDetailsObj[v55.lookId].lookDiscounts then v55.lookDetailsObj[v55.lookId].lookDiscounts else nil;
        if v92 then
            local v93 = v92[1];
            v91.Type = v93.discountCampaign;
            v91.AmountInRobux = if v55.originalPrice then v55.originalPrice - v55.totalPrice else nil;
            v91.Percent = v93.robuxDiscountPercentage;
        end;
        return v6.resolve({
            PriceInRobux = v55.totalPrice, 
            IsForSale = true, 
            Name = "Looks", 
            BasePriceInRobux = v55.originalPrice, 
            PriceDiscountDetails = {
                v91
            }
        });
    end, {
        v55.lookId, 
        v55.lookDetailsObj, 
        v55.originalPrice, 
        v55.totalPrice
    }) else nil;
    local v110 = v4.useCallback(function() --[[ Line: 310 ]]
        -- upvalues: v55 (copy), l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 (ref), v35 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v14 (ref), v56 (copy), v22 (ref), v72 (copy), v71 (copy), v90 (copy), v77 (copy), l_FFlagAXBlackbirdRoot_0 (ref), v94 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), l_FFlagAXRenameBackToAddToAvatar_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref)
        if not v55.lookId then
            return;
        else
            local v95 = nil;
            local v96 = {};
            local v97 = {};
            local v98 = {};
            local v99 = nil;
            if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 then
                local v100, v101, v102, v103, v104 = v35.getPurchaseInfoForLookId(v55.tryOnItems, v55.lookDetailsObj, v55.lookId);
                v95 = v100;
                v96 = v101;
                v97 = v102;
                v98 = v103;
                v99 = v104;
            else
                local v105, v106, v107, v108 = v35.getPurchaseInfoForLookId(v55.tryOnItems, v55.lookDetailsObj, v55.lookId);
                v95 = v105;
                v96 = v106;
                v97 = v107;
                v98 = v108;
            end;
            local v109 = if l_FFlagAXCatalogMakeupSupport_0 and v55.lookDetailsObj and v55.lookDetailsObj[v55.lookId] and v55.lookDetailsObj[v55.lookId].lookType then v55.lookDetailsObj[v55.lookId].lookType == v14.LookType.Makeup else nil;
            v56(v22({
                productPayload = {
                    kind = "Look", 
                    id = v55.lookId, 
                    expectedPrice = v55.totalPrice, 
                    salesLocationId = 0, 
                    excludedAssetIds = v96, 
                    excludedBundleIds = v97, 
                    timedOptions = if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 and v99 and #v99 > 0 then v99 else nil
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v72, 
                    onPurchaseAttempt = v71, 
                    onPurchaseSuccess = v90, 
                    onBuyItemButtonMounted = v77, 
                    fetchProductInfo = if l_FFlagAXBlackbirdRoot_0 then v94 else nil
                }, 
                postPurchaseActions = {
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v109 then v55.localized.wearAfterPurchaseMakeupLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v55.localized.wearAvatarAfterPurchaseLabel else v55.localized.wearAfterPurchaseLabel, 
                        actionKey = v14.WearAfterPurchasePostPurchaseActionKey, 
                        isActionSelected = true
                    }, 
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v109 then v55.localized.saveAsMakeupLookLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then if l_FFlagAXRenameBackToAddToAvatar_0 then v55.localized.addToMyAvatarsLabel else v55.localized.saveAsCharacterLabel else v55.localized.addToMyAvatarsLabel, 
                        actionKey = v14.SaveAsCharacterPostPurchaseActionKey, 
                        isActionSelected = true
                    }
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.Catalog
                }, 
                purchaseOptions = if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 then {
                    shouldSkipOwnershipCheck = true
                } else nil
            }, l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and true or nil));
            return;
        end;
    end, {
        v56, 
        v55.lookId, 
        v55.totalPrice, 
        v55.tryOnItems, 
        v55.lookDetailsObj, 
        v59, 
        v62, 
        v57, 
        v60, 
        v61, 
        v55.localized, 
        v58, 
        v55.isTryOnFromOutsideAX, 
        v72, 
        v71, 
        v90, 
        v77, 
        if l_FFlagAXBlackbirdRoot_0 then v94 else nil
    });
    local v119 = v4.useCallback(function() --[[ Line: 419 ]]
        -- upvalues: v55 (copy), v60 (copy), v15 (ref), v5 (ref), v34 (ref), v33 (ref), l_AvatarScreen_0 (ref), v57 (copy), v56 (copy), l_NavigateWithLock_0 (ref), v110 (copy)
        if v55.userRobux < v55.totalPrice then
            v60.sendAXCounter(v15.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        end;
        if v5.isEmpty(v55.itemsToPurchase) and v55.lookId ~= nil then
            local l_CharacterKey_0 = v34.CharacterKey;
            local v112 = v33();
            local v113 = nil;
            local v114 = nil;
            for v115, v116 in v112 do
                if v116.Name == l_CharacterKey_0 then
                    v113 = v115;
                    break;
                end;
            end;
            local l_v113_0 = v113;
            local l_v114_0 = v114;
            l_CharacterKey_0 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v112 = {
                onOverlayClosed = v55.onOverlayClosed, 
                categoryOverride = l_v113_0, 
                subcategoryOverride = l_v114_0
            };
            v60.sendAXCounter(v15.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
            v56(l_NavigateWithLock_0(function() --[[ Line: 438 ]]
                -- upvalues: v57 (ref), l_CharacterKey_0 (copy), v112 (copy)
                v57.navigate(l_CharacterKey_0, v112);
            end));
            return;
        else
            v110();
            return;
        end;
    end, {
        v55.tryOnItems, 
        v55.lookDetailsObj, 
        v55.lookId, 
        v55.userRobux, 
        v56, 
        v57, 
        v55.onOverlayClosed, 
        v60, 
        v58, 
        v55.itemsToPurchase, 
        v55.totalPrice, 
        v110
    });
    return {
        onPurchaseAttempt = v71, 
        onFlowComplete = v72, 
        onBuyItemButtonMounted = v77, 
        onPurchaseSuccess = v90, 
        openUnifiedPurchasePrompt = v110, 
        onButtonPressWithUnifiedPurchaseFlow = v119
    };
end;