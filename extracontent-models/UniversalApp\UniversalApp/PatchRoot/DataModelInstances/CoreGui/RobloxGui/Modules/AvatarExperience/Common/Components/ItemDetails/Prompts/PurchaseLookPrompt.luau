local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_setTimeout_0 = require(l_CorePackages_0.Packages.LuauPolyfill).setTimeout;
local v5 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local v8 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v9 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.CreateOutfit);
local l_SaveAsMakeupLookThunk_0 = v7.Thunks.SaveAsMakeupLookThunk;
local v11 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v12 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.PurchasePromptInteractiveAlert);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.PurchaseLooksProduct);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.WearAfterOutfitPurchase);
local v16 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v18 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v19 = require(l_Modules_0.LuaApp.mutedError);
local v20 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v21 = require(l_Modules_0.AvatarExperience.Common.Components.withOverlayFocusHandling);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams);
local v23 = require(l_Modules_0.AvatarExperience.Common.Util.CharacterManagerUtils);
local v24 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v25 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v26 = require(l_Modules_0.LuaApp.Hooks.useLocalization);
local v27 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v28 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v29 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local l_getUseSelectorDeepEquals_0 = v6.Utils.getUseSelectorDeepEquals;
local l_getTryOnItemReducerKey_0 = v6.Utils.getTryOnItemReducerKey;
local l_avatarLastEquippedStateStore_0 = v6.Stores.AvatarLastEquippedStateStore.avatarLastEquippedStateStore;
local l_useAvatarSaveContext_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSave).Context.useAvatarSaveContext;
local l_useTriggerFeedback_0 = require(l_CorePackages_0.Workspace.Packages.InteractionFeedback).useTriggerFeedback;
local l_useDispatch_0 = v3.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v3.Hooks.RoactRodux.useSelector;
local l_sendAXCounterV2_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2;
local v40 = game:DefineFastString("AXDefaultCharacterName", "Avatar");
local l_FIntAXLookOutfitCreationDelayMs_0 = v5.FIntAXLookOutfitCreationDelayMs;
local v42 = game:DefineFastFlag("SupportAlreadyOwnedItemPurchaseStatus", false);
local v43 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableSavePurchasedLooksWithLookName);
local v44 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local l_FFlagAXCatalogMakeupSupport_0 = v5.FFlagAXCatalogMakeupSupport;
local l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 = v5.FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup;
local v48 = l_FFlagAXRootSlotBasedEditorFlag_0 and game:DefineFastFlag("AXDisableCharacterSaveToast", false);
local v49 = require(l_Modules_0.LuaApp.Thunks.Fraud.OpenCentralOverlayForEconomicRestrictionPrompt);
local v50 = require(l_CorePackages_0.Workspace.Packages.IAPExperience);
local l_isEconomicRestrictionResponse_0 = v50.Utility.isEconomicRestrictionResponse;
local l_EconomicRestrictionsCounter_0 = v50.Counters.EconomicRestrictionsCounter;
local l_UniversalEconomicRestrictionsCounter_0 = l_EconomicRestrictionsCounter_0.UniversalEconomicRestrictionsCounter;
local l_EconomicRestrictionsSurface_0 = l_EconomicRestrictionsCounter_0.EconomicRestrictionsSurface;
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local l_parseEconomicRestrictionsFailureReason_0 = v50.Utility.parseEconomicRestrictionsFailureReason;
local l_parseEconomicRestrictionsExpirationTimeInMinutes_0 = v50.Utility.parseEconomicRestrictionsExpirationTimeInMinutes;
local function _(v58) --[[ Line: 98 ]] --[[ Name: PurchaseResolveNav ]]
    -- upvalues: v20 (copy)
    v20.closeOverlay(v58);
end;
local function v64(v60, v61, v62) --[[ Line: 106 ]] --[[ Name: formatItemForWearAfterPurchase ]]
    -- upvalues: v12 (copy)
    local v63 = v61.itemType == v12.ItemType.Bundle;
    return {
        assetId = if not v63 then v60 else nil, 
        assetIsWearable = not v63, 
        assetType = if v63 then v12.ItemType.Bundle else nil, 
        bundleId = if v63 then v60 else nil, 
        itemSubType = v61.itemSubType, 
        overrideOrder = v61.order, 
        overrideAdjustments = {
            position = v61.position, 
            rotation = v61.rotation, 
            scale = v61.scale
        }, 
        owned = true, 
        purchased = v62, 
        tryOnBundleInfo = if v63 then v61.bundleInfo else nil
    };
