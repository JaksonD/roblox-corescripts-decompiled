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
local v26 = game:DefineFastFlag("AXUnifiedSubsetOfLook", false);
local l_ItemTypeEnum_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon).Enums.ItemTypeEnum;
local v28 = require(l_Modules_0.AvatarExperience.Common.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_getTryOnItemReducerKey_0 = v25.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v25.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v35 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName);
local v38 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_FFlagAXFixPurchaseSurfaceLogging_0 = v6.FFlagAXFixPurchaseSurfaceLogging;
local function _(v41, v42) --[[ Line: 55 ]] --[[ Name: updateRobux ]]
    -- upvalues: v3 (copy), v10 (copy)
    local l_LocalUserId_0 = v42:getState().LocalUserId;
    v3.isNonEmptyString(l_LocalUserId_0, "Thunk.PurchaseProduct.updateRobux.localUserId");
    if typeof(l_LocalUserId_0) == "string" and l_LocalUserId_0 ~= "" then
        v42:dispatch(v10(v41, l_LocalUserId_0, true));
    end;
end;
local v45 = {
    HttpError = Enum.HttpError.OK
};
local function v54(v46, v47, v48, v49, v50, v51) --[[ Line: 65 ]]
    -- upvalues: l_PurchaseLookItemStatusEnum_0 (copy)
    for v52, v53 in v47 do
        if v53 == l_PurchaseLookItemStatusEnum_0.Success or v53 == l_PurchaseLookItemStatusEnum_0.AlreadyOwned then
            v49 = v49 + 1;
            v46:dispatch(v48(v52, true));
            if v53 == l_PurchaseLookItemStatusEnum_0.Success then
                table.insert(v51, (tonumber(v52)));
            end;
        else
            v50 = v50 + 1;
        end;
    end;
    return v49, v50, v51;
end;
local function v59(v55, v56, v57) --[[ Line: 92 ]] --[[ Name: formatItemForWearAfterPurchase ]]
    -- upvalues: v28 (copy)
    local v58 = v56.itemType == v28.ItemType.Bundle;
    return {
        assetId = if not v58 then v55 else nil, 
        assetIsWearable = not v58, 
        assetType = if v58 then v28.ItemType.Bundle else nil, 
        bundleId = if v58 then v55 else nil, 
        itemSubType = v56.itemSubType, 
        overrideOrder = v56.order, 
        overrideAdjustments = {
            position = v56.position, 
            rotation = v56.rotation, 
            scale = v56.scale
        }, 
        owned = true, 
        purchased = v57, 
        tryOnBundleInfo = if v58 then v56.bundleInfo else nil
    };
end;
local function _(v60, v61, v62, v63, v64) --[[ Line: 113 ]] --[[ Name: processItem ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), v59 (copy)
    local v65 = true;
    if v63 ~= "Success" then
        v65 = v63 == "AlreadyOwned";
    end;
    local v66 = if v64 ~= nil then l_getTryOnItemReducerKey_0(v62, v64) else v62;
    if v65 and v61[v66] ~= nil then
        table.insert(v60, (v59(v62, v61[v66], true)));
    end;
    return v60;
end;
local function v90(v68, v69, v70, v71, v72, v73, v74) --[[ Line: 127 ]] --[[ Name: handleWearAfterPurchase ]]
    -- upvalues: v59 (copy), v28 (copy), l_getTryOnItemReducerKey_0 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v34 (copy), v35 (copy), v33 (copy), l_PeekViewState_0 (copy)
    local v75 = {};
    for _, v77 in v72 do
        table.insert(v75, (v59(v77.itemId, v77, false)));
    end;
    for v78, v79 in v68.assetPurchaseStatus do
        local l_v75_0 = v75;
        local l_Asset_0 = v28.ItemType.Asset;
        local v82 = true;
        if v79 ~= "Success" then
            v82 = v79 == "AlreadyOwned";
        end;
        local v83 = if l_Asset_0 ~= nil then l_getTryOnItemReducerKey_0(v78, l_Asset_0) else v78;
        if v82 and v71[v83] ~= nil then
            table.insert(l_v75_0, (v59(v78, v71[v83], true)));
        end;
        v75 = l_v75_0;
    end;
    for v84, v85 in v68.bundlePurchaseStatus do
        local l_v75_1 = v75;
        local l_Bundle_0 = v28.ItemType.Bundle;
        local v88 = true;
        if v85 ~= "Success" then
            v88 = v85 == "AlreadyOwned";
        end;
        local v89 = if l_Bundle_0 ~= nil then l_getTryOnItemReducerKey_0(v84, l_Bundle_0) else v84;
        if v88 and v71[v89] ~= nil then
            table.insert(l_v75_1, (v59(v84, v71[v89], true)));
        end;
        v75 = l_v75_1;
    end;
    if v73 and v74 and v74.autoSaveNextNewSaveData then
        v74.autoSaveNextNewSaveData();
    end;
    if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
        l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
    end;
    v69:dispatch(v34(v75, v70, nil, v28.LookType.Avatar));
    if v35() and not v73 then
        v69:dispatch(v33(l_PeekViewState_0.Closed));
    end;
end;
local function v99(v91, v92, v93) --[[ Line: 180 ]] --[[ Name: handleSaveAsCharacter ]]
    -- upvalues: v38 (copy), v37 (copy), v20 (copy), v15 (copy)
    local v94 = v91:getState();
    local v95 = v94.AvatarExperience.AvatarScene.Looks[v92];
    local v96 = if v95 and v95.name then v95.name else nil;
    local v97 = v38.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v94);
    local v98 = nil;
    v98 = v37() and v96 or v20;
    v91:dispatch(v15(v98, v93, function() --[[ Line: 193 ]]
        return true;
    end, nil, v97));
