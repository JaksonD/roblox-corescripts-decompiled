local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_useFocusController_0 = v3.useFocusController;
local l_ItemTileEnums_0 = require(l_CorePackages_0.Packages.UIBlox).Tile.ItemTileEnums;
local v6 = require(l_CorePackages_0.Packages.tutils);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local v10 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_getZoomedSizeAndOffset_0 = v10.Utils.getZoomedSizeAndOffset;
local l_getThumbSizeVectorFromParamString_0 = v10.Utils.getThumbSizeVectorFromParamString;
local v13 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCatalog);
local l_useMultiItemShoppingFtux_0 = v13.Hooks.useMultiItemShoppingFtux;
local l_useMakeupFtux_0 = v13.Hooks.useMakeupFtux;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_PeekViewState_0 = require(l_CorePackages_0.Workspace.Packages.PeekView).PeekViewState;
local v18 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v18.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v18.Hooks.RoactRodux.useSelector;
local v21 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_useLastInput_0 = v21.useLastInput;
local l_useIsSpatial_0 = v21.useIsSpatial;
local v24 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics);
local l_UnifiedEventLogEnums_0 = v24.UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = v24.addUnifiedEventLogging;
local l_UnifiedEventLogConstants_0 = v24.UnifiedEventLogConstants;
local l_UnifiedEventLoggingUtils_0 = v24.Utils.UnifiedEventLoggingUtils;
local l_getTimedOptionForItemData_0 = v24.Utils.getTimedOptionForItemData;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local v31 = require(l_CorePackages_0.Packages.Foundation);
local v32 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXLookAndFeelBackgrounds_0 = v32.FFlagAXLookAndFeelBackgrounds;
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v32.FFlagAXCatalogItemCardFooterBackendDriven;
local v35 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 = v35.FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation;
local v37 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableShowRobloxAsLookCreator);
local l_FFlagAddTypesToWidgetItems_0 = v32.FFlagAddTypesToWidgetItems;
local v39 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookFromTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v41 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v42 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v43 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v44 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v45 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v49 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v50 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v51 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v52 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local l_selectEquippedLayeredMakeupAssets_0 = v10.State.Selectors.selectEquippedLayeredMakeupAssets;
local v54 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v55 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v57 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v58 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local v59 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v60 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v61 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v62 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v63 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v64 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v65 = require(l_Modules_0.AvatarExperience.Common.Actions.AddAnalyticsMetadata);
local v66 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v67 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v68 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullViewTable);
local l_getTryOnItemReducerKey_0 = v10.Utils.getTryOnItemReducerKey;
local l_ItemTypeEnum_0 = v10.Enums.ItemTypeEnum;
local l_CatalogItemCardStatusIconTypeEnum_0 = v10.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v10.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v10.Constants.MAX_MAKEUP_LAYERS;
local v74 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v75 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenLookDetailsFromButton);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local v78 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local _ = require(script.Parent.CatalogItemCard);
local v80 = require(script.Parent.useCatalogItemCardFocusNavigationBindings);
local v81 = require(script.Parent.useCatalogItemCardFtux);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 = v32.FFlagAXCatalogItemCardSelectedOverlayButtonLogging;
local l_FFlagAXDurablesSupport_0 = v32.FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportForPermanent_0 = v32.FFlagAXDurablesSupportForPermanent;
local l_FFlagAXMISEnableMultiShopping_0 = v32.FFlagAXMISEnableMultiShopping;
local l_FFlagAXCatalogMakeupSupport_0 = v32.FFlagAXCatalogMakeupSupport;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v32.FFlagAXAddLookTypeEnumForLogging;
local v89 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_FFlagAXCatalogCategoriesStore_0 = v32.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDurablesFooter_0 = v32.FFlagAXDurablesFooter;
local l_FFlagAXWearTimeSupport_0 = v35.FFlagAXWearTimeSupport;
local l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 = v13.Constants.LOOKS_IMAGE_OFFSET_MULTIPLIERS;
local l_LOOKS_IMAGE_ZOOM_0 = v13.Constants.LOOKS_IMAGE_ZOOM;
local v95 = {
    toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning", 
    isLocalized = false, 
    toastType = v50.InformationMessage
};
local function _(v96) --[[ Line: 130 ]] --[[ Name: isBodyBundle ]]
    -- upvalues: v43 (copy)
    if v96 then
        return v96.bundleType == v43.BundleTypeIdStrings.BodyParts;
    else
        return false;
    end;
