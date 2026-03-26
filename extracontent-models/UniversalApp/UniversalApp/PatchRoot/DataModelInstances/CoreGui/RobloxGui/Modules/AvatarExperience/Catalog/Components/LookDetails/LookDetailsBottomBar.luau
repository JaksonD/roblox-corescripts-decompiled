local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_Images_0 = v4.App.ImageSet.Images;
local v9 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v12 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v13 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v14 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v15 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v15.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v15.AvatarRoute.Hooks.useAvatarRoute;
local v18 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v19 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetLookFavorite);
local v20 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBar);
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ReportLook);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame);
local v26 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v27 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useLookUnifiedPurchaseFlow);
local v28 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v31 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v32 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v33 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v35 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils);
local v36 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v37 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v42 = require(l_Modules_0.AvatarExperience.Common.Hooks.useShareButton);
local v43 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFavoriteButton);
local v44 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v47 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v48 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableLookFavoriting);
local l_getUseSelectorDeepEquals_0 = v47.Utils.getUseSelectorDeepEquals;
local l_useFocusController_0 = v9.useFocusController;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances);
local v54 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v55 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v56 = game:DefineFastFlag("AXHideShareButtonForContextMenu", false);
local v57 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMISEnableMultiShopping_0 = v57.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesSupport_0 = v57.FFlagAXDurablesSupport;
local l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 = v57.FFlagAXEnableUnifiedPurchaseFlowForLooks;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local v62 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v62.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v62.Enums.ProductPurchaseSurface;
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v62.getIsUserEligibleForUnifiedPurchaseFlow;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixLookDetailsContextualMenu_0 = v57.FFlagAXFixLookDetailsContextualMenu;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local v74 = l_Images_0["icons/common/robux"];
local v75 = l_Images_0["icons/actions/block"];
local v76 = l_Images_0["icons/menu/avatar_on"];
local v77 = l_Images_0["icons/actions/feedback"];
local v78 = l_Images_0["icons/actions/info"];
local v79 = l_Images_0["icons/actions/edit/delete"];
local function v81(v80) --[[ Line: 118 ]] --[[ Name: selectTryOnItems ]]
    return v80.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v83(v82) --[[ Line: 121 ]] --[[ Name: selectLookId ]]
    return v82.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v85(v84) --[[ Line: 124 ]] --[[ Name: selectLookDetails ]]
    return v84.AvatarExperience.AvatarScene.Looks;
end;
local function v87(v86) --[[ Line: 127 ]] --[[ Name: selectLocalUserId ]]
    return v86.LocalUserId;
end;
local function v89(v88) --[[ Line: 130 ]] --[[ Name: selectUserRobux ]]
    return v88.UserRobux;
end;
local function v91(v90) --[[ Line: 133 ]] --[[ Name: selectCollectiblesItemInfo ]]
    return v90.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
end;
local function v93(v92) --[[ Line: 136 ]] --[[ Name: selectCollectiblesResellersInstances ]]
    return v92.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
end;
local function v95(v94) --[[ Line: 139 ]] --[[ Name: selectResellableInstances ]]
    return v94.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
end;
local function v97(v96) --[[ Line: 142 ]] --[[ Name: selectPeekViewState ]]
    return v96.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local v98 = nil;
if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
    v98 = function(v99) --[[ Line: 147 ]]
        return v99.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
    end;