end;
return function(v100, v101, v102, v103, v104, v105, v106, v107, v108, v109, v110, v111, v112, v113) --[[ Line: 209 ]] --[[ Name: handleLooksPurchaseSuccess ]]
    -- upvalues: l_PurchaseLookStatusEnum_0 (copy), v54 (copy), v13 (copy), v14 (copy), v3 (copy), v10 (copy), v11 (copy), l_AvatarScreenProperties_0 (copy), v26 (copy), v28 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), v4 (copy), l_UnifiedEventLogEnums_0 (copy), l_mutedError_0 (copy), v7 (copy), l_ItemTypeEnum_0 (copy), l_FFlagAXFixPurchaseSurfaceLogging_0 (copy), v12 (copy), v16 (copy), v90 (copy), v99 (copy), l_setTimeout_0 (copy), v9 (copy), v2 (copy), v45 (copy)
    return function(v114) --[[ Line: 225 ]]
        -- upvalues: v100 (copy), l_PurchaseLookStatusEnum_0 (ref), v54 (ref), v13 (ref), v14 (ref), v102 (copy), v3 (ref), v10 (ref), v109 (ref), v11 (ref), v113 (copy), l_AvatarScreenProperties_0 (ref), v26 (ref), v101 (copy), v28 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), v104 (copy), l_mutedError_0 (ref), v111 (copy), v7 (ref), v103 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXFixPurchaseSurfaceLogging_0 (ref), v110 (copy), v12 (ref), v16 (ref), v90 (ref), v105 (copy), v106 (copy), v108 (copy), v107 (copy), v99 (ref), v112 (copy), l_setTimeout_0 (ref), v9 (ref), v2 (ref), v45 (ref)
        local l_v100_0 = v100;
        local v116 = true;
        if l_v100_0.purchaseLookStatus ~= l_PurchaseLookStatusEnum_0.Success then
            v116 = l_v100_0.purchaseLookStatus == l_PurchaseLookStatusEnum_0.PartialSuccess;
        end;
        if v116 and type(l_v100_0) == "table" then
            local l_l_v100_0_0 = l_v100_0;
            local v118 = 0;
            local v119 = 0;
            local v120 = {};
            local v121 = {};
            local v122, v123, v124 = v54(v114, l_l_v100_0_0.assetPurchaseStatus, v13, v118, v119, v120);
            v118 = v122;
            v119 = v123;
            v120 = v124;
            v122, v123, v124 = v54(v114, l_l_v100_0_0.bundlePurchaseStatus, v14, v118, v119, v121);
            v118 = v122;
            v119 = v123;
            v121 = v124;
            v122 = v102;
            v123 = v114:getState().LocalUserId;
            v3.isNonEmptyString(v123, "Thunk.PurchaseProduct.updateRobux.localUserId");
            if typeof(v123) == "string" and v123 ~= "" then
                v114:dispatch(v10(v122, v123, true));
            end;
            v122 = nil;
            v123 = nil;
            v124 = nil;
            local v125 = nil;
            local v126 = nil;
            local v127 = v114:getState();
            if v109 then
                v122 = v109.query;
            else
                local v128, v129, v130, v131, v132 = v11.getAvatarsTabAnalyticsInfo(v127);
                v122 = v128;
                v123 = v129;
                v124 = v130;
                v125 = v131;
                v126 = v132;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 267 ]]
                -- upvalues: v114 (copy), v113 (ref), l_AvatarScreenProperties_0 (ref), v26 (ref), v109 (ref), v120 (ref), v121 (ref), v101 (ref), v28 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), v4 (ref), l_UnifiedEventLogEnums_0 (ref), v122 (ref), v104 (ref)
                local v133 = v114:getState().Navigation and v114:getState().Navigation.currentRoute;
                local v134 = nil;
                local v135 = nil;
                if v113 and v113.current and v113.opaque then
                    v135 = v113.opaque.name;
                elseif v133.params and v133.params.extraProps then
                    v135 = v133.params.extraProps.routeName;
                end;
                v134 = l_AvatarScreenProperties_0[v135];
                local v136 = if v26 then v109 == nil else nil;
                local v137 = nil;
                local v138 = nil;
                if v26 and #v120 > 0 then
                    v137 = table.concat(v120, ",");
                end;
                if v26 and #v121 > 0 then
                    v138 = table.concat(v121, ",");
                end;
                local l_LookAnalyticsInfo_0 = v114:getState().AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
                local v140 = false;
                if v101[v28.WearAfterPurchasePostPurchaseActionKey] then
                    v140 = v101[v28.WearAfterPurchasePostPurchaseActionKey];
                end;
                local v141 = false;
                if v101[v28.SaveAsCharacterPostPurchaseActionKey] then
                    v141 = v101[v28.SaveAsCharacterPostPurchaseActionKey];
                end;
                local v142 = l_LookAnalyticsInfo_0 or {
                    widgetType = nil
                };
                l_sendUnifiedEventForDeferredAction_0(v4.Dictionary.join(v114:getState().AvatarExperience.AnalyticsMetadata, {
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.PURCHASE_SUCCESS, 
                    keyword = v122, 
                    surface = if v134 and v134.analyticsData then v134.analyticsData.unifiedLoggingSurface else nil, 
                    organicAssetIds = if v26 and v136 then v137 else nil, 
                    organicBundleIds = if v26 and v136 then v138 else nil, 
                    organicItemPrice = if v26 and v136 then v104 else nil, 
                    assetIds = if not v26 or v136 then nil else v137, 
                    bundleIds = if not v26 or v136 then nil else v138, 
                    widgetItemPrice = if not v26 or v136 then nil else v104, 
                    widgetItemWearAfterPurchase = if v142.widgetType then v140 else nil, 
                    organicItemWearAfterPurchase = if v142.widgetType then nil else v140, 
                    widgetItemSaveToMyAvatars = if v142.widgetType then v141 else nil, 
                    organicItemSaveToMyAvatars = if v142.widgetType then nil else v141
                }));
            end);
            if not l_status_0 then
                l_mutedError_0(l_result_0);
            end;
            l_l_v100_0_0 = v4.Dictionary.join(l_l_v100_0_0, {
                successCount = v118, 
                failureCount = v119
            });
            if v109 then
                v109 = v4.Dictionary.join(v109, {
                    assetIds = v120
                });
                if #v120 > 0 or #v121 > 0 then
                    v111.widgetInteractionV2(v109, v7.ActionType.PURCHASE_SUCCESS);
                end;
            elseif not v109 then
                v111.avatarShopBuyItem(v103, l_ItemTypeEnum_0.Look, v104, v126, v125, v122, v123, v124, v114:getState().AvatarExperience.AnalyticsMetadata, if l_FFlagAXFixPurchaseSurfaceLogging_0 and v110 then v110.getParam(v28.NavigationParams.fromSurface) else nil);
            end;
            if #v120 > 0 or #v121 > 0 then
                v12.GetLookDetailsV2(v102, v103):andThen(function(v145) --[[ Line: 365 ]]
                    -- upvalues: v114 (copy), v16 (ref), v103 (ref), v120 (ref), v121 (ref)
                    local l_look_0 = v145.responseBody.look;
                    if l_look_0 then
                        local v147 = true;
                        for _, v149 in l_look_0.items do
                            if not v149.quantityOwned or v149.quantityOwned == 0 then
                                v147 = false;
                                break;
                            end;
                        end;
                        v114:dispatch(v16(v103, v120, v121, v147));
                    end;
                end);
            end;
            if v101[v28.WearAfterPurchasePostPurchaseActionKey] then
                v90(l_l_v100_0_0, v114, v110, v105, v106, v108, v107);
            end;
            if v101[v28.SaveAsCharacterPostPurchaseActionKey] then
                l_setTimeout_0(function() --[[ Line: 400 ]] --[[ Name: handleSaveAsCharacterWrapper ]]
                    -- upvalues: v99 (ref), v114 (copy), v103 (ref), v112 (ref)
                    v99(v114, v103, v112);
                end, v9);
            end;
            return v2.resolve(l_l_v100_0_0);
        else
            local l_v45_0 = v45;
            return v2.reject(l_v45_0);
        end;
    end;
end;