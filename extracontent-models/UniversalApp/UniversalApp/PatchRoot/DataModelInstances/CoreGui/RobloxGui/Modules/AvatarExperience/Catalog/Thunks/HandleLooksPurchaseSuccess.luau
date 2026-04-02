local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Promise);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local v7 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local v9 = game:DefineFastInt("AXLookOutfitCreationDelayMs1", 5000);
local v10 = require(l_Modules_0.LuaApp.Thunks.ApiFetchEconomyCurrency);
local v11 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAssetOwned);
local v14 = require(l_Modules_0.AvatarExperience.Common.Actions.SetBundleOwned);
local v15 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local v16 = require(l_Modules_0.AvatarExperience.Common.Actions.UpdateLookDetailsAfterSuccessfulPurchase);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_AvatarScreenProperties_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.AvatarScreenProperties;
local v20 = game:DefineFastString("AXDefaultCharacterName", "Avatar");
local l_Enums_0 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite).Enums;
local l_PurchaseLookStatusEnum_0 = l_Enums_0.PurchaseLookStatusEnum;
local l_PurchaseLookItemStatusEnum_0 = l_Enums_0.PurchaseLookItemStatusEnum;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v5.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v26 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v27 = game:DefineFastFlag("AXUnifiedSubsetOfLook", false);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v29 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_getTryOnItemReducerKey_0 = v25.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v25.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName);
local v39 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_SaveAsMakeupLookThunk_0 = v26.Thunks.SaveAsMakeupLookThunk;
local l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 = v5.FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v6.FFlagAXFixPurchaseSurfaceLogging;
local l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 = v5.FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess;
local function _(v45, v46) --[[ Line: 62 ]] --[[ Name: updateRobux ]]
    -- upvalues: v3 (copy), v10 (copy)
    local l_LocalUserId_0 = v46:getState().LocalUserId;
    v3.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v46:dispatch(v10(v45, l_LocalUserId_0, true));
    end;
end;
local v49 = {
    HttpError = Enum.HttpError.OK
};
local function v58(v50, v51, v52, v53, v54, v55) --[[ Line: 72 ]]
    -- upvalues: l_PurchaseLookItemStatusEnum_0 (copy)
    for v56, v57 in v51 do
        if v57 == l_PurchaseLookItemStatusEnum_0.Success or v57 == l_PurchaseLookItemStatusEnum_0.AlreadyOwned then
            v53 = v53 + 1;
            v50:dispatch(v52(v56, true));
            if v57 == l_PurchaseLookItemStatusEnum_0.Success then
                table.insert(v55, (tonumber(v56)));
            end;
        else
            v54 = v54 + 1;
        end;
    end;
    return v53, v54, v55;
end;
local function v63(v59, v60, v61) --[[ Line: 99 ]] --[[ Name: formatItemForWearAfterPurchase ]]
    -- upvalues: v29 (copy)
    local v62 = v60.itemType == v29.ItemType.Bundle;
    return {
        assetId = if not v62 then v59 else nil, 
        assetIsWearable = not v62, 
        assetType = if v62 then v29.ItemType.Bundle else nil, 
        bundleId = if v62 then v59 else nil, 
        itemSubType = v60.itemSubType, 
        overrideOrder = v60.order, 
        overrideAdjustments = {
            position = v60.position, 
            rotation = v60.rotation, 
            scale = v60.scale
        }, 
        owned = true, 
        purchased = v61, 
        tryOnBundleInfo = if v62 then v60.bundleInfo else nil
    };
