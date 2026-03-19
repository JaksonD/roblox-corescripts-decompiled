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
local l_getTimedOptionForItemData_0 = v24.Utils.getTimedOptionForItemData;
local l_useAvatarRoute_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).AvatarRoute.Hooks.useAvatarRoute;
local v30 = require(l_CorePackages_0.Packages.Foundation);
local v31 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXLookAndFeelBackgrounds_0 = v31.FFlagAXLookAndFeelBackgrounds;
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v31.FFlagAXCatalogItemCardFooterBackendDriven;
local v34 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 = v34.FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation;
local v36 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableShowRobloxAsLookCreator);
local l_FFlagAddTypesToWidgetItems_0 = v31.FFlagAddTypesToWidgetItems;
local v38 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookFromTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v40 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v41 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v42 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v43 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v44 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v46 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v47 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v48 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v49 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v50 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v51 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local l_selectEquippedLayeredMakeupAssets_0 = v10.State.Selectors.selectEquippedLayeredMakeupAssets;
local v53 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v54 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v56 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v57 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local v58 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v59 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v60 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v61 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v62 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v63 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v64 = require(l_Modules_0.AvatarExperience.Common.Actions.AddAnalyticsMetadata);
local v65 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v66 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v67 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullViewTable);
local l_getTryOnItemReducerKey_0 = v10.Utils.getTryOnItemReducerKey;
local l_ItemTypeEnum_0 = v10.Enums.ItemTypeEnum;
local l_CatalogItemCardStatusIconTypeEnum_0 = v10.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v10.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v10.Constants.MAX_MAKEUP_LAYERS;
local v73 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v74 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenLookDetailsFromButton);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local v77 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local _ = require(script.Parent.CatalogItemCard);
local v79 = require(script.Parent.useCatalogItemCardFocusNavigationBindings);
local v80 = require(script.Parent.useCatalogItemCardFtux);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 = v31.FFlagAXCatalogItemCardSelectedOverlayButtonLogging;
local l_FFlagAXDurablesSupport_0 = v31.FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportForPermanent_0 = v31.FFlagAXDurablesSupportForPermanent;
local l_FFlagAXMISEnableMultiShopping_0 = v31.FFlagAXMISEnableMultiShopping;
local l_FFlagAXCatalogMakeupSupport_0 = v31.FFlagAXCatalogMakeupSupport;
local v87 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_FFlagAXCatalogCategoriesStore_0 = v31.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDurablesFooter_0 = v31.FFlagAXDurablesFooter;
local l_FFlagAXWearTimeSupport_0 = v34.FFlagAXWearTimeSupport;
local l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 = v13.Constants.LOOKS_IMAGE_OFFSET_MULTIPLIERS;
local l_LOOKS_IMAGE_ZOOM_0 = v13.Constants.LOOKS_IMAGE_ZOOM;
local v93 = {
    toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning", 
    isLocalized = false, 
    toastType = v49.InformationMessage
};
local function _(v94) --[[ Line: 128 ]] --[[ Name: isBodyBundle ]]
    -- upvalues: v42 (copy)
    if v94 then
        return v94.bundleType == v42.BundleTypeIdStrings.BodyParts;
    else
        return false;
    end;