end;
local function v73(v65, v66, v67, v68, v69, v70) --[[ Line: 127 ]] --[[ Name: processItem ]]
    -- upvalues: v42 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_getTryOnItemReducerKey_0 (copy), v64 (copy)
    local v71 = true;
    if v68 ~= "Success" then
        v71 = v42 and v68 == "AlreadyOwned";
    end;
    local v72 = if v69 ~= nil and (not (v70 ~= v12.LookType.Avatar) or l_FFlagAXCatalogMakeupSupport_0 and v70 == v12.LookType.Makeup) then l_getTryOnItemReducerKey_0(v67, v69) else v67;
    if v71 and v66[v72] ~= nil then
        table.insert(v65, (v64(v67, v66[v72], true)));
    end;
    return v65;
end;
local function v85(v74, v75, v76) --[[ Line: 159 ]] --[[ Name: ShowToasts ]]
    -- upvalues: v25 (copy), v24 (copy)
    local l_successCount_0 = v74.successCount;
    local l_failureCount_0 = v74.failureCount;
    if l_successCount_0 > 0 and l_failureCount_0 <= 0 then
        local v79 = if l_successCount_0 == 1 then v76:Format("Feature.Avatar.Message.LooksPurchaseSuccessSingular", {
            numItems = l_successCount_0
        }) else v76:Format("Feature.Avatar.Message.LooksPurchaseSuccessPlural", {
            numItems = l_successCount_0
        });
        local v80 = {
            isLocalized = true, 
            toastMessage = v79, 
            toastType = v25.PurchaseMessage
        };
        v75(v24(v80));
        return;
    elseif l_successCount_0 > 0 and l_failureCount_0 > 0 then
        local v81 = nil;
        v81 = l_successCount_0 == 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSS" or l_successCount_0 == 1 and l_failureCount_0 > 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericSP" or l_successCount_0 > 1 and l_failureCount_0 == 1 and "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPS" or "Feature.Avatar.Message.LooksPurchasePartialSuccessGenericPP";
        local v82 = {
            numSuccessItems = l_successCount_0, 
            numFailureItems = l_failureCount_0
        };
        local v83 = {
            isLocalized = true, 
            toastMessage = v76:Format("Feature.Avatar.Heading.LooksPurchasePartialSuccess"), 
            toastSubMessage = v76:Format(v81, v82), 
            toastType = v25.NetworkingError
        };
        v75(v24(v83));
        return;
    elseif l_successCount_0 <= 0 and l_failureCount_0 > 0 then
        local v84 = {
            isLocalized = true, 
            toastMessage = v76:Format("Feature.Avatar.Heading.LooksPurchaseFailed"), 
            toastSubMessage = v76:Format("Feature.Avatar.Message.LooksPurchaseFailedNetworkError"), 
            toastType = v25.NetworkingError
        };
        v75(v24(v84));
        return;
    else
        return;
    end;