end;
local function _(v100, v101) --[[ Line: 152 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v29 (copy)
    local v102 = v29();
    local v103 = nil;
    local v104 = nil;
    for v105, v106 in v102 do
        if v106.Name == v100 then
            v103 = v105;
            if v101 and v106.Subcategories then
                for v107, v108 in v106.Subcategories do
                    if v108.Name == v101 then
                        return v103, v107;
                    end;
                end;
                return v103, v104;
            else
                break;
            end;
        end;
    end;
    return v103, v104;
end;
local function _(v110, v111, v112, v113, v114) --[[ Line: 177 ]] --[[ Name: getPriceForItem ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), v20 (copy)
    local l_priceInRobux_0 = v110.priceInRobux;
    if l_FFlagAXDurablesSupport_0 and v114 and v110.timedOptions then
        local v116 = v110.timedOptions[v114];
        if v116 then
            l_priceInRobux_0 = v116.price;
        end;
    end;
    if v110.collectibleItemId then
        local v117 = v20.findCheapestCollectiblePurchaseInfoV2(v110.collectibleItemId, v20.IsResellable(v110), v111, v112, v113);
        if v117.price then
            l_priceInRobux_0 = v117.price;
        end;
    end;
    return l_priceInRobux_0;
end;
local v119 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v119 = function(v120, v121, v122, v123, v124, v125, v126) --[[ Line: 213 ]]
        -- upvalues: v35 (copy), l_FFlagAXDurablesSupport_0 (copy), v20 (copy)
        local v127 = 0;
        local v128 = 0;
        local v129 = 0;
        local v130 = false;
        if not v125 then
            return v129, v127, v128, v130;
        else
            for _, v132 in v120 do
                v127 = v127 + 1;
                local v133 = v35.getItemInfo(v132.id, v132.itemType, v124, v125);
                if not v133 then
                    if not v130 then
                        v130 = true;
                    end;
                elseif not v133 or not v133.quantityOwned or v133.quantityOwned <= 0 then
                    local v134 = nil;
                    if l_FFlagAXDurablesSupport_0 and v126 then
                        for _, v136 in v126 do
                            if v136.itemId == v132.id and v136.itemType == v132.itemType then
                                v134 = v136.selectedTimedOptionIndex;
                                break;
                            end;
                        end;
                    end;
                    local v137 = if l_FFlagAXDurablesSupport_0 then v134 else nil;
                    local l_priceInRobux_1 = v133.priceInRobux;
                    if l_FFlagAXDurablesSupport_0 and v137 and v133.timedOptions then
                        local v139 = v133.timedOptions[v137];
                        if v139 then
                            l_priceInRobux_1 = v139.price;
                        end;
                    end;
                    if v133.collectibleItemId then
                        local v140 = v20.findCheapestCollectiblePurchaseInfoV2(v133.collectibleItemId, v20.IsResellable(v133), v121, v122, v123);
                        if v140.price then
                            l_priceInRobux_1 = v140.price;
                        end;
                    end;
                    local l_l_priceInRobux_1_0 = l_priceInRobux_1;
                    if l_l_priceInRobux_1_0 ~= nil then
                        v129 = v129 + l_l_priceInRobux_1_0;
                        v128 = v128 + 1;
                    end;
                end;
            end;
            return v129, v127, v128, v130;
        end;
    end;
end;
local function v160(v142, v143, v144, v145, v146, v147) --[[ Line: 278 ]]
    -- upvalues: v35 (copy), l_FFlagAXDurablesSupport_0 (copy), v20 (copy), v5 (copy)
    local v148 = 0;
    local v149 = 0;
    local v150 = {};
    local v151 = false;
    for _, v153 in v142 do
        if v153.selectedInTryOnManager then
            v148 = v148 + 1;
            local v154 = v35.getItemInfo(v153.itemId, v153.itemType, v146, v147);
            if not v154 then
                if not v151 then
                    v151 = true;
                end;
            elseif not v154 or not v154.quantityOwned or v154.quantityOwned <= 0 then
                local v155 = if l_FFlagAXDurablesSupport_0 then v153.selectedTimedOptionIndex else nil;
                local l_priceInRobux_2 = v154.priceInRobux;
                if l_FFlagAXDurablesSupport_0 and v155 and v154.timedOptions then
                    local v157 = v154.timedOptions[v155];
                    if v157 then
                        l_priceInRobux_2 = v157.price;
                    end;
                end;
                if v154.collectibleItemId then
                    local v158 = v20.findCheapestCollectiblePurchaseInfoV2(v154.collectibleItemId, v20.IsResellable(v154), v143, v144, v145);
                    if v158.price then
                        l_priceInRobux_2 = v158.price;
                    end;
                end;
                local l_l_priceInRobux_2_0 = l_priceInRobux_2;
                if l_l_priceInRobux_2_0 ~= nil then
                    v149 = v149 + l_l_priceInRobux_2_0;
                    v150[v153.itemId] = v5.Dictionary.join(v153, {
                        expectedPrice = l_l_priceInRobux_2_0
                    });
                end;
            end;
        end;
    end;
    return v149, v148, v150, v151;
end;
local v161 = {
    addToMyAvatarsLabel = l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 and "Feature.Avatar.Label.Title.AddToMyAvatars" or nil, 
    wearAfterPurchaseLabel = l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 and "Feature.Catalog.Label.WearAfterPurchase" or nil, 
    wearAvatarAfterPurchaseLabel = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "Feature.Catalog.Label.WearAvatarAfterPurchase" or nil, 
    saveAsCharacterLabel = l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 and "Feature.Catalog.Label.SaveAsCharacter" or nil, 
    saveAsMakeupLookLabel = l_FFlagAXCatalogMakeupSupport_0 and "Feature.Avatar.Label.Title.AddToMyMakeupLooks" or nil, 
    wearAfterPurchaseMakeupLabel = l_FFlagAXCatalogMakeupSupport_0 and "Feature.Avatar.Label.Title.WearAfterPurchase" or nil, 
    freeText = "Feature.Catalog.LabelFree", 
    reportText = "Feature.Catalog.Action.Report", 
    viewDetailsPageLabel = "Feature.Catalog.Action.ViewDetailsPage", 
    deleteAvatarLabel = "Feature.Catalog.Action.DeleteAvatar"
};
return function(v162) --[[ Line: 357 ]] --[[ Name: LookDetailsBottomBar ]]
    -- upvalues: l_UserInputService_0 (copy), v37 (copy), l_isGamepadInput_0 (copy), l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v85 (copy), l_getUseSelectorDeepEquals_0 (copy), v83 (copy), v48 (copy), l_useNavigation_0 (copy), v44 (copy), v14 (copy), v13 (copy), v12 (copy), v98 (ref), l_useLocalization_0 (copy), v161 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v81 (copy), v87 (copy), v89 (copy), v91 (copy), v93 (copy), v95 (copy), v97 (copy), v24 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), v19 (copy), v54 (copy), v55 (copy), v43 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v5 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), v26 (copy), l_AvatarScreen_0 (copy), v42 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v32 (copy), v33 (copy), v31 (copy), l_PeekViewState_0 (copy), v36 (copy), v22 (copy), v18 (copy), l_FFlagAXFixLookDetailsContextualMenu_0 (copy), v78 (copy), v56 (copy), v79 (copy), v77 (copy), v23 (copy), v119 (ref), l_FFlagAXDurablesSupport_0 (copy), v160 (copy), v28 (copy), v30 (copy), v29 (copy), v35 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v27 (copy), v74 (copy), v76 (copy), v75 (copy), l_NumberLocalization_0 (copy), v3 (copy), v21 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v164, _ = v37.useState(l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0));
    local v166, v167 = v37.useState(false);
    local v168 = nil;
    local v169 = nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        local v170, v171 = v37.useState(false);
        v168 = v170;
        v169 = v171;
    end;
    local v172 = l_useAvatarRoute_0();
    local v173 = l_useDispatch_0();
    local v174 = l_useSelector_0(v85, l_getUseSelectorDeepEquals_0());
    local v175 = l_useSelector_0(v83, l_getUseSelectorDeepEquals_0());
    local v176 = if v48() then v175 ~= nil and v174[v175] ~= nil and (v174[v175].isFavorited or false) else false;
    local v177 = l_useNavigation_0();
    local v178 = v44(v14);
    local v179 = v44(v13);
    local v180 = v44(v12);
    local v181 = nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        v181 = l_useSelector_0(v98, l_getUseSelectorDeepEquals_0());
    end;
    local v182 = l_useLocalization_0(v161);
    local v183 = l_useStyle_0();
    local l_Theme_0 = v183.Theme;
    local l_Font_0 = v183.Font;
    local v186 = l_useDesignTokens_0();
    local v187 = l_useSelector_0(v81, l_getUseSelectorDeepEquals_0());
    local v188 = l_useSelector_0(v87, l_getUseSelectorDeepEquals_0());
    local v189 = l_useSelector_0(v89, l_getUseSelectorDeepEquals_0())[v188];
    local v190 = l_useSelector_0(v91, l_getUseSelectorDeepEquals_0());
    local v191 = l_useSelector_0(v93, l_getUseSelectorDeepEquals_0());
    local v192 = l_useSelector_0(v95, l_getUseSelectorDeepEquals_0());
    local v193 = l_useSelector_0(v97, l_getUseSelectorDeepEquals_0());
    local v197 = if v48() then v37.useCallback(function(v194) --[[ Line: 403 ]]
        -- upvalues: v24 (ref), v176 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v175 (copy), v174 (copy), v173 (copy), v19 (ref), v178 (copy), v54 (ref), v55 (ref)
        v24.closeOverlay(v194);
        local v195 = not v176;
        if l_FFlagAXCatalogMakeupSupport_0 then
            local v196 = if v175 and v174[v175] then v174[v175].lookType else nil;
            v173(v19(v178, v175, v195, v196));
        else
            v173(v19(v178, v175, v195));
        end;
        v173(v54({
            toastMessage = v195 and "Feature.Catalog.Toast.FavoritedLook" or "Feature.Catalog.Toast.UnfavoritedLook", 
            toastType = v55.SuccessConfirmation
        }));
    end, {
        v173, 
        v54, 
        v19, 
        v175, 
        v174, 
        v178, 
        v176, 
        v177
    }) else nil;
    local v198 = if v48() then v43(v175, v176, v197) else nil;
    local v199 = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then v37.useMemo(function() --[[ Line: 440 ]]
        -- upvalues: v175 (copy), v174 (copy), v5 (ref)
        if v175 and v174 then
            return v5.Dictionary.union(v174[v175].lookAssetInfos or {}, v174[v175].lookBundleInfos or {});
        else
            return {};
        end;
    end, {
        v175, 
        v174
    }) else nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        v37.useEffect(function() --[[ Line: 452 ]]
            -- upvalues: l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v178 (copy), v169 (ref)
            l_getIsUserEligibleForUnifiedPurchaseFlow_0(v178):andThen(function(v200) --[[ Line: 454 ]]
                -- upvalues: v169 (ref)
                v169(v200);
            end):catch(function(_) --[[ Line: 457 ]]
                -- upvalues: v169 (ref)
                v169(false);
            end);
        end, {
            v178
        });
    end;
    local v202 = v37.useCallback(function() --[[ Line: 464 ]]
        -- upvalues: v173 (copy), v54 (ref), v55 (ref)
        v173(v54({
            toastMessage = "Feature.Catalog.Toast.AvatarUnderReview", 
            toastType = v55.NetworkingError
        }));
    end, {
        v173
    });
    local v203 = v37.useMemo(function() --[[ Line: 470 ]]
        -- upvalues: v174 (copy), v175 (copy), v26 (ref)
        if v174 and v175 then
            return v174[v175].moderationStatus == v26.ModerationStatus.Moderated;
        else
            return false;
        end;
    end, {
        v174, 
        v175
    });
    local v204 = v37.useMemo(function() --[[ Line: 477 ]]
        -- upvalues: v174 (copy), v175 (copy), v26 (ref)
        if v174 and v175 then
            return v174[v175].moderationStatus == v26.ModerationStatus.PendingModeration;
        else
            return false;
        end;
    end, {
        v174, 
        v175
    });
    local v205 = v37.useMemo(function() --[[ Line: 484 ]]
        -- upvalues: v172 (copy), l_AvatarScreen_0 (ref)
        return v172 and v172.opaque and v172.opaque.name == l_AvatarScreen_0.MySharedAvatars;
    end, {
        v172
    });
    local v206 = v42(v175, v26.ItemType.Look, true, nil, v204 and v202 or nil);
    local v207 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v209 = v37.useCallback(function(v208) --[[ Line: 503 ]]
        -- upvalues: v180 (copy), v26 (ref), v173 (copy), v32 (ref), v172 (copy), v33 (ref), v31 (ref), l_PeekViewState_0 (ref), v24 (ref)
        v180.sendAXCounter(v26.Counter.ContextFrame.ViewDetailsPageClick);
        v173(v32(v180, v172.opaque.name, v33.None));
        v173(v31(l_PeekViewState_0.Brief));
        v24.closeOverlay(v208);
    end, {
        v180, 
        v173, 
        v172
    });
    local v211 = v37.useMemo(function() --[[ Line: 510 ]]
        -- upvalues: v188 (copy), v174 (copy), v175 (copy), v36 (ref)
        if v188 and v174 and v175 then
            local v210 = v174[v175];
            return v210 and v210.curator and tostring(v210.curator.id) == tostring(v188) and v210.curator.type == v36.CreatorType.User;
        else
            return false;
        end;
    end, {
        v174, 
        v175, 
        v188
    });
    local v212 = v37.useCallback(function() --[[ Line: 523 ]]
        -- upvalues: v164 (copy), v172 (copy), l_AvatarScreen_0 (ref), v22 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v207 (copy)
        if v164 and v172.current.name == l_AvatarScreen_0.LookDetails then
            v22("LookDetails");
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v207.captureFocus();
            end;
        end;
    end, {
        v164, 
        v172, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v207
    });
    local v216 = v37.useCallback(function(v213) --[[ Line: 540 ]]
        -- upvalues: v180 (copy), v26 (ref), v24 (ref), l_AvatarScreen_0 (ref), v212 (copy), v175 (copy), v177 (copy), v173 (copy), v18 (ref)
        v180.sendAXCounter(v26.Counter.ContextFrame.DeleteAvatarClick);
        v24.closeOverlay(v213);
        v173(v18(function() --[[ Line: 543 ]]
            -- upvalues: l_AvatarScreen_0 (ref), v212 (ref), v175 (ref), v177 (ref)
            local l_DeleteAvatarConfirmationPrompt_0 = l_AvatarScreen_0.DeleteAvatarConfirmationPrompt;
            local v215 = {
                onOverlayClosed = v212, 
                lookId = v175
            };
            v177.navigate(l_DeleteAvatarConfirmationPrompt_0, v215);
        end));
    end, {
        v180, 
        v173, 
        v175, 
        v212
    });
    local v221 = v37.useCallback(function() --[[ Line: 555 ]]
        -- upvalues: v193 (copy), l_PeekViewState_0 (ref), l_FFlagAXFixLookDetailsContextualMenu_0 (ref), v78 (ref), v182 (copy), v209 (copy), v48 (ref), v203 (copy), v198 (copy), v56 (ref), v205 (copy), v206 (copy), v211 (copy), v79 (ref), v216 (copy), v77 (ref), v173 (copy), v23 (ref), v178 (copy), v24 (ref)
        local v217 = v193 == l_PeekViewState_0.SuperBrief;
        if l_FFlagAXFixLookDetailsContextualMenu_0 then
            local v218 = {};
            if v217 then
                table.insert(v218, {
                    icon = v78, 
                    text = v182.viewDetailsPageLabel, 
                    onActivated = v209
                });
            end;
            if v48() and not v203 then
                table.insert(v218, v198);
            end;
            if not v56 and not v203 and not v205 then
                table.insert(v218, v206);
            end;
            if v211 and v205 then
                table.insert(v218, {
                    icon = v79, 
                    text = v182.deleteAvatarLabel, 
                    onActivated = v216
                });
            end;
            if not v211 then
                table.insert(v218, {
                    icon = v77, 
                    text = v182.reportText, 
                    onActivated = function(v219) --[[ Line: 590 ]] --[[ Name: onActivated ]]
                        -- upvalues: v173 (ref), v23 (ref), v178 (ref), v24 (ref)
                        v173(v23(v178));
                        v24.closeOverlay(v219);
                    end
                });
            end;
            return v218;
        else
            return {
                if not v217 then nil else {
                    icon = v78, 
                    text = v182.viewDetailsPageLabel, 
                    onActivated = v209
                }, 
                if not v48() or v203 then nil else v198, 
                if not not v56 or v203 or v205 then nil else v206, 
                if v211 and v205 then {
                    icon = v79, 
                    text = v182.deleteAvatarLabel, 
                    onActivated = v216
                } else nil, 
                if v211 then nil else {
                    icon = v77, 
                    text = v182.reportText, 
                    onActivated = function(v220) --[[ Line: 625 ]] --[[ Name: onActivated ]]
                        -- upvalues: v173 (ref), v23 (ref), v178 (ref), v24 (ref)
                        v173(v23(v178));
                        v24.closeOverlay(v220);
                    end
                }
            };
        end;
    end, {
        v178, 
        v182, 
        v209, 
        v216, 
        v211, 
        v173, 
        v206, 
        if v48() then v198 else nil, 
        if v48() then v176 else nil, 
        if v48() then v193 else nil, 
        v203, 
        v205
    });
    local v222 = v37.useCallback(function() --[[ Line: 649 ]]
        -- upvalues: v167 (copy), v212 (copy)
        v167(false);
        v212();
    end, {
        v212
    });
    local v225 = v37.useCallback(function() --[[ Line: 655 ]]
        -- upvalues: v221 (copy), v77 (ref), v182 (copy), v173 (copy), v23 (ref), v178 (copy), v24 (ref), v56 (ref), v203 (copy), v205 (copy), v206 (copy), v177 (copy), l_AvatarScreen_0 (ref), v162 (copy), v222 (copy), v18 (ref)
        v173(v18(function() --[[ Line: 656 ]]
            -- upvalues: v221 (ref), v77 (ref), v182 (ref), v173 (ref), v23 (ref), v178 (ref), v24 (ref), v56 (ref), v203 (ref), v205 (ref), v206 (ref), v177 (ref), l_AvatarScreen_0 (ref), v162 (ref), v222 (ref)
            local v224 = if v221 then v221() else {
                {
                    icon = v77, 
                    text = v182.reportText, 
                    onActivated = function(v223) --[[ Line: 663 ]] --[[ Name: onActivated ]]
                        -- upvalues: v173 (ref), v23 (ref), v178 (ref), v24 (ref)
                        v173(v23(v178));
                        v24.closeOverlay(v223);
                    end
                }, 
                if not not v56 or v203 or v205 then nil else v206
            };
            v177.navigate(l_AvatarScreen_0.ContextMenu, {
                centered = v162.centered, 
                contextButtons = v224, 
                onOverlayClosed = v222
            });
        end));
    end, {
        v177, 
        v173, 
        v222, 
        v182, 
        v178, 
        v206, 
        v221
    });
    local v226 = nil;
    local v227 = nil;
    local v228 = nil;
    local v229 = nil;
    local v230 = nil;
    local v231 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then
        local v232, v233, v234, v235 = v37.useMemo(function() --[[ Line: 696 ]]
            -- upvalues: v119 (ref), v199 (copy), v190 (copy), v191 (copy), v192 (copy), v174 (copy), v175 (copy), l_FFlagAXDurablesSupport_0 (ref), v187 (copy)
            return v119(v199, v190, v191, v192, v174, v175, if l_FFlagAXDurablesSupport_0 then v187 else nil);
        end, {
            v190, 
            v191, 
            v192, 
            v174, 
            v175, 
            v199, 
            if l_FFlagAXDurablesSupport_0 then v187 else nil
        });
        v226 = v232;
        v227 = v233;
        v228 = v234;
        v229 = v235;
    else
        local v236, v237, v238, v239 = v37.useMemo(function() --[[ Line: 719 ]]
            -- upvalues: v160 (ref), v187 (copy), v190 (copy), v191 (copy), v192 (copy), v174 (copy), v175 (copy)
            return v160(v187, v190, v191, v192, v174, v175);
        end, {
            v187, 
            v190, 
            v191, 
            v192, 
            v174, 
            v175
        });
        v226 = v236;
        v230 = v237;
        v231 = v238;
        v229 = v239;
    end;
    local v270 = if l_FFlagAXMISEnableMultiShopping_0 and v199 and v162.alwaysBuyAll then v37.useCallback(function() --[[ Line: 744 ]]
        -- upvalues: v119 (ref), v199 (copy), v190 (copy), v191 (copy), v192 (copy), v174 (copy), v175 (copy), l_FFlagAXDurablesSupport_0 (ref), v187 (copy), v189 (copy), l_AvatarScreen_0 (ref), v212 (copy), v180 (copy), v28 (ref), v30 (ref), v29 (ref), v35 (ref), v172 (copy), v162 (copy), v24 (ref), v177 (copy), v173 (copy), v18 (ref)
        local v240, _, v242, _ = v119(v199, v190, v191, v192, v174, v175, if l_FFlagAXDurablesSupport_0 then v187 else nil);
        local v244 = nil;
        local v245 = nil;
        if v189 < v240 then
            v244 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v245 = {
                onOverlayClosed = v212
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v242 == 0 and v175 ~= nil then
            local l_CharacterKey_0 = v30.CharacterKey;
            local v247 = v29();
            local v248 = nil;
            local v249 = nil;
            for v250, v251 in v247 do
                if v251.Name == l_CharacterKey_0 then
                    v248 = v250;
                    break;
                end;
            end;
            local l_v248_0 = v248;
            local l_v249_0 = v249;
            v244 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v245 = {
                onOverlayClosed = v212, 
                categoryOverride = l_v248_0, 
                subcategoryOverride = l_v249_0
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v254 = v35.getOwnedItemsInLook(v199, v174, v175);
            if v175 ~= nil then
                v244 = l_AvatarScreen_0.PurchaseLookPrompt;
                v245 = {
                    lookId = v175, 
                    priceInRobux = v240, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true, 
                    fromAvatarRoute = v172, 
                    allLookItems = v199, 
                    ownedItemsInLook = v254, 
                    isTryOnFromOutsideAX = v162.isTryOnFromOutsideAX
                };
                if v24.isWithinViewContext(v172, l_AvatarScreen_0.CatalogSearch) then
                    v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked);
                else
                    v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked);
                end;
            else
                v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId);
                v245 = {
                    onOverlayClosed = v212
                };
            end;
        end;
        v173(v18(function() --[[ Line: 824 ]]
            -- upvalues: v177 (ref), v244 (ref), v245 (ref)
            v177.navigate(v244, v245);
        end));
    end, {
        v190, 
        v191, 
        v192, 
        v174, 
        v175, 
        v189, 
        v173, 
        v177, 
        v212, 
        v180, 
        v172, 
        v199, 
        if l_FFlagAXDurablesSupport_0 then v187 else nil
    }) else v37.useCallback(function() --[[ Line: 846 ]]
        -- upvalues: v160 (ref), v187 (copy), v190 (copy), v191 (copy), v192 (copy), v174 (copy), v175 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v189 (copy), l_AvatarScreen_0 (ref), v212 (copy), v180 (copy), v28 (ref), v5 (ref), v30 (ref), v29 (ref), v35 (ref), v172 (copy), v162 (copy), v24 (ref), v177 (copy), v173 (copy), v18 (ref)
        local v255, _, v257 = v160(v187, v190, v191, v192, v174, v175);
        local v258 = nil;
        local v259 = nil;
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
            local v260 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
            l_TimeToInteractiveTracker_0.trackStart(v260);
            l_TimeToInteractiveTracker_0.updateMetadata(v260, {
                page = l_ProductPurchaseSurface_0.Catalog, 
                category = "legacy_purchase_modal"
            });
        end;
        if v189 < v255 then
            v258 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v259 = {
                onOverlayClosed = v212
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v5.isEmpty(v257) and v175 ~= nil then
            local l_CharacterKey_1 = v30.CharacterKey;
            local v262 = v29();
            local v263 = nil;
            local v264 = nil;
            for v265, v266 in v262 do
                if v266.Name == l_CharacterKey_1 then
                    v263 = v265;
                    break;
                end;
            end;
            local l_v263_0 = v263;
            local l_v264_0 = v264;
            v258 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v259 = {
                onOverlayClosed = v212, 
                categoryOverride = l_v263_0, 
                subcategoryOverride = l_v264_0
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v269 = v35.getOwnedTryOnItems(v187, v174, v175);
            if v175 ~= nil then
                v258 = l_AvatarScreen_0.PurchaseLookPrompt;
                v259 = {
                    itemsToPurchase = v257, 
                    lookId = v175, 
                    ownedTryOnItems = v269, 
                    priceInRobux = v255, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true, 
                    fromAvatarRoute = v172, 
                    isTryOnFromOutsideAX = v162.isTryOnFromOutsideAX
                };
                if v24.isWithinViewContext(v172, l_AvatarScreen_0.CatalogSearch) then
                    v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked);
                else
                    v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked);
                end;
            else
                v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId);
                v259 = {
                    onOverlayClosed = v212
                };
            end;
        end;
        v173(v18(function() --[[ Line: 935 ]]
            -- upvalues: v177 (ref), v258 (ref), v259 (ref)
            v177.navigate(v258, v259);
        end));
    end, {
        v187, 
        v190, 
        v191, 
        v192, 
        v174, 
        v175, 
        v189, 
        v173, 
        v177, 
        v212, 
        v180, 
        v172
    });
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        local l_onButtonPressWithUnifiedPurchaseFlow_0 = v27({
            lookId = v175, 
            totalPrice = v226, 
            tryOnItems = v187, 
            lookDetailsObj = v174, 
            lookAnalyticsInfo = v181, 
            localized = v182, 
            isTryOnFromOutsideAX = v162.isTryOnFromOutsideAX, 
            itemsToPurchase = v231, 
            userRobux = v189, 
            onOverlayClosed = v212
        }).onButtonPressWithUnifiedPurchaseFlow;
        if v168 then
            v270 = l_onButtonPressWithUnifiedPurchaseFlow_0;
        end;
    end;
    local v276 = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then nil else v37.useCallback(function() --[[ Line: 977 ]]
        -- upvalues: v187 (copy), v35 (ref), v174 (copy), v175 (copy)
        local v272 = 0;
        for _, v274 in v187 do
            if v274.selectedInTryOnManager then
                local v275 = v35.getItemInfo(v274.itemId, v274.itemType, v174, v175);
                if not v275 or not v275.quantityOwned or v275.quantityOwned == 0 then
                    return false;
                else
                    v272 = v272 + 1;
                end;
            end;
        end;
        return v272 > 0;
    end, {
        v187, 
        v174, 
        v175
    });
    local v282 = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then v37.useCallback(function(v277) --[[ Line: 1000 ]]
        -- upvalues: v199 (copy), v35 (ref), v174 (copy)
        if v199 == nil then
            return false;
        else
            local v278 = 0;
            for _, v280 in v199 do
                local v281 = if v280.itemType then v35.getItemInfo(v280.id, v280.itemType, v174, v277) else nil;
                if not v281 or not v281.quantityOwned or v281.quantityOwned == 0 then
                    return false;
                else
                    v278 = v278 + 1;
                end;
            end;
            return v278 > 0;
        end;
    end, {
        v174, 
        v199
    }) else nil;
    local l_v74_0 = v74;
    local v284 = false;
    local v285 = nil;
    local v286 = v231 and v5.isEmpty(v231);
    if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then
        v286 = v228 == 0;
    end;
    if v286 then
        v285 = "";
        local v287 = v276 and v276();
        if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then
            v287 = v282 and v282(v175) ~= nil;
        end;
        if v175 ~= nil and v287 then
            l_v74_0 = v76;
        else
            l_v74_0 = v75;
            v284 = true;
        end;
    elseif v226 == 0 then
        l_v74_0 = nil;
        v285 = v182.freeText;
    else
        v285 = l_NumberLocalization_0.localize(string.format("%.0f", v226), v179:GetLocale());
    end;
    if v189 == nil then
        v284 = true;
    end;
    local v288 = v179:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
        numItems = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then v227 else v230
    });
    local l_hideDescriptor_0 = v162.hideDescriptor;
    local v290 = v3.createElement("TextLabel", {
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v186.Global.Size_400), 
        Text = v288, 
        TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
        Font = l_Font_0.Header2.Font, 
        TextColor3 = l_Theme_0.SecondaryContent.Color, 
        TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    });
    local v291 = v37.useCallback(function() --[[ Line: 1080 ]]
        -- upvalues: v225 (copy), v167 (copy)
        v225();
        v167(true);
    end, {
        v225, 
        v167
    });
    local v292 = v37.useMemo(function() --[[ Line: 1085 ]]
        -- upvalues: v285 (ref), l_v74_0 (ref), v229 (ref), v284 (ref), v186 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v183 (copy), v270 (ref)
        return {
            buttonText = v285, 
            buttonIcon = l_v74_0, 
            buttonIsLoading = v229, 
            buttonIsDisabled = v284, 
            buttonIconPadding = v186.Global.Space_50, 
            buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v186.Global.Size_250 else v186.Global.Size_400, 
            buttonColor = v183.Theme.ContextualPrimaryDefault.Color, 
            buttonTextColor = v183.Theme.ContextualPrimaryContent.Color, 
            onActivated = not v284 and v270 or nil
        };
    end, {
        v285, 
        l_v74_0, 
        v229, 
        v284, 
        v186, 
        v183, 
        v270
    });
    local v293 = v205 and not v203 and v206 ~= nil;
    return v3.createElement(v21, {
        bottomPadding = 0, 
        buttonProps = v292, 
        hideGradient = true, 
        isMoreButtonSelected = v166, 
        leftPadding = 0, 
        onMoreButtonActivated = v291, 
        rightPadding = 0, 
        showMoreButton = true, 
        showMiddleButton = v293, 
        onMiddleButtonActivated = if v293 then v206.onActivated else nil, 
        middleButtonIcon = if v293 then v206.icon else nil, 
        topComponent = if l_hideDescriptor_0 then nil else v290, 
        topComponentHeight = l_hideDescriptor_0 and 0 or v186.Global.Size_400, 
        ZIndex = 1
    });
end;