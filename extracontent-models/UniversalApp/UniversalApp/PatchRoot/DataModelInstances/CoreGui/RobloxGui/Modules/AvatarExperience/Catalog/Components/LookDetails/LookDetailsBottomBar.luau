local l_CoreGui_0 = game:GetService("CoreGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.UIBlox);
local v5 = require(l_CorePackages_0.Packages.Cryo);
local v6 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceSlotBasedEditor);
local v7 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_NumberLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).NumberLocalization;
local l_isGamepadInput_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).isGamepadInput;
local l_Images_0 = v4.App.ImageSet.Images;
local v11 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v13 = require(l_Modules_0.AvatarExperience.Common.Utils);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v15 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v16 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
local v17 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v18.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v18.AvatarRoute.Hooks.useAvatarRoute;
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v22 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SetLookFavorite);
local v23 = require(l_Modules_0.AvatarExperience.Catalog.Components.ActionBar.ActionBar);
local l_logOnOverlayClosed_0 = v18.Debug.logOnOverlayClosed;
local v25 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.ReportLook);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local _ = require(l_Modules_0.AvatarExperience.Common.Components.ItemDetails.Prompts.ContextFrame);
local v28 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v29 = require(l_Modules_0.AvatarExperience.Catalog.Hooks.useLookUnifiedPurchaseFlow);
local l_AvatarEditorSubcategories_0 = v6.Enums.AvatarEditorSubcategories;
local l_AvatarEditorCategories_0 = v6.Enums.AvatarEditorCategories;
local v32 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.GetAvatarEditorCategories);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_SetTryOnManagerPeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.SetTryOnManagerPeekViewState;
local v36 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_FullView_0 = v7.Enums.FullView;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v39 = require(l_Modules_0.AvatarExperience.Catalog.Components.LookDetails.LookDetailsBottomBarUtils);
local v40 = require(l_Modules_0.AvatarExperience.Catalog.CatalogConstants);
local v41 = require(l_CorePackages_0.Packages.React);
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v46 = require(l_Modules_0.AvatarExperience.Common.Hooks.useShareButton);
local v47 = require(l_Modules_0.AvatarExperience.Common.Hooks.useFavoriteButton);
local v48 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v51 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableLookFavoriting);
local l_getUseSelectorDeepEquals_0 = v7.Utils.getUseSelectorDeepEquals;
local l_selectTryOnsLookId_0 = v7.State.Selectors.selectTryOnsLookId;
local l_useFocusController_0 = v11.useFocusController;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesItemInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellableInstances);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.CollectiblesResellersInstances);
local v58 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v59 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v60 = game:DefineFastFlag("AXHideShareButtonForContextMenu", false);
local v61 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXMISEnableMultiShopping_0 = v61.FFlagAXMISEnableMultiShopping;
local l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 = v61.FFlagAXEnableUnifiedPurchaseFlowForLooks;
local l_FFlagAXCatalogMakeupSupport_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXCatalogMakeupSupport;
local v65 = require(l_CorePackages_0.Workspace.Packages.PurchasePromptLite);
local l_getTTIEventName_0 = v65.getTTIEventName;
local l_TimeToInteractiveTracker_0 = require(l_CorePackages_0.Workspace.Packages.TimeToInteractiveTracker).TimeToInteractiveTracker;
local l_ProductPurchaseSurface_0 = v65.Enums.ProductPurchaseSurface;
local l_getIsUserEligibleForUnifiedPurchaseFlow_0 = v65.getIsUserEligibleForUnifiedPurchaseFlow;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.Looks);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local l_FFlagUnifiedPurchaseFlowMarketplaceUIImprovements_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUnifiedPurchaseFlowMarketplaceUIImprovements;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXFixLookDetailsContextualMenu_0 = v61.FFlagAXFixLookDetailsContextualMenu;
local l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAddPerformanceMetricsToUnifiedPurchaseModal;
local l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks_0 = v61.FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks;
local l_FFlagAXFixLookLinkToCustomize_0 = v61.FFlagAXFixLookLinkToCustomize;
local l_FFlagAXBlackbirdRoot_0 = v61.FFlagAXBlackbirdRoot;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v61.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v81 = l_Images_0["icons/common/robux"];
local v82 = l_Images_0["icons/actions/block"];
local v83 = l_Images_0["icons/menu/avatar_on"];
local v84 = l_Images_0["icons/actions/feedback"];
local v85 = l_Images_0["icons/actions/info"];
local v86 = l_Images_0["icons/actions/edit/delete"];
local function v88(v87) --[[ Line: 131 ]] --[[ Name: selectTryOnItems ]]
    return v87.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v90(v89) --[[ Line: 134 ]] --[[ Name: selectLookId ]]
    return v89.AvatarExperience.AvatarScene.OutfitTryOn.LookId;
