local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v7 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local v10 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v11 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseLooksProduct);
local v13 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v17 = require(l_Modules_0.LuaApp.mutedError);
local v18 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v19 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v21 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v22 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v23 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v24 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v25 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v26 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v27 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_getUseSelectorDeepEquals_0 = v6.Utils.getUseSelectorDeepEquals;
local l_getTryOnItemReducerKey_0 = v6.Utils.getTryOnItemReducerKey;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local v32 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local v33 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_isEconomicRestrictionResponse_0 = v33.Utility.isEconomicRestrictionResponse;
local l_EconomicRestrictionsCounter_0 = v33.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_parseEconomicRestrictionsFailureReason_0 = v33.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v33.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_useTriggerFeedback_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).useTriggerFeedback;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v45 = game:DefineFastString("AXDefaultCharacterName", "Avatar");
local l_FIntAXLookOutfitCreationDelayMs_0 = v5.FIntAXLookOutfitCreationDelayMs;
local v47 = game:DefineFastFlag("SupportAlreadyOwnedItemPurchaseStatus", false);
local v48 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName);
local v49 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v50 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag and game:DefineFastFlag("AXDisableCharacterSaveToast", false);
local function _(v51) --[[ Line: 96 ]] --[[ Name: PurchaseResolveNav ]]
    -- upvalues: v18 (copy)
    v18.closeOverlay(v51);
end;
local function v60(v53, v54, v55) --[[ Line: 104 ]] --[[ Name: formatItemForWearAfterPurchaseMIS ]]
    -- upvalues: v10 (copy)
    local v56 = v54.itemType == v10.ItemType.Bundle;
    local v57 = {};
    if v56 then
        for _, v59 in v54.assetsInBundle do
            if v59.isIncluded then
                v57[tostring(v59.id)] = {
                    assetType = tostring(v59.assetType), 
                    order = v59.order
                };
            end;
        end;
    end;
    return {
        assetId = if not v56 then v53 else nil, 
        assetIsWearable = not v56, 
        assetType = if v56 then v10.ItemType.Bundle else nil, 
        bundleId = if v56 then v53 else nil, 
        itemSubType = if v56 then tostring(v54.bundleType) else tostring(v54.assetType), 
        owned = true, 
        purchased = v55, 
        tryOnBundleInfo = if v56 then v57 else nil
    };
end;
local function v65(v61, v62, v63) --[[ Line: 135 ]] --[[ Name: formatItemForWearAfterPurchaseLegacy ]]
    -- upvalues: v10 (copy)
    local v64 = v62.itemType == v10.ItemType.Bundle;
    return {
        assetId = if not v64 then v61 else nil, 
        assetIsWearable = not v64, 
        assetType = if v64 then v10.ItemType.Bundle else nil, 
        bundleId = if v64 then v61 else nil, 
        itemSubType = v62.itemSubType, 
        overrideOrder = v62.order, 
        overrideAdjustments = {
            position = v62.position, 
            rotation = v62.rotation, 
            scale = v62.scale
        }, 
        owned = true, 
        purchased = v63, 
        tryOnBundleInfo = if v64 then v62.bundleInfo else nil
    };
end;
local _ = function(v66, v67, v68, v69, _) --[[ Line: 160 ]] --[[ Name: processItem ]]
    -- upvalues: v47 (copy), v60 (copy)
    local v71 = true;
    if v69 ~= "Success" then
        v71 = v47 and v69 == "AlreadyOwned";
    end;
    if v71 and v67[v68] ~= nil then
        table.insert(v66, (v60(v68, v67[v68], true)));
    end;
    return v66;
end;
local _ = function(v73, v74, v75, v76, v77, _) --[[ Line: 174 ]] --[[ Name: processItemLegacy ]]
    -- upvalues: v47 (copy), l_getTryOnItemReducerKey_0 (copy), v65 (copy)
    local v79 = true;
    if v76 ~= "Success" then
        v79 = v47 and v76 == "AlreadyOwned";
    end;
    local v80 = if v77 ~= nil then l_getTryOnItemReducerKey_0(v75, v77) else v75;
    if v79 and v74[v80] ~= nil then
        table.insert(v73, (v65(v75, v74[v80], true)));
    end;
    return v73;
