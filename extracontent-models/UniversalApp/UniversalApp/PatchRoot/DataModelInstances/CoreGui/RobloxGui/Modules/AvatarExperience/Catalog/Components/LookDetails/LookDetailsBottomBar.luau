local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_Images_0 = v4.App.ImageSet.Images;
local v10 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v14 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v15 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v16 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v17 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v17.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v17.AvatarRoute.Hooks.useAvatarRoute;
local v20 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v21 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetLookFavorite);
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBar);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v24 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ReportLook);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame);
local v27 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v28 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useLookUnifiedPurchaseFlow);
local l_AvatarEditorSubcategories_0 = v6.Enums.AvatarEditorSubcategories;
local l_AvatarEditorCategories_0 = v6.Enums.AvatarEditorCategories;
local v31 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v32 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v34 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v35 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v36 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v38 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils);
local v39 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v40 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v45 = require(l_Modules_0.AvatarExperience.Common.Hooks.useShareButton);
local v46 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFavoriteButton);
local v47 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v50 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v51 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableLookFavoriting);
local l_getUseSelectorDeepEquals_0 = v50.Utils.getUseSelectorDeepEquals;
local l_selectTryOnsLookId_0 = v50.State.Selectors.selectTryOnsLookId;
local l_useFocusController_0 = v10.useFocusController;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances);
local v58 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v59 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v60 = game:DefineFastFlag("AXHideShareButtonForContextMenu", false);
local v61 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMISEnableMultiShopping_0 = v61.FFlagAXMISEnableMultiShopping;
local l_FFlagAXDurablesSupport_0 = v61.FFlagAXDurablesSupport;
local l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 = v61.FFlagAXEnableUnifiedPurchaseFlowForLooks;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local v66 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v66.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v66.Enums.ProductPurchaseSurface;
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v66.getIsUserEligibleForUnifiedPurchaseFlow;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixLookDetailsContextualMenu_0 = v61.FFlagAXFixLookDetailsContextualMenu;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagAXFixLookLinkToCustomize_0 = v61.FFlagAXFixLookLinkToCustomize;
local v79 = l_Images_0["icons/common/robux"];
local v80 = l_Images_0["icons/actions/block"];
local v81 = l_Images_0["icons/menu/avatar_on"];
local v82 = l_Images_0["icons/actions/feedback"];
local v83 = l_Images_0["icons/actions/info"];
local v84 = l_Images_0["icons/actions/edit/delete"];
local function v86(v85) --[[ Line: 125 ]] --[[ Name: selectTryOnItems ]]
    return v85.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v88(v87) --[[ Line: 128 ]] --[[ Name: selectLookId ]]
    return v87.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v90(v89) --[[ Line: 131 ]] --[[ Name: selectLookDetails ]]
    return v89.AvatarExperience.AvatarScene.Looks;
end;
local function v92(v91) --[[ Line: 134 ]] --[[ Name: selectLocalUserId ]]
    return v91.LocalUserId;
end;
local function v94(v93) --[[ Line: 137 ]] --[[ Name: selectUserRobux ]]
    return v93.UserRobux;
end;
local function v96(v95) --[[ Line: 140 ]] --[[ Name: selectCollectiblesItemInfo ]]
    return v95.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
end;
local function v98(v97) --[[ Line: 143 ]] --[[ Name: selectCollectiblesResellersInstances ]]
    return v97.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
end;
local function v100(v99) --[[ Line: 146 ]] --[[ Name: selectResellableInstances ]]
    return v99.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
end;
local function v102(v101) --[[ Line: 149 ]] --[[ Name: selectPeekViewState ]]
    return v101.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local v103 = nil;
if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
    v103 = function(v104) --[[ Line: 154 ]]
        return v104.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
    end;