end;
local function v92(v91) --[[ Line: 137 ]] --[[ Name: selectLookDetails ]]
    return v91.AvatarExperience.AvatarScene.Looks;
end;
local function v94(v93) --[[ Line: 140 ]] --[[ Name: selectLocalUserId ]]
    return v93.LocalUserId;
end;
local function v96(v95) --[[ Line: 143 ]] --[[ Name: selectUserRobux ]]
    return v95.UserRobux;
end;
local function v98(v97) --[[ Line: 146 ]] --[[ Name: selectCollectiblesItemInfo ]]
    return v97.AvatarExperience.Common.Collectibles.CollectiblesItemInfo;
end;
local function v100(v99) --[[ Line: 149 ]] --[[ Name: selectCollectiblesResellersInstances ]]
    return v99.AvatarExperience.Common.Collectibles.CollectiblesResellersInstances;
end;
local function v102(v101) --[[ Line: 152 ]] --[[ Name: selectResellableInstances ]]
    return v101.AvatarExperience.Common.Collectibles.CollectiblesResellableInstances;
end;
local function v104(v103) --[[ Line: 155 ]] --[[ Name: selectPeekViewState ]]
    return v103.AvatarExperience.Common.ItemDetailsPeekView.tryOnManagerViewState;
end;
local v105 = nil;
if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
    v105 = function(v106) --[[ Line: 160 ]]
        return v106.AvatarExperience.AvatarScene.OutfitTryOn.LookAnalyticsInfo;
    end;
end;
local v107 = nil;
if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
    v107 = function(v108) --[[ Line: 167 ]]
        return v108.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookAnalyticsInfo;
    end;
end;
local function _(v109, v110) --[[ Line: 172 ]] --[[ Name: getAvatarEditorCategoryIndexesByName ]]
    -- upvalues: v33 (copy)
    local v111 = v33();
    local v112 = nil;
    local v113 = nil;
    for v114, v115 in v111 do
        if v115.Name == v109 then
            v112 = v114;
            if v110 and v115.Subcategories then
                for v116, v117 in v115.Subcategories do
                    if v117.Name == v110 then
                        return v112, v116;
                    end;
                end;
                return v112, v113;
            else
                break;
            end;
        end;
    end;
    return v112, v113;
end;
local function v140(v119, v120, v121, v122, v123, v124) --[[ Line: 193 ]]
    -- upvalues: v39 (copy), l_FFlagAXBlackbirdRoot_0 (copy), v5 (copy)
    local v125 = 0;
    local v126 = 0;
    local v127 = 0;
    local v128 = {};
    local v129 = false;
    for _, v131 in v119 do
        if v131.selectedInTryOnManager then
            v125 = v125 + 1;
            local v132 = v39.getItemInfo(v131.itemId, v131.itemType, v123, v124);
            if not v132 then
                if not v129 then
                    v129 = true;
                end;
            elseif not v132 or not v132.quantityOwned or v132.quantityOwned <= 0 then
                local v133 = v39.getPriceForItem(v132, v120, v121, v122, v131.selectedTimedOptionIndex);
                if v133 ~= nil then
                    if l_FFlagAXBlackbirdRoot_0 then
                        if v132 and v132.discountInformation then
                            local v134 = false;
                            if v131.selectedTimedOptionIndex and v132.timedOptions then
                                local v135 = v132.timedOptions[v131.selectedTimedOptionIndex];
                                if v135 and v135.discountInformation then
                                    v127 = v127 + v135.discountInformation.originalPrice;
                                    v134 = true;
                                elseif v135 and not v135.discountInformation and v135.days ~= 0 then
                                    v127 = v127 + v135.price;
                                    v134 = true;
                                end;
                            end;
                            if not v134 then
                                v127 = v127 + v132.discountInformation.originalPrice;
                            end;
                        else
                            v127 = v127 + v133;
                        end;
                    end;
                    v126 = v126 + v133;
                    v128[v131.itemId] = v5.Dictionary.join(v131, {
                        expectedPrice = v133
                    });
                end;
            end;
        end;
    end;
    local l_v126_0 = v126;
    local l_v125_0 = v125;
    local l_v128_0 = v128;
    local l_v129_0 = v129;
    if l_FFlagAXBlackbirdRoot_0 then
        return l_v126_0, l_v125_0, l_v128_0, l_v129_0, v127;
    else
        return l_v126_0, l_v125_0, l_v128_0, l_v129_0, nil;
    end;
