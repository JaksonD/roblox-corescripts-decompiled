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
local l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXUnifiedPurchasePromptTimedOptionsInLooks;
local function _(v38, v39) --[[ Line: 63 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v29 (copy)
    local v40 = v29();
    local v41 = nil;
    local v42 = nil;
    for v43, v44 in v40 do
        if v44.Name == v38 then
            v41 = v43;
            if v39 and v44.Subcategories then
                for v45, v46 in v44.Subcategories do
                    if v46.Name == v39 then
                        return v41, v45;
                    end;
                end;
                return v41, v42;
            else
                break;
            end;
        end;
    end;
    return v41, v42;
end;
return function(v48) --[[ Line: 105 ]] --[[ Name: useLookUnifiedPurchaseFlow ]]
    -- upvalues: l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v7 (copy), v15 (copy), v16 (copy), v17 (copy), l_useAvatarSaveContext_0 (copy), v3 (copy), v31 (copy), v4 (copy), v13 (copy), v19 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), v36 (copy), l_UnifiedEventLogEnums_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogConstants_0 (copy), v33 (copy), v32 (copy), l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v11 (copy), v18 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (copy), l_ProductPurchaseSurface_0 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), v12 (copy), v30 (copy), v29 (copy), l_AvatarScreen_0 (copy), v20 (copy)
    local v49 = l_useDispatch_0();
    local v50 = l_useNavigation_0();
    local v51 = l_useAvatarRoute_0();
    local v52 = v7(v15);
    local v53 = v7(v16);
    local v54 = v7(v17);
    local v55 = l_useAvatarSaveContext_0();
    local v64 = v3.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v31 (ref), v48 (copy), v4 (ref), v53 (copy), v13 (ref)
        local v56 = nil;
        local v57 = nil;
        local v58 = nil;
        local v59 = {};
        local v60, v61, v62, v63 = v31.getPurchaseInfoForLookId(v48.tryOnItems, v48.lookDetailsObj, v48.lookId);
        v56 = v60;
        v57 = v61;
        v58 = v62;
        v59 = v63;
        v60 = if v48.lookAnalyticsInfo then v4.Dictionary.join(v48.lookAnalyticsInfo, {
            totalRobux = v48.totalPrice, 
            assetIds = v59
        }) else nil;
        if v60 and #v59 > 0 then
            v53.widgetInteractionV2(v60, v13.ActionType.PURCHASE_ATTEMPT);
        end;
    end, {
        v48.tryOnItems, 
        v48.lookDetailsObj, 
        v48.lookId, 
        v48.lookAnalyticsInfo, 
        v48.totalPrice, 
        v53
    });
    local v65 = v3.useCallback(function() --[[ Line: 140 ]]
        -- upvalues: v49 (copy), v19 (ref)
        v49(v19());
    end, {
        v49
    });
    local v70 = v3.useCallback(function(v66) --[[ Line: 145 ]]
        -- upvalues: v48 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), v36 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), l_UnifiedEventLoggingUtils_0 (ref), l_addUnifiedEventLogging_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v66 and v48.lookAnalyticsInfo then
            local v67 = {
                current = v66
            };
            local v68 = nil;
            local v69 = if l_FFlagAXAddLookTypeEnumForLogging_0 and v48.lookId and v48.lookDetailsObj and v48.lookDetailsObj[v48.lookId] then v48.lookDetailsObj[v48.lookId].lookType else nil;
            if v36 then
                v68 = v4.Dictionary.join(v48.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v48.lookAnalyticsInfo.widgetType) and v69 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v69) else nil, 
                    widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v48.lookAnalyticsInfo.widgetType and v69 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v69) else nil, 
                    widgetItemPrice = if v48.lookAnalyticsInfo.widgetType then v48.totalPrice else nil, 
                    organicItemPrice = if v48.lookAnalyticsInfo.widgetType then nil else v48.totalPrice
                });
                l_addUnifiedEventLogging_0(v67, v68, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                return;
            else
                v68 = v4.Dictionary.join(v48.lookAnalyticsInfo, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_ATTEMPT, 
                    itemType = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK, 
                    organicLookType = if not (not l_FFlagAXAddLookTypeEnumForLogging_0 or v48.lookAnalyticsInfo.widgetType) and v69 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v69) else nil, 
                    widgetLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v48.lookAnalyticsInfo.widgetType and v69 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(v69) else nil, 
                    widgetItemPrice = if v48.lookAnalyticsInfo.widgetType then v48.totalPrice else nil, 
                    organicItemPrice = if v48.lookAnalyticsInfo.widgetType then nil else v48.totalPrice, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                }, {
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
                l_addUnifiedEventLogging_0(v67, v68);
            end;
        end;
    end, {
        v48.totalPrice, 
        v48.lookAnalyticsInfo, 
        if l_FFlagAXAddLookTypeEnumForLogging_0 then v48.lookDetailsObj else nil, 
        if l_FFlagAXAddLookTypeEnumForLogging_0 then v48.lookId else nil
    });
    local v83 = v3.useCallback(function(v71, v72) --[[ Line: 211 ]]
        -- upvalues: v33 (ref), v48 (copy), v31 (ref), v4 (ref), v49 (copy), v32 (ref), v52 (copy), v55 (copy), v50 (copy), v53 (copy), v54 (copy), v51 (copy)
        local v73 = v33.getOwnedTryOnItems(v48.tryOnItems, v48.lookDetailsObj, v48.lookId);
        local l_isTryOnFromOutsideAX_0 = v48.isTryOnFromOutsideAX;
        local v75 = nil;
        local v76 = nil;
        local v77 = nil;
        local v78 = {};
        local v79, v80, v81, v82 = v31.getPurchaseInfoForLookId(v48.tryOnItems, v48.lookDetailsObj, v48.lookId);
        v75 = v79;
        v76 = v80;
        v77 = v81;
        v78 = v82;
        v79 = if v48.lookAnalyticsInfo then v4.Dictionary.join(v48.lookAnalyticsInfo, {
            totalRobux = v48.totalPrice, 
            assetIds = v78
        }) else nil;
        v49(v32(v71, v72, v52, v48.lookId, v48.totalPrice, v48.tryOnItems, v73, v55, l_isTryOnFromOutsideAX_0, v79, v50, v53, v54, v51));
    end, {
        v49, 
        v52, 
        v48.lookId, 
        v48.lookAnalyticsInfo, 
        v48.totalPrice, 
        v48.tryOnItems, 
        v55, 
        v50, 
        v53, 
        v54, 
        v48.lookDetailsObj, 
        v51, 
        v48.isTryOnFromOutsideAX
    });
    local v99 = v3.useCallback(function() --[[ Line: 263 ]]
        -- upvalues: v48 (copy), l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 (ref), v31 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v11 (ref), v49 (copy), v18 (ref), v65 (copy), v64 (copy), v83 (copy), v70 (copy), l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 (ref), l_ProductPurchaseSurface_0 (ref), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref)
        if not v48.lookId then
            return;
        else
            local v84 = nil;
            local v85 = {};
            local v86 = {};
            local v87 = {};
            local v88 = nil;
            if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 then
                local v89, v90, v91, v92, v93 = v31.getPurchaseInfoForLookId(v48.tryOnItems, v48.lookDetailsObj, v48.lookId);
                v84 = v89;
                v85 = v90;
                v86 = v91;
                v87 = v92;
                v88 = v93;
            else
                local v94, v95, v96, v97 = v31.getPurchaseInfoForLookId(v48.tryOnItems, v48.lookDetailsObj, v48.lookId);
                v84 = v94;
                v85 = v95;
                v86 = v96;
                v87 = v97;
            end;
            local v98 = if l_FFlagAXCatalogMakeupSupport_0 and v48.lookDetailsObj and v48.lookDetailsObj[v48.lookId] and v48.lookDetailsObj[v48.lookId].lookType then v48.lookDetailsObj[v48.lookId].lookType == v11.LookType.Makeup else nil;
            v49(v18({
                productPayload = {
                    kind = "Look", 
                    id = v48.lookId, 
                    expectedPrice = v48.totalPrice, 
                    salesLocationId = 0, 
                    excludedAssetIds = v85, 
                    excludedBundleIds = v86, 
                    timedOptions = if l_FFlagAXUnifiedPurchasePromptTimedOptionsInLooks_0 and v88 and #v88 > 0 then v88 else nil
                }, 
                purchaseCallbacks = {
                    onFlowComplete = v65, 
                    onPurchaseAttempt = v64, 
                    onPurchaseSuccess = v83, 
                    onBuyItemButtonMounted = v70
                }, 
                postPurchaseActions = {
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v98 then v48.localized.wearAfterPurchaseMakeupLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v48.localized.wearAvatarAfterPurchaseLabel else v48.localized.wearAfterPurchaseLabel, 
                        actionKey = v11.WearAfterPurchasePostPurchaseActionKey, 
                        isActionSelected = true
                    }, 
                    {
                        label = if l_FFlagAXCatalogMakeupSupport_0 and v98 then v48.localized.saveAsMakeupLookLabel else if l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 then v48.localized.saveAsCharacterLabel else v48.localized.addToMyAvatarsLabel, 
                        actionKey = v11.SaveAsCharacterPostPurchaseActionKey, 
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
        v49, 
        v48.lookId, 
        v48.totalPrice, 
        v48.tryOnItems, 
        v48.lookDetailsObj, 
        v52, 
        v55, 
        v50, 
        v53, 
        v54, 
        v48.localized, 
        v51, 
        v48.isTryOnFromOutsideAX
    });
    local v108 = v3.useCallback(function() --[[ Line: 364 ]]
        -- upvalues: v48 (copy), v53 (copy), v12 (ref), v4 (ref), v30 (ref), v29 (ref), l_AvatarScreen_0 (ref), v50 (copy), v49 (copy), v20 (ref), v99 (copy)
        if v48.userRobux < v48.totalPrice then
            v53.sendAXCounter(v12.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        end;
        if v4.isEmpty(v48.itemsToPurchase) and v48.lookId ~= nil then
            local l_CharacterKey_0 = v30.CharacterKey;
            local v101 = v29();
            local v102 = nil;
            local v103 = nil;
            for v104, v105 in v101 do
                if v105.Name == l_CharacterKey_0 then
                    v102 = v104;
                    break;
                end;
            end;
            local l_v102_0 = v102;
            local l_v103_0 = v103;
            l_CharacterKey_0 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v101 = {
                onOverlayClosed = v48.onOverlayClosed, 
                categoryOverride = l_v102_0, 
                subcategoryOverride = l_v103_0
            };
            v53.sendAXCounter(v12.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
            v49(v20(function() --[[ Line: 383 ]]
                -- upvalues: v50 (ref), l_CharacterKey_0 (copy), v101 (copy)
                v50.navigate(l_CharacterKey_0, v101);
            end));
            return;
        else
            v99();
            return;
        end;
    end, {
        v48.tryOnItems, 
        v48.lookDetailsObj, 
        v48.lookId, 
        v48.userRobux, 
        v49, 
        v50, 
        v48.onOverlayClosed, 
        v53, 
        v51, 
        v48.itemsToPurchase, 
        v48.totalPrice, 
        v99
    });
    return {
        onPurchaseAttempt = v64, 
        onFlowComplete = v65, 
        onBuyItemButtonMounted = v70, 
        onPurchaseSuccess = v83, 
        openUnifiedPurchasePrompt = v99, 
        onButtonPressWithUnifiedPurchaseFlow = v108
    };
end;