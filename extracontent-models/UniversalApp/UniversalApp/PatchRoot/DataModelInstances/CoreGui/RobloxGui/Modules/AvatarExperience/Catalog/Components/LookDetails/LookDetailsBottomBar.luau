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
local function v109(v100, v101) --[[ Line: 152 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
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
    -- upvalues: l_UserInputService_0 (copy), v37 (copy), l_isGamepadInput_0 (copy), l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v85 (copy), l_getUseSelectorDeepEquals_0 (copy), v83 (copy), v48 (copy), l_useNavigation_0 (copy), v44 (copy), v14 (copy), v13 (copy), v12 (copy), v98 (ref), l_useLocalization_0 (copy), v161 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v81 (copy), v87 (copy), v89 (copy), v91 (copy), v93 (copy), v95 (copy), v97 (copy), v24 (copy), v19 (copy), v54 (copy), v55 (copy), v43 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), v5 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), v26 (copy), l_AvatarScreen_0 (copy), v42 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v32 (copy), v33 (copy), v31 (copy), l_PeekViewState_0 (copy), v36 (copy), v22 (copy), v18 (copy), l_FFlagAXFixLookDetailsContextualMenu_0 (copy), v78 (copy), v56 (copy), v79 (copy), v77 (copy), v23 (copy), v119 (ref), l_FFlagAXDurablesSupport_0 (copy), v160 (copy), v28 (copy), v109 (copy), v30 (copy), v35 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v27 (copy), v74 (copy), v76 (copy), v75 (copy), l_NumberLocalization_0 (copy), v3 (copy), v21 (copy)
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
    local v196 = if v48() then v37.useCallback(function(v194) --[[ Line: 403 ]]
        -- upvalues: v24 (ref), v176 (copy), v173 (copy), v19 (ref), v178 (copy), v175 (copy), v54 (ref), v55 (ref)
        v24.closeOverlay(v194);
        local v195 = not v176;
        v173(v19(v178, v175, v195));
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
    local v197 = if v48() then v43(v175, v176, v196) else nil;
    local v198 = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then v37.useMemo(function() --[[ Line: 434 ]]
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
        v37.useEffect(function() --[[ Line: 446 ]]
            -- upvalues: l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v178 (copy), v169 (ref)
            l_getIsUserEligibleForUnifiedPurchaseFlow_0(v178):andThen(function(v199) --[[ Line: 448 ]]
                -- upvalues: v169 (ref)
                v169(v199);
            end):catch(function(_) --[[ Line: 451 ]]
                -- upvalues: v169 (ref)
                v169(false);
            end);
        end, {
            v178
        });
    end;
    local v201 = v37.useCallback(function() --[[ Line: 458 ]]
        -- upvalues: v173 (copy), v54 (ref), v55 (ref)
        v173(v54({
            toastMessage = "Feature.Catalog.Toast.AvatarUnderReview", 
            toastType = v55.NetworkingError
        }));
    end, {
        v173
    });
    local v202 = v37.useMemo(function() --[[ Line: 464 ]]
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
    local v203 = v37.useMemo(function() --[[ Line: 471 ]]
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
    local v204 = v37.useMemo(function() --[[ Line: 478 ]]
        -- upvalues: v172 (copy), l_AvatarScreen_0 (ref)
        return v172 and v172.opaque and v172.opaque.name == l_AvatarScreen_0.MySharedAvatars;
    end, {
        v172
    });
    local v205 = v42(v175, v26.ItemType.Look, true, nil, v203 and v201 or nil);
    local v206 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v208 = v37.useCallback(function(v207) --[[ Line: 497 ]]
        -- upvalues: v180 (copy), v26 (ref), v173 (copy), v32 (ref), v172 (copy), v33 (ref), v31 (ref), l_PeekViewState_0 (ref), v24 (ref)
        v180.sendAXCounter(v26.Counter.ContextFrame.ViewDetailsPageClick);
        v173(v32(v180, v172.opaque.name, v33.None));
        v173(v31(l_PeekViewState_0.Brief));
        v24.closeOverlay(v207);
    end, {
        v180, 
        v173, 
        v172
    });
    local v210 = v37.useMemo(function() --[[ Line: 504 ]]
        -- upvalues: v188 (copy), v174 (copy), v175 (copy), v36 (ref)
        if v188 and v174 and v175 then
            local v209 = v174[v175];
            return v209 and v209.curator and tostring(v209.curator.id) == tostring(v188) and v209.curator.type == v36.CreatorType.User;
        else
            return false;
        end;
    end, {
        v174, 
        v175, 
        v188
    });
    local v211 = v37.useCallback(function() --[[ Line: 517 ]]
        -- upvalues: v164 (copy), v172 (copy), l_AvatarScreen_0 (ref), v22 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v206 (copy)
        if v164 and v172.current.name == l_AvatarScreen_0.LookDetails then
            v22("LookDetails");
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v206.captureFocus();
            end;
        end;
    end, {
        v164, 
        v172, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v206
    });
    local v215 = v37.useCallback(function(v212) --[[ Line: 534 ]]
        -- upvalues: v180 (copy), v26 (ref), v24 (ref), l_AvatarScreen_0 (ref), v211 (copy), v175 (copy), v177 (copy), v173 (copy), v18 (ref)
        v180.sendAXCounter(v26.Counter.ContextFrame.DeleteAvatarClick);
        v24.closeOverlay(v212);
        v173(v18(function() --[[ Line: 537 ]]
            -- upvalues: l_AvatarScreen_0 (ref), v211 (ref), v175 (ref), v177 (ref)
            local l_DeleteAvatarConfirmationPrompt_0 = l_AvatarScreen_0.DeleteAvatarConfirmationPrompt;
            local v214 = {
                onOverlayClosed = v211, 
                lookId = v175
            };
            v177.navigate(l_DeleteAvatarConfirmationPrompt_0, v214);
        end));
    end, {
        v180, 
        v173, 
        v175, 
        v211
    });
    local v220 = v37.useCallback(function() --[[ Line: 549 ]]
        -- upvalues: v193 (copy), l_PeekViewState_0 (ref), l_FFlagAXFixLookDetailsContextualMenu_0 (ref), v78 (ref), v182 (copy), v208 (copy), v48 (ref), v202 (copy), v197 (copy), v56 (ref), v204 (copy), v205 (copy), v210 (copy), v79 (ref), v215 (copy), v77 (ref), v173 (copy), v23 (ref), v178 (copy), v24 (ref)
        local v216 = v193 == l_PeekViewState_0.SuperBrief;
        if l_FFlagAXFixLookDetailsContextualMenu_0 then
            local v217 = {};
            if v216 then
                table.insert(v217, {
                    icon = v78, 
                    text = v182.viewDetailsPageLabel, 
                    onActivated = v208
                });
            end;
            if v48() and not v202 then
                table.insert(v217, v197);
            end;
            if not v56 and not v202 and not v204 then
                table.insert(v217, v205);
            end;
            if v210 and v204 then
                table.insert(v217, {
                    icon = v79, 
                    text = v182.deleteAvatarLabel, 
                    onActivated = v215
                });
            end;
            if not v210 then
                table.insert(v217, {
                    icon = v77, 
                    text = v182.reportText, 
                    onActivated = function(v218) --[[ Line: 584 ]] --[[ Name: onActivated ]]
                        -- upvalues: v173 (ref), v23 (ref), v178 (ref), v24 (ref)
                        v173(v23(v178));
                        v24.closeOverlay(v218);
                    end
                });
            end;
            return v217;
        else
            return {
                if not v216 then nil else {
                    icon = v78, 
                    text = v182.viewDetailsPageLabel, 
                    onActivated = v208
                }, 
                if not v48() or v202 then nil else v197, 
                if not not v56 or v202 or v204 then nil else v205, 
                if v210 and v204 then {
                    icon = v79, 
                    text = v182.deleteAvatarLabel, 
                    onActivated = v215
                } else nil, 
                if v210 then nil else {
                    icon = v77, 
                    text = v182.reportText, 
                    onActivated = function(v219) --[[ Line: 619 ]] --[[ Name: onActivated ]]
                        -- upvalues: v173 (ref), v23 (ref), v178 (ref), v24 (ref)
                        v173(v23(v178));
                        v24.closeOverlay(v219);
                    end
                }
            };
        end;
    end, {
        v178, 
        v182, 
        v208, 
        v215, 
        v210, 
        v173, 
        v205, 
        if v48() then v197 else nil, 
        if v48() then v176 else nil, 
        if v48() then v193 else nil, 
        v202, 
        v204
    });
    local v221 = v37.useCallback(function() --[[ Line: 643 ]]
        -- upvalues: v167 (copy), v211 (copy)
        v167(false);
        v211();
    end, {
        v211
    });
    local v224 = v37.useCallback(function() --[[ Line: 649 ]]
        -- upvalues: v220 (copy), v77 (ref), v182 (copy), v173 (copy), v23 (ref), v178 (copy), v24 (ref), v56 (ref), v202 (copy), v204 (copy), v205 (copy), v177 (copy), l_AvatarScreen_0 (ref), v162 (copy), v221 (copy), v18 (ref)
        v173(v18(function() --[[ Line: 650 ]]
            -- upvalues: v220 (ref), v77 (ref), v182 (ref), v173 (ref), v23 (ref), v178 (ref), v24 (ref), v56 (ref), v202 (ref), v204 (ref), v205 (ref), v177 (ref), l_AvatarScreen_0 (ref), v162 (ref), v221 (ref)
            local v223 = if v220 then v220() else {
                {
                    icon = v77, 
                    text = v182.reportText, 
                    onActivated = function(v222) --[[ Line: 657 ]] --[[ Name: onActivated ]]
                        -- upvalues: v173 (ref), v23 (ref), v178 (ref), v24 (ref)
                        v173(v23(v178));
                        v24.closeOverlay(v222);
                    end
                }, 
                if not not v56 or v202 or v204 then nil else v205
            };
            v177.navigate(l_AvatarScreen_0.ContextMenu, {
                centered = v162.centered, 
                contextButtons = v223, 
                onOverlayClosed = v221
            });
        end));
    end, {
        v177, 
        v173, 
        v221, 
        v182, 
        v178, 
        v205, 
        v220
    });
    local v225 = nil;
    local v226 = nil;
    local v227 = nil;
    local v228 = nil;
    local v229 = nil;
    local v230 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then
        local v231, v232, v233, v234 = v37.useMemo(function() --[[ Line: 690 ]]
            -- upvalues: v119 (ref), v198 (copy), v190 (copy), v191 (copy), v192 (copy), v174 (copy), v175 (copy), l_FFlagAXDurablesSupport_0 (ref), v187 (copy)
            return v119(v198, v190, v191, v192, v174, v175, if l_FFlagAXDurablesSupport_0 then v187 else nil);
        end, {
            v190, 
            v191, 
            v192, 
            v174, 
            v175, 
            v198, 
            if l_FFlagAXDurablesSupport_0 then v187 else nil
        });
        v225 = v231;
        v226 = v232;
        v227 = v233;
        v228 = v234;
    else
        local v235, v236, v237, v238 = v37.useMemo(function() --[[ Line: 713 ]]
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
        v225 = v235;
        v229 = v236;
        v230 = v237;
        v228 = v238;
    end;
    local v257 = if l_FFlagAXMISEnableMultiShopping_0 and v198 and v162.alwaysBuyAll then v37.useCallback(function() --[[ Line: 738 ]]
        -- upvalues: v119 (ref), v198 (copy), v190 (copy), v191 (copy), v192 (copy), v174 (copy), v175 (copy), l_FFlagAXDurablesSupport_0 (ref), v187 (copy), v189 (copy), l_AvatarScreen_0 (ref), v211 (copy), v180 (copy), v28 (ref), v109 (ref), v30 (ref), v35 (ref), v172 (copy), v162 (copy), v24 (ref), v177 (copy), v173 (copy), v18 (ref)
        local v239, _, v241, _ = v119(v198, v190, v191, v192, v174, v175, if l_FFlagAXDurablesSupport_0 then v187 else nil);
        local v243 = nil;
        local v244 = nil;
        if v189 < v239 then
            v243 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v244 = {
                onOverlayClosed = v211
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v241 == 0 and v175 ~= nil then
            local v245, v246 = v109(v30.CharacterKey);
            v243 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v244 = {
                onOverlayClosed = v211, 
                categoryOverride = v245, 
                subcategoryOverride = v246
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v247 = v35.getOwnedItemsInLook(v198, v174, v175);
            if v175 ~= nil then
                v243 = l_AvatarScreen_0.PurchaseLookPrompt;
                v244 = {
                    lookId = v175, 
                    priceInRobux = v239, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true, 
                    fromAvatarRoute = v172, 
                    allLookItems = v198, 
                    ownedItemsInLook = v247, 
                    isTryOnFromOutsideAX = v162.isTryOnFromOutsideAX
                };
                if v24.isWithinViewContext(v172, l_AvatarScreen_0.CatalogSearch) then
                    v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked);
                else
                    v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked);
                end;
            else
                v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId);
                v244 = {
                    onOverlayClosed = v211
                };
            end;
        end;
        v173(v18(function() --[[ Line: 818 ]]
            -- upvalues: v177 (ref), v243 (ref), v244 (ref)
            v177.navigate(v243, v244);
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
        v211, 
        v180, 
        v172, 
        v198, 
        if l_FFlagAXDurablesSupport_0 then v187 else nil
    }) else v37.useCallback(function() --[[ Line: 840 ]]
        -- upvalues: v160 (ref), v187 (copy), v190 (copy), v191 (copy), v192 (copy), v174 (copy), v175 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v189 (copy), l_AvatarScreen_0 (ref), v211 (copy), v180 (copy), v28 (ref), v5 (ref), v109 (ref), v30 (ref), v35 (ref), v172 (copy), v162 (copy), v24 (ref), v177 (copy), v173 (copy), v18 (ref)
        local v248, _, v250 = v160(v187, v190, v191, v192, v174, v175);
        local v251 = nil;
        local v252 = nil;
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
            local v253 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
            l_TimeToInteractiveTracker_0.trackStart(v253);
            l_TimeToInteractiveTracker_0.updateMetadata(v253, {
                page = l_ProductPurchaseSurface_0.Catalog, 
                category = "legacy_purchase_modal"
            });
        end;
        if v189 < v248 then
            v251 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v252 = {
                onOverlayClosed = v211
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v5.isEmpty(v250) and v175 ~= nil then
            local v254, v255 = v109(v30.CharacterKey);
            v251 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v252 = {
                onOverlayClosed = v211, 
                categoryOverride = v254, 
                subcategoryOverride = v255
            };
            v180.sendAXCounter(v28.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v256 = v35.getOwnedTryOnItems(v187, v174, v175);
            if v175 ~= nil then
                v251 = l_AvatarScreen_0.PurchaseLookPrompt;
                v252 = {
                    itemsToPurchase = v250, 
                    lookId = v175, 
                    ownedTryOnItems = v256, 
                    priceInRobux = v248, 
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
                v252 = {
                    onOverlayClosed = v211
                };
            end;
        end;
        v173(v18(function() --[[ Line: 929 ]]
            -- upvalues: v177 (ref), v251 (ref), v252 (ref)
            v177.navigate(v251, v252);
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
        v211, 
        v180, 
        v172
    });
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        local l_onButtonPressWithUnifiedPurchaseFlow_0 = v27({
            lookId = v175, 
            totalPrice = v225, 
            tryOnItems = v187, 
            lookDetailsObj = v174, 
            lookAnalyticsInfo = v181, 
            localized = v182, 
            isTryOnFromOutsideAX = v162.isTryOnFromOutsideAX, 
            itemsToPurchase = v230, 
            userRobux = v189, 
            onOverlayClosed = v211
        }).onButtonPressWithUnifiedPurchaseFlow;
        if v168 then
            v257 = l_onButtonPressWithUnifiedPurchaseFlow_0;
        end;
    end;
    local v263 = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then nil else v37.useCallback(function() --[[ Line: 971 ]]
        -- upvalues: v187 (copy), v35 (ref), v174 (copy), v175 (copy)
        local v259 = 0;
        for _, v261 in v187 do
            if v261.selectedInTryOnManager then
                local v262 = v35.getItemInfo(v261.itemId, v261.itemType, v174, v175);
                if not v262 or not v262.quantityOwned or v262.quantityOwned == 0 then
                    return false;
                else
                    v259 = v259 + 1;
                end;
            end;
        end;
        return v259 > 0;
    end, {
        v187, 
        v174, 
        v175
    });
    local v269 = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then v37.useCallback(function(v264) --[[ Line: 994 ]]
        -- upvalues: v198 (copy), v35 (ref), v174 (copy)
        if v198 == nil then
            return false;
        else
            local v265 = 0;
            for _, v267 in v198 do
                local v268 = if v267.itemType then v35.getItemInfo(v267.id, v267.itemType, v174, v264) else nil;
                if not v268 or not v268.quantityOwned or v268.quantityOwned == 0 then
                    return false;
                else
                    v265 = v265 + 1;
                end;
            end;
            return v265 > 0;
        end;
    end, {
        v174, 
        v198
    }) else nil;
    local l_v74_0 = v74;
    local v271 = false;
    local v272 = nil;
    local v273 = v230 and v5.isEmpty(v230);
    if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then
        v273 = v227 == 0;
    end;
    if v273 then
        v272 = "";
        local v274 = v263 and v263();
        if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then
            v274 = v269 and v269(v175) ~= nil;
        end;
        if v175 ~= nil and v274 then
            l_v74_0 = v76;
        else
            l_v74_0 = v75;
            v271 = true;
        end;
    elseif v225 == 0 then
        l_v74_0 = nil;
        v272 = v182.freeText;
    else
        v272 = l_NumberLocalization_0.localize(string.format("%.0f", v225), v179:GetLocale());
    end;
    if v189 == nil then
        v271 = true;
    end;
    local v275 = v179:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
        numItems = if l_FFlagAXMISEnableMultiShopping_0 and v162.alwaysBuyAll then v226 else v229
    });
    local l_hideDescriptor_0 = v162.hideDescriptor;
    local v277 = v3.createElement("TextLabel", {
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v186.Global.Size_400), 
        Text = v275, 
        TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
        Font = l_Font_0.Header2.Font, 
        TextColor3 = l_Theme_0.SecondaryContent.Color, 
        TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    });
    local v278 = v37.useCallback(function() --[[ Line: 1074 ]]
        -- upvalues: v224 (copy), v167 (copy)
        v224();
        v167(true);
    end, {
        v224, 
        v167
    });
    local v279 = v37.useMemo(function() --[[ Line: 1079 ]]
        -- upvalues: v272 (ref), l_v74_0 (ref), v228 (ref), v271 (ref), v186 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v183 (copy), v257 (ref)
        return {
            buttonText = v272, 
            buttonIcon = l_v74_0, 
            buttonIsLoading = v228, 
            buttonIsDisabled = v271, 
            buttonIconPadding = v186.Global.Space_50, 
            buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v186.Global.Size_250 else v186.Global.Size_400, 
            buttonColor = v183.Theme.ContextualPrimaryDefault.Color, 
            buttonTextColor = v183.Theme.ContextualPrimaryContent.Color, 
            onActivated = not v271 and v257 or nil
        };
    end, {
        v272, 
        l_v74_0, 
        v228, 
        v271, 
        v186, 
        v183, 
        v257
    });
    local v280 = v204 and not v202 and v205 ~= nil;
    return v3.createElement(v21, {
        bottomPadding = 0, 
        buttonProps = v279, 
        hideGradient = true, 
        isMoreButtonSelected = v166, 
        leftPadding = 0, 
        onMoreButtonActivated = v278, 
        rightPadding = 0, 
        showMoreButton = true, 
        showMiddleButton = v280, 
        onMiddleButtonActivated = if v280 then v205.onActivated else nil, 
        middleButtonIcon = if v280 then v205.icon else nil, 
        topComponent = if l_hideDescriptor_0 then nil else v277, 
        topComponentHeight = l_hideDescriptor_0 and 0 or v186.Global.Size_400, 
        ZIndex = 1
    });
end;