end;
local function _(v96) --[[ Line: 132 ]] --[[ Name: getItemTypeFromItemData ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local v97 = if v96 then v96.tileRestrictionsMap else nil;
    if v97 then
        if v97[l_ItemTileEnums_0.Restriction.Limited] then
            return "Limited";
        elseif v97[l_ItemTileEnums_0.Restriction.LimitedUnique] or v97[l_ItemTileEnums_0.Restriction.Collectible] then
            return "Collectible";
        end;
    end;
    return nil;
end;
local function _(v99) --[[ Line: 148 ]] --[[ Name: getItemInfoFromItemData ]]
    -- upvalues: v42 (copy)
    if v99 and v99.bundleType == v42.BundleTypeIdStrings.DynamicHead then
        return "DynamicHead";
    else
        return nil;
    end;
end;
local _ = function(v101) --[[ Line: 155 ]] --[[ Name: getTimedOptionDays ]]
    for _, v103 in v101 do
        if v103.selected and v103.days > 0 then
            return v103.days;
        end;
    end;
    return nil;
end;
local function _(v105) --[[ Line: 164 ]] --[[ Name: getCreatorFromItemData ]]
    if v105 and v105.creator then
        local v106 = v105.creator.name or v105.creatorName;
        if v106 then
            return {
                name = v106, 
                verified = v105.creator.hasVerifiedBadge
            };
        end;
    end;
    return nil;
end;
local function v109(v108) --[[ Line: 174 ]] --[[ Name: getCreatorFromLookData ]]
    -- upvalues: v36 (copy), v42 (copy)
    if v108 and v108.curator and v108.curator.name and (v36() or v108.curator.name:lower() ~= v42.RobloxCreatorName:lower()) then
        return {
            name = v108.curator.name, 
            verified = if v108 and v108.curator then v108.curator.hasVerifiedBadge else nil
        };
    else
        return nil;
    end;
end;
local function v111(v110) --[[ Line: 193 ]] --[[ Name: getLookStatusFromModerationStatus ]]
    -- upvalues: v42 (copy)
    if v110 == v42.ModerationStatus.PendingModeration then
        return {
            type = "icon", 
            iconType = "PendingModeration"
        };
    elseif v110 == v42.ModerationStatus.Moderated then
        return {
            type = "icon", 
            iconType = "Moderated"
        };
    else
        return nil;
    end;
end;
local function _(v112) --[[ Line: 202 ]] --[[ Name: isValidItemId ]]
    local v113 = false;
    if v112 ~= nil then
        v113 = v112 ~= "0";
    end;
    return v113;
end;
local _ = function(v115, v116) --[[ Line: 208 ]] --[[ Name: isValidThumbnailSize ]]
    -- upvalues: v42 (copy)
    if v116 ~= nil then
        for _, v118 in v42.CatalogThumbnailTypeToSize[v116] do
            if v118 == v115 then
                return true;
            end;
        end;
    end;
    return false;
end;
local function v127(v120, v121, v122) --[[ Line: 223 ]] --[[ Name: cardIsSelectedInTryOnOutfit ]]
    -- upvalues: l_getTryOnItemReducerKey_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy)
    if v121 and v120.AvatarExperience.AvatarScene.OutfitTryOn.LookId == v121 then
        return true;
    else
        local l_TryOnItems_0 = v120.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v124 = v120.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil;
        if v121 and v122 then
            local v125 = l_getTryOnItemReducerKey_0(v121, v122);
            if l_FFlagAXMISEnableMultiShopping_0 then
                return l_TryOnItems_0[v125] ~= nil;
            else
                local v126 = false;
                if l_TryOnItems_0[v125] ~= nil then
                    v126 = v124;
                end;
                return v126;
            end;
        else
            return false;
        end;
    end;
end;
local function v143(v128, v129, v130) --[[ Line: 242 ]] --[[ Name: selectCatalogItemCardState ]]
    -- upvalues: v127 (copy), v51 (copy), v43 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v87 (copy), v41 (copy), v42 (copy), v67 (copy), l_PeekViewState_0 (copy)
    local v131 = v127(v128, v129, v130);
    local l_LastToggledItem_0 = v128.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    local v133 = nil;
    local v134 = nil;
    local v135 = v51(v128.AvatarExperience.Common, v129, v130);
    if v135 then
        local v136, v137 = v43.GetStatus(v135);
        v133 = v136;
        v134 = v137;
    end;
    local v138 = nil;
    v138 = if l_FFlagAXCatalogCategoriesStore_0 then v87.getCatalogSelectionStore().selectedCategoryInfo(false) else v41.getCatalogCategoryInfoFromState(v128);
    local v139 = v131 and v135 and v135.bundleType == v42.BundleTypeIdStrings.Animations;
    local l_PageType_0 = v138.PageType;
    local v141 = v139 and (l_LastToggledItem_0 and l_LastToggledItem_0.itemId == v129 or l_PageType_0 == v42.PageType.Animation or l_PageType_0 == v42.PageType.AllAnimation);
    local l_viewState_0 = v128.AvatarExperience.Common.ItemDetailsPeekView.viewState;
    return {
        itemData = v135, 
        isSelected = v131, 
        statusText = v134, 
        avatarType = v128.AvatarExperience.AvatarEditor.Character.AvatarType, 
        isAvatarR6 = v128.AvatarExperience.AvatarEditor.Character.AvatarType == v42.AvatarType.R6, 
        fullView = v67(v128), 
        showAnimationTabs = v141, 
        isItemDetailsViewStateFull = l_viewState_0 == l_PeekViewState_0.Full
    };
end;
local function v145(v144) --[[ Line: 290 ]]
    return v144.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v149(v146) --[[ Line: 294 ]] --[[ Name: showDurableBadge ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy)
    if not l_FFlagAXDurablesSupport_0 then
        return nil;
    elseif l_FFlagAXDurablesFooter_0 then
        return nil;
    elseif not v146 or not v146.timedOptions then
        return nil;
    else
        for _, v148 in v146.timedOptions do
            if v148.selected then
                return {
                    type = "badge", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
                    text = if l_FFlagAXDurablesSupportForPermanent_0 then if v148.days > 0 then tostring(v148.days) else "" else tostring(v148.days)
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
return function(v150) --[[ Line: 362 ]] --[[ Name: useCatalogItemCardViewModel ]]
    -- upvalues: v2 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v66 (copy), l_useRoactService_0 (copy), v40 (copy), v54 (copy), v53 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useMultiItemShoppingFtux_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_useMakeupFtux_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v143 (copy), l_useSelector_0 (copy), v6 (copy), v145 (copy), l_selectEquippedLayeredMakeupAssets_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_useLocalization_0 (copy), v43 (copy), v42 (copy), l_getThumbSizeVectorFromParamString_0 (copy), l_getZoomedSizeAndOffset_0 (copy), l_LOOKS_IMAGE_ZOOM_0 (copy), l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_ItemTypeEnum_0 (copy), v74 (copy), l_AvatarScreen_0 (copy), v77 (copy), v59 (copy), l_FFlagAXWearTimeSupport_0 (copy), v80 (copy), l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 (copy), v65 (copy), v57 (copy), v63 (copy), v50 (copy), v73 (copy), l_PeekViewState_0 (copy), v38 (copy), v58 (copy), v64 (copy), v56 (copy), v44 (copy), v60 (copy), v48 (copy), v93 (copy), v62 (copy), v45 (copy), v61 (copy), l_getTryOnItemReducerKey_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), l_MAX_MAKEUP_LAYERS_0 (copy), v3 (copy), v7 (copy), l_addUnifiedEventLogging_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_getTimedOptionForItemData_0 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy), v79 (copy), v47 (copy), v46 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v109 (copy), v30 (copy), l_ItemTileEnums_0 (copy), v111 (copy), v149 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy)
    local v151 = false;
    local v152 = false;
    local v153 = v2.useRef(nil);
    local v154 = v2.useRef(nil);
    local v155 = l_useLastInput_0();
    local v156 = l_useIsSpatial_0();
    local v157 = false;
    if v155 == v21.Input.Directional then
        v157 = not v156;
    end;
    local v158 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v159 = v66();
    local v160 = l_useRoactService_0(v40);
    local v161 = l_useRoactService_0(v54);
    local v162 = l_useRoactService_0(v53);
    local v163 = if l_FFlagAXMISEnableMultiShopping_0 then l_useMultiItemShoppingFtux_0() else nil;
    local v164 = if l_FFlagAXCatalogMakeupSupport_0 then l_useMakeupFtux_0() else nil;
    local v165 = l_useNavigation_0();
    local v166 = l_useAvatarRoute_0();
    local v167 = l_useDispatch_0();
    local l_itemId_0 = v150.itemId;
    local l_itemType_0 = v150.itemType;
    local l_lookData_0 = v150.lookData;
    local v171 = v166 and v166.opaque and v166.opaque.name;
    local v173 = v2.useCallback(function(v172) --[[ Line: 383 ]]
        -- upvalues: v143 (ref), l_itemId_0 (copy), l_itemType_0 (copy)
        return (v143(v172, l_itemId_0, l_itemType_0));
    end, {
        l_itemId_0, 
        l_itemType_0
    });
    local v174 = l_useSelector_0(v173, v6.shallowEqual);
    local v175 = if not not l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(v145) else nil;
    local v176 = if l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(l_selectEquippedLayeredMakeupAssets_0) else nil;
    local v177 = if l_lookData_0 and l_lookData_0.assets then #l_lookData_0.assets else 0;
    local v178 = if l_lookData_0 and l_lookData_0.bundles then #l_lookData_0.bundles else 0;
    local v179;
    if l_FFlagAXDurablesFooter_0 and v174 and v174.itemData and v174.itemData.timedOptions then
        for _, v181 in v174.itemData.timedOptions do
            if v181.selected and v181.days > 0 then
                v179 = v181.days;
                v151 = true;
            end;
            if v151 then
                break;
            end;
        end;
        if not v151 then
            v179 = nil;
        end;
    else
        v179 = nil;
    end;
    v151 = false;
    local v182 = l_useLocalization_0({
        statusText = v174.statusText, 
        details = "Feature.Avatar.Label.DetailsButton", 
        detailsWithItemsCount = {
            "Feature.Avatar.Label.Details"; 
            quantity = v177 + v178
        }, 
        timedOptionDays = if l_FFlagAXDurablesFooter_0 and v179 then {
            "Feature.Durables.TimeRemaining.Days"; 
            number = v179
        } else nil
    });
    local l_isSelected_0 = v174.isSelected;
    local l_itemData_0 = v174.itemData;
    local v185 = l_itemType_0 and v43.GetRbxThumbType(l_itemType_0) or nil;
    local l__150x150_0 = v42.CatalogThumbnailTypeToSize.Asset._150x150;
    if v150.thumbnailSize then
        local l_thumbnailSize_0 = v150.thumbnailSize;
        local v188;
        if v185 ~= nil then
            for _, v190 in v42.CatalogThumbnailTypeToSize[v185] do
                if v190 == l_thumbnailSize_0 then
                    v188 = true;
                    v152 = true;
                end;
                if v152 then
                    break;
                end;
            end;
        end;
        if not v152 then
            v188 = false;
        end;
        v152 = false;
        if v188 then
            l__150x150_0 = v150.thumbnailSize;
        end;
    end;
    local v191 = l_getThumbSizeVectorFromParamString_0(l__150x150_0);
    local v192 = if (if l_itemData_0 then l_itemData_0.bundleType == v42.BundleTypeIdStrings.BodyParts else false) and v191 then l_getZoomedSizeAndOffset_0(v191, l_LOOKS_IMAGE_ZOOM_0, l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0) else nil;
    local v193 = false;
    if l_itemId_0 ~= nil then
        v193 = l_itemId_0 ~= "0";
    end;
    local v194 = if v193 then ("rbxthumb://type=%*&id=%*&%*"):format(v185, l_itemId_0, l__150x150_0) else nil;
    v193 = v2.useCallback(function(v195) --[[ Line: 438 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_ItemTypeEnum_0 (ref), l_lookData_0 (copy), v162 (copy), v166 (copy), v167 (copy), v74 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v171 (copy), l_AvatarScreen_0 (ref), v77 (ref), v165 (copy), v59 (ref), v43 (ref), l_itemData_0 (copy), v150 (copy)
        if l_itemId_0 and l_itemType_0 then
            if l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 then
                l_sendUnifiedEventForDeferredAction_0({
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "CLICK_ITEM_DETAILS"
                });
            end;
            if l_itemType_0 == l_ItemTypeEnum_0.Look then
                local v196 = {
                    lookId = l_lookData_0 and l_lookData_0.id, 
                    valueInRobux = l_lookData_0 and l_lookData_0.totalValue, 
                    catalogAnalytics = v162, 
                    avatarRoute = v166
                };
                v167(v74(v196));
                if l_FFlagAXMISEnableMultiShopping_0 and v171 ~= l_AvatarScreen_0.MySharedAvatars then
                    v167(v77(function() --[[ Line: 457 ]]
                        -- upvalues: v165 (ref), l_AvatarScreen_0 (ref)
                        v165.navigate(l_AvatarScreen_0.LookDetails);
                    end));
                    return;
                end;
            else
                v167(v59({
                    itemId = l_itemId_0, 
                    itemType = l_itemType_0, 
                    itemSubType = v43.GetItemSubType(l_itemType_0, l_itemData_0), 
                    priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                    catalogAnalytics = v162, 
                    avatarRoute = v166, 
                    navigation = v165, 
                    itemDetailsPeekViewRefs = v150.itemDetailsPeekViewRefs, 
                    resultsListRef = v150.resultsListRef, 
                    widgetInfo = v150.widgetAnalyticsInfo, 
                    showFullWithNoPeekView = v195
                }));
            end;
        end;
    end, {
        v167, 
        l_itemId_0, 
        l_itemType_0, 
        v162, 
        v166, 
        v165, 
        v150.itemDetailsPeekViewRefs, 
        v150.resultsListRef, 
        v150.widgetAnalyticsInfo, 
        l_lookData_0, 
        v171
    });
    if l_FFlagAXWearTimeSupport_0 then
        v80({
            isSelected = l_isSelected_0, 
            itemData = l_itemData_0
        });
    end;
    local v197 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        v197 = v2.useCallback(function() --[[ Line: 499 ]]
            -- upvalues: v193 (copy)
            v193(true);
        end, {
            v193
        });
    end;
    local v198 = v2.useCallback(function() --[[ Line: 505 ]]
        -- upvalues: v65 (ref), v157 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v158 (copy), l_itemId_0 (copy), v193 (copy), v167 (copy), v57 (ref), v165 (copy), l_itemType_0 (copy)
        return v167(v57(v165, l_itemId_0, l_itemType_0, function() --[[ Line: 506 ]] --[[ Name: onR15PromptWillClose ]]
            -- upvalues: v65 (ref), v157 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v158 (ref), l_itemId_0 (ref), v193 (ref)
            v65("CatalogItemCard", v157);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v157 then
                v158.captureFocus();
            end;
            if l_itemId_0 then
                v193();
            end;
        end, nil, true));
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v157, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v158, 
        l_itemId_0, 
        v193, 
        v167, 
        v165, 
        l_itemId_0, 
        l_itemType_0
    });
    local v214 = v2.useCallback(function(v199) --[[ Line: 546 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v159 (copy), v153 (copy), v171 (copy), v167 (copy), v63 (ref), v162 (copy), v50 (ref), v165 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref), v73 (ref), v160 (copy), v150 (copy), l_PeekViewState_0 (ref), v38 (ref), v58 (ref), v64 (ref), v56 (ref), v44 (ref), v198 (copy), v43 (ref), l_itemData_0 (copy), v60 (ref), v166 (copy), v174 (copy), v161 (copy), v42 (ref), v48 (ref), v93 (ref), v62 (ref), v45 (ref), v61 (ref)
        if not l_itemId_0 or not l_itemType_0 then
            return;
        elseif l_itemType_0 == l_ItemTypeEnum_0.Look then
            if not l_isSelected_0 then
                if v159 then
                    local v200 = if v153 then v153.current else nil;
                    if v200 ~= nil then
                        v159.setSelectedItemInstance(v200);
                    end;
                end;
                if v171 ~= nil then
                    v167(v63(v162, v171, v50.None));
                end;
                local l_v165_0 = v165;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    l_v165_0 = if v171 == l_AvatarScreen_0.MySharedAvatars then v165 else nil;
                end;
                local v202 = 2;
                if l_FFlagAXMISEnableMultiShopping_0 and v171 ~= l_AvatarScreen_0.MySharedAvatars then
                    v202 = 1;
                end;
                v167(v73(v160, l_v165_0, v150.widgetAnalyticsInfo, l_itemId_0, if l_FFlagAXMISEnableMultiShopping_0 and v171 == l_AvatarScreen_0.MySharedAvatars then l_PeekViewState_0.SuperBrief else nil, v202));
            else
                if v159 then
                    v159.setSelectedItemInstance(nil);
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    v167(v38(l_itemId_0));
                end;
                v167(v58(l_PeekViewState_0.Closed));
            end;
            if v150.isOrganic then
                if not l_isSelected_0 then
                    local l_analyticsContext_0 = v150.analyticsContext;
                    local l_analyticsItemCountPerPage_0 = v150.analyticsItemCountPerPage;
                    local l_index_0 = v150.index;
                    v167(v64({
                        selectedItemIndex = l_index_0
                    }));
                    v167(v56(l_analyticsContext_0, v162.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_0, l_analyticsItemCountPerPage_0, false));
                    return;
                end;
            else
                v162.widgetInteractionV2(v150.widgetAnalyticsInfo, if l_isSelected_0 then v44.ActionType.ITEM_DESELECTED else v44.ActionType.ITEM_CLICK);
            end;
            return;
        elseif v198() then
            return;
        else
            local v206 = v43.GetItemSubType(l_itemType_0, l_itemData_0);
            local l_l_isSelected_0_0 = l_isSelected_0;
            if l_FFlagAXMISEnableMultiShopping_0 then
                v167(v58(l_PeekViewState_0.Closed));
            end;
            v167(v60(v160, v162, l_itemType_0, v206, l_itemId_0, true, v166, v165, v150.widgetAnalyticsInfo, nil, if l_FFlagAXMISEnableMultiShopping_0 then v199 else nil));
            if not l_FFlagAXMISEnableMultiShopping_0 and v159 then
                v167(v58(l_PeekViewState_0.Closed));
            end;
            if v159 and l_l_isSelected_0_0 then
                v159.setSelectedItemInstance();
            end;
            if not l_l_isSelected_0_0 then
                if v159 then
                    v159.setSelectedItemInstance(v153.current);
                end;
                if l_isSelected_0 then
                    return;
                elseif v174.fullView[v166.opaque.name] == v50.UIFullView then
                    v167(v63(v161, v166.opaque.name, v50.None));
                end;
            end;
            if l_isSelected_0 then
                return;
            else
                local v208 = l_itemData_0 and l_itemData_0.assetType;
                if v174.isAvatarR6 and v208 ~= v42.AssetTypeIdStrings.HairAccessory and v42.LayeredAssetTypes[v208] ~= nil then
                    v167(v48(v93));
                end;
                if l_itemType_0 == v42.ItemType.Asset and v42.AssetTypeIdToCategory[v206] == v42.AssetCategories.Animation then
                    v167(v62(l_itemId_0, v208));
                end;
                local l_analyticsContext_1 = v150.analyticsContext;
                local l_analyticsItemCountPerPage_1 = v150.analyticsItemCountPerPage;
                local l_index_1 = v150.index;
                local l_adTrackingData_0 = v150.adTrackingData;
                v167(v64({
                    selectedItemIndex = l_index_1
                }));
                v167(v56(l_analyticsContext_1, v162.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_1, l_analyticsItemCountPerPage_1, false));
                if v150.widgetAnalyticsInfo then
                    local l_widgetAnalyticsInfo_0 = v150.widgetAnalyticsInfo;
                    v162.widgetInteractionV2(l_widgetAnalyticsInfo_0, v44.ActionType.ITEM_CLICK);
                end;
                if l_adTrackingData_0 then
                    v45.TrackSponsoredItemClick(v160, l_adTrackingData_0);
                end;
                if v174.isItemDetailsViewStateFull then
                    v167(v61(v165));
                end;
                return;
            end;
        end;
    end, {
        v167, 
        l_itemId_0, 
        v198, 
        l_itemData_0, 
        v160, 
        v162, 
        l_itemType_0, 
        v166, 
        v165, 
        v150.widgetAnalyticsInfo, 
        v159, 
        v174.fullView, 
        v174.isAvatarR6, 
        v174.isItemDetailsViewStateFull, 
        v161, 
        v166.opaque.name, 
        v150.analyticsContext, 
        v150.analyticsItemCountPerPage, 
        v150.index, 
        v150.adTrackingData, 
        l_isSelected_0, 
        v171
    });
    local _ = if l_FFlagAXMISEnableMultiShopping_0 then v2.useCallback(function() --[[ Line: 789 ]]
        -- upvalues: l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v171 (copy), l_AvatarScreen_0 (ref), v175 (copy), v163 (copy), v165 (copy), v214 (copy)
        local v215 = l_itemType_0 == l_ItemTypeEnum_0.Look;
        if not l_isSelected_0 and v171 ~= l_AvatarScreen_0.MySharedAvatars and v215 and v175 and next(v175) ~= nil and v163 and v163.shouldShowWearAvatarReplaceAllItemsPrompt() then
            v165.navigate(l_AvatarScreen_0.WearAvatarReplaceAllItemsPrompt, {
                onConfirm = function(v216) --[[ Line: 802 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v163 (ref), v214 (ref)
                    if v216 then
                        v163.hideWearAvatarReplaceAllItemsPrompt();
                    end;
                    v214();
                end
            });
            return;
        else
            v214();
            return;
        end;
    end, {
        l_itemType_0, 
        v214, 
        l_isSelected_0, 
        v175, 
        v163, 
        v171, 
        v165
    }) else nil;
    local v221 = if l_FFlagAXCatalogMakeupSupport_0 then v2.useCallback(function() --[[ Line: 819 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_getTryOnItemReducerKey_0 (ref), v175 (copy), v42 (ref), v164 (copy), l_itemData_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), v176 (copy), l_MAX_MAKEUP_LAYERS_0 (ref), v165 (copy), l_AvatarScreen_0 (ref), v214 (copy)
        local v218 = nil;
        if l_itemId_0 and l_itemType_0 then
            v218 = l_getTryOnItemReducerKey_0(l_itemId_0, l_itemType_0);
        end;
        local v219 = v175 and not v175[v218] and l_itemType_0 == v42.ItemType.Asset;
        if v164 and v164.shouldShowMakeupMax6LayersPrompt() and l_itemData_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_itemData_0.assetType] and v176 and #v176 == l_MAX_MAKEUP_LAYERS_0 and v219 then
            v165.navigate(l_AvatarScreen_0.MakeupMax6LayersPrompt, {
                onConfirm = function(v220) --[[ Line: 838 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v164 (ref), v214 (ref)
                    if v220 then
                        v164.hideMakeupMax6LayersPrompt();
                    end;
                    v214();
                end
            });
            return;
        else
            v214();
            return;
        end;
    end, {
        v164, 
        v165, 
        v214, 
        l_itemData_0, 
        v176, 
        v175, 
        l_itemId_0, 
        l_itemType_0
    }) else nil;
    local v222 = v2.useMemo(function() --[[ Line: 862 ]]
        -- upvalues: v3 (ref), v193 (copy), v214 (copy)
        return {
            OpenDetails = v3.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 865 ]]
                -- upvalues: v193 (ref)
                v193(true);
            end, {
                key = "Feature.Catalog.Action.OpenDetails"
            }) or nil, 
            Select = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 872 ]]
                -- upvalues: v214 (ref)
                v214();
            end, {
                key = "Feature.Avatar.Action.Select"
            }) or nil
        };
    end, {
        v214, 
        v193
    });
    local v224 = v2.useCallback(function(_) --[[ Line: 880 ]]
        -- upvalues: v150 (copy), l_itemId_0 (copy)
        if v150.onThumbnailLoaded then
            v150.onThumbnailLoaded(l_itemId_0);
        end;
    end, {
        v150.onThumbnailLoaded
    });
    local v229 = v2.useMemo(function() --[[ Line: 886 ]]
        -- upvalues: l_lookData_0 (copy), v7 (ref)
        if l_lookData_0 then
            local v226 = v7.List.map(if l_lookData_0.assets then l_lookData_0.assets else {}, function(v225) --[[ Line: 888 ]]
                return v225.id;
            end);
            local v228 = v7.List.map(if l_lookData_0.bundles then l_lookData_0.bundles else {}, function(v227) --[[ Line: 891 ]]
                return v227.id;
            end);
            return {
                assetIds = v226, 
                bundleIds = v228
            };
        else
            return {};
        end;
    end, {
        l_lookData_0
    });
    local v230 = nil;
    local v231 = v150.hydratedContent or {
        price = nil
    };
    local v232 = if v150.gridInformation then v150.gridInformation.gridPositionRow else nil;
    local v233 = if v150.gridInformation then v150.gridInformation.gridPositionColumn else nil;
    local v234 = if l_itemType_0 == "Look" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else if l_itemType_0 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
    v230 = v2.useCallback(function(v235) --[[ Line: 916 ]]
        -- upvalues: v153 (copy), v150 (copy), l_itemType_0 (copy), l_lookData_0 (copy), v231 (copy), l_itemId_0 (copy), l_itemData_0 (copy), l_addUnifiedEventLogging_0 (ref), v7 (ref), v232 (copy), v233 (copy), v234 (copy), l_isSelected_0 (copy), l_UnifiedEventLogEnums_0 (ref), v229 (copy), l_FFlagAXCatalogMakeupSupport_0 (ref), l_FFlagAXDurablesSupport_0 (ref), l_getTimedOptionForItemData_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v235 then
            v153.current = v235;
            local v236 = nil;
            local v237 = nil;
            local v238 = nil;
            if v150.widgetAnalyticsInfo then
                if l_itemType_0 == "Look" then
                    v236 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v237 = if v150.widgetAnalyticsInfo then v150.widgetAnalyticsInfo.itemId ~= nil else false;
                    v238 = true;
                else
                    v236 = if v231 then v231.price ~= nil else false;
                    v237 = if v150.widgetAnalyticsInfo then v150.widgetAnalyticsInfo.itemId ~= nil else false;
                    v238 = true;
                end;
            elseif v150.isOrganic then
                if l_itemType_0 == "Look" then
                    v236 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v237 = l_itemId_0 ~= nil;
                    v238 = true;
                else
                    if l_itemData_0 then
                        local v239 = true;
                        if l_itemData_0.lowestPrice == nil then
                            v239 = l_itemData_0.priceInRobux ~= nil;
                        end;
                        v236 = v239;
                    else
                        v236 = false;
                    end;
                    v237 = l_itemId_0 ~= nil;
                    if l_itemData_0 then
                        local v240 = true;
                        if l_itemData_0.assetType == nil then
                            v240 = false;
                            if l_itemData_0.bundleType ~= nil then
                                v240 = l_itemData_0.bundleType ~= "AvatarAnimations";
                            end;
                        end;
                        v238 = v240;
                    else
                        v238 = false;
                    end;
                end;
            end;
            if v236 and v237 and v238 then
                l_addUnifiedEventLogging_0(v153, v7.Dictionary.join(v150.widgetAnalyticsInfo or {
                    itemId = l_itemId_0, 
                    assetType = if l_itemData_0 then l_itemData_0.assetType else nil, 
                    bundleType = if l_itemData_0 then l_itemData_0.bundleType else nil, 
                    gridPositionRow = v232, 
                    gridPositionColumn = v233
                }, {
                    itemType = v234, 
                    action = if l_isSelected_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                    category = v150.impressionsCategory, 
                    subcategory = v150.impressionsSubcategory, 
                    taxonomyId = v150.impressionsTaxonomyId, 
                    assetIds = if v150.widgetAnalyticsInfo and v229 then v229.assetIds else nil, 
                    bundleIds = if v150.widgetAnalyticsInfo and v229 then v229.bundleIds else nil, 
                    organicAssetIds = if v150.isOrganic and v229 then v229.assetIds else nil, 
                    organicBundleIds = if v150.isOrganic and v229 then v229.bundleIds else nil, 
                    organicLookType = if l_FFlagAXCatalogMakeupSupport_0 and v150.isOrganic and l_lookData_0 then l_lookData_0.lookType else nil, 
                    widgetLookType = if not (l_FFlagAXCatalogMakeupSupport_0 and l_lookData_0) or v150.isOrganic then nil else l_lookData_0.lookType, 
                    organicItemPrice = if v150.isOrganic then if l_lookData_0 then l_lookData_0.totalPrice else if l_itemData_0 then l_itemData_0.lowestPrice or l_itemData_0.priceInRobux else nil else nil, 
                    widgetItemPrice = if v150.widgetAnalyticsInfo then if l_lookData_0 then l_lookData_0.totalPrice else v231.price else nil, 
                    organicTimedOption = if l_FFlagAXDurablesSupport_0 and v150.isOrganic then l_getTimedOptionForItemData_0(l_itemData_0) else nil, 
                    widgetTimedOption = if not l_FFlagAXDurablesSupport_0 or v150.isOrganic then nil else l_getTimedOptionForItemData_0(l_itemData_0), 
                    widgetAssetType = if not (not l_FFlagAddTypesToWidgetItems_0 or v150.isOrganic) and l_itemData_0 then l_itemData_0.assetType else nil, 
                    widgetBundleType = if not (not l_FFlagAddTypesToWidgetItems_0 or v150.isOrganic) and l_itemData_0 then l_itemData_0.bundleType else nil
                }), {
                    hasDeferredActions = true, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
            end;
        end;
    end, {
        v150.widgetAnalyticsInfo, 
        v150.hydratedContent, 
        l_itemId_0, 
        v234, 
        l_itemData_0, 
        v232, 
        v233, 
        l_isSelected_0, 
        v150.impressionsCategory, 
        v150.impressionsSubcategory, 
        v150.impressionsTaxonomyId, 
        v229, 
        l_lookData_0
    });
    local v241 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        local v243 = v2.useCallback(function() --[[ Line: 1057 ]]
            -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v171 (copy), l_AvatarScreen_0 (ref), v167 (copy), v73 (ref), v160 (copy), v165 (copy), v150 (copy), l_PeekViewState_0 (ref), v59 (ref), v43 (ref), l_itemData_0 (copy), v162 (copy), v166 (copy)
            if l_itemId_0 and l_itemType_0 then
                if l_itemType_0 == l_ItemTypeEnum_0.Look then
                    local v242 = 2;
                    if l_FFlagAXMISEnableMultiShopping_0 and v171 ~= l_AvatarScreen_0.MySharedAvatars then
                        v242 = 1;
                    end;
                    v167(v73(v160, v165, v150.widgetAnalyticsInfo, l_itemId_0, l_PeekViewState_0.Full, v242));
                    return;
                else
                    v167(v59({
                        itemId = l_itemId_0, 
                        itemType = l_itemType_0, 
                        itemSubType = v43.GetItemSubType(l_itemType_0, l_itemData_0), 
                        priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                        catalogAnalytics = v162, 
                        avatarRoute = v166, 
                        navigation = v165, 
                        itemDetailsPeekViewRefs = v150.itemDetailsPeekViewRefs, 
                        resultsListRef = v150.resultsListRef, 
                        widgetInfo = v150.widgetAnalyticsInfo, 
                        showFullWithNoPeekView = true
                    }));
                end;
            end;
        end, {
            v167, 
            l_itemId_0, 
            l_itemType_0, 
            l_itemData_0, 
            v160, 
            v165, 
            v150.widgetAnalyticsInfo, 
            v162, 
            v166, 
            v150.itemDetailsPeekViewRefs, 
            v150.resultsListRef
        });
        v241 = v79({
            onOpenItemDetailsPage = v243, 
            onSelectItem = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_FFlagAXCatalogMakeupSupport_0 then v221 else v214
        }, v230);
    end;
    v2.useEffect(function() --[[ Line: 1115 ]]
        -- upvalues: v154 (copy), v150 (copy), v47 (ref), v46 (ref)
        local l_current_0 = v154.current;
        if l_current_0 and v150.impressionsId then
            l_current_0:SetAttribute(v150.impressionsTag, v150.impressionsId);
            local v245 = v47[v150.impressionsSchema];
            v46.writeItemAttributes(v245, l_current_0, v150);
        end;
    end, {
        v150.impressionsId, 
        v150.impressionsTag, 
        v150.impressionsSchema
    });
    local l_cardStyle_0 = v150.cardStyle;
    local l_tileWidth_0 = v150.tileWidth;
    local l_thumbailAspectRatio_0 = v150.thumbailAspectRatio;
    local v249 = l_itemData_0 and l_itemData_0.name;
    local v250 = l_itemData_0 and (l_itemData_0.lowestPrice or l_itemData_0.priceInRobux) or nil;
    local v251 = l_itemData_0 and l_itemData_0.priceStatus;
    local v252 = nil;
    if l_FFlagAXDurablesSupport_0 and l_itemData_0 and l_itemData_0.timedOptions then
        for _, v254 in l_itemData_0.timedOptions do
            if v254.selected then
                v250 = v254.price;
            end;
        end;
    end;
    if v150.itemType == l_ItemTypeEnum_0.Look then
        v250 = l_lookData_0 and l_lookData_0.totalPrice;
        v249 = l_lookData_0 and l_lookData_0.name;
        if v171 == l_AvatarScreen_0.MySharedAvatars and l_lookData_0 and l_lookData_0.owned then
            v252 = l_lookData_0.moderationStatus;
        end;
    end;
    local v259 = v2.useMemo(function() --[[ Line: 1151 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v150 (copy), l_ItemTypeEnum_0 (ref), v109 (ref), l_lookData_0 (copy), l_itemData_0 (copy)
        if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then
            if v150.isCreatorNameVisible then
                if v150.itemType == l_ItemTypeEnum_0.Look then
                    return (v109(l_lookData_0));
                else
                    local l_l_itemData_0_0 = l_itemData_0;
                    if l_l_itemData_0_0 and l_l_itemData_0_0.creator then
                        local v256 = l_l_itemData_0_0.creator.name or l_l_itemData_0_0.creatorName;
                        if v256 then
                            return {
                                name = v256, 
                                verified = l_l_itemData_0_0.creator.hasVerifiedBadge
                            };
                        end;
                    end;
                    return nil;
                end;
            else
                return nil;
            end;
        elseif v150.creatorNameTileFooterEnabled then
            if v150.itemType == l_ItemTypeEnum_0.Look then
                return (v109(l_lookData_0));
            else
                local l_l_itemData_0_1 = l_itemData_0;
                if l_l_itemData_0_1 and l_l_itemData_0_1.creator then
                    local v258 = l_l_itemData_0_1.creator.name or l_l_itemData_0_1.creatorName;
                    if v258 then
                        return {
                            name = v258, 
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
        v150.itemType, 
        v150.isCreatorNameVisible, 
        v150.creatorNameTileFooterEnabled
    });
    local v260 = if l_FFlagAXDurablesFooter_0 and v179 then v182.timedOptionDays else nil;
    local v262 = v2.useMemo(function() --[[ Line: 1175 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v150 (copy), v251 (copy), v250 (ref), l_FFlagAXDurablesFooter_0 (ref), v260 (copy), v30 (ref)
        local v261 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v150.isPriceVisible then if v251 then {
            type = "text", 
            text = v251
        } else if v250 then {
            type = "price", 
            price = v250 or 0
        } else nil else nil else if v251 then {
            type = "text", 
            text = v251
        } else if v250 then {
            type = "price", 
            price = v250 or 0
        } else nil;
        if l_FFlagAXDurablesFooter_0 and v260 and v261 then
            return {
                type = "multi", 
                contents = {
                    v261, 
                    {
                        type = "timedOption", 
                        icon = v30.Enums.IconName.Clock, 
                        text = v260
                    }
                }
            };
        else
            return v261;
        end;
    end, {
        v150.isPriceVisible, 
        v251, 
        v250, 
        v260
    });
    local v263 = v2.useCallback(function() --[[ Line: 1205 ]]
        -- upvalues: v193 (copy)
        v193(true);
    end, {
        v193
    });
    local v264 = if v157 then nil else if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v197 else v263;
    local v265 = {
        ref = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v241 else v230, 
        animationTabsItemData = if v174.showAnimationTabs then l_itemData_0 else nil, 
        onActivated = if l_FFlagAXCatalogMakeupSupport_0 then v221 else v214, 
        onOverlayButtonActivated = v264, 
        overlayButtonText = if v157 then nil else if l_FFlagAXMISEnableMultiShopping_0 then v182.details else if v150.itemType == l_ItemTypeEnum_0.Look then v182.detailsWithItemsCount else v182.details, 
        thumbnailRef = v154, 
        thumbnailTag = v150.impressionsTag, 
        thumbnailUrl = v194, 
        onThumbnailLoaded = v224, 
        thumbnailRect = v192, 
        priceLineContent = v262, 
        creator = v259, 
        title = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v150.isTitleVisible then v249 else nil else v249
    };
    local v266;
    if v150.itemType == l_ItemTypeEnum_0.Look then
        v266 = nil;
    else
        local v267 = if l_itemData_0 then l_itemData_0.tileRestrictionsMap else nil;
        v266 = if v267 then v267[l_ItemTileEnums_0.Restriction.Limited] and "Limited" or (v267[l_ItemTileEnums_0.Restriction.LimitedUnique] or v267[l_ItemTileEnums_0.Restriction.Collectible]) and "Collectible" or nil else nil;
    end;
    v265.itemType = v266;
    v265.itemInfo = if v150.itemType == l_ItemTypeEnum_0.Look then nil else l_itemData_0 and l_itemData_0.bundleType == v42.BundleTypeIdStrings.DynamicHead and "DynamicHead" or nil;
    v265.itemStatus = if v150.itemType == l_ItemTypeEnum_0.Look then v111(v252) else if v182.statusText then {
        type = "text", 
        text = v182.statusText
    } else v149(l_itemData_0);
    v265.headerAspectRatio = if l_tileWidth_0 then nil else l_thumbailAspectRatio_0;
    v265.headerSize = if l_tileWidth_0 then UDim2.fromOffset(l_tileWidth_0, l_tileWidth_0 / (l_thumbailAspectRatio_0 or 1)) else nil;
    v265.isSelected = l_isSelected_0;
    v265.backgroundLayers = if l_FFlagAXLookAndFeelBackgrounds_0 and l_cardStyle_0 then l_cardStyle_0.backgroundLayers else nil;
    v265.inputBindings = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then nil else v222;
    return v265;
end;