end;
return (v22((v21(function(v86) --[[ Line: 224 ]] --[[ Name: PurchaseLookPrompt ]]
    -- upvalues: v27 (copy), v29 (copy), l_useDispatch_0 (copy), v28 (copy), v8 (copy), v16 (copy), l_useTriggerFeedback_0 (copy), v2 (copy), l_useAvatarSaveContext_0 (copy), l_useSelector_0 (copy), l_getUseSelectorDeepEquals_0 (copy), v23 (copy), v43 (copy), v26 (copy), v12 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v25 (copy), v24 (copy), v64 (copy), v73 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (copy), l_avatarLastEquippedStateStore_0 (copy), v15 (copy), v44 (copy), v18 (copy), l_PeekViewState_0 (copy), v40 (copy), v11 (copy), l_SaveAsMakeupLookThunk_0 (copy), v48 (copy), v9 (copy), l_parseEconomicRestrictionsFailureReason_0 (copy), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (copy), l_default_0 (copy), l_UniversalEconomicRestrictionsCounter_0 (copy), l_EconomicRestrictionsSurface_0 (copy), v20 (copy), v49 (copy), v14 (copy), v85 (copy), l_setTimeout_0 (copy), l_FIntAXLookOutfitCreationDelayMs_0 (copy), l_sendAXCounterV2_0 (copy), v19 (copy), l_isEconomicRestrictionResponse_0 (copy), v13 (copy)
    local v87 = v27(v29);
    local v88 = l_useDispatch_0();
    local v89 = v27(v28);
    local v90 = v27(v8);
    local v91 = v27(v16);
    local v92 = l_useTriggerFeedback_0();
    local v93, v94 = v2.useState(false);
    local v95, v96 = v2.useState(true);
    local v97, v98 = v2.useState(true);
    local v99 = l_useAvatarSaveContext_0();
    local v101 = l_useSelector_0(function(v100) --[[ Line: 237 ]]
        return v100.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
    end);
    local v103 = l_useSelector_0(function(v102) --[[ Line: 241 ]]
        return v102.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
    end, l_getUseSelectorDeepEquals_0());
    local v105 = l_useSelector_0(function(v104) --[[ Line: 245 ]]
        return v104.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype;
    end, l_getUseSelectorDeepEquals_0());
    local v107 = l_useSelector_0(function(v106) --[[ Line: 249 ]]
        return v106.AvatarExperience.AvatarEditor.OutfitInfos;
    end, l_getUseSelectorDeepEquals_0());
    local v109 = l_useSelector_0(function(v108) --[[ Line: 253 ]]
        -- upvalues: v23 (ref)
        return v23.getCombinedHumanoidDescriptionFromEquippedAndOutfitTryOn(v108);
    end, l_getUseSelectorDeepEquals_0());
    local v112 = l_useSelector_0(function(v110) --[[ Line: 257 ]]
        -- upvalues: v86 (copy)
        local v111 = v110.AvatarExperience.AvatarScene.Looks[v86.lookId];
        if v111 then
            return v111.lookType;
        else
            return nil;
        end;
    end, l_getUseSelectorDeepEquals_0());
    local v113 = nil;
    if v43() then
        v113 = l_useSelector_0(function(v114) --[[ Line: 265 ]]
            -- upvalues: v86 (copy)
            local v115 = v114.AvatarExperience.AvatarScene.Looks[v86.lookId];
            if v115 and v115.name then
                return v115.name;
            else
                return nil;
            end;
        end, l_getUseSelectorDeepEquals_0());
    end;
    local v116 = v26({
        buyButtonText = v112 == v12.LookType.Avatar and "Feature.Avatar.Title.BuyAvatar" or l_FFlagAXCatalogMakeupSupport_0 and v112 == v12.LookType.Makeup and "Feature.Avatar.Title.BuyMakeup" or "Feature.Avatar.Title.BuyOutfit", 
        buyLookQuestion = v112 == v12.LookType.Avatar and "Feature.Avatar.Label.BuyAvatarQuestion" or l_FFlagAXCatalogMakeupSupport_0 and v112 == v12.LookType.Makeup and "Feature.Avatar.Label.BuyMakeupQuestion" or "Feature.Avatar.Label.BuyLookQuestion", 
        buyLookTitle = v112 == v12.LookType.Avatar and "Feature.Avatar.Title.BuyAvatar" or l_FFlagAXCatalogMakeupSupport_0 and v112 == v12.LookType.Makeup and "Feature.Avatar.Title.BuyMakeup" or "Feature.Avatar.Title.BuyOutfit", 
        getButtonText = "Feature.Catalog.Label.Get", 
        getLookQuestion = "Feature.Avatar.Label.GetLookQuestion", 
        getLookTitle = "Feature.Avatar.Title.GetOutfit", 
        characterSavedHeading = "Feature.Avatar.Heading.LooksCharacterSaved", 
        characterSavedMsg = "Feature.Avatar.Message.LooksCharacterSaved", 
        makeupLookSavedHeading = "Feature.Avatar.Heading.MakeupLookSaved", 
        makeupLookSavedMsg = "Feature.Avatar.Message.MakeupLookSaved"
    });
    local function v117() --[[ Line: 300 ]]
        -- upvalues: v96 (copy), v95 (copy)
        v96(not v95);
    end;
    local function v118() --[[ Line: 304 ]]
        -- upvalues: v98 (copy), v97 (copy)
        v98(not v97);
    end;
    local function v121(v119) --[[ Line: 309 ]]
        -- upvalues: v116 (copy), v25 (ref), v88 (copy), v24 (ref)
        if not v119 then
            return;
        else
            local v120 = {
                isLocalized = true, 
                toastMessage = v116.characterSavedHeading, 
                toastSubMessage = v116.characterSavedMsg, 
                toastType = v25.SuccessConfirmation
            };
            v88(v24(v120));
            return;
        end;
    end;
    local function v123() --[[ Line: 325 ]]
        -- upvalues: v116 (copy), v25 (ref), v88 (copy), v24 (ref)
        local v122 = {
            isLocalized = true, 
            toastMessage = v116.makeupLookSavedHeading, 
            toastSubMessage = v116.makeupLookSavedMsg, 
            toastType = v25.SuccessConfirmation
        };
        v88(v24(v122));
    end;
    local function v134(v124) --[[ Line: 335 ]] --[[ Name: handleWearAfterPurchase ]]
        -- upvalues: v95 (copy), v86 (copy), v64 (ref), v112 (copy), v12 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v73 (ref), v101 (copy), v99 (copy), l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 (ref), l_avatarLastEquippedStateStore_0 (ref), v88 (copy), v15 (ref), v44 (ref), v18 (ref), l_PeekViewState_0 (ref)
        if not v95 then
            return;
        else
            local v125 = {};
            for _, v127 in v86.ownedTryOnItems do
                table.insert(v125, (v64(v127.itemId, v127, false)));
            end;
            if v112 == v12.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and v112 == v12.LookType.Makeup then
                for v128, v129 in v124.assetPurchaseStatus do
                    v125 = v73(v125, v101, v128, v129, v12.ItemType.Asset, v112);
                end;
                for v130, v131 in v124.bundlePurchaseStatus do
                    v125 = v73(v125, v101, v130, v131, v12.ItemType.Bundle, v112);
                end;
            else
                for v132, v133 in v124.itemPurchaseStatus do
                    v125 = v73(v125, v101, v132, v133);
                end;
            end;
            if v86.isTryOnFromOutsideAX and v99 and v99.autoSaveNextNewSaveData then
                v99.autoSaveNextNewSaveData();
            end;
            if l_FFlagAXRevertEquippedAssetsAfterLayeringTryOnMakeup_0 then
                l_avatarLastEquippedStateStore_0.setShouldRevertLastEquippedState(false);
            end;
            v88(v15(v125, v86.navigation, nil, v112));
            if v44() and not v86.isTryOnFromOutsideAX then
                v88(v18(l_PeekViewState_0.Closed));
            end;
            return;
        end;
    end;
    local function v138() --[[ Line: 406 ]] --[[ Name: handleSaveAsCharacter ]]
        -- upvalues: v97 (copy), v112 (copy), v12 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v43 (ref), v113 (ref), v40 (ref), v11 (ref), v105 (copy), v107 (copy), v88 (copy), l_SaveAsMakeupLookThunk_0 (ref), v87 (copy), v101 (copy), v48 (ref), v123 (copy), v9 (ref), v90 (copy), v121 (copy), v109 (copy)
        if not v97 then
            return;
        else
            local v135 = nil;
            if v112 == v12.LookType.Avatar or l_FFlagAXCatalogMakeupSupport_0 and v112 == v12.LookType.Makeup then
                v135 = if v43() and v113 then v113 else v40;
            else
                for v136 = 1, 1000 do
                    v135 = "Outfit" .. v136;
                    if not v11.isDuplicateOutfitName(v105, v107, v135) then
                        break;
                    end;
                end;
            end;
            local function v137() --[[ Line: 433 ]]
                return true;
            end;
            if l_FFlagAXCatalogMakeupSupport_0 and v112 == v12.LookType.Makeup then
                v88(l_SaveAsMakeupLookThunk_0(v87, v135, v101, if v48 then nil else v123));
                return;
            else
                v88(v9(v135, v90, v137, if v48 then nil else v121, v109));
                return;
            end;
        end;
    end;
    local function v142(v139) --[[ Line: 459 ]]
        -- upvalues: l_parseEconomicRestrictionsFailureReason_0 (ref), l_parseEconomicRestrictionsExpirationTimeInMinutes_0 (ref), l_default_0 (ref), l_UniversalEconomicRestrictionsCounter_0 (ref), l_EconomicRestrictionsSurface_0 (ref), v20 (ref), v86 (copy), v88 (copy), v49 (ref)
        local v140 = l_parseEconomicRestrictionsFailureReason_0(v139);
        local v141 = l_parseEconomicRestrictionsExpirationTimeInMinutes_0(v139);
        l_default_0:logRobloxTelemetryCounter(l_UniversalEconomicRestrictionsCounter_0, 1, {
            surface = l_EconomicRestrictionsSurface_0.AvatarExperienceLook, 
            failureReason = v140
        });
        v20.closeOverlay(v86.navigation);
        return v88(v49(v140, v141));
    end;
    local function v147() --[[ Line: 470 ]]
        -- upvalues: v93 (copy), v94 (copy), v92 (copy), v88 (copy), v14 (ref), v87 (copy), v86 (copy), v91 (copy), v85 (ref), v89 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v112 (copy), v12 (ref), v138 (copy), v134 (copy), l_setTimeout_0 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v20 (ref), l_sendAXCounterV2_0 (ref), v19 (ref), v142 (copy), l_isEconomicRestrictionResponse_0 (ref), v24 (ref), v25 (ref)
        if v93 then
            return;
        else
            v94(true);
            v92("MakePurchase", "Press");
            v88(v14(v87, v86.lookId, v86.priceInRobux, v91)):andThen(function(v143) --[[ Line: 479 ]]
                -- upvalues: v94 (ref), v85 (ref), v88 (ref), v89 (ref), l_FFlagAXCatalogMakeupSupport_0 (ref), v112 (ref), v12 (ref), v138 (ref), v134 (ref), l_setTimeout_0 (ref), l_FIntAXLookOutfitCreationDelayMs_0 (ref), v86 (ref), v20 (ref)
                v94(false);
                v85(v143, v88, v89);
                if l_FFlagAXCatalogMakeupSupport_0 and v112 == v12.LookType.Makeup then
                    v138();
                end;
                v134(v143);
                if v112 == v12.LookType.Avatar then
                    l_setTimeout_0(v138, l_FIntAXLookOutfitCreationDelayMs_0);
                elseif v112 ~= v12.LookType.Makeup then
                    v138();
                end;
                local l_navigation_0 = v86.navigation;
                v20.closeOverlay(l_navigation_0);
            end, function(v145) --[[ Line: 498 ]]
                -- upvalues: l_sendAXCounterV2_0 (ref), v12 (ref), v86 (ref), v19 (ref), v142 (ref), l_isEconomicRestrictionResponse_0 (ref), v94 (ref), v88 (ref), v24 (ref), v25 (ref), v20 (ref)
                l_sendAXCounterV2_0(v12.Counter.Errors.PurchaseLooksProductError, {
                    lookId = v86.lookId
                });
                v19("PurchaseLooksProduct error", v145);
                if v142 and l_isEconomicRestrictionResponse_0(v145) then
                    v142(v145);
                    return;
                else
                    v94(false);
                    v88(v24({
                        isLocalized = false, 
                        toastType = v25.NetworkingError, 
                        toastMessage = "CoreScripts.PurchasePrompt.PurchaseFailed.UnknownFailureNoItemName"
                    }));
                    local l_navigation_1 = v86.navigation;
                    v20.closeOverlay(l_navigation_1);
                    return;
                end;
            end);
            return;
        end;
    end;
    local function v148() --[[ Line: 519 ]]
        -- upvalues: v93 (copy), v20 (ref), v86 (copy)
        if v93 then
            return;
        else
            v20.closeOverlay(v86.navigation);
            return;
        end;
    end;
    local v149 = v86.priceInRobux == 0;
    local v150 = nil;
    local v151 = nil;
    local v152 = nil;
    if v149 then
        v150 = v116.getLookTitle;
        v151 = v116.getLookQuestion;
        v152 = v116.getButtonText;
    else
        v150 = v116.buyLookTitle;
        v151 = v116.buyLookQuestion;
        v152 = v116.buyButtonText;
    end;
    return v2.createElement(v13, {
        priceInRobux = v86.priceInRobux, 
        showWearAfterPurchase = v86.showWearAfterPurchase, 
        showSaveAsCharacter = v86.showSaveAsCharacter, 
        isWearAfterPurchaseChecked = v95, 
        isSaveAsCharacterChecked = v97, 
        toggleWearAfterPurchase = v117, 
        toggleSaveAsCharacter = v118, 
        saveIfWearAfterPurchase = v86.isTryOnFromOutsideAX, 
        lookType = v112, 
        analyticsInfo = v103, 
        titleText = v150, 
        bodyText = v151, 
        confirmButtonText = v152, 
        onConfirm = v147, 
        onCancel = v148, 
        isLoading = v93, 
        isPurchasingOutfit = true, 
        defaultChildRef = v86.defaultChildRef
    });
end))));