end;
local v141 = {
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
return function(v142) --[[ Line: 298 ]] --[[ Name: LookDetailsBottomBar ]]
    -- upvalues: l_UserInputService_0 (copy), v41 (copy), l_isGamepadInput_0 (copy), l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 (copy), l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v92 (copy), l_getUseSelectorDeepEquals_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_selectTryOnsLookId_0 (copy), v90 (copy), v51 (copy), l_useNavigation_0 (copy), v48 (copy), v17 (copy), v16 (copy), v15 (copy), v105 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), v107 (ref), v28 (copy), l_useLocalization_0 (copy), v141 (copy), l_useStyle_0 (copy), l_useDesignTokens_0 (copy), v88 (copy), v94 (copy), v96 (copy), v98 (copy), v100 (copy), v102 (copy), v104 (copy), v26 (copy), v22 (copy), v58 (copy), v59 (copy), v47 (copy), v5 (copy), l_getIsUserEligibleForUnifiedPurchaseFlow_0 (copy), l_AvatarScreen_0 (copy), v46 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v36 (copy), l_FullView_0 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_PeekViewState_0 (copy), v40 (copy), l_logOnOverlayClosed_0 (copy), l_NavigateWithLock_0 (copy), l_FFlagAXFixLookDetailsContextualMenu_0 (copy), v85 (copy), v60 (copy), v86 (copy), v84 (copy), v25 (copy), v39 (copy), v140 (copy), v32 (copy), l_FFlagAXFixLookLinkToCustomize_0 (copy), v13 (copy), l_AvatarEditorSubcategories_0 (copy), l_AvatarEditorCategories_0 (copy), v34 (copy), v33 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (copy), l_getTTIEventName_0 (copy), l_ProductPurchaseSurface_0 (copy), l_TimeToInteractiveTracker_0 (copy), v29 (copy), l_FFlagAXBlackbirdRoot_0 (copy), v81 (copy), v83 (copy), v82 (copy), l_NumberLocalization_0 (copy), v3 (copy), v23 (copy)
    local l_l_UserInputService_0_LastInputType_0 = l_UserInputService_0:GetLastInputType();
    local v144, _ = v41.useState(l_isGamepadInput_0(l_l_UserInputService_0_LastInputType_0));
    local v146, v147 = v41.useState(false);
    local v148 = nil;
    local v149 = nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 and not l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks_0 then
        local v150, v151 = v41.useState(false);
        v148 = v150;
        v149 = v151;
    end;
    local v152 = l_useAvatarRoute_0();
    local v153 = l_useDispatch_0();
    local v154 = l_useSelector_0(v92, l_getUseSelectorDeepEquals_0());
    local v155 = l_useSelector_0(if l_FFlagAXCatalogMakeupSupport_0 and l_FFlagAXMISEnableMultiShopping_0 then l_selectTryOnsLookId_0 else v90, l_getUseSelectorDeepEquals_0());
    local v156 = if v51() then v155 ~= nil and v154[v155] ~= nil and (v154[v155].isFavorited or false) else false;
    local v157 = l_useNavigation_0();
    local v158 = v48(v17);
    local v159 = v48(v16);
    local v160 = v48(v15);
    local v161 = nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        v161 = l_useSelector_0(v105, l_getUseSelectorDeepEquals_0());
    end;
    local v162 = nil;
    local v163 = nil;
    if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
        v163 = l_useSelector_0(v107, l_getUseSelectorDeepEquals_0());
        v162 = if v155 and v154 and v154[v155] then v154[v155].lookType == v28.LookType.Makeup else false;
    end;
    local v164 = l_useLocalization_0(v141);
    local v165 = l_useStyle_0();
    local l_Theme_0 = v165.Theme;
    local l_Font_0 = v165.Font;
    local v168 = l_useDesignTokens_0();
    local v169 = l_useSelector_0(v88, l_getUseSelectorDeepEquals_0());
    local v170 = l_useSelector_0(v94, l_getUseSelectorDeepEquals_0());
    local v171 = l_useSelector_0(v96, l_getUseSelectorDeepEquals_0())[v170];
    local v172 = l_useSelector_0(v98, l_getUseSelectorDeepEquals_0());
    local v173 = l_useSelector_0(v100, l_getUseSelectorDeepEquals_0());
    local v174 = l_useSelector_0(v102, l_getUseSelectorDeepEquals_0());
    local v175 = l_useSelector_0(v104, l_getUseSelectorDeepEquals_0());
    local v179 = if v51() then v41.useCallback(function(v176) --[[ Line: 362 ]]
        -- upvalues: v26 (ref), v156 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), v155 (copy), v154 (copy), v153 (copy), v22 (ref), v158 (copy), v58 (ref), v59 (ref)
        v26.closeOverlay(v176);
        local v177 = not v156;
        if l_FFlagAXCatalogMakeupSupport_0 then
            local v178 = if v155 and v154[v155] then v154[v155].lookType else nil;
            v153(v22(v158, v155, v177, v178));
        else
            v153(v22(v158, v155, v177));
        end;
        v153(v58({
            toastMessage = v177 and "Feature.Catalog.Toast.FavoritedLook" or "Feature.Catalog.Toast.UnfavoritedLook", 
            toastType = v59.SuccessConfirmation
        }));
    end, {
        v153, 
        v58, 
        v22, 
        v155, 
        v154, 
        v158, 
        v156, 
        v157
    }) else nil;
    local v180 = if v51() then v47(v155, v156, v179) else nil;
    local v181 = if l_FFlagAXMISEnableMultiShopping_0 then v41.useMemo(function() --[[ Line: 399 ]]
        -- upvalues: v142 (copy), v155 (copy), v154 (copy), v5 (ref)
        if not v142.alwaysBuyAll then
            return nil;
        elseif v155 and v154 then
            return v5.Dictionary.union(v154[v155].lookAssetInfos or {}, v154[v155].lookBundleInfos or {});
        else
            return {};
        end;
    end, {
        v155, 
        v154, 
        v142.alwaysBuyAll
    }) else nil;
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 and not l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks_0 then
        v41.useEffect(function() --[[ Line: 418 ]]
            -- upvalues: l_getIsUserEligibleForUnifiedPurchaseFlow_0 (ref), v158 (copy), v149 (ref)
            l_getIsUserEligibleForUnifiedPurchaseFlow_0(v158):andThen(function(v182) --[[ Line: 420 ]]
                -- upvalues: v149 (ref)
                v149(v182);
            end):catch(function(_) --[[ Line: 423 ]]
                -- upvalues: v149 (ref)
                v149(false);
            end);
        end, {
            v158
        });
    end;
    local v184 = v41.useCallback(function() --[[ Line: 431 ]]
        -- upvalues: v153 (copy), v58 (ref), v59 (ref)
        v153(v58({
            toastMessage = "Feature.Catalog.Toast.AvatarUnderReview", 
            toastType = v59.NetworkingError
        }));
    end, {
        v153
    });
    local v185 = v41.useMemo(function() --[[ Line: 437 ]]
        -- upvalues: v154 (copy), v155 (copy), v28 (ref)
        if v154 and v155 then
            return v154[v155].moderationStatus == v28.ModerationStatus.Moderated;
        else
            return false;
        end;
    end, {
        v154, 
        v155
    });
    local v186 = v41.useMemo(function() --[[ Line: 444 ]]
        -- upvalues: v154 (copy), v155 (copy), v28 (ref)
        if v154 and v155 then
            return v154[v155].moderationStatus == v28.ModerationStatus.PendingModeration;
        else
            return false;
        end;
    end, {
        v154, 
        v155
    });
    local v187 = v41.useMemo(function() --[[ Line: 451 ]]
        -- upvalues: v152 (copy), l_AvatarScreen_0 (ref)
        return v152 and v152.opaque and v152.opaque.name == l_AvatarScreen_0.MySharedAvatars;
    end, {
        v152
    });
    local v188 = v46(v155, v28.ItemType.Look, true, nil, v186 and v184 or nil);
    local v189 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v191 = v41.useCallback(function(v190) --[[ Line: 470 ]]
        -- upvalues: v160 (copy), v28 (ref), v153 (copy), v36 (ref), v152 (copy), l_FullView_0 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_PeekViewState_0 (ref), v26 (ref)
        v160.sendAXCounter(v28.Counter.ContextFrame.ViewDetailsPageClick);
        v153(v36(v160, v152.opaque.name, l_FullView_0.None));
        v153(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Brief));
        v26.closeOverlay(v190);
    end, {
        v160, 
        v153, 
        v152
    });
    local v193 = v41.useMemo(function() --[[ Line: 477 ]]
        -- upvalues: v170 (copy), v154 (copy), v155 (copy), v40 (ref)
        if v170 and v154 and v155 then
            local v192 = v154[v155];
            return v192 and v192.curator and tostring(v192.curator.id) == tostring(v170) and v192.curator.type == v40.CreatorType.User;
        else
            return false;
        end;
    end, {
        v154, 
        v155, 
        v170
    });
    local v194 = v41.useCallback(function() --[[ Line: 490 ]]
        -- upvalues: v144 (copy), v152 (copy), l_AvatarScreen_0 (ref), l_logOnOverlayClosed_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v189 (copy)
        if v144 and v152.current.name == l_AvatarScreen_0.LookDetails then
            l_logOnOverlayClosed_0("LookDetails");
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                v189.captureFocus();
            end;
        end;
    end, {
        v144, 
        v152, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v189
    });
    local v198 = v41.useCallback(function(v195) --[[ Line: 507 ]]
        -- upvalues: v160 (copy), v28 (ref), v26 (ref), l_AvatarScreen_0 (ref), v194 (copy), v155 (copy), v157 (copy), v153 (copy), l_NavigateWithLock_0 (ref)
        v160.sendAXCounter(v28.Counter.ContextFrame.DeleteAvatarClick);
        v26.closeOverlay(v195);
        v153(l_NavigateWithLock_0(function() --[[ Line: 510 ]]
            -- upvalues: l_AvatarScreen_0 (ref), v194 (ref), v155 (ref), v157 (ref)
            local l_DeleteAvatarConfirmationPrompt_0 = l_AvatarScreen_0.DeleteAvatarConfirmationPrompt;
            local v197 = {
                onOverlayClosed = v194, 
                lookId = v155
            };
            v157.navigate(l_DeleteAvatarConfirmationPrompt_0, v197);
        end));
    end, {
        v160, 
        v153, 
        v155, 
        v194
    });
    local v203 = v41.useCallback(function() --[[ Line: 522 ]]
        -- upvalues: v175 (copy), l_PeekViewState_0 (ref), l_FFlagAXFixLookDetailsContextualMenu_0 (ref), v85 (ref), v164 (copy), v191 (copy), v51 (ref), v185 (copy), v180 (copy), v60 (ref), v187 (copy), v188 (copy), v193 (copy), v86 (ref), v198 (copy), v84 (ref), v153 (copy), v25 (ref), v158 (copy), v26 (ref)
        local v199 = v175 == l_PeekViewState_0.SuperBrief;
        if l_FFlagAXFixLookDetailsContextualMenu_0 then
            local v200 = {};
            if v199 then
                table.insert(v200, {
                    icon = v85, 
                    text = v164.viewDetailsPageLabel, 
                    onActivated = v191
                });
            end;
            if v51() and not v185 then
                table.insert(v200, v180);
            end;
            if not v60 and not v185 and not v187 then
                table.insert(v200, v188);
            end;
            if v193 and v187 then
                table.insert(v200, {
                    icon = v86, 
                    text = v164.deleteAvatarLabel, 
                    onActivated = v198
                });
            end;
            if not v193 then
                table.insert(v200, {
                    icon = v84, 
                    text = v164.reportText, 
                    onActivated = function(v201) --[[ Line: 557 ]] --[[ Name: onActivated ]]
                        -- upvalues: v153 (ref), v25 (ref), v158 (ref), v26 (ref)
                        v153(v25(v158));
                        v26.closeOverlay(v201);
                    end
                });
            end;
            return v200;
        else
            return {
                if not v199 then nil else {
                    icon = v85, 
                    text = v164.viewDetailsPageLabel, 
                    onActivated = v191
                }, 
                if not v51() or v185 then nil else v180, 
                if not not v60 or v185 or v187 then nil else v188, 
                if v193 and v187 then {
                    icon = v86, 
                    text = v164.deleteAvatarLabel, 
                    onActivated = v198
                } else nil, 
                if v193 then nil else {
                    icon = v84, 
                    text = v164.reportText, 
                    onActivated = function(v202) --[[ Line: 592 ]] --[[ Name: onActivated ]]
                        -- upvalues: v153 (ref), v25 (ref), v158 (ref), v26 (ref)
                        v153(v25(v158));
                        v26.closeOverlay(v202);
                    end
                }
            };
        end;
    end, {
        v158, 
        v164, 
        v191, 
        v198, 
        v193, 
        v153, 
        v188, 
        if v51() then v180 else nil, 
        if v51() then v156 else nil, 
        if v51() then v175 else nil, 
        v185, 
        v187
    });
    local v204 = v41.useCallback(function() --[[ Line: 616 ]]
        -- upvalues: v147 (copy), v194 (copy)
        v147(false);
        v194();
    end, {
        v194
    });
    local v207 = v41.useCallback(function() --[[ Line: 622 ]]
        -- upvalues: v203 (copy), v84 (ref), v164 (copy), v153 (copy), v25 (ref), v158 (copy), v26 (ref), v60 (ref), v185 (copy), v187 (copy), v188 (copy), v157 (copy), l_AvatarScreen_0 (ref), v142 (copy), v204 (copy), l_NavigateWithLock_0 (ref)
        v153(l_NavigateWithLock_0(function() --[[ Line: 623 ]]
            -- upvalues: v203 (ref), v84 (ref), v164 (ref), v153 (ref), v25 (ref), v158 (ref), v26 (ref), v60 (ref), v185 (ref), v187 (ref), v188 (ref), v157 (ref), l_AvatarScreen_0 (ref), v142 (ref), v204 (ref)
            local v206 = if v203 then v203() else {
                {
                    icon = v84, 
                    text = v164.reportText, 
                    onActivated = function(v205) --[[ Line: 630 ]] --[[ Name: onActivated ]]
                        -- upvalues: v153 (ref), v25 (ref), v158 (ref), v26 (ref)
                        v153(v25(v158));
                        v26.closeOverlay(v205);
                    end
                }, 
                if not not v60 or v185 or v187 then nil else v188
            };
            v157.navigate(l_AvatarScreen_0.ContextMenu, {
                centered = v142.centered, 
                contextButtons = v206, 
                onOverlayClosed = v204
            });
        end));
    end, {
        v157, 
        v153, 
        v204, 
        v164, 
        v158, 
        v188, 
        v203
    });
    local v208 = nil;
    local v209 = nil;
    local v210 = nil;
    local v211 = nil;
    local v212 = nil;
    local v213 = nil;
    local v214 = nil;
    if l_FFlagAXMISEnableMultiShopping_0 and v142.alwaysBuyAll then
        local v215, v216, v217, v218, v219, v220 = v39.getBottomBarInfoMIS(v181, v172, v173, v174, v154, v155, v169);
        v208 = v215;
        v209 = v216;
        v210 = v217;
        v211 = v218;
        v213 = v219;
        v214 = v220;
    else
        local v221, v222, v223, v224, v225 = v140(v169, v172, v173, v174, v154, v155);
        v208 = v221;
        v212 = v222;
        v213 = v223;
        v211 = v224;
        v214 = v225;
    end;
    local v264 = if l_FFlagAXMISEnableMultiShopping_0 and v181 and v142.alwaysBuyAll then v41.useCallback(function() --[[ Line: 687 ]]
        -- upvalues: v39 (ref), v181 (copy), v172 (copy), v173 (copy), v174 (copy), v154 (copy), v155 (copy), v169 (copy), v171 (copy), l_AvatarScreen_0 (ref), v194 (copy), v160 (copy), v32 (ref), l_FFlagAXFixLookLinkToCustomize_0 (ref), v13 (ref), v28 (ref), l_AvatarEditorSubcategories_0 (ref), l_AvatarEditorCategories_0 (ref), v34 (ref), v33 (ref), v152 (copy), v142 (copy), v26 (ref), v157 (copy), v153 (copy), l_NavigateWithLock_0 (ref)
        local v226, _, v228, _ = v39.getBottomBarInfoMIS(v181, v172, v173, v174, v154, v155, v169);
        local v230 = nil;
        local v231 = nil;
        if v171 < v226 then
            v230 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v231 = {
                onOverlayClosed = v194
            };
            v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v228 == 0 and v155 ~= nil then
            local v232 = nil;
            local v233 = nil;
            if l_FFlagAXFixLookLinkToCustomize_0 then
                local v234, v235 = v13.GetAvatarEditorCategoryIdsFromNavKey(if v154[v155].lookType == v28.LookType.Makeup then l_AvatarEditorSubcategories_0.MakeupLooks else l_AvatarEditorCategories_0.Avatars);
                v232 = v234;
                v233 = v235;
            else
                local l_CharacterKey_0 = v34.CharacterKey;
                local v237 = v33();
                local v238 = nil;
                local v239 = nil;
                for v240, v241 in v237 do
                    if v241.Name == l_CharacterKey_0 then
                        v238 = v240;
                        break;
                    end;
                end;
                local l_v238_0 = v238;
                local l_v239_0 = v239;
                v232 = l_v238_0;
                v233 = l_v239_0;
            end;
            v230 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v231 = {
                onOverlayClosed = v194, 
                categoryOverride = v232, 
                subcategoryOverride = v233
            };
            v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v244 = v39.getOwnedItemsInLook(v181, v154, v155);
            if v155 ~= nil then
                v230 = l_AvatarScreen_0.PurchaseLookPrompt;
                v231 = {
                    lookId = v155, 
                    priceInRobux = v226, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true, 
                    fromAvatarRoute = v152, 
                    allLookItems = v181, 
                    ownedItemsInLook = v244, 
                    isTryOnFromOutsideAX = v142.isTryOnFromOutsideAX
                };
                if v26.isWithinViewContext(v152, l_AvatarScreen_0.CatalogSearch) then
                    v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked);
                else
                    v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked);
                end;
            else
                v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId);
                v231 = {
                    onOverlayClosed = v194
                };
            end;
        end;
        v153(l_NavigateWithLock_0(function() --[[ Line: 777 ]]
            -- upvalues: v157 (ref), v230 (ref), v231 (ref)
            v157.navigate(v230, v231);
        end));
    end, {
        v172, 
        v173, 
        v174, 
        v154, 
        v155, 
        v171, 
        v153, 
        v157, 
        v194, 
        v160, 
        v152, 
        v181, 
        v169
    }) else v41.useCallback(function() --[[ Line: 799 ]]
        -- upvalues: v140 (ref), v169 (copy), v172 (copy), v173 (copy), v174 (copy), v154 (copy), v155 (copy), l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 (ref), l_getTTIEventName_0 (ref), l_ProductPurchaseSurface_0 (ref), l_TimeToInteractiveTracker_0 (ref), v171 (copy), l_AvatarScreen_0 (ref), v194 (copy), v160 (copy), v32 (ref), v5 (ref), l_FFlagAXFixLookLinkToCustomize_0 (ref), v13 (ref), v28 (ref), l_AvatarEditorSubcategories_0 (ref), l_AvatarEditorCategories_0 (ref), v34 (ref), v33 (ref), v39 (ref), v152 (copy), v142 (copy), v26 (ref), v157 (copy), v153 (copy), l_NavigateWithLock_0 (ref)
        local v245, _, v247 = v140(v169, v172, v173, v174, v154, v155);
        local v248 = nil;
        local v249 = nil;
        if l_FFlagAddPerformanceMetricsToUnifiedPurchaseModal_0 then
            local v250 = l_getTTIEventName_0(l_ProductPurchaseSurface_0.Catalog);
            l_TimeToInteractiveTracker_0.trackStart(v250);
            l_TimeToInteractiveTracker_0.updateMetadata(v250, {
                page = l_ProductPurchaseSurface_0.Catalog, 
                category = "legacy_purchase_modal"
            });
        end;
        if v171 < v245 then
            v248 = l_AvatarScreen_0.InsufficientRobuxPrompt;
            v249 = {
                onOverlayClosed = v194
            };
            v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetBuyClickedInsufficientRobux);
        elseif v5.isEmpty(v247) and v155 ~= nil then
            local v251 = nil;
            local v252 = nil;
            if l_FFlagAXFixLookLinkToCustomize_0 then
                local v253, v254 = v13.GetAvatarEditorCategoryIdsFromNavKey(if v154[v155].lookType == v28.LookType.Makeup then l_AvatarEditorSubcategories_0.MakeupLooks else l_AvatarEditorCategories_0.Avatars);
                v251 = v253;
                v252 = v254;
            else
                local l_CharacterKey_1 = v34.CharacterKey;
                local v256 = v33();
                local v257 = nil;
                local v258 = nil;
                for v259, v260 in v256 do
                    if v260.Name == l_CharacterKey_1 then
                        v257 = v259;
                        break;
                    end;
                end;
                local l_v257_0 = v257;
                local l_v258_0 = v258;
                v251 = l_v257_0;
                v252 = l_v258_0;
            end;
            v248 = l_AvatarScreen_0.LeaveCatalogToAvatarPrompt;
            v249 = {
                onOverlayClosed = v194, 
                categoryOverride = v251, 
                subcategoryOverride = v252
            };
            v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetBuyClickedNoItemsToPurchase);
        else
            local v263 = v39.getOwnedTryOnItems(v169, v154, v155);
            if v155 ~= nil then
                v248 = l_AvatarScreen_0.PurchaseLookPrompt;
                v249 = {
                    itemsToPurchase = v247, 
                    lookId = v155, 
                    ownedTryOnItems = v263, 
                    priceInRobux = v245, 
                    showSaveAsCharacter = true, 
                    showWearAfterPurchase = true, 
                    fromAvatarRoute = v152, 
                    isTryOnFromOutsideAX = v142.isTryOnFromOutsideAX
                };
                if v26.isWithinViewContext(v152, l_AvatarScreen_0.CatalogSearch) then
                    v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetSearchBuyClicked);
                else
                    v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetHomeBuyClicked);
                end;
            else
                v160.sendAXCounter(v32.Counter.AvatarWidget.AvatarsWidgetBuyClickedMissingLookId);
                v249 = {
                    onOverlayClosed = v194
                };
            end;
        end;
        v153(l_NavigateWithLock_0(function() --[[ Line: 897 ]]
            -- upvalues: v157 (ref), v248 (ref), v249 (ref)
            v157.navigate(v248, v249);
        end));
    end, {
        v169, 
        v172, 
        v173, 
        v174, 
        v154, 
        v155, 
        v171, 
        v153, 
        v157, 
        v194, 
        v160, 
        v152
    });
    if l_FFlagAXEnableUnifiedPurchaseFlowForLooks_0 then
        local l_onButtonPressWithUnifiedPurchaseFlow_0 = v29({
            lookId = v155, 
            totalPrice = v208, 
            originalPrice = if l_FFlagAXBlackbirdRoot_0 then v214 else nil, 
            tryOnItems = v169, 
            lookDetailsObj = v154, 
            lookAnalyticsInfo = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 and v162 then v163 else v161, 
            localized = v164, 
            isTryOnFromOutsideAX = v142.isTryOnFromOutsideAX, 
            itemsToPurchase = v213, 
            userRobux = v171, 
            onOverlayClosed = v194
        }).onButtonPressWithUnifiedPurchaseFlow;
        if l_FFlagAXLaunchUnifiedPurchaseFlowMarketplaceLooks_0 then
            v264 = l_onButtonPressWithUnifiedPurchaseFlow_0;
        elseif v148 then
            v264 = l_onButtonPressWithUnifiedPurchaseFlow_0;
        end;
    end;
    local v270 = if l_FFlagAXMISEnableMultiShopping_0 and v142.alwaysBuyAll then nil else v41.useCallback(function() --[[ Line: 946 ]]
        -- upvalues: v169 (copy), v39 (ref), v154 (copy), v155 (copy)
        local v266 = 0;
        for _, v268 in v169 do
            if v268.selectedInTryOnManager then
                local v269 = v39.getItemInfo(v268.itemId, v268.itemType, v154, v155);
                if not v269 or not v269.quantityOwned or v269.quantityOwned == 0 then
                    return false;
                else
                    v266 = v266 + 1;
                end;
            end;
        end;
        return v266 > 0;
    end, {
        v169, 
        v154, 
        v155
    });
    local v276 = if l_FFlagAXMISEnableMultiShopping_0 then v41.useCallback(function(v271) --[[ Line: 969 ]]
        -- upvalues: v181 (copy), v142 (copy), v39 (ref), v154 (copy)
        if v181 == nil or not v142.alwaysBuyAll then
            return false;
        else
            local v272 = 0;
            for _, v274 in v181 do
                local v275 = if v274.itemType then v39.getItemInfo(v274.id, v274.itemType, v154, v271) else nil;
                if not v275 or not v275.quantityOwned or v275.quantityOwned == 0 then
                    return false;
                else
                    v272 = v272 + 1;
                end;
            end;
            return v272 > 0;
        end;
    end, {
        v154, 
        v181, 
        v142.alwaysBuyAll
    }) else nil;
    local l_v81_0 = v81;
    local v278 = false;
    local v279 = nil;
    local v280 = v213 and v5.isEmpty(v213);
    if l_FFlagAXMISEnableMultiShopping_0 and v142.alwaysBuyAll then
        v280 = v210 == 0;
    end;
    if v280 then
        v279 = "";
        local v281 = v270 and v270();
        if l_FFlagAXMISEnableMultiShopping_0 and v142.alwaysBuyAll then
            v281 = v276 and v276(v155) ~= nil;
        end;
        if v155 ~= nil and v281 then
            l_v81_0 = v83;
        else
            l_v81_0 = v82;
            v278 = true;
        end;
    elseif v208 == 0 then
        l_v81_0 = nil;
        v279 = v164.freeText;
    else
        v279 = l_NumberLocalization_0.localize(string.format("%.0f", v208), v159:GetLocale());
    end;
    if v171 == nil then
        v278 = true;
    end;
    local v282 = v159:Format("Feature.Avatar.Label.TryOnManagerDescriptor", {
        numItems = if l_FFlagAXMISEnableMultiShopping_0 and v142.alwaysBuyAll then v209 else v212
    });
    local l_hideDescriptor_0 = v142.hideDescriptor;
    local v284 = v3.createElement("TextLabel", {
        LayoutOrder = 1, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v168.Global.Size_400), 
        Text = v282, 
        TextSize = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize, 
        Font = l_Font_0.Header2.Font, 
        TextColor3 = l_Theme_0.SecondaryContent.Color, 
        TextTransparency = l_Theme_0.SecondaryContent.Transparency, 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top
    });
    local v285 = v41.useCallback(function() --[[ Line: 1049 ]]
        -- upvalues: v207 (copy), v147 (copy)
        v207();
        v147(true);
    end, {
        v207, 
        v147
    });
    local v286 = v41.useMemo(function() --[[ Line: 1054 ]]
        -- upvalues: v279 (ref), l_v81_0 (ref), v211 (ref), v278 (ref), v168 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), v165 (copy), v264 (ref)
        return {
            buttonText = v279, 
            buttonIcon = l_v81_0, 
            buttonIsLoading = v211, 
            buttonIsDisabled = v278, 
            buttonIconPadding = v168.Global.Space_50, 
            buttonIconSize = if l_FFlagAXMISEnableMultiShopping_0 then v168.Global.Size_250 else v168.Global.Size_400, 
            buttonColor = v165.Theme.ContextualPrimaryDefault.Color, 
            buttonTextColor = v165.Theme.ContextualPrimaryContent.Color, 
            onActivated = not v278 and v264 or nil
        };
    end, {
        v279, 
        l_v81_0, 
        v211, 
        v278, 
        v168, 
        v165, 
        v264
    });
    local v287 = v187 and not v185 and v188 ~= nil;
    return v3.createElement(v23, {
        bottomPadding = 0, 
        buttonProps = v286, 
        hideGradient = true, 
        isMoreButtonSelected = v146, 
        leftPadding = 0, 
        onMoreButtonActivated = v285, 
        rightPadding = 0, 
        showMoreButton = true, 
        showMiddleButton = v287, 
        onMiddleButtonActivated = if v287 then v188.onActivated else nil, 
        middleButtonIcon = if v287 then v188.icon else nil, 
        topComponent = if l_hideDescriptor_0 then nil else v284, 
        topComponentHeight = l_hideDescriptor_0 and 0 or v168.Global.Size_400, 
        ZIndex = 1
    });
end;