end;
local function _(v105, v106) --[[ Line: 159 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v32 (copy)
    local v107 = v32();
    local v108 = nil;
    local v109 = nil;
    for v110, v111 in v107 do
        if v111.Name == v105 then
            v108 = v110;
            if v106 and v111.Subcategories then
                for v112, v113 in v111.Subcategories do
                    if v113.Name == v106 then
                        return v108, v112;
                    end;
                end;
                return v108, v109;
            else
                break;
            end;
        end;
    end;
    return v108, v109;
end;
local function v129(v115, v116, v117, v118, v119, v120) --[[ Line: 180 ]]
    -- upvalues: v38 (copy), l_FFlagAXDurablesSupport_0 (copy), v5 (copy)
    local v121 = 0;
    local v122 = 0;
    local v123 = {};
    local v124 = false;
    for _, v126 in v115 do
        if v126.selectedInTryOnManager then
            v121 = v121 + 1;
            local v127 = v38.getItemInfo(v126.itemId, v126.itemType, v119, v120);
            if not v127 then
                if not v124 then
                    v124 = true;
                end;
            elseif not v127 or not v127.quantityOwned or v127.quantityOwned <= 0 then
                local v128 = v38.getPriceForItem(v127, v116, v117, v118, if l_FFlagAXDurablesSupport_0 then v126.selectedTimedOptionIndex else nil);
                if v128 ~= nil then
                    v122 = v122 + v128;
                    v123[v126.itemId] = v5.Dictionary.join(v126, {
                        expectedPrice = v128
                    });
                end;
            end;
        end;
    end;
    return v122, v121, v123, v124;
end;
local v130 = {
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
return function(v131) --[[ Line: 259 ]] --[[ Name: LookDetailsBottomBar ]]
    -- upvalues: l_UserInputService_0 (copy), v40 (copy), l_isGamepadInput_0 (copy), l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v90 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_selectTryOnsLookId_0 (copy), v88 (copy), v51 (copy), l_useNavigation_0 (copy), v47 (copy), v16 (copy), v15 (copy), v14 (copy), v103 (ref), l_useLocalization_0 (copy), v130 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v86 (copy), v92 (copy), v94 (copy), v96 (copy), v98 (copy), v100 (copy), v102 (copy), v25 (copy), v21 (copy), v58 (copy), v59 (copy), v46 (copy), v5 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), v27 (copy), l_AvatarScreen_0 (copy), v45 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v35 (copy), v36 (copy), v34 (copy), l_PeekViewState_0 (copy), v39 (copy), v23 (copy), v20 (copy), l_FFlagAXFixLookDetailsContextualMenu_0 (copy), v83 (copy), v60 (copy), v84 (copy), v82 (copy), v24 (copy), v38 (copy), l_FFlagAXDurablesSupport_0 (copy), v129 (copy), v31 (copy), l_FFlagAXFixLookLinkToCustomize_0 (copy), v12 (copy), l_AvatarEditorSubcategories_0 (copy), l_AvatarEditorCategories_0 (copy), v33 (copy), v32 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v28 (copy), v79 (copy), v81 (copy), v80 (copy), l_NumberLocalization_0 (copy), v3 (copy), v22 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v133, _ = v40.useState(l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0));
    local v135, v136 = v40.useState(false);
    local v137 = nil;
    local v138 = nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        local v139, v140 = v40.useState(false);
        v137 = v139;
        v138 = v140;
    end;
    local v141 = l_useAvatarRoute_0();
    local v142 = l_useDispatch_0();
    local v143 = l_useSelector_0(v90, l_getUseSelectorDeepEquals_0());
    local v144 = l_useSelector_0(if l_FFlagAXCatalogMakeupSupport_0 and l_FFlagAXMISEnableMultiShopping_0 then l_selectTryOnsLookId_0 else v88, l_getUseSelectorDeepEquals_0());
    local v145 = if v51() then v144 ~= nil and v143[v144] ~= nil and (v143[v144].isFavorited or false) else false;
    local v146 = l_useNavigation_0();
    local v147 = v47(v16);
    local v148 = v47(v15);
    local v149 = v47(v14);
    local v150 = nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        v150 = l_useSelector_0(v103, l_getUseSelectorDeepEquals_0());
    end;
    local v151 = l_useLocalization_0(v130);
    local v152 = l_useStyle_0();
    local l_Theme_0 = v152.Theme;
    local l_Font_0 = v152.Font;
    local v155 = l_useDesignTokens_0();
    local v156 = l_useSelector_0(v86, l_getUseSelectorDeepEquals_0());
    local v157 = l_useSelector_0(v92, l_getUseSelectorDeepEquals_0());
    local v158 = l_useSelector_0(v94, l_getUseSelectorDeepEquals_0())[v157];
    local v159 = l_useSelector_0(v96, l_getUseSelectorDeepEquals_0());
    local v160 = l_useSelector_0(v98, l_getUseSelectorDeepEquals_0());
    local v161 = l_useSelector_0(v100, l_getUseSelectorDeepEquals_0());
    local v162 = l_useSelector_0(v102, l_getUseSelectorDeepEquals_0());
    local v166 = if v51() then v40.useCallback(function(v163) --[[ Line: 308 ]]
        -- upvalues: v25 (ref), v145 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v144 (copy), v143 (copy), v142 (copy), v21 (ref), v147 (copy), v58 (ref), v59 (ref)
        v25.closeOverlay(v163);
        local v164 = not v145;
        if l_FFlagAXCatalogMakeupSupport_0 then
            local v165 = if v144 and v143[v144] then v143[v144].lookType else nil;
            v142(v21(v147, v144, v164, v165));
        else
            v142(v21(v147, v144, v164));
        end;
        v142(v58({
            toastMessage = v164 and "Feature.Catalog.Toast.FavoritedLook" or "Feature.Catalog.Toast.UnfavoritedLook", 
            toastType = v59.SuccessConfirmation
        }));
    end, {
        v142, 
        v58, 
        v21, 
        v144, 
        v143, 
        v147, 
        v145, 
        v146
    }) else nil;
    local v167 = if v51() then v46(v144, v145, v166) else nil;
    local v168 = if l_FFlagAXMISEnableMultiShopping_0 and v131.alwaysBuyAll then v40.useMemo(function() --[[ Line: 345 ]]
        -- upvalues: v144 (copy), v143 (copy), v5 (ref)
        if v144 and v143 then
            return v5.Dictionary.union(v143[v144].lookAssetInfos or {}, v143[v144].lookBundleInfos or {});
        else
            return {};
        end;
    end, {
        v144, 
        v143
    }) else nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        v40.useEffect(function() --[[ Line: 357 ]]
            -- upvalues: l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v147 (copy), v138 (ref)
            l_getIsUserEligibleForUnifiedPurchaseFlow_0(v147):andThen(function(v169) --[[ Line: 359 ]]
                -- upvalues: v138 (ref)
                v138(v169);
            end):catch(function(_) --[[ Line: 362 ]]
                -- upvalues: v138 (ref)
                v138(false);
            end);
        end, {
            v147
        });
    end;
    local v171 = v40.useCallback(function() --[[ Line: 369 ]]
        -- upvalues: v142 (copy), v58 (ref), v59 (ref)
        v142(v58({
            toastMessage = "Feature.Catalog.Toast.AvatarUnderReview", 
            toastType = v59.NetworkingError
        }));
    end, {
        v142
    });
    local v172 = v40.useMemo(function() --[[ Line: 375 ]]
        -- upvalues: v143 (copy), v144 (copy), v27 (ref)
        if v143 and v144 then
            return v143[v144].moderationStatus == v27.ModerationStatus.Moderated;
        else
            return false;
        end;
    end, {
        v143, 
        v144
    });
    local v173 = v40.useMemo(function() --[[ Line: 382 ]]
        -- upvalues: v143 (copy), v144 (copy), v27 (ref)
        if v143 and v144 then
            return v143[v144].moderationStatus == v27.ModerationStatus.PendingModeration;
        else
            return false;
        end;
    end, {
        v143, 
        v144
    });
    local v174 = v40.useMemo(function() --[[ Line: 389 ]]
        -- upvalues: v141 (copy), l_AvatarScreen_0 (ref)
        return v141 and v141.opaque and v141.opaque.name == l_AvatarScreen_0.MySharedAvatars;
    end, {
        v141
    });
    local v175 = v45(v144, v27.ItemType.Look, true, nil, v173 and v171 or nil);
    local v176 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v178 = v40.useCallback(function(v177) --[[ Line: 408 ]]
        -- upvalues: v149 (copy), v27 (ref), v142 (copy), v35 (ref), v141 (copy), v36 (ref), v34 (ref), l_PeekViewState_0 (ref), v25 (ref)
        v149.sendAXCounter(v27.Counter.ContextFrame.ViewDetailsPageClick);
        v142(v35(v149, v141.opaque.name, v36.None));
        v142(v34(l_PeekViewState_0.Brief));
        v25.closeOverlay(v177);
    end, {
        v149, 
        v142, 
        v141
    });
    local v180 = v40.useMemo(function() --[[ Line: 415 ]]
        -- upvalues: v157 (copy), v143 (copy), v144 (copy), v39 (ref)
        if v157 and v143 and v144 then
            local v179 = v143[v144];
            return v179 and v179.curator and tostring(v179.curator.id) == tostring(v157) and v179.curator.type == v39.CreatorType.User;
        else
            return false;
        end;
    end, {
        v143, 
        v144, 
        v157
    });
    local v181 = v40.useCallback(function() --[[ Line: 428 ]]
        -- upvalues: v133 (copy), v141 (copy), l_AvatarScreen_0 (ref), v23 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v176 (copy)
        if v133 and v141.current.name == l_AvatarScreen_0.LookDetails then
            v23("LookDetails");
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v176.captureFocus();
            end;
        end;
    end, {
        v133, 
        v141, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v176
    });
    local v185 = v40.useCallback(function(v182) --[[ Line: 445 ]]
        -- upvalues: v149 (copy), v27 (ref), v25 (ref), l_AvatarScreen_0 (ref), v181 (copy), v144 (copy), v146 (copy), v142 (copy), v20 (ref)
        v149.sendAXCounter(v27.Counter.ContextFrame.DeleteAvatarClick);
        v25.closeOverlay(v182);
        v142(v20(function() --[[ Line: 448 ]]
            -- upvalues: l_AvatarScreen_0 (ref), v181 (ref), v144 (ref), v146 (ref)
            local l_DeleteAvatarConfirmationPrompt_0 = l_AvatarScreen_0.DeleteAvatarConfirmationPrompt;
            local v184 = {
                onOverlayClosed = v181, 
                lookId = v144
            };
            v146.navigate(l_DeleteAvatarConfirmationPrompt_0, v184);
        end));
    end, {
        v149, 
        v142, 
        v144, 
        v181
    });
    local v190 = v40.useCallback(function() --[[ Line: 460 ]]
        -- upvalues: v162 (copy), l_PeekViewState_0 (ref), l_FFlagAXFixLookDetailsContextualMenu_0 (ref), v83 (ref), v151 (copy), v178 (copy), v51 (ref), v172 (copy), v167 (copy), v60 (ref), v174 (copy), v175 (copy), v180 (copy), v84 (ref), v185 (copy), v82 (ref), v142 (copy), v24 (ref), v147 (copy), v25 (ref)
        local v186 = v162 == l_PeekViewState_0.SuperBrief;
        if l_FFlagAXFixLookDetailsContextualMenu_0 then
            local v187 = {};
            if v186 then
                table.insert(v187, {
                    icon = v83, 
                    text = v151.viewDetailsPageLabel, 
                    onActivated = v178
                });
            end;
            if v51() and not v172 then
                table.insert(v187, v167);
            end;
            if not v60 and not v172 and not v174 then
                table.insert(v187, v175);
            end;
            if v180 and v174 then
                table.insert(v187, {
                    icon = v84, 
                    text = v151.deleteAvatarLabel, 
                    onActivated = v185
                });
            end;
            if not v180 then
                table.insert(v187, {
                    icon = v82, 
                    text = v151.reportText, 
                    onActivated = function(v188) --[[ Line: 495 ]] --[[ Name: onActivated ]]
                        -- upvalues: v142 (ref), v24 (ref), v147 (ref), v25 (ref)
                        v142(v24(v147));
                        v25.closeOverlay(v188);
                    end
                });
            end;
            return v187;
        else
            return {
                if not v186 then nil else {
                    icon = v83, 
                    text = v151.viewDetailsPageLabel, 
                    onActivated = v178
                }, 
                if not v51() or v172 then nil else v167, 
                if not not v60 or v172 or v174 then nil else v175, 
                if v180 and v174 then {
                    icon = v84, 
                    text = v151.deleteAvatarLabel, 
                    onActivated = v185
                } else nil, 
                if v180 then nil else {
                    icon = v82, 
                    text = v151.reportText, 
                    onActivated = function(v189) --[[ Line: 530 ]] --[[ Name: onActivated ]]
                        -- upvalues: v142 (ref), v24 (ref), v147 (ref), v25 (ref)
                        v142(v24(v147));
                        v25.closeOverlay(v189);
                    end
                }
            };
        end;
    end, {
        v147, 
        v151, 
        v178, 
        v185, 
        v180, 
        v142, 
        v175, 
        if v51() then v167 else nil, 
        if v51() then v145 else nil, 
        if v51() then v162 else nil, 
        v172, 
        v174
    });
    local v191 = v40.useCallback(function() --[[ Line: 554 ]]
        -- upvalues: v136 (copy), v181 (copy)
        v136(false);
        v181();
    end, {
        v181
    });
    local v194 = v40.useCallback(function() --[[ Line: 560 ]]
        -- upvalues: v190 (copy), v82 (ref), v151 (copy), v142 (copy), v24 (ref), v147 (copy), v25 (ref), v60 (ref), v172 (copy), v174 (copy), v175 (copy), v146 (copy), l_AvatarScreen_0 (ref), v131 (copy), v191 (copy), v20 (ref)
        v142(v20(function() --[[ Line: 561 ]]
            -- upvalues: v190 (ref), v82 (ref), v151 (ref), v142 (ref), v24 (ref), v147 (ref), v25 (ref), v60 (ref), v172 (ref), v174 (ref), v175 (ref), v146 (ref), l_AvatarScreen_0 (ref), v131 (ref), v191 (ref)
            local v193 = if v190 then v190() else {
                {
                    icon = v82, 
                    text = v151.reportText, 
                    onActivated = function(v192) --[[ Line: 568 ]] --[[ Name: onActivated ]]
                        -- upvalues: v142 (ref), v24 (ref), v147 (ref), v25 (ref)
                        v142(v24(v147));
                        v25.closeOverlay(v192);
                    end
                }, 
                if not not v60 or v172 or v174 then nil else v175
            };
            v146.navigate(l_AvatarScreen_0.ContextMenu, {
                centered = v131.centered, 
                contextButtons = v193, 
                onOverlayClosed = v191
            });
        end));
    end, {
        v146, 
        v142, 
        v191, 
        v151, 
        v147, 
        v175, 
        v190
    });
    local v195 = nil;
    local v196 = nil;
    local v197 = nil;
    local v198 = nil;
    local v199 = nil;
    local v200 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 and v131.alwaysBuyAll then
        local v201, v202, v203, v204, v205 = v40.useMemo(function() --[[ Line: 601 ]]
            -- upvalues: v38 (ref), v168 (copy), v159 (copy), v160 (copy), v161 (copy), v143 (copy), v144 (copy), l_FFlagAXDurablesSupport_0 (ref), v156 (copy)
            return v38.getBottomBarInfoMIS(v168, v159, v160, v161, v143, v144, if l_FFlagAXDurablesSupport_0 then v156 else nil);
        end, {
            v159, 
            v160, 
            v161, 
            v143, 
            v144, 
            v168, 
            if l_FFlagAXDurablesSupport_0 then v156 else nil
        });
        v195 = v201;
        v196 = v202;
        v197 = v203;
        v198 = v204;
        v200 = v205;
    else
        local v206, v207, v208, v209 = v40.useMemo(function() --[[ Line: 624 ]]
            -- upvalues: v129 (ref), v156 (copy), v159 (copy), v160 (copy), v161 (copy), v143 (copy), v144 (copy)
            return v129(v156, v159, v160, v161, v143, v144);
        end, {
            v156, 
            v159, 
            v160, 
            v161, 
            v143, 
            v144
        });
        v195 = v206;
        v199 = v207;
        v200 = v208;
        v198 = v209;
    end;
    local v248 = if l_FFlagAXMISEnableMultiShopping_0 and v168 and v131.alwaysBuyAll then v40.useCallback(function() --[[ Line: 649 ]]
        -- upvalues: v38 (ref), v168 (copy), v159 (copy), v160 (copy), v161 (copy), v143 (copy), v144 (copy), l_FFlagAXDurablesSupport_0 (ref), v156 (copy), v158 (copy), l_AvatarScreen_0 (ref), v181 (copy), v149 (copy), v31 (ref), l_FFlagAXFixLookLinkToCustomize_0 (ref), v12 (ref), v27 (ref), l_AvatarEditorSubcategories_0 (ref), l_AvatarEditorCategories_0 (ref), v33 (ref), v32 (ref), v141 (copy), v131 (copy), v25 (ref), v146 (copy), v142 (copy), v20 (ref)
        local v210, _, v212, _ = v38.getBottomBarInfoMIS(v168, v159, v160, v161, v143, v144, if l_FFlagAXDurablesSupport_0 then v156 else nil);
        local v214 = nil;
        local v215 = nil;
        if v158 < v210 then
            v214 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v215 = {
                onOverlayClosed = v181
            };
            v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v212 == 0 and v144 ~= nil then
            local v216 = nil;
            local v217 = nil;
            if l_FFlagAXFixLookLinkToCustomize_0 then
                local v218, v219 = v12.GetAvatarEditorCategoryIdsFromNavKey(if v143[v144].lookType == v27.LookType.Makeup then l_AvatarEditorSubcategories_0.MakeupLooks else l_AvatarEditorCategories_0.Avatars);
                v216 = v218;
                v217 = v219;
            else
                local l_CharacterKey_0 = v33.CharacterKey;
                local v221 = v32();
                local v222 = nil;
                local v223 = nil;
                for v224, v225 in v221 do
                    if v225.Name == l_CharacterKey_0 then
                        v222 = v224;
                        break;
                    end;
                end;
                local l_v222_0 = v222;
                local l_v223_0 = v223;
                v216 = l_v222_0;
                v217 = l_v223_0;
            end;
            v214 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v215 = {
                onOverlayClosed = v181, 
                categoryOverride = v216, 
                subcategoryOverride = v217
            };
            v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v228 = v38.getOwnedItemsInLook(v168, v143, v144);
            if v144 ~= nil then
                v214 = l_AvatarScreen_0.PurchaseLookPrompt;
                v215 = {
                    lookId = v144, 
                    priceInRobux = v210, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true, 
                    fromAvatarRoute = v141, 
                    allLookItems = v168, 
                    ownedItemsInLook = v228, 
                    isTryOnFromOutsideAX = v131.isTryOnFromOutsideAX
                };
                if v25.isWithinViewContext(v141, l_AvatarScreen_0.CatalogSearch) then
                    v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked);
                else
                    v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked);
                end;
            else
                v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId);
                v215 = {
                    onOverlayClosed = v181
                };
            end;
        end;
        v142(v20(function() --[[ Line: 739 ]]
            -- upvalues: v146 (ref), v214 (ref), v215 (ref)
            v146.navigate(v214, v215);
        end));
    end, {
        v159, 
        v160, 
        v161, 
        v143, 
        v144, 
        v158, 
        v142, 
        v146, 
        v181, 
        v149, 
        v141, 
        v168, 
        if l_FFlagAXDurablesSupport_0 then v156 else nil
    }) else v40.useCallback(function() --[[ Line: 761 ]]
        -- upvalues: v129 (ref), v156 (copy), v159 (copy), v160 (copy), v161 (copy), v143 (copy), v144 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v158 (copy), l_AvatarScreen_0 (ref), v181 (copy), v149 (copy), v31 (ref), v5 (ref), l_FFlagAXFixLookLinkToCustomize_0 (ref), v12 (ref), v27 (ref), l_AvatarEditorSubcategories_0 (ref), l_AvatarEditorCategories_0 (ref), v33 (ref), v32 (ref), v38 (ref), v141 (copy), v131 (copy), v25 (ref), v146 (copy), v142 (copy), v20 (ref)
        local v229, _, v231 = v129(v156, v159, v160, v161, v143, v144);
        local v232 = nil;
        local v233 = nil;
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
            local v234 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
            l_TimeToInteractiveTracker_0.trackStart(v234);
            l_TimeToInteractiveTracker_0.updateMetadata(v234, {
                page = l_ProductPurchaseSurface_0.Catalog, 
                category = "legacy_purchase_modal"
            });
        end;
        if v158 < v229 then
            v232 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v233 = {
                onOverlayClosed = v181
            };
            v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v5.isEmpty(v231) and v144 ~= nil then
            local v235 = nil;
            local v236 = nil;
            if l_FFlagAXFixLookLinkToCustomize_0 then
                local v237, v238 = v12.GetAvatarEditorCategoryIdsFromNavKey(if v143[v144].lookType == v27.LookType.Makeup then l_AvatarEditorSubcategories_0.MakeupLooks else l_AvatarEditorCategories_0.Avatars);
                v235 = v237;
                v236 = v238;
            else
                local l_CharacterKey_1 = v33.CharacterKey;
                local v240 = v32();
                local v241 = nil;
                local v242 = nil;
                for v243, v244 in v240 do
                    if v244.Name == l_CharacterKey_1 then
                        v241 = v243;
                        break;
                    end;
                end;
                local l_v241_0 = v241;
                local l_v242_0 = v242;
                v235 = l_v241_0;
                v236 = l_v242_0;
            end;
            v232 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v233 = {
                onOverlayClosed = v181, 
                categoryOverride = v235, 
                subcategoryOverride = v236
            };
            v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v247 = v38.getOwnedTryOnItems(v156, v143, v144);
            if v144 ~= nil then
                v232 = l_AvatarScreen_0.PurchaseLookPrompt;
                v233 = {
                    itemsToPurchase = v231, 
                    lookId = v144, 
                    ownedTryOnItems = v247, 
                    priceInRobux = v229, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true, 
                    fromAvatarRoute = v141, 
                    isTryOnFromOutsideAX = v131.isTryOnFromOutsideAX
                };
                if v25.isWithinViewContext(v141, l_AvatarScreen_0.CatalogSearch) then
                    v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked);
                else
                    v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked);
                end;
            else
                v149.sendAXCounter(v31.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId);
                v233 = {
                    onOverlayClosed = v181
                };
            end;
        end;
        v142(v20(function() --[[ Line: 859 ]]
            -- upvalues: v146 (ref), v232 (ref), v233 (ref)
            v146.navigate(v232, v233);
        end));
    end, {
        v156, 
        v159, 
        v160, 
        v161, 
        v143, 
        v144, 
        v158, 
        v142, 
        v146, 
        v181, 
        v149, 
        v141
    });
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        local l_onButtonPressWithUnifiedPurchaseFlow_0 = v28({
            lookId = v144, 
            totalPrice = v195, 
            tryOnItems = v156, 
            lookDetailsObj = v143, 
            lookAnalyticsInfo = v150, 
            localized = v151, 
            isTryOnFromOutsideAX = v131.isTryOnFromOutsideAX, 
            itemsToPurchase = v200, 
            userRobux = v158, 
            onOverlayClosed = v181
        }).onButtonPressWithUnifiedPurchaseFlow;
        if v137 then
            v248 = l_onButtonPressWithUnifiedPurchaseFlow_0;
        end;
    end;
    local v254 = if l_FFlagAXMISEnableMultiShopping_0 and v131.alwaysBuyAll then nil else v40.useCallback(function() --[[ Line: 901 ]]
        -- upvalues: v156 (copy), v38 (ref), v143 (copy), v144 (copy)
        local v250 = 0;
        for _, v252 in v156 do
            if v252.selectedInTryOnManager then
                local v253 = v38.getItemInfo(v252.itemId, v252.itemType, v143, v144);
                if not v253 or not v253.quantityOwned or v253.quantityOwned == 0 then
                    return false;
                else
                    v250 = v250 + 1;
                end;
            end;
        end;
        return v250 > 0;
    end, {
        v156, 
        v143, 
        v144
    });
    local v260 = if l_FFlagAXMISEnableMultiShopping_0 and v131.alwaysBuyAll then v40.useCallback(function(v255) --[[ Line: 924 ]]
        -- upvalues: v168 (copy), v38 (ref), v143 (copy)
        if v168 == nil then
            return false;
        else
            local v256 = 0;
            for _, v258 in v168 do
                local v259 = if v258.itemType then v38.getItemInfo(v258.id, v258.itemType, v143, v255) else nil;
                if not v259 or not v259.quantityOwned or v259.quantityOwned == 0 then
                    return false;
                else
                    v256 = v256 + 1;
                end;
            end;
            return v256 > 0;
        end;
    end, {
        v143, 
        v168
    }) else nil;
    local l_v79_0 = v79;
    local v262 = false;
    local v263 = nil;
    local v264 = v200 and v5.isEmpty(v200);
    if l_FFlagAXMISEnableMultiShopping_0 and v131.alwaysBuyAll then
        v264 = v197 == 0;
    end;
    if v264 then
        v263 = "";
        local v265 = v254 and v254();
        if l_FFlagAXMISEnableMultiShopping_0 and v131.alwaysBuyAll then
            v265 = v260 and v260(v144) ~= nil;
        end;
        if v144 ~= nil and v265 then
            l_v79_0 = v81;
        else
            l_v79_0 = v80;
            v262 = true;
        end;
    elseif v195 == 0 then
        l_v79_0 = nil;
        v263 = v151.freeText;
    else
        v263 = l_NumberLocalization_0.localize(string.format("%.0f", v195), v148:GetLocale());
    end;
    if v158 == nil then
        v262 = true;
    end;
    local v266 = v148:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
        numItems = if l_FFlagAXMISEnableMultiShopping_0 and v131.alwaysBuyAll then v196 else v199
    });
    local l_hideDescriptor_0 = v131.hideDescriptor;
    local v268 = v3.createElement("TextLabel", {
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v155.Global.Size_400), 
        Text = v266, 
        TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
        Font = l_Font_0.Header2.Font, 
        TextColor3 = l_Theme_0.SecondaryContent.Color, 
        TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    });
    local v269 = v40.useCallback(function() --[[ Line: 1004 ]]
        -- upvalues: v194 (copy), v136 (copy)
        v194();
        v136(true);
    end, {
        v194, 
        v136
    });
    local v270 = v40.useMemo(function() --[[ Line: 1009 ]]
        -- upvalues: v263 (ref), l_v79_0 (ref), v198 (ref), v262 (ref), v155 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v152 (copy), v248 (ref)
        return {
            buttonText = v263, 
            buttonIcon = l_v79_0, 
            buttonIsLoading = v198, 
            buttonIsDisabled = v262, 
            buttonIconPadding = v155.Global.Space_50, 
            buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v155.Global.Size_250 else v155.Global.Size_400, 
            buttonColor = v152.Theme.ContextualPrimaryDefault.Color, 
            buttonTextColor = v152.Theme.ContextualPrimaryContent.Color, 
            onActivated = not v262 and v248 or nil
        };
    end, {
        v263, 
        l_v79_0, 
        v198, 
        v262, 
        v155, 
        v152, 
        v248
    });
    local v271 = v174 and not v172 and v175 ~= nil;
    return v3.createElement(v22, {
        bottomPadding = 0, 
        buttonProps = v270, 
        hideGradient = true, 
        isMoreButtonSelected = v135, 
        leftPadding = 0, 
        onMoreButtonActivated = v269, 
        rightPadding = 0, 
        showMoreButton = true, 
        showMiddleButton = v271, 
        onMiddleButtonActivated = if v271 then v175.onActivated else nil, 
        middleButtonIcon = if v271 then v175.icon else nil, 
        topComponent = if l_hideDescriptor_0 then nil else v268, 
        topComponentHeight = l_hideDescriptor_0 and 0 or v155.Global.Size_400, 
        ZIndex = 1
    });
end;