end;
local function _(v98) --[[ Line: 134 ]] --[[ Name: getItemTypeFromItemData ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local v99 = if v98 then v98.tileRestrictionsMap else nil;
    if v99 then
        if v99[l_ItemTileEnums_0.Restriction.Limited] then
            return "Limited";
        elseif v99[l_ItemTileEnums_0.Restriction.LimitedUnique] or v99[l_ItemTileEnums_0.Restriction.Collectible] then
            return "Collectible";
        end;
    end;
    return nil;
end;
local function _(v101) --[[ Line: 150 ]] --[[ Name: getItemInfoFromItemData ]]
    -- upvalues: v43 (copy)
    if v101 and v101.bundleType == v43.BundleTypeIdStrings.DynamicHead then
        return "DynamicHead";
    else
        return nil;
    end;
end;
local _ = function(v103) --[[ Line: 157 ]] --[[ Name: getTimedOptionDays ]]
    for _, v105 in v103 do
        if v105.selected and v105.days > 0 then
            return v105.days;
        end;
    end;
    return nil;
end;
local function _(v107) --[[ Line: 166 ]] --[[ Name: getCreatorFromItemData ]]
    if v107 and v107.creator then
        local v108 = v107.creator.name or v107.creatorName;
        if v108 then
            return {
                name = v108, 
                verified = v107.creator.hasVerifiedBadge
            };
        end;
    end;
    return nil;
end;
local function v111(v110) --[[ Line: 176 ]] --[[ Name: getCreatorFromLookData ]]
    -- upvalues: v37 (copy), v43 (copy)
    if v110 and v110.curator and v110.curator.name and (v37() or v110.curator.name:lower() ~= v43.RobloxCreatorName:lower()) then
        return {
            name = v110.curator.name, 
            verified = if v110 and v110.curator then v110.curator.hasVerifiedBadge else nil
        };
    else
        return nil;
    end;
end;
local function v113(v112) --[[ Line: 195 ]] --[[ Name: getLookStatusFromModerationStatus ]]
    -- upvalues: v43 (copy)
    if v112 == v43.ModerationStatus.PendingModeration then
        return {
            type = "icon", 
            iconType = "PendingModeration"
        };
    elseif v112 == v43.ModerationStatus.Moderated then
        return {
            type = "icon", 
            iconType = "Moderated"
        };
    else
        return nil;
    end;
end;
local function _(v114) --[[ Line: 204 ]] --[[ Name: isValidItemId ]]
    local v115 = false;
    if v114 ~= nil then
        v115 = v114 ~= "0";
    end;
    return v115;
end;
local _ = function(v117, v118) --[[ Line: 210 ]] --[[ Name: isValidThumbnailSize ]]
    -- upvalues: v43 (copy)
    if v118 ~= nil then
        for _, v120 in v43.CatalogThumbnailTypeToSize[v118] do
            if v120 == v117 then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v129(v122, v123, v124) --[[ Line: 225 ]] --[[ Name: cardIsSelectedInTryOnOutfit ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
    if v123 and v122.AvatarExperience.AvatarScene.OutfitTryOn.LookId == v123 then
        return true;
    else
        local l_TryOnItems_0 = v122.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v126 = v122.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil;
        if v123 and v124 then
            local v127 = l_getTryOnItemReducerKey_0(v123, v124);
            if l_FFlagAXMISEnableMultiShopping_0 then
                return l_TryOnItems_0[v127] ~= nil;
            else
                local v128 = false;
                if l_TryOnItems_0[v127] ~= nil then
                    v128 = v126;
                end;
                return v128;
            end;
        else
            return false;
        end;
    end;
end;
local function v145(v130, v131, v132) --[[ Line: 244 ]] --[[ Name: selectCatalogItemCardState ]]
    -- upvalues: v129 (copy), v52 (copy), v44 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v89 (copy), v42 (copy), v43 (copy), v68 (copy), l_PeekViewState_0 (copy)
    local v133 = v129(v130, v131, v132);
    local l_LastToggledItem_0 = v130.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    local v135 = nil;
    local v136 = nil;
    local v137 = v52(v130.AvatarExperience.Common, v131, v132);
    if v137 then
        local v138, v139 = v44.GetStatus(v137);
        v135 = v138;
        v136 = v139;
    end;
    local v140 = nil;
    v140 = if l_FFlagAXCatalogCategoriesStore_0 then v89.getCatalogSelectionStore().selectedCategoryInfo(false) else v42.getCatalogCategoryInfoFromState(v130);
    local v141 = v133 and v137 and v137.bundleType == v43.BundleTypeIdStrings.Animations;
    local l_PageType_0 = v140.PageType;
    local v143 = v141 and (l_LastToggledItem_0 and l_LastToggledItem_0.itemId == v131 or l_PageType_0 == v43.PageType.Animation or l_PageType_0 == v43.PageType.AllAnimation);
    local l_viewState_0 = v130.AvatarExperience.Common.ItemDetailsPeekView.viewState;
    return {
        itemData = v137, 
        isSelected = v133, 
        statusText = v136, 
        avatarType = v130.AvatarExperience.AvatarEditor.Character.AvatarType, 
        isAvatarR6 = v130.AvatarExperience.AvatarEditor.Character.AvatarType == v43.AvatarType.R6, 
        fullView = v68(v130), 
        showAnimationTabs = v143, 
        isItemDetailsViewStateFull = l_viewState_0 == l_PeekViewState_0.Full
    };
end;
local function v147(v146) --[[ Line: 292 ]]
    return v146.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v151(v148) --[[ Line: 296 ]] --[[ Name: showDurableBadge ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy)
    if not l_FFlagAXDurablesSupport_0 then
        return nil;
    elseif l_FFlagAXDurablesFooter_0 then
        return nil;
    elseif not v148 or not v148.timedOptions then
        return nil;
    else
        for _, v150 in v148.timedOptions do
            if v150.selected then
                return {
                    type = "badge", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
                    text = if l_FFlagAXDurablesSupportForPermanent_0 then if v150.days > 0 then tostring(v150.days) else "" else tostring(v150.days)
                };
            end;
        end;
        return {
            type = "badge", 
            iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
            text = ""
        };
    end;
end;
return function(v152) --[[ Line: 364 ]] --[[ Name: useCatalogItemCardViewModel ]]
    -- upvalues: v2 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v67 (copy), l_useRoactService_0 (copy), v41 (copy), v55 (copy), v54 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useMultiItemShoppingFtux_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_useMakeupFtux_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v145 (copy), l_useSelector_0 (copy), v6 (copy), v147 (copy), l_selectEquippedLayeredMakeupAssets_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_useLocalization_0 (copy), v44 (copy), v43 (copy), l_getThumbSizeVectorFromParamString_0 (copy), l_getZoomedSizeAndOffset_0 (copy), l_LOOKS_IMAGE_ZOOM_0 (copy), l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_ItemTypeEnum_0 (copy), v75 (copy), l_AvatarScreen_0 (copy), v78 (copy), v60 (copy), l_FFlagAXWearTimeSupport_0 (copy), v81 (copy), l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 (copy), v66 (copy), v58 (copy), v64 (copy), v51 (copy), v74 (copy), l_PeekViewState_0 (copy), v39 (copy), v59 (copy), v65 (copy), v57 (copy), v45 (copy), v61 (copy), v49 (copy), v95 (copy), v63 (copy), v46 (copy), v62 (copy), l_getTryOnItemReducerKey_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), v3 (copy), v7 (copy), l_addUnifiedEventLogging_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_getTimedOptionForItemData_0 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy), v80 (copy), v48 (copy), v47 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v111 (copy), v31 (copy), l_ItemTileEnums_0 (copy), v113 (copy), v151 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy)
    local v153 = false;
    local v154 = false;
    local v155 = v2.useRef(nil);
    local v156 = v2.useRef(nil);
    local v157 = l_useLastInput_0();
    local v158 = l_useIsSpatial_0();
    local v159 = false;
    if v157 == v21.Input.Directional then
        v159 = not v158;
    end;
    local v160 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v161 = v67();
    local v162 = l_useRoactService_0(v41);
    local v163 = l_useRoactService_0(v55);
    local v164 = l_useRoactService_0(v54);
    local v165 = if l_FFlagAXMISEnableMultiShopping_0 then l_useMultiItemShoppingFtux_0() else nil;
    local v166 = if l_FFlagAXCatalogMakeupSupport_0 then l_useMakeupFtux_0() else nil;
    local v167 = l_useNavigation_0();
    local v168 = l_useAvatarRoute_0();
    local v169 = l_useDispatch_0();
    local l_itemId_0 = v152.itemId;
    local l_itemType_0 = v152.itemType;
    local l_lookData_0 = v152.lookData;
    local v173 = v168 and v168.opaque and v168.opaque.name;
    local v175 = v2.useCallback(function(v174) --[[ Line: 385 ]]
        -- upvalues: v145 (ref), l_itemId_0 (copy), l_itemType_0 (copy)
        return (v145(v174, l_itemId_0, l_itemType_0));
    end, {
        l_itemId_0, 
        l_itemType_0
    });
    local v176 = l_useSelector_0(v175, v6.shallowEqual);
    local v177 = if not not l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(v147) else nil;
    local v178 = if l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(l_selectEquippedLayeredMakeupAssets_0) else nil;
    local v179 = if l_lookData_0 and l_lookData_0.assets then #l_lookData_0.assets else 0;
    local v180 = if l_lookData_0 and l_lookData_0.bundles then #l_lookData_0.bundles else 0;
    local v181;
    if l_FFlagAXDurablesFooter_0 and v176 and v176.itemData and v176.itemData.timedOptions then
        for _, v183 in v176.itemData.timedOptions do
            if v183.selected and v183.days > 0 then
                v181 = v183.days;
                v153 = true;
            end;
            if v153 then
                break;
            end;
        end;
        if not v153 then
            v181 = nil;
        end;
    else
        v181 = nil;
    end;
    v153 = false;
    local v184 = l_useLocalization_0({
        statusText = v176.statusText, 
        details = "Feature.Avatar.Label.DetailsButton", 
        detailsWithItemsCount = {
            "Feature.Avatar.Label.Details"; 
            quantity = v179 + v180
        }, 
        timedOptionDays = if l_FFlagAXDurablesFooter_0 and v181 then {
            "Feature.Durables.TimeRemaining.Days"; 
            number = v181
        } else nil
    });
    local l_isSelected_0 = v176.isSelected;
    local l_itemData_0 = v176.itemData;
    local v187 = l_itemType_0 and v44.GetRbxThumbType(l_itemType_0) or nil;
    local l__150x150_0 = v43.CatalogThumbnailTypeToSize.Asset._150x150;
    if v152.thumbnailSize then
        local l_thumbnailSize_0 = v152.thumbnailSize;
        local v190;
        if v187 ~= nil then
            for _, v192 in v43.CatalogThumbnailTypeToSize[v187] do
                if v192 == l_thumbnailSize_0 then
                    v190 = true;
                    v154 = true;
                end;
                if v154 then
                    break;
                end;
            end;
        end;
        if not v154 then
            v190 = false;
        end;
        v154 = false;
        if v190 then
            l__150x150_0 = v152.thumbnailSize;
        end;
    end;
    local v193 = l_getThumbSizeVectorFromParamString_0(l__150x150_0);
    local v194 = if (if l_itemData_0 then l_itemData_0.bundleType == v43.BundleTypeIdStrings.BodyParts else false) and v193 then l_getZoomedSizeAndOffset_0(v193, l_LOOKS_IMAGE_ZOOM_0, l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0) else nil;
    local v195 = false;
    if l_itemId_0 ~= nil then
        v195 = l_itemId_0 ~= "0";
    end;
    local v196 = if v195 then ("rbxthumb://type=%*&id=%*&%*"):format(v187, l_itemId_0, l__150x150_0) else nil;
    v195 = v2.useCallback(function(v197) --[[ Line: 440 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_ItemTypeEnum_0 (ref), l_lookData_0 (copy), v164 (copy), v168 (copy), v169 (copy), v75 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v173 (copy), l_AvatarScreen_0 (ref), v78 (ref), v167 (copy), v60 (ref), v44 (ref), l_itemData_0 (copy), v152 (copy)
        if l_itemId_0 and l_itemType_0 then
            if l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 then
                l_sendUnifiedEventForDeferredAction_0({
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "CLICK_ITEM_DETAILS"
                });
            end;
            if l_itemType_0 == l_ItemTypeEnum_0.Look then
                local v198 = {
                    lookId = l_lookData_0 and l_lookData_0.id, 
                    valueInRobux = l_lookData_0 and l_lookData_0.totalValue, 
                    catalogAnalytics = v164, 
                    avatarRoute = v168
                };
                v169(v75(v198));
                if l_FFlagAXMISEnableMultiShopping_0 and v173 ~= l_AvatarScreen_0.MySharedAvatars then
                    v169(v78(function() --[[ Line: 459 ]]
                        -- upvalues: v167 (ref), l_AvatarScreen_0 (ref)
                        v167.navigate(l_AvatarScreen_0.LookDetails);
                    end));
                    return;
                end;
            else
                v169(v60({
                    itemId = l_itemId_0, 
                    itemType = l_itemType_0, 
                    itemSubType = v44.GetItemSubType(l_itemType_0, l_itemData_0), 
                    priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                    catalogAnalytics = v164, 
                    avatarRoute = v168, 
                    navigation = v167, 
                    itemDetailsPeekViewRefs = v152.itemDetailsPeekViewRefs, 
                    resultsListRef = v152.resultsListRef, 
                    widgetInfo = v152.widgetAnalyticsInfo, 
                    showFullWithNoPeekView = v197
                }));
            end;
        end;
    end, {
        v169, 
        l_itemId_0, 
        l_itemType_0, 
        v164, 
        v168, 
        v167, 
        v152.itemDetailsPeekViewRefs, 
        v152.resultsListRef, 
        v152.widgetAnalyticsInfo, 
        l_lookData_0, 
        v173
    });
    if l_FFlagAXWearTimeSupport_0 then
        v81({
            isSelected = l_isSelected_0, 
            itemData = l_itemData_0
        });
    end;
    local v199 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        v199 = v2.useCallback(function() --[[ Line: 501 ]]
            -- upvalues: v195 (copy)
            v195(true);
        end, {
            v195
        });
    end;
    local v200 = v2.useCallback(function() --[[ Line: 507 ]]
        -- upvalues: v66 (ref), v159 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v160 (copy), l_itemId_0 (copy), v195 (copy), v169 (copy), v58 (ref), v167 (copy), l_itemType_0 (copy)
        return v169(v58(v167, l_itemId_0, l_itemType_0, function() --[[ Line: 508 ]] --[[ Name: onR15PromptWillClose ]]
            -- upvalues: v66 (ref), v159 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v160 (ref), l_itemId_0 (ref), v195 (ref)
            v66("CatalogItemCard", v159);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v159 then
                v160.captureFocus();
            end;
            if l_itemId_0 then
                v195();
            end;
        end, nil, true));
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v159, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v160, 
        l_itemId_0, 
        v195, 
        v169, 
        v167, 
        l_itemId_0, 
        l_itemType_0
    });
    local v216 = v2.useCallback(function(v201) --[[ Line: 548 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v161 (copy), v155 (copy), v173 (copy), v169 (copy), v64 (ref), v164 (copy), v51 (ref), v167 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref), v74 (ref), v162 (copy), v152 (copy), l_PeekViewState_0 (ref), v39 (ref), v59 (ref), v65 (ref), v57 (ref), v45 (ref), v200 (copy), v44 (ref), l_itemData_0 (copy), v61 (ref), v168 (copy), v176 (copy), v163 (copy), v43 (ref), v49 (ref), v95 (ref), v63 (ref), v46 (ref), v62 (ref)
        if not l_itemId_0 or not l_itemType_0 then
            return;
        elseif l_itemType_0 == l_ItemTypeEnum_0.Look then
            if not l_isSelected_0 then
                if v161 then
                    local v202 = if v155 then v155.current else nil;
                    if v202 ~= nil then
                        v161.setSelectedItemInstance(v202);
                    end;
                end;
                if v173 ~= nil then
                    v169(v64(v164, v173, v51.None));
                end;
                local l_v167_0 = v167;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    l_v167_0 = if v173 == l_AvatarScreen_0.MySharedAvatars then v167 else nil;
                end;
                local v204 = 2;
                if l_FFlagAXMISEnableMultiShopping_0 and v173 ~= l_AvatarScreen_0.MySharedAvatars then
                    v204 = 1;
                end;
                v169(v74(v162, l_v167_0, v152.widgetAnalyticsInfo, l_itemId_0, if l_FFlagAXMISEnableMultiShopping_0 and v173 == l_AvatarScreen_0.MySharedAvatars then l_PeekViewState_0.SuperBrief else nil, v204));
            else
                if v161 then
                    v161.setSelectedItemInstance(nil);
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    v169(v39(l_itemId_0));
                end;
                v169(v59(l_PeekViewState_0.Closed));
            end;
            if v152.isOrganic then
                if not l_isSelected_0 then
                    local l_analyticsContext_0 = v152.analyticsContext;
                    local l_analyticsItemCountPerPage_0 = v152.analyticsItemCountPerPage;
                    local l_index_0 = v152.index;
                    v169(v65({
                        selectedItemIndex = l_index_0
                    }));
                    v169(v57(l_analyticsContext_0, v164.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_0, l_analyticsItemCountPerPage_0, false));
                    return;
                end;
            else
                v164.widgetInteractionV2(v152.widgetAnalyticsInfo, if l_isSelected_0 then v45.ActionType.ITEM_DESELECTED else v45.ActionType.ITEM_CLICK);
            end;
            return;
        elseif v200() then
            return;
        else
            local v208 = v44.GetItemSubType(l_itemType_0, l_itemData_0);
            local l_l_isSelected_0_0 = l_isSelected_0;
            if l_FFlagAXMISEnableMultiShopping_0 then
                v169(v59(l_PeekViewState_0.Closed));
            end;
            v169(v61(v162, v164, l_itemType_0, v208, l_itemId_0, true, v168, v167, v152.widgetAnalyticsInfo, nil, if l_FFlagAXMISEnableMultiShopping_0 then v201 else nil));
            if not l_FFlagAXMISEnableMultiShopping_0 and v161 then
                v169(v59(l_PeekViewState_0.Closed));
            end;
            if v161 and l_l_isSelected_0_0 then
                v161.setSelectedItemInstance();
            end;
            if not l_l_isSelected_0_0 then
                if v161 then
                    v161.setSelectedItemInstance(v155.current);
                end;
                if l_isSelected_0 then
                    return;
                elseif v176.fullView[v168.opaque.name] == v51.UIFullView then
                    v169(v64(v163, v168.opaque.name, v51.None));
                end;
            end;
            if l_isSelected_0 then
                return;
            else
                local v210 = l_itemData_0 and l_itemData_0.assetType;
                if v176.isAvatarR6 and v210 ~= v43.AssetTypeIdStrings.HairAccessory and v43.LayeredAssetTypes[v210] ~= nil then
                    v169(v49(v95));
                end;
                if l_itemType_0 == v43.ItemType.Asset and v43.AssetTypeIdToCategory[v208] == v43.AssetCategories.Animation then
                    v169(v63(l_itemId_0, v210));
                end;
                local l_analyticsContext_1 = v152.analyticsContext;
                local l_analyticsItemCountPerPage_1 = v152.analyticsItemCountPerPage;
                local l_index_1 = v152.index;
                local l_adTrackingData_0 = v152.adTrackingData;
                v169(v65({
                    selectedItemIndex = l_index_1
                }));
                v169(v57(l_analyticsContext_1, v164.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_1, l_analyticsItemCountPerPage_1, false));
                if v152.widgetAnalyticsInfo then
                    local l_widgetAnalyticsInfo_0 = v152.widgetAnalyticsInfo;
                    v164.widgetInteractionV2(l_widgetAnalyticsInfo_0, v45.ActionType.ITEM_CLICK);
                end;
                if l_adTrackingData_0 then
                    v46.TrackSponsoredItemClick(v162, l_adTrackingData_0);
                end;
                if v176.isItemDetailsViewStateFull then
                    v169(v62(v167));
                end;
                return;
            end;
        end;
    end, {
        v169, 
        l_itemId_0, 
        v200, 
        l_itemData_0, 
        v162, 
        v164, 
        l_itemType_0, 
        v168, 
        v167, 
        v152.widgetAnalyticsInfo, 
        v161, 
        v176.fullView, 
        v176.isAvatarR6, 
        v176.isItemDetailsViewStateFull, 
        v163, 
        v168.opaque.name, 
        v152.analyticsContext, 
        v152.analyticsItemCountPerPage, 
        v152.index, 
        v152.adTrackingData, 
        l_isSelected_0, 
        v173
    });
    local _ = if l_FFlagAXMISEnableMultiShopping_0 then v2.useCallback(function() --[[ Line: 791 ]]
        -- upvalues: l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v173 (copy), l_AvatarScreen_0 (ref), v177 (copy), v165 (copy), v167 (copy), v216 (copy)
        local v217 = l_itemType_0 == l_ItemTypeEnum_0.Look;
        if not l_isSelected_0 and v173 ~= l_AvatarScreen_0.MySharedAvatars and v217 and v177 and next(v177) ~= nil and v165 and v165.shouldShowWearAvatarReplaceAllItemsPrompt() then
            v167.navigate(l_AvatarScreen_0.WearAvatarReplaceAllItemsPrompt, {
                onConfirm = function(v218) --[[ Line: 804 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v165 (ref), v216 (ref)
                    if v218 then
                        v165.hideWearAvatarReplaceAllItemsPrompt();
                    end;
                    v216();
                end
            });
            return;
        else
            v216();
            return;
        end;
    end, {
        l_itemType_0, 
        v216, 
        l_isSelected_0, 
        v177, 
        v165, 
        v173, 
        v167
    }) else nil;
    local v223 = if l_FFlagAXCatalogMakeupSupport_0 then v2.useCallback(function() --[[ Line: 821 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_getTryOnItemReducerKey_0 (ref), v177 (copy), v43 (ref), v166 (copy), l_itemData_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), v178 (copy), l_MAX_MAKEUP_LAYERS_0 (ref), v167 (copy), l_AvatarScreen_0 (ref), v216 (copy)
        local v220 = nil;
        if l_itemId_0 and l_itemType_0 then
            v220 = l_getTryOnItemReducerKey_0(l_itemId_0, l_itemType_0);
        end;
        local v221 = v177 and not v177[v220] and l_itemType_0 == v43.ItemType.Asset;
        if v166 and v166.shouldShowMakeupMax6LayersPrompt() and l_itemData_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_itemData_0.assetType] and v178 and #v178 == l_MAX_MAKEUP_LAYERS_0 and v221 then
            v167.navigate(l_AvatarScreen_0.MakeupMax6LayersPrompt, {
                onConfirm = function(v222) --[[ Line: 840 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v166 (ref), v216 (ref)
                    if v222 then
                        v166.hideMakeupMax6LayersPrompt();
                    end;
                    v216();
                end
            });
            return;
        else
            v216();
            return;
        end;
    end, {
        v166, 
        v167, 
        v216, 
        l_itemData_0, 
        v178, 
        v177, 
        l_itemId_0, 
        l_itemType_0
    }) else nil;
    local v224 = v2.useMemo(function() --[[ Line: 864 ]]
        -- upvalues: v3 (ref), v195 (copy), v216 (copy)
        return {
            OpenDetails = v3.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 867 ]]
                -- upvalues: v195 (ref)
                v195(true);
            end, {
                key = "Feature.Catalog.Action.OpenDetails"
            }) or nil, 
            Select = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 874 ]]
                -- upvalues: v216 (ref)
                v216();
            end, {
                key = "Feature.Avatar.Action.Select"
            }) or nil
        };
    end, {
        v216, 
        v195
    });
    local v226 = v2.useCallback(function(_) --[[ Line: 882 ]]
        -- upvalues: v152 (copy), l_itemId_0 (copy)
        if v152.onThumbnailLoaded then
            v152.onThumbnailLoaded(l_itemId_0);
        end;
    end, {
        v152.onThumbnailLoaded
    });
    local v231 = v2.useMemo(function() --[[ Line: 888 ]]
        -- upvalues: l_lookData_0 (copy), v7 (ref)
        if l_lookData_0 then
            local v228 = v7.List.map(if l_lookData_0.assets then l_lookData_0.assets else {}, function(v227) --[[ Line: 890 ]]
                return v227.id;
            end);
            local v230 = v7.List.map(if l_lookData_0.bundles then l_lookData_0.bundles else {}, function(v229) --[[ Line: 893 ]]
                return v229.id;
            end);
            return {
                assetIds = v228, 
                bundleIds = v230
            };
        else
            return {};
        end;
    end, {
        l_lookData_0
    });
    local v232 = nil;
    local v233 = v152.hydratedContent or {
        price = nil
    };
    local v234 = if v152.gridInformation then v152.gridInformation.gridPositionRow else nil;
    local v235 = if v152.gridInformation then v152.gridInformation.gridPositionColumn else nil;
    local v236 = if l_itemType_0 == "Look" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else if l_itemType_0 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
    v232 = v2.useCallback(function(v237) --[[ Line: 918 ]]
        -- upvalues: v155 (copy), v152 (copy), l_itemType_0 (copy), l_lookData_0 (copy), v233 (copy), l_itemId_0 (copy), l_itemData_0 (copy), l_addUnifiedEventLogging_0 (ref), v7 (ref), v234 (copy), v235 (copy), v236 (copy), l_isSelected_0 (copy), l_UnifiedEventLogEnums_0 (ref), v231 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), l_UnifiedEventLoggingUtils_0 (ref), l_FFlagAXDurablesSupport_0 (ref), l_getTimedOptionForItemData_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v237 then
            v155.current = v237;
            local v238 = nil;
            local v239 = nil;
            local v240 = nil;
            if v152.widgetAnalyticsInfo then
                if l_itemType_0 == "Look" then
                    v238 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v239 = if v152.widgetAnalyticsInfo then v152.widgetAnalyticsInfo.itemId ~= nil else false;
                    v240 = true;
                else
                    v238 = if v233 then v233.price ~= nil else false;
                    v239 = if v152.widgetAnalyticsInfo then v152.widgetAnalyticsInfo.itemId ~= nil else false;
                    v240 = true;
                end;
            elseif v152.isOrganic then
                if l_itemType_0 == "Look" then
                    v238 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v239 = l_itemId_0 ~= nil;
                    v240 = true;
                else
                    if l_itemData_0 then
                        local v241 = true;
                        if l_itemData_0.lowestPrice == nil then
                            v241 = l_itemData_0.priceInRobux ~= nil;
                        end;
                        v238 = v241;
                    else
                        v238 = false;
                    end;
                    v239 = l_itemId_0 ~= nil;
                    if l_itemData_0 then
                        local v242 = true;
                        if l_itemData_0.assetType == nil then
                            v242 = false;
                            if l_itemData_0.bundleType ~= nil then
                                v242 = l_itemData_0.bundleType ~= "AvatarAnimations";
                            end;
                        end;
                        v240 = v242;
                    else
                        v240 = false;
                    end;
                end;
            end;
            if v238 and v239 and v240 then
                l_addUnifiedEventLogging_0(v155, v7.Dictionary.join(v152.widgetAnalyticsInfo or {
                    itemId = l_itemId_0, 
                    assetType = if l_itemData_0 then l_itemData_0.assetType else nil, 
                    bundleType = if l_itemData_0 then l_itemData_0.bundleType else nil, 
                    gridPositionRow = v234, 
                    gridPositionColumn = v235
                }, {
                    itemType = v236, 
                    action = if l_isSelected_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                    category = v152.impressionsCategory, 
                    subcategory = v152.impressionsSubcategory, 
                    taxonomyId = v152.impressionsTaxonomyId, 
                    assetIds = if v152.widgetAnalyticsInfo and v231 then v231.assetIds else nil, 
                    bundleIds = if v152.widgetAnalyticsInfo and v231 then v231.bundleIds else nil, 
                    organicAssetIds = if v152.isOrganic and v231 then v231.assetIds else nil, 
                    organicBundleIds = if v152.isOrganic and v231 then v231.bundleIds else nil, 
                    organicLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v152.isOrganic and l_lookData_0 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType) else nil, 
                    widgetLookType = if not (l_FFlagAXAddLookTypeEnumForLogging_0 and l_lookData_0) or v152.isOrganic then nil else l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType), 
                    organicItemPrice = if v152.isOrganic then if l_lookData_0 then l_lookData_0.totalPrice else if l_itemData_0 then l_itemData_0.lowestPrice or l_itemData_0.priceInRobux else nil else nil, 
                    widgetItemPrice = if v152.widgetAnalyticsInfo then if l_lookData_0 then l_lookData_0.totalPrice else v233.price else nil, 
                    organicTimedOption = if l_FFlagAXDurablesSupport_0 and v152.isOrganic then l_getTimedOptionForItemData_0(l_itemData_0) else nil, 
                    widgetTimedOption = if not l_FFlagAXDurablesSupport_0 or v152.isOrganic then nil else l_getTimedOptionForItemData_0(l_itemData_0), 
                    widgetAssetType = if not (not l_FFlagAddTypesToWidgetItems_0 or v152.isOrganic) and l_itemData_0 then l_itemData_0.assetType else nil, 
                    widgetBundleType = if not (not l_FFlagAddTypesToWidgetItems_0 or v152.isOrganic) and l_itemData_0 then l_itemData_0.bundleType else nil
                }), {
                    hasDeferredActions = true, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
            end;
        end;
    end, {
        v152.widgetAnalyticsInfo, 
        v152.hydratedContent, 
        l_itemId_0, 
        v236, 
        l_itemData_0, 
        v234, 
        v235, 
        l_isSelected_0, 
        v152.impressionsCategory, 
        v152.impressionsSubcategory, 
        v152.impressionsTaxonomyId, 
        v231, 
        l_lookData_0
    });
    local v243 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        local v245 = v2.useCallback(function() --[[ Line: 1059 ]]
            -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v173 (copy), l_AvatarScreen_0 (ref), v169 (copy), v74 (ref), v162 (copy), v167 (copy), v152 (copy), l_PeekViewState_0 (ref), v60 (ref), v44 (ref), l_itemData_0 (copy), v164 (copy), v168 (copy)
            if l_itemId_0 and l_itemType_0 then
                if l_itemType_0 == l_ItemTypeEnum_0.Look then
                    local v244 = 2;
                    if l_FFlagAXMISEnableMultiShopping_0 and v173 ~= l_AvatarScreen_0.MySharedAvatars then
                        v244 = 1;
                    end;
                    v169(v74(v162, v167, v152.widgetAnalyticsInfo, l_itemId_0, l_PeekViewState_0.Full, v244));
                    return;
                else
                    v169(v60({
                        itemId = l_itemId_0, 
                        itemType = l_itemType_0, 
                        itemSubType = v44.GetItemSubType(l_itemType_0, l_itemData_0), 
                        priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                        catalogAnalytics = v164, 
                        avatarRoute = v168, 
                        navigation = v167, 
                        itemDetailsPeekViewRefs = v152.itemDetailsPeekViewRefs, 
                        resultsListRef = v152.resultsListRef, 
                        widgetInfo = v152.widgetAnalyticsInfo, 
                        showFullWithNoPeekView = true
                    }));
                end;
            end;
        end, {
            v169, 
            l_itemId_0, 
            l_itemType_0, 
            l_itemData_0, 
            v162, 
            v167, 
            v152.widgetAnalyticsInfo, 
            v164, 
            v168, 
            v152.itemDetailsPeekViewRefs, 
            v152.resultsListRef
        });
        v243 = v80({
            onOpenItemDetailsPage = v245, 
            onSelectItem = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_FFlagAXCatalogMakeupSupport_0 then v223 else v216
        }, v232);
    end;
    v2.useEffect(function() --[[ Line: 1117 ]]
        -- upvalues: v156 (copy), v152 (copy), v48 (ref), v47 (ref)
        local l_current_0 = v156.current;
        if l_current_0 and v152.impressionsId then
            l_current_0:SetAttribute(v152.impressionsTag, v152.impressionsId);
            local v247 = v48[v152.impressionsSchema];
            v47.writeItemAttributes(v247, l_current_0, v152);
        end;
    end, {
        v152.impressionsId, 
        v152.impressionsTag, 
        v152.impressionsSchema
    });
    local l_cardStyle_0 = v152.cardStyle;
    local l_tileWidth_0 = v152.tileWidth;
    local l_thumbailAspectRatio_0 = v152.thumbailAspectRatio;
    local v251 = l_itemData_0 and l_itemData_0.name;
    local v252 = l_itemData_0 and (l_itemData_0.lowestPrice or l_itemData_0.priceInRobux) or nil;
    local v253 = l_itemData_0 and l_itemData_0.priceStatus;
    local v254 = nil;
    if l_FFlagAXDurablesSupport_0 and l_itemData_0 and l_itemData_0.timedOptions then
        for _, v256 in l_itemData_0.timedOptions do
            if v256.selected then
                v252 = v256.price;
            end;
        end;
    end;
    if v152.itemType == l_ItemTypeEnum_0.Look then
        v252 = l_lookData_0 and l_lookData_0.totalPrice;
        v251 = l_lookData_0 and l_lookData_0.name;
        if v173 == l_AvatarScreen_0.MySharedAvatars and l_lookData_0 and l_lookData_0.owned then
            v254 = l_lookData_0.moderationStatus;
        end;
    end;
    local v261 = v2.useMemo(function() --[[ Line: 1153 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v152 (copy), l_ItemTypeEnum_0 (ref), v111 (ref), l_lookData_0 (copy), l_itemData_0 (copy)
        if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then
            if v152.isCreatorNameVisible then
                if v152.itemType == l_ItemTypeEnum_0.Look then
                    return (v111(l_lookData_0));
                else
                    local l_l_itemData_0_0 = l_itemData_0;
                    if l_l_itemData_0_0 and l_l_itemData_0_0.creator then
                        local v258 = l_l_itemData_0_0.creator.name or l_l_itemData_0_0.creatorName;
                        if v258 then
                            return {
                                name = v258, 
                                verified = l_l_itemData_0_0.creator.hasVerifiedBadge
                            };
                        end;
                    end;
                    return nil;
                end;
            else
                return nil;
            end;
        elseif v152.creatorNameTileFooterEnabled then
            if v152.itemType == l_ItemTypeEnum_0.Look then
                return (v111(l_lookData_0));
            else
                local l_l_itemData_0_1 = l_itemData_0;
                if l_l_itemData_0_1 and l_l_itemData_0_1.creator then
                    local v260 = l_l_itemData_0_1.creator.name or l_l_itemData_0_1.creatorName;
                    if v260 then
                        return {
                            name = v260, 
                            verified = l_l_itemData_0_1.creator.hasVerifiedBadge
                        };
                    end;
                end;
                return nil;
            end;
        else
            return nil;
        end;
    end, {
        l_lookData_0, 
        l_itemData_0, 
        v152.itemType, 
        v152.isCreatorNameVisible, 
        v152.creatorNameTileFooterEnabled
    });
    local v262 = if l_FFlagAXDurablesFooter_0 and v181 then v184.timedOptionDays else nil;
    local v264 = v2.useMemo(function() --[[ Line: 1177 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v152 (copy), v253 (copy), v252 (ref), l_FFlagAXDurablesFooter_0 (ref), v262 (copy), v31 (ref)
        local v263 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v152.isPriceVisible then if v253 then {
            type = "text", 
            text = v253
        } else if v252 then {
            type = "price", 
            price = v252 or 0
        } else nil else nil else if v253 then {
            type = "text", 
            text = v253
        } else if v252 then {
            type = "price", 
            price = v252 or 0
        } else nil;
        if l_FFlagAXDurablesFooter_0 and v262 and v263 then
            return {
                type = "multi", 
                contents = {
                    v263, 
                    {
                        type = "timedOption", 
                        icon = v31.Enums.IconName.Clock, 
                        text = v262
                    }
                }
            };
        else
            return v263;
        end;
    end, {
        v152.isPriceVisible, 
        v253, 
        v252, 
        v262
    });
    local v265 = v2.useCallback(function() --[[ Line: 1207 ]]
        -- upvalues: v195 (copy)
        v195(true);
    end, {
        v195
    });
    local v266 = if v159 then nil else if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v199 else v265;
    local v267 = {
        ref = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v243 else v232, 
        animationTabsItemData = if v176.showAnimationTabs then l_itemData_0 else nil, 
        onActivated = if l_FFlagAXCatalogMakeupSupport_0 then v223 else v216, 
        onOverlayButtonActivated = v266, 
        overlayButtonText = if v159 then nil else if l_FFlagAXMISEnableMultiShopping_0 then v184.details else if v152.itemType == l_ItemTypeEnum_0.Look then v184.detailsWithItemsCount else v184.details, 
        thumbnailRef = v156, 
        thumbnailTag = v152.impressionsTag, 
        thumbnailUrl = v196, 
        onThumbnailLoaded = v226, 
        thumbnailRect = v194, 
        priceLineContent = v264, 
        creator = v261, 
        title = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v152.isTitleVisible then v251 else nil else v251
    };
    local v268;
    if v152.itemType == l_ItemTypeEnum_0.Look then
        v268 = nil;
    else
        local v269 = if l_itemData_0 then l_itemData_0.tileRestrictionsMap else nil;
        v268 = if v269 then v269[l_ItemTileEnums_0.Restriction.Limited] and "Limited" or (v269[l_ItemTileEnums_0.Restriction.LimitedUnique] or v269[l_ItemTileEnums_0.Restriction.Collectible]) and "Collectible" or nil else nil;
    end;
    v267.itemType = v268;
    v267.itemInfo = if v152.itemType == l_ItemTypeEnum_0.Look then nil else l_itemData_0 and l_itemData_0.bundleType == v43.BundleTypeIdStrings.DynamicHead and "DynamicHead" or nil;
    v267.itemStatus = if v152.itemType == l_ItemTypeEnum_0.Look then v113(v254) else if v184.statusText then {
        type = "text", 
        text = v184.statusText
    } else v151(l_itemData_0);
    v267.headerAspectRatio = if l_tileWidth_0 then nil else l_thumbailAspectRatio_0;
    v267.headerSize = if l_tileWidth_0 then UDim2.fromOffset(l_tileWidth_0, l_tileWidth_0 / (l_thumbailAspectRatio_0 or 1)) else nil;
    v267.isSelected = l_isSelected_0;
    v267.backgroundLayers = if l_FFlagAXLookAndFeelBackgrounds_0 and l_cardStyle_0 then l_cardStyle_0.backgroundLayers else nil;
    v267.inputBindings = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then nil else v224;
    return v267;
end;