end;
local function v93(v82, v83, v84) --[[ Line: 201 ]] --[[ Name: ShowToasts ]]
    -- upvalues: v23 (copy), v22 (copy)
    local l_successCount_0 = v82.successCount;
    local l_failureCount_0 = v82.failureCount;
    if l_successCount_0 > 0 and l_failureCount_0 <= 0 then
        local v87 = if l_successCount_0 == 1 then v84:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", {
            numItems = l_successCount_0
        }) else v84:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", {
            numItems = l_successCount_0
        });
        local v88 = {
            isLocalized = true, 
            toastMessage = v87, 
            toastType = v23.PurchaseMessage
        };
        v83(v22(v88));
        return;
    elseif l_successCount_0 > 0 and l_failureCount_0 > 0 then
        local v89 = nil;
        v89 = l_successCount_0 == 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" or l_successCount_0 == 1 and l_failureCount_0 > 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" or l_successCount_0 > 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" or "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP";
        local v90 = {
            numSuccessItems = l_successCount_0, 
            numFailureItems = l_failureCount_0
        };
        local v91 = {
            isLocalized = true, 
            toastMessage = v84:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"), 
            toastSubMessage = v84:Format(v89, v90), 
            toastType = v23.NetworkingError
        };
        v83(v22(v91));
        return;
    elseif l_successCount_0 <= 0 and l_failureCount_0 > 0 then
        local v92 = {
            isLocalized = true, 
            toastMessage = v84:Format("Feature.Avatar.Heading.LooksPurchaseFailed"), 
            toastSubMessage = v84:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"), 
            toastType = v23.NetworkingError
        };
        v83(v22(v92));
        return;
    else
        return;
    end;
end;
local function v95(v94) --[[ Line: 266 ]] --[[ Name: selectTryOnItems ]]
    return v94.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v97(v96) --[[ Line: 270 ]] --[[ Name: selectLookAnalyticsInfo ]]
    return v96.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