end;
local function _(v64, v65, v66, v67, v68) --[[ Line: 120 ]] --[[ Name: processItem ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v63 (copy)
    local v69 = true;
    if v67 ~= "Success" then
        v69 = v67 == "AlreadyOwned";
    end;
    local v70 = if v68 ~= nil then l_getTryOnItemReducerKey_0(v66, v68) else v66;
    if v69 and v65[v70] ~= nil then
        table.insert(v64, (v63(v66, v65[v70], true)));
    end;
    return v64;
end;
local function v94(v72, v73, v74, v75, v76, v77, v78) --[[ Line: 134 ]] --[[ Name: handleWearAfterPurchase ]]
    -- upvalues: v63 (copy), v29 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v35 (copy), v36 (copy), v34 (copy), l_PeekViewState_0 (copy)
    local v79 = {};
    for _, v81 in v76 do
        table.insert(v79, (v63(v81.itemId, v81, false)));
    end;
    for v82, v83 in v72.assetPurchaseStatus do
        local l_v79_0 = v79;
        local l_Asset_0 = v29.ItemType.Asset;
        local v86 = true;
        if v83 ~= "Success" then
            v86 = v83 == "AlreadyOwned";
        end;
        local v87 = if l_Asset_0 ~= nil then l_getTryOnItemReducerKey_0(v82, l_Asset_0) else v82;
        if v86 and v75[v87] ~= nil then
            table.insert(l_v79_0, (v63(v82, v75[v87], true)));
        end;
        v79 = l_v79_0;
    end;
    for v88, v89 in v72.bundlePurchaseStatus do
        local l_v79_1 = v79;
        local l_Bundle_0 = v29.ItemType.Bundle;
        local v92 = true;
        if v89 ~= "Success" then
            v92 = v89 == "AlreadyOwned";
        end;
        local v93 = if l_Bundle_0 ~= nil then l_getTryOnItemReducerKey_0(v88, l_Bundle_0) else v88;
        if v92 and v75[v93] ~= nil then
            table.insert(l_v79_1, (v63(v88, v75[v93], true)));
        end;
        v79 = l_v79_1;
    end;
    if v77 and v78 and v78.autoSaveNextNewSaveData then
        v78.autoSaveNextNewSaveData();
    end;
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
    end;
    v73:dispatch(v35(v79, v74, nil, v29.LookType.Avatar));
    if v36() and not v77 then
        v73:dispatch(v34(l_PeekViewState_0.Closed));
    end;
end;
local function v105(v95, v96, v97, v98, v99) --[[ Line: 187 ]] --[[ Name: handleSaveAsCharacter ]]
    -- upvalues: v39 (copy), v38 (copy), v20 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (copy), v29 (copy), l_SaveAsMakeupLookThunk_0 (copy), v15 (copy)
    local v100 = v95:getState();
    local v101 = v100.AvatarExperience.AvatarScene.Looks[v96];
    local v102 = if v101 and v101.name then v101.name else nil;
    local v103 = v39.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v100);
    local v104 = nil;
    v104 = v38() and v102 or v20;
    if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 and v101 and v101.lookType == v29.LookType.Makeup then
        v95:dispatch(l_SaveAsMakeupLookThunk_0(v98, v104, v99));
        return;
    else
        v95:dispatch((v15(v104, v97, function() --[[ Line: 207 ]]
            return true;
        end, nil, v103)));
        return;
    end;
end;
return function(v106, v107, v108, v109, v110, v111, v112, v113, v114, v115, v116, v117, v118, v119) --[[ Line: 224 ]] --[[ Name: handleLooksPurchaseSuccess ]]
    -- upvalues: l_PurchaseLookStatusEnum_0 (copy), v58 (copy), v13 (copy), v14 (copy), v3 (copy), v10 (copy), v11 (copy), l_AvatarScreenProperties_0 (copy), v27 (copy), v29 (copy), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v4 (copy), l_UnifiedEventLogEnums_0 (copy), l_mutedError_0 (copy), v7 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v12 (copy), v16 (copy), v94 (copy), v105 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (copy), l_setTimeout_0 (copy), v9 (copy), v2 (copy), v49 (copy)
    return function(v120) --[[ Line: 240 ]]
        -- upvalues: v106 (copy), l_PurchaseLookStatusEnum_0 (ref), v58 (ref), v13 (ref), v14 (ref), v108 (copy), v3 (ref), v10 (ref), v115 (ref), v11 (ref), v119 (copy), l_AvatarScreenProperties_0 (ref), v27 (ref), v107 (copy), v29 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), v110 (copy), l_mutedError_0 (ref), v117 (copy), v7 (ref), v109 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v116 (copy), v12 (ref), v16 (ref), v94 (ref), v111 (copy), v112 (copy), v114 (copy), v113 (copy), v105 (ref), v118 (copy), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (ref), l_setTimeout_0 (ref), v9 (ref), v2 (ref), v49 (ref)
        local l_v106_0 = v106;
        local v122 = true;
        if l_v106_0.purchaseLookStatus ~= l_PurchaseLookStatusEnum_0.Success then
            v122 = l_v106_0.purchaseLookStatus == l_PurchaseLookStatusEnum_0.PartialSuccess;
        end;
        if v122 and type(l_v106_0) == "table" then
            local l_l_v106_0_0 = l_v106_0;
            local v124 = 0;
            local v125 = 0;
            local v126 = {};
            local v127 = {};
            local v128, v129, v130 = v58(v120, l_l_v106_0_0.assetPurchaseStatus, v13, v124, v125, v126);
            v124 = v128;
            v125 = v129;
            v126 = v130;
            v128, v129, v130 = v58(v120, l_l_v106_0_0.bundlePurchaseStatus, v14, v124, v125, v127);
            v124 = v128;
            v125 = v129;
            v127 = v130;
            v128 = v108;
            v129 = v120:getState().LocalUserId;
            v3.isNonEmptyString(v129, "Thunk.PurchaseProduct.updateRobux.localUserId");
            if typeof(v129) == "string" and v129 ~= "" then
                v120:dispatch(v10(v128, v129, true));
            end;
            v128 = nil;
            v129 = nil;
            v130 = nil;
            local v131 = nil;
            local v132 = nil;
            local v133 = v120:getState();
            if v115 then
                v128 = v115.query;
            else
                local v134, v135, v136, v137, v138 = v11.getAvatarsTabAnalyticsInfo(v133);
                v128 = v134;
                v129 = v135;
                v130 = v136;
                v131 = v137;
                v132 = v138;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 282 ]]
                -- upvalues: v120 (copy), v119 (ref), l_AvatarScreenProperties_0 (ref), v27 (ref), v115 (ref), v126 (ref), v127 (ref), v107 (ref), v29 (ref), l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), v128 (ref), v110 (ref)
                local v139 = v120:getState().Navigation and v120:getState().Navigation.currentRoute;
                local v140 = nil;
                local v141 = nil;
                if v119 and v119.current and v119.opaque then
                    v141 = v119.opaque.name;
                elseif v139.params and v139.params.extraProps then
                    v141 = v139.params.extraProps.routeName;
                end;
                v140 = l_AvatarScreenProperties_0[v141];
                local v142 = if v27 then v115 == nil else nil;
                local v143 = nil;
                local v144 = nil;
                if v27 and #v126 > 0 then
                    v143 = table.concat(v126, ",");
                end;
                if v27 and #v127 > 0 then
                    v144 = table.concat(v127, ",");
                end;
                local l_LookAnalyticsInfo_0 = v120:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
                local v146 = false;
                if v107[v29.WearAfterPurchasePostPurchaseActionKey] then
                    v146 = v107[v29.WearAfterPurchasePostPurchaseActionKey];
                end;
                local v147 = false;
                if v107[v29.SaveAsCharacterPostPurchaseActionKey] then
                    v147 = v107[v29.SaveAsCharacterPostPurchaseActionKey];
                end;
                local v148 = nil;
                if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then
                    if v115 and v115.surface then
                        v148 = v115.surface;
                    elseif v140 and v140.analyticsData then
                        v148 = v140.analyticsData.unifiedLoggingSurface;
                    end;
                end;
                local v149 = l_LookAnalyticsInfo_0 or {
                    widgetType = nil
                };
                l_sendUnifiedEventForDeferredAction_0(v4.Dictionary.join(v120:getState().AvatarExperience.AnalyticsMetadata, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                    itemType = if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else nil, 
                    keyword = v128, 
                    surface = if l_FFlagAXFixAvatarInDiscoveryUnifiedLoggingPurchaseSuccess_0 then v148 else if v140 and v140.analyticsData then v140.analyticsData.unifiedLoggingSurface else nil, 
                    organicAssetIds = if v27 and v142 then v143 else nil, 
                    organicBundleIds = if v27 and v142 then v144 else nil, 
                    organicItemPrice = if v27 and v142 then v110 else nil, 
                    assetIds = if not v27 or v142 then nil else v143, 
                    bundleIds = if not v27 or v142 then nil else v144, 
                    widgetItemPrice = if not v27 or v142 then nil else v110, 
                    widgetItemWearAfterPurchase = if v149.widgetType then v146 else nil, 
                    organicItemWearAfterPurchase = if v149.widgetType then nil else v146, 
                    widgetItemSaveToMyAvatars = if v149.widgetType then v147 else nil, 
                    organicItemSaveToMyAvatars = if v149.widgetType then nil else v147
                }));
            end);
            if not l_status_0 then
                l_mutedError_0(l_result_0);
            end;
            l_l_v106_0_0 = v4.Dictionary.join(l_l_v106_0_0, {
                successCount = v124, 
                failureCount = v125
            });
            if v115 then
                v115 = v4.Dictionary.join(v115, {
                    assetIds = v126
                });
                if #v126 > 0 or #v127 > 0 then
                    v117.widgetInteractionV2(v115, v7.ActionType.PURCHASE_SUCCESS);
                end;
            elseif not v115 then
                v117.avatarShopBuyItem(v109, l_ItemTypeEnum_0.Look, v110, v132, v131, v128, v129, v130, v120:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v116 then v116.getParam(v29.NavigationParams.fromSurface) else nil);
            end;
            if #v126 > 0 or #v127 > 0 then
                v12.GetLookDetailsV2(v108, v109):andThen(function(v152) --[[ Line: 395 ]]
                    -- upvalues: v120 (copy), v16 (ref), v109 (ref), v126 (ref), v127 (ref)
                    local l_look_0 = v152.responseBody.look;
                    if l_look_0 then
                        local v154 = true;
                        for _, v156 in l_look_0.items do
                            if not v156.quantityOwned or v156.quantityOwned == 0 then
                                v154 = false;
                                break;
                            end;
                        end;
                        v120:dispatch(v16(v109, v126, v127, v154));
                    end;
                end);
            end;
            if v107[v29.WearAfterPurchasePostPurchaseActionKey] then
                v94(l_l_v106_0_0, v120, v116, v111, v112, v114, v113);
            end;
            if v107[v29.SaveAsCharacterPostPurchaseActionKey] then
                local function v157() --[[ Line: 430 ]] --[[ Name: handleSaveAsCharacterWrapper ]]
                    -- upvalues: v105 (ref), v120 (copy), v109 (ref), v118 (ref), l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 (ref), v108 (ref), v111 (ref)
                    v105(v120, v109, v118, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v108 else nil, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v111 else nil);
                end;
                if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then
                    local v158 = v120:getState().AvatarExperience.AvatarScene.Looks[v109];
                    if v158 and v158.lookType == v29.LookType.Makeup then
                        v105(v120, v109, v118, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v108 else nil, if l_FFlagAXUnifiedPurchasePromptMakeupLooksSaveLookType_0 then v111 else nil);
                    else
                        l_setTimeout_0(v157, v9);
                    end;
                else
                    l_setTimeout_0(v157, v9);
                end;
            end;
            return v2.resolve(l_l_v106_0_0);
        else
            local l_v49_0 = v49;
            return v2.reject(l_v49_0);
        end;
    end;
end;