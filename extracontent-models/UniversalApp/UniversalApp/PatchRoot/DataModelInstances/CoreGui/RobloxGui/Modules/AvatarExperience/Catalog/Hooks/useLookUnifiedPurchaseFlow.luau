local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v7 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v8 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v8.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v8.AvatarRoute.Hooks.useAvatarRoute;
local v11 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v17 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v18 = require(l_Modules_0.LuaApp.Thunks.OpenCentralOverlayForUnifiedPurchasePrompt);
local v19 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_UnifiedEventLoggingUtils_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Utils.UnifiedEventLoggingUtils;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_ProductPurchaseSurface_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums.ProductPurchaseSurface;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local l_FFlagAXAddLookTypeEnumForLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAddLookTypeEnumForLogging;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v31 = require(l_Modules_0.AvatarExperience.Common.Util.LookUtils);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.HandleLooksPurchaseSuccess);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local v36 = game:DefineFastFlag("AXFixUnifiedPurchaseFlowSessionTag", false);
local function v46(v37, v38) --[[ Line: 61 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v29 (copy)
    local v39 = v29();
    local v40 = nil;
    local v41 = nil;
    for v42, v43 in v39 do
        if v43.Name == v37 then
            v40 = v42;
            if v38 and v43.Subcategories then
                for v44, v45 in v43.Subcategories do
                    if v45.Name == v38 then
                        return v40, v44;
                    end;
                end;
                return v40, v41;
            else
                break;
            end;
        end;
    end;
    return v40, v41;
end;
return function(v47) --[[ Line: 103 ]] --[[ Name: useLookUnifiedPurchaseFlow ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v7 (copy), v15 (copy), v16 (copy), v17 (copy), l_useAvatarSaveContext_0 (copy), v3 (copy), v31 (copy), v4 (copy), v13 (copy), v19 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), v36 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogConstants_0 (copy), v33 (copy), v32 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v11 (copy), v18 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v12 (copy), v46 (copy), v30 (copy), l_AvatarScreen_0 (copy), v20 (copy)
    local v48 = l_useDispatch_0();
    local v49 = l_useNavigation_0();
    local v50 = l_useAvatarRoute_0();
    local v51 = v7(v15);
    local v52 = v7(v16);
    local v53 = v7(v17);
    local v54 = l_useAvatarSaveContext_0();
    local v63 = v3.useCallback(function() --[[ Line: 113 ]]
        -- upvalues: v31 (ref), v47 (copy), v4 (ref), v52 (copy), v13 (ref)
        local v55 = nil;
        local v56 = nil;
        local v57 = nil;
        local v58 = {};
        local v59, v60, v61, v62 = v31.getPurchaseInfoForLookId(v47.tryOnItems, v47.lookDetailsObj, v47.lookId);
        v55 = v59;
        v56 = v60;
        v57 = v61;
        v58 = v62;
        v59 = if v47.lookAnalyticsInfo then v4.Dictionary.join(v47.lookAnalyticsInfo, {
            totalRobux = v47.totalPrice, 
            assetIds = v58
        }) else nil;
        if v59 and #v58 > 0 then
            v52.widgetInteractionV2(v59, v13.ActionType.PURCHASE_ATTEMPT);
        end;
    end, {
        v47.tryOnItems, 
        v47.lookDetailsObj, 
        v47.lookId, 
        v47.lookAnalyticsInfo, 
        v47.totalPrice, 
        v52
    });
    local v64 = v3.useCallback(function() --[[ Line: 138 ]]
        -- upvalues: v48 (copy), v19 (ref)
        v48(v19());
    end, {
        v48
    });
    local v69 = v3.useCallback(function(v65) --[[ Line: 143 ]]
        -- upvalues: v47 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), v36 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLoggingUtils_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v65 and v47.lookAnalyticsInfo then
            local v66 = {
                current = v65
            };
            local v67 = nil;
            local v68 = if l_FFlagAXAddLookTypeEnumForLogging_0 and v47.lookId and v47.lookDetailsObj and v47.lookDetailsObj[v47.lookId] then v47.lookDetailsObj[v47.lookId].lookType else nil;
            if v36 then
                v67 = v4.Dictionary.join(v47.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v47.lookAnalyticsInfo.widgetType) and v68 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v68) else nil, 
                    widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v47.lookAnalyticsInfo.widgetType and v68 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v68) else nil, 
                    widgetItemPrice = if v47.lookAnalyticsInfo.widgetType then v47.totalPrice else nil, 
                    organicItemPrice = if v47.lookAnalyticsInfo.widgetType then nil else v47.totalPrice
                });
                l_addUnifiedEventLogging_0(v66, v67, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                return;
            else
                v67 = v4.Dictionary.join(v47.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v47.lookAnalyticsInfo.widgetType) and v68 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v68) else nil, 
                    widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v47.lookAnalyticsInfo.widgetType and v68 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v68) else nil, 
                    widgetItemPrice = if v47.lookAnalyticsInfo.widgetType then v47.totalPrice else nil, 
                    organicItemPrice = if v47.lookAnalyticsInfo.widgetType then nil else v47.totalPrice, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                }, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                l_addUnifiedEventLogging_0(v66, v67);
            end;
        end;
    end, {
        v47.totalPrice, 
        v47.lookAnalyticsInfo, 
        if l_FFlagAXAddLookTypeEnumForLogging_0 then v47.lookDetailsObj else nil, 
        if l_FFlagAXAddLookTypeEnumForLogging_0 then v47.lookId else nil
    });
    local v82 = v3.useCallback(function(v70, v71) --[[ Line: 209 ]]
        -- upvalues: v33 (ref), v47 (copy), v31 (ref), v4 (ref), v48 (copy), v32 (ref), v51 (copy), v54 (copy), v49 (copy), v52 (copy), v53 (copy), v50 (copy)
        local v72 = v33.getOwnedTryOnItems(v47.tryOnItems, v47.lookDetailsObj, v47.lookId);
        local l_isTryOnFromOutsideAX_0 = v47.isTryOnFromOutsideAX;
        local v74 = nil;
        local v75 = nil;
        local v76 = nil;
        local v77 = {};
        local v78, v79, v80, v81 = v31.getPurchaseInfoForLookId(v47.tryOnItems, v47.lookDetailsObj, v47.lookId);
        v74 = v78;
        v75 = v79;
        v76 = v80;
        v77 = v81;
        v78 = if v47.lookAnalyticsInfo then v4.Dictionary.join(v47.lookAnalyticsInfo, {
            totalRobux = v47.totalPrice, 
            assetIds = v77
        }) else nil;
        v48(v32(v70, v71, v51, v47.lookId, v47.totalPrice, v47.tryOnItems, v72, v54, l_isTryOnFromOutsideAX_0, v78, v49, v52, v53, v50));
    end, {
        v48, 
        v51, 
        v47.lookId, 
        v47.lookAnalyticsInfo, 
        v47.totalPrice, 
        v47.tryOnItems, 
        v54, 
        v49, 
        v52, 
        v53, 
        v47.lookDetailsObj, 
        v50, 
        v47.isTryOnFromOutsideAX
    });
    local v91 = v3.useCallback(function() --[[ Line: 261 ]]
        -- upvalues: v47 (copy), v31 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v11 (ref), v48 (copy), v18 (ref), v64 (copy), v63 (copy), v82 (copy), v69 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref)
        if not v47.lookId then
            return;
        else
            local v83 = nil;
            local v84 = {};
            local v85 = {};
            local v86 = {};
            local v87, v88, v89, v90 = v31.getPurchaseInfoForLookId(v47.tryOnItems, v47.lookDetailsObj, v47.lookId);
            v83 = v87;
            v84 = v88;
            v85 = v89;
            v86 = v90;
            v87 = if l_FFlagAXCatalogMakeupSupport_0 and v47.lookDetailsObj and v47.lookDetailsObj[v47.lookId] and v47.lookDetailsObj[v47.lookId].lookType then v47.lookDetailsObj[v47.lookId].lookType == v11.LookType.Makeup else nil;
            v48(v18({
                productPayload = {
                    kind = "Look", 
                    id = v47.lookId, 
                    expectedPrice = v47.totalPrice, 
                    salesLocationId = 0, 
                    excludedAssetIds = v84, 
                    excludedBundleIds = v85
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v64, 
                    onPurchaseAttempt = v63, 
                    onPurchaseSuccess = v82, 
                    onBuyItemButtonMounted = v69
                }, 
                postPurchaseActions = {
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v87 then v47.localized.wearAfterPurchaseMakeupLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v47.localized.wearAvatarAfterPurchaseLabel else v47.localized.wearAfterPurchaseLabel, 
                        actionKey = v11.WearAfterPurchasePostPurchaseActionKey, 
                        isActionSelected = true
                    }, 
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v87 then v47.localized.saveAsMakeupLookLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v47.localized.saveAsCharacterLabel else v47.localized.addToMyAvatarsLabel, 
                        actionKey = v11.SaveAsCharacterPostPurchaseActionKey, 
                        isActionSelected = true
                    }
                }, 
                purchaseAnalyticsMetadata = {
                    surface = l_ProductPurchaseSurface_0.Catalog
                }
            }, l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 and true or nil));
            return;
        end;
    end, {
        v48, 
        v47.lookId, 
        v47.totalPrice, 
        v47.tryOnItems, 
        v47.lookDetailsObj, 
        v51, 
        v54, 
        v49, 
        v52, 
        v53, 
        v47.localized, 
        v50, 
        v47.isTryOnFromOutsideAX
    });
    local v96 = v3.useCallback(function() --[[ Line: 338 ]]
        -- upvalues: v47 (copy), v52 (copy), v12 (ref), v4 (ref), v46 (ref), v30 (ref), l_AvatarScreen_0 (ref), v49 (copy), v48 (copy), v20 (ref), v91 (copy)
        if v47.userRobux < v47.totalPrice then
            v52.sendAXCounter(v12.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        end;
        if v4.isEmpty(v47.itemsToPurchase) and v47.lookId ~= nil then
            local v92, v93 = v46(v30.CharacterKey);
            local l_LeaveCatalogToAvatarPrompt_0 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            local v95 = {
                onOverlayClosed = v47.onOverlayClosed, 
                categoryOverride = v92, 
                subcategoryOverride = v93
            };
            v52.sendAXCounter(v12.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
            v48(v20(function() --[[ Line: 357 ]]
                -- upvalues: v49 (ref), l_LeaveCatalogToAvatarPrompt_0 (copy), v95 (copy)
                v49.navigate(l_LeaveCatalogToAvatarPrompt_0, v95);
            end));
            return;
        else
            v91();
            return;
        end;
    end, {
        v47.tryOnItems, 
        v47.lookDetailsObj, 
        v47.lookId, 
        v47.userRobux, 
        v48, 
        v49, 
        v47.onOverlayClosed, 
        v52, 
        v50, 
        v47.itemsToPurchase, 
        v47.totalPrice, 
        v91
    });
    return {
        onPurchaseAttempt = v63, 
        onFlowComplete = v64, 
        onBuyItemButtonMounted = v69, 
        onPurchaseSuccess = v82, 
        openUnifiedPurchasePrompt = v91, 
        onButtonPressWithUnifiedPurchaseFlow = v96
    };
end;