end;
return (v20((v19(function(v98) --[[ Line: 274 ]] --[[ Name: PurchaseLookPrompt ]]
    -- upvalues: v25 (copy), v27 (copy), l_useDispatch_0 (copy), v26 (copy), v7 (copy), v14 (copy), l_useTriggerFeedback_0 (copy), v2 (copy), l_useAvatarSaveContext_0 (copy), l_useSelector_0 (copy), v97 (copy), l_getUseSelectorDeepEquals_0 (copy), v95 (copy), v21 (copy), v48 (copy), v24 (copy), v23 (copy), v22 (copy), v65 (copy), v10 (copy), v47 (copy), l_getTryOnItemReducerKey_0 (copy), v60 (copy), v13 (copy), v49 (copy), v16 (copy), l_PeekViewState_0 (copy), v45 (copy), v9 (copy), v50 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v18 (copy), v32 (copy), v12 (copy), v93 (copy), l_setTimeout_0 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (copy), l_sendAXCounterV2_0 (copy), v17 (copy), l_isEconomicRestrictionResponse_0 (copy), v11 (copy)
    local v99 = v25(v27);
    local v100 = l_useDispatch_0();
    local v101 = v25(v26);
    local v102 = v25(v7);
    local v103 = v25(v14);
    local v104 = l_useTriggerFeedback_0();
    local v105, v106 = v2.useState(false);
    local v107, v108 = v2.useState(true);
    local v109, v110 = v2.useState(true);
    local v111 = l_useAvatarSaveContext_0();
    local v112 = l_useSelector_0(v97, l_getUseSelectorDeepEquals_0());
    local v113 = l_useSelector_0(v95, l_getUseSelectorDeepEquals_0());
    local v115 = l_useSelector_0(function(v114) --[[ Line: 290 ]]
        -- upvalues: v21 (ref)
        return v21.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v114);
    end, l_getUseSelectorDeepEquals_0());
    local v118 = l_useSelector_0(function(v116) --[[ Line: 294 ]]
        -- upvalues: v98 (copy)
        local v117 = v116.AvatarExperience.AvatarScene.Looks[v98.lookId];
        if v117 then
            return v117.lookType;
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v119 = nil;
    if v48() then
        v119 = l_useSelector_0(function(v120) --[[ Line: 302 ]]
            -- upvalues: v98 (copy)
            local v121 = v120.AvatarExperience.AvatarScene.Looks[v98.lookId];
            if v121 and v121.name then
                return v121.name;
            else
                return nil;
            end;
        end, l_getUseSelectorDeepEquals_0());
    end;
    local v122 = v24({
        buyButtonText = "Feature.Avatar.Title.BuyAvatar", 
        buyLookQuestion = "Feature.Avatar.Label.BuyAvatarQuestion", 
        buyLookTitle = "Feature.Avatar.Title.BuyAvatar", 
        getButtonText = "Feature.Catalog.Label.Get", 
        getLookQuestion = "Feature.Avatar.Label.GetLookQuestion", 
        getLookTitle = "Feature.Avatar.Title.GetOutfit", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksCharacterSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksCharacterSaved"
    });
    local function v123() --[[ Line: 320 ]]
        -- upvalues: v108 (copy), v107 (copy)
        v108(not v107);
    end;
    local function v124() --[[ Line: 324 ]]
        -- upvalues: v110 (copy), v109 (copy)
        v110(not v109);
    end;
    local function v127(v125) --[[ Line: 329 ]]
        -- upvalues: v122 (copy), v23 (ref), v100 (copy), v22 (ref)
        if not v125 then
            return;
        else
            local v126 = {
                isLocalized = true, 
                toastMessage = v122.characterSavedHeading, 
                toastSubMessage = v122.characterSavedMsg, 
                toastType = v23.SuccessConfirmation
            };
            v100(v22(v126));
            return;
        end;
    end;
    local function v162(v128) --[[ Line: 345 ]] --[[ Name: handleWearAfterPurchase ]]
        -- upvalues: v107 (copy), v98 (copy), v65 (ref), v113 (copy), v10 (ref), v118 (copy), v47 (ref), l_getTryOnItemReducerKey_0 (ref), v60 (ref), v111 (copy), v100 (copy), v13 (ref), v49 (ref), v16 (ref), l_PeekViewState_0 (ref)
        if not v107 then
            return;
        else
            local v129 = {};
            if v98.isTryOnFromOutsideAX then
                if v98.ownedTryOnItems then
                    for _, v131 in v98.ownedTryOnItems do
                        table.insert(v129, (v65(v131.itemId, v131, false)));
                    end;
                end;
                if v113 then
                    for v132, v133 in v128.assetPurchaseStatus do
                        local l_v129_0 = v129;
                        local l_v113_0 = v113;
                        local l_Asset_0 = v10.ItemType.Asset;
                        local _ = v118;
                        local v138 = true;
                        if v133 ~= "Success" then
                            v138 = v47 and v133 == "AlreadyOwned";
                        end;
                        local v139 = if l_Asset_0 ~= nil then l_getTryOnItemReducerKey_0(v132, l_Asset_0) else v132;
                        if v138 and l_v113_0[v139] ~= nil then
                            table.insert(l_v129_0, (v65(v132, l_v113_0[v139], true)));
                        end;
                        v129 = l_v129_0;
                    end;
                    for v140, v141 in v128.bundlePurchaseStatus do
                        local l_v129_1 = v129;
                        local l_v113_1 = v113;
                        local l_Bundle_0 = v10.ItemType.Bundle;
                        local _ = v118;
                        local v146 = true;
                        if v141 ~= "Success" then
                            v146 = v47 and v141 == "AlreadyOwned";
                        end;
                        local v147 = if l_Bundle_0 ~= nil then l_getTryOnItemReducerKey_0(v140, l_Bundle_0) else v140;
                        if v146 and l_v113_1[v147] ~= nil then
                            table.insert(l_v129_1, (v65(v140, l_v113_1[v147], true)));
                        end;
                        v129 = l_v129_1;
                    end;
                end;
            else
                if v98.ownedItemsInLook then
                    for _, v149 in v98.ownedItemsInLook do
                        table.insert(v129, (v60(v149.id, v149, false)));
                    end;
                end;
                if v98.allLookItems then
                    for v150, v151 in v128.assetPurchaseStatus do
                        local l_v129_2 = v129;
                        local l_allLookItems_0 = v98.allLookItems;
                        local _ = v10.ItemType.Asset;
                        local v155 = true;
                        if v151 ~= "Success" then
                            v155 = v47 and v151 == "AlreadyOwned";
                        end;
                        if v155 and l_allLookItems_0[v150] ~= nil then
                            table.insert(l_v129_2, (v60(v150, l_allLookItems_0[v150], true)));
                        end;
                        v129 = l_v129_2;
                    end;
                    for v156, v157 in v128.bundlePurchaseStatus do
                        local l_v129_3 = v129;
                        local l_allLookItems_1 = v98.allLookItems;
                        local _ = v10.ItemType.Bundle;
                        local v161 = true;
                        if v157 ~= "Success" then
                            v161 = v47 and v157 == "AlreadyOwned";
                        end;
                        if v161 and l_allLookItems_1[v156] ~= nil then
                            table.insert(l_v129_3, (v60(v156, l_allLookItems_1[v156], true)));
                        end;
                        v129 = l_v129_3;
                    end;
                end;
            end;
            if v98.isTryOnFromOutsideAX and v111 and v111.autoSaveNextNewSaveData then
                v111.autoSaveNextNewSaveData();
            end;
            v100(v13(v129, v98.navigation, nil, v118));
            if v49() and not v98.isTryOnFromOutsideAX then
                v100(v16(l_PeekViewState_0.Closed));
            end;
            return;
        end;
    end;
    local function v164() --[[ Line: 442 ]] --[[ Name: handleSaveAsCharacter ]]
        -- upvalues: v109 (copy), v48 (ref), v119 (ref), v45 (ref), v100 (copy), v9 (ref), v102 (copy), v50 (ref), v127 (copy), v115 (copy)
        if not v109 then
            return;
        else
            local v163 = nil;
            v163 = if v48() and v119 then v119 else v45;
            v100(v9(v163, v102, function() --[[ Line: 456 ]]
                return true;
            end, if v50 then nil else v127, v115));
            return;
        end;
    end;
    local v168 = v98.isTryOnFromOutsideAX and function(v165) --[[ Line: 472 ]]
        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v18 (ref), v98 (copy), v100 (copy), v32 (ref)
        local v166 = l_parseEconomicRestrictionsFailureReason_0(v165);
        local v167 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v165);
        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
            surface = l_EconomicRestrictionsSurface_0.AvatarExperienceLook, 
            failureReason = v166
        });
        v18.closeOverlay(v98.navigation);
        return v100(v32(v166, v167));
    end or nil;
    local function v173() --[[ Line: 484 ]]
        -- upvalues: v105 (copy), v106 (copy), v104 (copy), v100 (copy), v12 (ref), v99 (copy), v98 (copy), v103 (copy), v93 (ref), v101 (copy), v162 (copy), l_setTimeout_0 (ref), v164 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v18 (ref), l_sendAXCounterV2_0 (ref), v10 (ref), v17 (ref), v168 (copy), l_isEconomicRestrictionResponse_0 (ref), v22 (ref), v23 (ref)
        if v105 then
            return;
        else
            v106(true);
            v104("MakePurchase", "Press");
            v100(v12(v99, v98.lookId, v98.priceInRobux, v103)):andThen(function(v169) --[[ Line: 493 ]]
                -- upvalues: v106 (ref), v93 (ref), v100 (ref), v101 (ref), v162 (ref), l_setTimeout_0 (ref), v164 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v98 (ref), v18 (ref)
                v106(false);
                v93(v169, v100, v101);
                v162(v169);
                l_setTimeout_0(v164, l_FIntAXLookOutfitCreationDelayMs_0);
                local l_navigation_0 = v98.navigation;
                v18.closeOverlay(l_navigation_0);
            end, function(v171) --[[ Line: 500 ]]
                -- upvalues: l_sendAXCounterV2_0 (ref), v10 (ref), v98 (ref), v17 (ref), v168 (ref), l_isEconomicRestrictionResponse_0 (ref), v106 (ref), v100 (ref), v22 (ref), v23 (ref), v18 (ref)
                l_sendAXCounterV2_0(v10.Counter.Errors.PurchaseLooksProductError, {
                    lookId = v98.lookId, 
                    promptType = "PurchaseLookPromptMIS", 
                    isTryOnFromOutsideAX = tostring(v98.isTryOnFromOutsideAX)
                });
                v17("PurchaseLooksProductMIS error", v171);
                if v168 and l_isEconomicRestrictionResponse_0(v171) then
                    v168(v171);
                    return;
                else
                    v106(false);
                    v100(v22({
                        isLocalized = false, 
                        toastType = v23.NetworkingError, 
                        toastMessage = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName"
                    }));
                    local l_navigation_1 = v98.navigation;
                    v18.closeOverlay(l_navigation_1);
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v174() --[[ Line: 524 ]]
        -- upvalues: v105 (copy), v18 (ref), v98 (copy)
        if v105 then
            return;
        else
            v18.closeOverlay(v98.navigation);
            return;
        end;
    end;
    local v175 = v98.priceInRobux == 0;
    local v176 = nil;
    local v177 = nil;
    local v178 = nil;
    if v175 then
        v176 = v122.getLookTitle;
        v177 = v122.getLookQuestion;
        v178 = v122.getButtonText;
    else
        v176 = v122.buyLookTitle;
        v177 = v122.buyLookQuestion;
        v178 = v122.buyButtonText;
    end;
    return v2.createElement(v11, {
        priceInRobux = v98.priceInRobux, 
        showWearAfterPurchase = v98.showWearAfterPurchase, 
        showSaveAsCharacter = v98.showSaveAsCharacter, 
        isWearAfterPurchaseChecked = v107, 
        isSaveAsCharacterChecked = v109, 
        toggleWearAfterPurchase = v123, 
        toggleSaveAsCharacter = v124, 
        saveIfWearAfterPurchase = v98.isTryOnFromOutsideAX, 
        lookType = v118, 
        analyticsInfo = v112, 
        titleText = v176, 
        bodyText = v177, 
        confirmButtonText = v178, 
        onConfirm = v173, 
        onCancel = v174, 
        isLoading = v105, 
        isPurchasingOutfit = true, 
        defaultChildRef = v98.defaultChildRef
    });
end))));