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
local l_AddAnalyticsMetadata_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux).Actions.AddAnalyticsMetadata;
local l_SetLastToggledLookType_0 = v13.State.Actions.SetLastToggledLookType;
local v41 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookFromTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v43 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v44 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v45 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v47 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v48 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v50 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v51 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v52 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v53 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v55 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local l_selectEquippedLayeredMakeupAssets_0 = v10.State.Selectors.selectEquippedLayeredMakeupAssets;
local v57 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v58 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v60 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v61 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local v62 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v63 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v64 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v65 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v66 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v67 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v68 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v69 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v70 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullViewTable);
local l_getTryOnItemReducerKey_0 = v10.Utils.getTryOnItemReducerKey;
local l_ItemTypeEnum_0 = v10.Enums.ItemTypeEnum;
local l_CatalogItemCardStatusIconTypeEnum_0 = v10.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v10.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v10.Constants.MAX_MAKEUP_LAYERS;
local v76 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v77 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenLookDetailsFromButton);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local v80 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local _ = require(script.Parent.CatalogItemCard);
local v82 = require(script.Parent.useCatalogItemCardFocusNavigationBindings);
local v83 = require(script.Parent.useCatalogItemCardFtux);
local v84 = require(script.Parent.getItemCardStatus);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 = v32.FFlagAXCatalogItemCardSelectedOverlayButtonLogging;
local l_FFlagAXDurablesSupport_0 = v32.FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportForPermanent_0 = v32.FFlagAXDurablesSupportForPermanent;
local l_FFlagAXMISEnableMultiShopping_0 = v32.FFlagAXMISEnableMultiShopping;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v32.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXCatalogMakeupSupport_0 = v32.FFlagAXCatalogMakeupSupport;
local v92 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_FFlagAXCatalogCategoriesStore_0 = v32.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDurablesFooter_0 = v32.FFlagAXDurablesFooter;
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v32.FFlagAXInventoryDurablesExpiredFilter;
local l_FFlagAXWearTimeSupport_0 = v35.FFlagAXWearTimeSupport;
local l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 = v13.Constants.LOOKS_IMAGE_OFFSET_MULTIPLIERS;
local l_LOOKS_IMAGE_ZOOM_0 = v13.Constants.LOOKS_IMAGE_ZOOM;
local v99 = {
    toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning", 
    isLocalized = false, 
    toastType = v52.InformationMessage
};
local function _(v100) --[[ Line: 135 ]] --[[ Name: isBodyBundle ]]
    -- upvalues: v45 (copy)
    if v100 then
        return v100.bundleType == v45.BundleTypeIdStrings.BodyParts;
    else
        return false;
    end;
end;
local function _(v102) --[[ Line: 139 ]] --[[ Name: getItemTypeFromItemData ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local v103 = if v102 then v102.tileRestrictionsMap else nil;
    if v103 then
        if v103[l_ItemTileEnums_0.Restriction.Limited] then
            return "Limited";
        elseif v103[l_ItemTileEnums_0.Restriction.LimitedUnique] or v103[l_ItemTileEnums_0.Restriction.Collectible] then
            return "Collectible";
        end;
    end;
    return nil;
end;
local function _(v105) --[[ Line: 155 ]] --[[ Name: getItemInfoFromItemData ]]
    -- upvalues: v45 (copy)
    if v105 and v105.bundleType == v45.BundleTypeIdStrings.DynamicHead then
        return "DynamicHead";
    else
        return nil;
    end;
end;
local _ = function(v107) --[[ Line: 162 ]] --[[ Name: getTimedOptionDays ]]
    for _, v109 in v107 do
        if v109.selected and v109.days > 0 then
            return v109.days;
        end;
    end;
    return nil;
end;
local function _(v111) --[[ Line: 171 ]] --[[ Name: getCreatorFromItemData ]]
    if v111 and v111.creator then
        local v112 = v111.creator.name or v111.creatorName;
        if v112 then
            return {
                name = v112, 
                verified = v111.creator.hasVerifiedBadge
            };
        end;
    end;
    return nil;
end;
local function v115(v114) --[[ Line: 181 ]] --[[ Name: getCreatorFromLookData ]]
    -- upvalues: v37 (copy), v45 (copy)
    if v114 and v114.curator and v114.curator.name and (v37() or v114.curator.name:lower() ~= v45.RobloxCreatorName:lower()) then
        return {
            name = v114.curator.name, 
            verified = if v114 and v114.curator then v114.curator.hasVerifiedBadge else nil
        };
    else
        return nil;
    end;
end;
local function v117(v116) --[[ Line: 200 ]] --[[ Name: getLookStatusFromModerationStatus ]]
    -- upvalues: v45 (copy)
    if v116 == v45.ModerationStatus.PendingModeration then
        return {
            type = "icon", 
            iconType = "PendingModeration"
        };
    elseif v116 == v45.ModerationStatus.Moderated then
        return {
            type = "icon", 
            iconType = "Moderated"
        };
    else
        return nil;
    end;
end;
local function _(v118) --[[ Line: 209 ]] --[[ Name: isValidItemId ]]
    local v119 = false;
    if v118 ~= nil then
        v119 = v118 ~= "0";
    end;
    return v119;
end;
local _ = function(v121, v122) --[[ Line: 215 ]] --[[ Name: isValidThumbnailSize ]]
    -- upvalues: v45 (copy)
    if v122 ~= nil then
        for _, v124 in v45.CatalogThumbnailTypeToSize[v122] do
            if v124 == v121 then
                return true;
            end;
        end;
    end;
    return false;
end;
local v126 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v126 = function(v127) --[[ Line: 232 ]]
        -- upvalues: l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy)
        local v128 = {};
        for _, v130 in v127 do
            if v130.selectedInTryOnManager and v130.itemType and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v130.itemSubType] then
                table.insert(v128, v130);
            end;
        end;
        return v128;
    end;
end;
local function v138(v131, v132, v133) --[[ Line: 246 ]] --[[ Name: cardIsSelectedInTryOnOutfit ]]
    -- upvalues: l_FFlagAXCatalogMakeupSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_getTryOnItemReducerKey_0 (copy)
    if v132 and v131.AvatarExperience.AvatarScene.OutfitTryOn.LookId == v132 then
        return true;
    elseif l_FFlagAXCatalogMakeupSupport_0 and l_FFlagAXMISEnableMultiShopping_0 and v132 and v131.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId == v132 then
        return true;
    else
        local l_TryOnItems_0 = v131.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v135 = v131.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil;
        if v132 and v133 then
            local v136 = l_getTryOnItemReducerKey_0(v132, v133);
            if l_FFlagAXMISEnableMultiShopping_0 then
                return l_TryOnItems_0[v136] ~= nil;
            else
                local v137 = false;
                if l_TryOnItems_0[v136] ~= nil then
                    v137 = v135;
                end;
                return v137;
            end;
        else
            return false;
        end;
    end;
end;
local function v154(v139, v140, v141) --[[ Line: 274 ]] --[[ Name: selectCatalogItemCardState ]]
    -- upvalues: v138 (copy), v55 (copy), v46 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v92 (copy), v44 (copy), v45 (copy), v70 (copy), l_PeekViewState_0 (copy)
    local v142 = v138(v139, v140, v141);
    local l_LastToggledItem_0 = v139.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    local v144 = nil;
    local v145 = nil;
    local v146 = v55(v139.AvatarExperience.Common, v140, v141);
    if v146 then
        local v147, v148 = v46.GetStatus(v146);
        v144 = v147;
        v145 = v148;
    end;
    local v149 = nil;
    v149 = if l_FFlagAXCatalogCategoriesStore_0 then v92.getCatalogSelectionStore().selectedCategoryInfo(false) else v44.getCatalogCategoryInfoFromState(v139);
    local v150 = v142 and v146 and v146.bundleType == v45.BundleTypeIdStrings.Animations;
    local l_PageType_0 = v149.PageType;
    local v152 = v150 and (l_LastToggledItem_0 and l_LastToggledItem_0.itemId == v140 or l_PageType_0 == v45.PageType.Animation or l_PageType_0 == v45.PageType.AllAnimation);
    local l_viewState_0 = v139.AvatarExperience.Common.ItemDetailsPeekView.viewState;
    return {
        itemData = v146, 
        isSelected = v142, 
        statusText = v145, 
        avatarType = v139.AvatarExperience.AvatarEditor.Character.AvatarType, 
        isAvatarR6 = v139.AvatarExperience.AvatarEditor.Character.AvatarType == v45.AvatarType.R6, 
        fullView = v70(v139), 
        showAnimationTabs = v152, 
        isItemDetailsViewStateFull = l_viewState_0 == l_PeekViewState_0.Full
    };
end;
local function v156(v155) --[[ Line: 322 ]]
    return v155.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v160(v157) --[[ Line: 326 ]] --[[ Name: showDurableBadge ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy)
    if not l_FFlagAXDurablesSupport_0 then
        return nil;
    elseif l_FFlagAXDurablesFooter_0 then
        return nil;
    elseif not v157 or not v157.timedOptions then
        return nil;
    else
        for _, v159 in v157.timedOptions do
            if v159.selected then
                return {
                    type = "badge", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
                    text = if l_FFlagAXDurablesSupportForPermanent_0 then if v159.days > 0 then tostring(v159.days) else "" else tostring(v159.days)
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
return function(v161) --[[ Line: 395 ]] --[[ Name: useCatalogItemCardViewModel ]]
    -- upvalues: v2 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v69 (copy), l_useRoactService_0 (copy), v43 (copy), v58 (copy), v57 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useMultiItemShoppingFtux_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_useMakeupFtux_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v154 (copy), l_useSelector_0 (copy), v6 (copy), v156 (copy), l_selectEquippedLayeredMakeupAssets_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_useLocalization_0 (copy), v46 (copy), v45 (copy), l_getThumbSizeVectorFromParamString_0 (copy), l_getZoomedSizeAndOffset_0 (copy), l_LOOKS_IMAGE_ZOOM_0 (copy), l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_ItemTypeEnum_0 (copy), v77 (copy), l_AvatarScreen_0 (copy), l_SetLastToggledLookType_0 (copy), v80 (copy), v63 (copy), l_FFlagAXWearTimeSupport_0 (copy), v83 (copy), l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 (copy), v68 (copy), v61 (copy), v67 (copy), v53 (copy), v76 (copy), l_PeekViewState_0 (copy), v41 (copy), v62 (copy), l_AddAnalyticsMetadata_0 (copy), v60 (copy), v47 (copy), v64 (copy), v51 (copy), v99 (copy), v66 (copy), v48 (copy), v65 (copy), l_getTryOnItemReducerKey_0 (copy), v126 (ref), l_MAX_MAKEUP_LAYERS_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v3 (copy), v7 (copy), l_addUnifiedEventLogging_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_getTimedOptionForItemData_0 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy), v82 (copy), v50 (copy), v49 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v115 (copy), v31 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v84 (copy), l_ItemTileEnums_0 (copy), v117 (copy), v160 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy)
    local v162 = false;
    local v163 = false;
    local v164 = v2.useRef(nil);
    local v165 = v2.useRef(nil);
    local v166 = l_useLastInput_0();
    local v167 = l_useIsSpatial_0();
    local v168 = false;
    if v166 == v21.Input.Directional then
        v168 = not v167;
    end;
    local v169 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v170 = v69();
    local v171 = l_useRoactService_0(v43);
    local v172 = l_useRoactService_0(v58);
    local v173 = l_useRoactService_0(v57);
    local v174 = if l_FFlagAXMISEnableMultiShopping_0 then l_useMultiItemShoppingFtux_0() else nil;
    local v175 = if l_FFlagAXCatalogMakeupSupport_0 then l_useMakeupFtux_0() else nil;
    local v176 = l_useNavigation_0();
    local v177 = l_useAvatarRoute_0();
    local v178 = l_useDispatch_0();
    local l_itemId_0 = v161.itemId;
    local l_itemType_0 = v161.itemType;
    local l_lookData_0 = v161.lookData;
    local v182 = v177 and v177.opaque and v177.opaque.name;
    local v184 = v2.useCallback(function(v183) --[[ Line: 416 ]]
        -- upvalues: v154 (ref), l_itemId_0 (copy), l_itemType_0 (copy)
        return (v154(v183, l_itemId_0, l_itemType_0));
    end, {
        l_itemId_0, 
        l_itemType_0
    });
    local v185 = l_useSelector_0(v184, v6.shallowEqual);
    local v186 = if not not l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(v156) else nil;
    local v187 = if l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(l_selectEquippedLayeredMakeupAssets_0) else nil;
    local v188 = if l_lookData_0 and l_lookData_0.assets then #l_lookData_0.assets else 0;
    local v189 = if l_lookData_0 and l_lookData_0.bundles then #l_lookData_0.bundles else 0;
    local v190;
    if l_FFlagAXDurablesFooter_0 and v185 and v185.itemData and v185.itemData.timedOptions then
        for _, v192 in v185.itemData.timedOptions do
            if v192.selected and v192.days > 0 then
                v190 = v192.days;
                v162 = true;
            end;
            if v162 then
                break;
            end;
        end;
        if not v162 then
            v190 = nil;
        end;
    else
        v190 = nil;
    end;
    v162 = false;
    local v193 = l_useLocalization_0({
        statusText = v185.statusText, 
        details = "Feature.Avatar.Label.DetailsButton", 
        detailsWithItemsCount = {
            "Feature.Avatar.Label.Details"; 
            quantity = v188 + v189
        }, 
        timedOptionDays = if l_FFlagAXDurablesFooter_0 and v190 then {
            "Feature.Durables.TimeRemaining.Days"; 
            number = v190
        } else nil
    });
    local l_isSelected_0 = v185.isSelected;
    local l_itemData_0 = v185.itemData;
    local v196 = l_itemType_0 and v46.GetRbxThumbType(l_itemType_0) or nil;
    local l__150x150_0 = v45.CatalogThumbnailTypeToSize.Asset._150x150;
    if v161.thumbnailSize then
        local l_thumbnailSize_0 = v161.thumbnailSize;
        local v199;
        if v196 ~= nil then
            for _, v201 in v45.CatalogThumbnailTypeToSize[v196] do
                if v201 == l_thumbnailSize_0 then
                    v199 = true;
                    v163 = true;
                end;
                if v163 then
                    break;
                end;
            end;
        end;
        if not v163 then
            v199 = false;
        end;
        v163 = false;
        if v199 then
            l__150x150_0 = v161.thumbnailSize;
        end;
    end;
    local v202 = l_getThumbSizeVectorFromParamString_0(l__150x150_0);
    local v203 = if (if l_itemData_0 then l_itemData_0.bundleType == v45.BundleTypeIdStrings.BodyParts else false) and v202 then l_getZoomedSizeAndOffset_0(v202, l_LOOKS_IMAGE_ZOOM_0, l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0) else nil;
    local v204 = false;
    if l_itemId_0 ~= nil then
        v204 = l_itemId_0 ~= "0";
    end;
    local v205 = if v204 then ("rbxthumb://type=%*&id=%*&%*"):format(v196, l_itemId_0, l__150x150_0) else nil;
    v204 = v2.useCallback(function(v206) --[[ Line: 471 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_ItemTypeEnum_0 (ref), l_lookData_0 (copy), v173 (copy), v177 (copy), v178 (copy), v77 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v182 (copy), l_AvatarScreen_0 (ref), l_SetLastToggledLookType_0 (ref), v80 (ref), v176 (copy), v63 (ref), v46 (ref), l_itemData_0 (copy), v161 (copy)
        if l_itemId_0 and l_itemType_0 then
            if l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 then
                l_sendUnifiedEventForDeferredAction_0({
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "CLICK_ITEM_DETAILS"
                });
            end;
            if l_itemType_0 == l_ItemTypeEnum_0.Look then
                local v207 = {
                    lookId = l_lookData_0 and l_lookData_0.id, 
                    valueInRobux = l_lookData_0 and l_lookData_0.totalValue, 
                    catalogAnalytics = v173, 
                    avatarRoute = v177
                };
                v178(v77(v207));
                if l_FFlagAXMISEnableMultiShopping_0 and v182 ~= l_AvatarScreen_0.MySharedAvatars then
                    if l_lookData_0 then
                        v178(l_SetLastToggledLookType_0({
                            lastToggledLookType = l_lookData_0.lookType
                        }));
                    end;
                    v178(v80(function() --[[ Line: 496 ]]
                        -- upvalues: v176 (ref), l_AvatarScreen_0 (ref)
                        v176.navigate(l_AvatarScreen_0.LookDetails);
                    end));
                    return;
                end;
            else
                v178(v63({
                    itemId = l_itemId_0, 
                    itemType = l_itemType_0, 
                    itemSubType = v46.GetItemSubType(l_itemType_0, l_itemData_0), 
                    priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                    catalogAnalytics = v173, 
                    avatarRoute = v177, 
                    navigation = v176, 
                    itemDetailsPeekViewRefs = v161.itemDetailsPeekViewRefs, 
                    resultsListRef = v161.resultsListRef, 
                    widgetInfo = v161.widgetAnalyticsInfo, 
                    showFullWithNoPeekView = v206
                }));
            end;
        end;
    end, {
        v178, 
        l_itemId_0, 
        l_itemType_0, 
        v173, 
        v177, 
        v176, 
        v161.itemDetailsPeekViewRefs, 
        v161.resultsListRef, 
        v161.widgetAnalyticsInfo, 
        l_lookData_0, 
        v182
    });
    if l_FFlagAXWearTimeSupport_0 then
        v83({
            isSelected = l_isSelected_0, 
            itemData = l_itemData_0
        });
    end;
    local v208 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        v208 = v2.useCallback(function() --[[ Line: 538 ]]
            -- upvalues: v204 (copy)
            v204(true);
        end, {
            v204
        });
    end;
    local v209 = v2.useCallback(function() --[[ Line: 544 ]]
        -- upvalues: v68 (ref), v168 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v169 (copy), l_itemId_0 (copy), v204 (copy), v178 (copy), v61 (ref), v176 (copy), l_itemType_0 (copy)
        return v178(v61(v176, l_itemId_0, l_itemType_0, function() --[[ Line: 545 ]] --[[ Name: onR15PromptWillClose ]]
            -- upvalues: v68 (ref), v168 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v169 (ref), l_itemId_0 (ref), v204 (ref)
            v68("CatalogItemCard", v168);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v168 then
                v169.captureFocus();
            end;
            if l_itemId_0 then
                v204();
            end;
        end, nil, true));
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v168, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v169, 
        l_itemId_0, 
        v204, 
        v178, 
        v176, 
        l_itemId_0, 
        l_itemType_0
    });
    local v225 = v2.useCallback(function(v210) --[[ Line: 585 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v170 (copy), v164 (copy), v182 (copy), v178 (copy), v67 (ref), v173 (copy), v53 (ref), v176 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref), v76 (ref), v171 (copy), v161 (copy), l_PeekViewState_0 (ref), v41 (ref), v62 (ref), l_AddAnalyticsMetadata_0 (ref), v60 (ref), v47 (ref), v209 (copy), v46 (ref), l_itemData_0 (copy), v64 (ref), v177 (copy), v185 (copy), v172 (copy), v45 (ref), v51 (ref), v99 (ref), v66 (ref), v48 (ref), v65 (ref)
        if not l_itemId_0 or not l_itemType_0 then
            return;
        elseif l_itemType_0 == l_ItemTypeEnum_0.Look then
            if not l_isSelected_0 then
                if v170 then
                    local v211 = if v164 then v164.current else nil;
                    if v211 ~= nil then
                        v170.setSelectedItemInstance(v211);
                    end;
                end;
                if v182 ~= nil then
                    v178(v67(v173, v182, v53.None));
                end;
                local l_v176_0 = v176;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    l_v176_0 = if v182 == l_AvatarScreen_0.MySharedAvatars then v176 else nil;
                end;
                local v213 = 2;
                if l_FFlagAXMISEnableMultiShopping_0 and v182 ~= l_AvatarScreen_0.MySharedAvatars then
                    v213 = 1;
                end;
                v178(v76(v171, l_v176_0, v161.widgetAnalyticsInfo, l_itemId_0, if l_FFlagAXMISEnableMultiShopping_0 then l_PeekViewState_0.SuperBrief else nil, v213));
            else
                if v170 then
                    v170.setSelectedItemInstance(nil);
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    v178(v41(l_itemId_0));
                end;
                v178(v62(l_PeekViewState_0.Closed));
            end;
            if v161.isOrganic then
                if not l_isSelected_0 then
                    local l_analyticsContext_0 = v161.analyticsContext;
                    local l_analyticsItemCountPerPage_0 = v161.analyticsItemCountPerPage;
                    local l_index_0 = v161.index;
                    v178(l_AddAnalyticsMetadata_0({
                        selectedItemIndex = l_index_0
                    }));
                    v178(v60(l_analyticsContext_0, v173.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_0, l_analyticsItemCountPerPage_0, false));
                    return;
                end;
            else
                v173.widgetInteractionV2(v161.widgetAnalyticsInfo, if l_isSelected_0 then v47.ActionType.ITEM_DESELECTED else v47.ActionType.ITEM_CLICK);
            end;
            return;
        elseif v209() then
            return;
        else
            local v217 = v46.GetItemSubType(l_itemType_0, l_itemData_0);
            local l_l_isSelected_0_0 = l_isSelected_0;
            if l_FFlagAXMISEnableMultiShopping_0 then
                v178(v62(l_PeekViewState_0.Closed));
            end;
            v178(v64(v171, v173, l_itemType_0, v217, l_itemId_0, true, v177, v176, v161.widgetAnalyticsInfo, nil, if l_FFlagAXMISEnableMultiShopping_0 then v210 else nil));
            if not l_FFlagAXMISEnableMultiShopping_0 and v170 then
                v178(v62(l_PeekViewState_0.Closed));
            end;
            if v170 and l_l_isSelected_0_0 then
                v170.setSelectedItemInstance();
            end;
            if not l_l_isSelected_0_0 then
                if v170 then
                    v170.setSelectedItemInstance(v164.current);
                end;
                if l_isSelected_0 then
                    return;
                elseif v185.fullView[v177.opaque.name] == v53.UIFullView then
                    v178(v67(v172, v177.opaque.name, v53.None));
                end;
            end;
            if l_isSelected_0 then
                return;
            else
                local v219 = l_itemData_0 and l_itemData_0.assetType;
                if v185.isAvatarR6 and v219 ~= v45.AssetTypeIdStrings.HairAccessory and v45.LayeredAssetTypes[v219] ~= nil then
                    v178(v51(v99));
                end;
                if l_itemType_0 == v45.ItemType.Asset and v45.AssetTypeIdToCategory[v217] == v45.AssetCategories.Animation then
                    v178(v66(l_itemId_0, v219));
                end;
                local l_analyticsContext_1 = v161.analyticsContext;
                local l_analyticsItemCountPerPage_1 = v161.analyticsItemCountPerPage;
                local l_index_1 = v161.index;
                local l_adTrackingData_0 = v161.adTrackingData;
                v178(l_AddAnalyticsMetadata_0({
                    selectedItemIndex = l_index_1
                }));
                v178(v60(l_analyticsContext_1, v173.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_1, l_analyticsItemCountPerPage_1, false));
                if v161.widgetAnalyticsInfo then
                    local l_widgetAnalyticsInfo_0 = v161.widgetAnalyticsInfo;
                    v173.widgetInteractionV2(l_widgetAnalyticsInfo_0, v47.ActionType.ITEM_CLICK);
                end;
                if l_adTrackingData_0 then
                    v48.TrackSponsoredItemClick(v171, l_adTrackingData_0);
                end;
                if v185.isItemDetailsViewStateFull then
                    v178(v65(v176));
                end;
                return;
            end;
        end;
    end, {
        v178, 
        l_itemId_0, 
        v209, 
        l_itemData_0, 
        v171, 
        v173, 
        l_itemType_0, 
        v177, 
        v176, 
        v161.widgetAnalyticsInfo, 
        v170, 
        v185.fullView, 
        v185.isAvatarR6, 
        v185.isItemDetailsViewStateFull, 
        v172, 
        v177.opaque.name, 
        v161.analyticsContext, 
        v161.analyticsItemCountPerPage, 
        v161.index, 
        v161.adTrackingData, 
        l_isSelected_0, 
        v182
    });
    local v228 = if l_FFlagAXMISEnableMultiShopping_0 then v2.useCallback(function() --[[ Line: 825 ]]
        -- upvalues: l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v182 (copy), l_AvatarScreen_0 (ref), v186 (copy), l_lookData_0 (copy), v45 (ref), v174 (copy), v176 (copy), v225 (copy)
        local v226 = l_itemType_0 == l_ItemTypeEnum_0.Look;
        if not l_isSelected_0 and v182 ~= l_AvatarScreen_0.MySharedAvatars and v226 and v186 and next(v186) ~= nil and l_lookData_0 and l_lookData_0.lookType ~= v45.LookType.Makeup and v174 and v174.shouldShowWearAvatarReplaceAllItemsPrompt() then
            v176.navigate(l_AvatarScreen_0.WearAvatarReplaceAllItemsPrompt, {
                onConfirm = function(v227) --[[ Line: 840 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v174 (ref), v225 (ref)
                    if v227 then
                        v174.hideWearAvatarReplaceAllItemsPrompt();
                    end;
                    v225();
                end
            });
            return;
        else
            v225();
            return;
        end;
    end, {
        l_itemType_0, 
        v225, 
        l_isSelected_0, 
        v186, 
        v174, 
        v182, 
        v176, 
        l_lookData_0
    }) else nil;
    local v235 = if l_FFlagAXCatalogMakeupSupport_0 then v2.useCallback(function() --[[ Line: 866 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_getTryOnItemReducerKey_0 (ref), v186 (copy), v45 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v126 (ref), l_MAX_MAKEUP_LAYERS_0 (ref), v187 (copy), v175 (copy), l_itemData_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), v176 (copy), l_AvatarScreen_0 (ref), v225 (copy)
        local v229 = nil;
        if l_itemId_0 and l_itemType_0 then
            v229 = l_getTryOnItemReducerKey_0(l_itemId_0, l_itemType_0);
        end;
        local v230 = v186 and not v186[v229] and l_itemType_0 == v45.ItemType.Asset;
        local v231 = if l_FFlagAXMISEnableMultiShopping_0 and v230 and v186 then v126(v186) else nil;
        local v232 = l_FFlagAXMISEnableMultiShopping_0 and v231 and #v231 == l_MAX_MAKEUP_LAYERS_0;
        local v233 = l_FFlagAXMISEnableMultiShopping_0 and v187 and v231 and #v187 + #v231 >= l_MAX_MAKEUP_LAYERS_0;
        if v175 and v175.shouldShowMakeupMax6LayersPrompt() and l_itemData_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_itemData_0.assetType] and v230 and (v187 and #v187 == l_MAX_MAKEUP_LAYERS_0 or v232 or v233) then
            v176.navigate(l_AvatarScreen_0.MakeupMax6LayersPrompt, {
                onConfirm = function(v234) --[[ Line: 902 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v175 (ref), v225 (ref)
                    if v234 then
                        v175.hideMakeupMax6LayersPrompt();
                    end;
                    v225();
                end
            });
            if l_FFlagAXMISEnableMultiShopping_0 then
                v175.incrementSeenMakeupMax6LayersPrompt();
                return;
            end;
        else
            v225();
        end;
    end, {
        v175, 
        v176, 
        v225, 
        l_itemData_0, 
        v187, 
        v186, 
        l_itemId_0, 
        l_itemType_0
    }) else nil;
    local v236 = v2.useMemo(function() --[[ Line: 930 ]]
        -- upvalues: v3 (ref), v204 (copy), v225 (copy)
        return {
            OpenDetails = v3.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 933 ]]
                -- upvalues: v204 (ref)
                v204(true);
            end, {
                key = "Feature.Catalog.Action.OpenDetails"
            }) or nil, 
            Select = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 940 ]]
                -- upvalues: v225 (ref)
                v225();
            end, {
                key = "Feature.Avatar.Action.Select"
            }) or nil
        };
    end, {
        v225, 
        v204
    });
    local v238 = v2.useCallback(function(_) --[[ Line: 948 ]]
        -- upvalues: v161 (copy), l_itemId_0 (copy)
        if v161.onThumbnailLoaded then
            v161.onThumbnailLoaded(l_itemId_0);
        end;
    end, {
        v161.onThumbnailLoaded
    });
    local v243 = v2.useMemo(function() --[[ Line: 954 ]]
        -- upvalues: l_lookData_0 (copy), v7 (ref)
        if l_lookData_0 then
            local v240 = v7.List.map(if l_lookData_0.assets then l_lookData_0.assets else {}, function(v239) --[[ Line: 956 ]]
                return v239.id;
            end);
            local v242 = v7.List.map(if l_lookData_0.bundles then l_lookData_0.bundles else {}, function(v241) --[[ Line: 959 ]]
                return v241.id;
            end);
            return {
                assetIds = v240, 
                bundleIds = v242
            };
        else
            return {};
        end;
    end, {
        l_lookData_0
    });
    local v244 = nil;
    local v245 = v161.hydratedContent or {
        price = nil
    };
    local v246 = if v161.gridInformation then v161.gridInformation.gridPositionRow else nil;
    local v247 = if v161.gridInformation then v161.gridInformation.gridPositionColumn else nil;
    local v248 = if l_itemType_0 == "Look" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else if l_itemType_0 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
    v244 = v2.useCallback(function(v249) --[[ Line: 984 ]]
        -- upvalues: v164 (copy), v161 (copy), l_itemType_0 (copy), l_lookData_0 (copy), v245 (copy), l_itemId_0 (copy), l_itemData_0 (copy), l_addUnifiedEventLogging_0 (ref), v7 (ref), v246 (copy), v247 (copy), v248 (copy), l_isSelected_0 (copy), l_UnifiedEventLogEnums_0 (ref), v243 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), l_UnifiedEventLoggingUtils_0 (ref), l_FFlagAXDurablesSupport_0 (ref), l_getTimedOptionForItemData_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v249 then
            v164.current = v249;
            local v250 = nil;
            local v251 = nil;
            local v252 = nil;
            if v161.widgetAnalyticsInfo then
                if l_itemType_0 == "Look" then
                    v250 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v251 = if v161.widgetAnalyticsInfo then v161.widgetAnalyticsInfo.itemId ~= nil else false;
                    v252 = true;
                else
                    v250 = if v245 then v245.price ~= nil else false;
                    v251 = if v161.widgetAnalyticsInfo then v161.widgetAnalyticsInfo.itemId ~= nil else false;
                    v252 = true;
                end;
            elseif v161.isOrganic then
                if l_itemType_0 == "Look" then
                    v250 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v251 = l_itemId_0 ~= nil;
                    v252 = true;
                else
                    if l_itemData_0 then
                        local v253 = true;
                        if l_itemData_0.lowestPrice == nil then
                            v253 = l_itemData_0.priceInRobux ~= nil;
                        end;
                        v250 = v253;
                    else
                        v250 = false;
                    end;
                    v251 = l_itemId_0 ~= nil;
                    if l_itemData_0 then
                        local v254 = true;
                        if l_itemData_0.assetType == nil then
                            v254 = false;
                            if l_itemData_0.bundleType ~= nil then
                                v254 = l_itemData_0.bundleType ~= "AvatarAnimations";
                            end;
                        end;
                        v252 = v254;
                    else
                        v252 = false;
                    end;
                end;
            end;
            if v250 and v251 and v252 then
                l_addUnifiedEventLogging_0(v164, v7.Dictionary.join(v161.widgetAnalyticsInfo or {
                    itemId = l_itemId_0, 
                    assetType = if l_itemData_0 then l_itemData_0.assetType else nil, 
                    bundleType = if l_itemData_0 then l_itemData_0.bundleType else nil, 
                    gridPositionRow = v246, 
                    gridPositionColumn = v247
                }, {
                    itemType = v248, 
                    action = if l_isSelected_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                    category = v161.impressionsCategory, 
                    subcategory = v161.impressionsSubcategory, 
                    taxonomyId = v161.impressionsTaxonomyId, 
                    assetIds = if v161.widgetAnalyticsInfo and v243 then v243.assetIds else nil, 
                    bundleIds = if v161.widgetAnalyticsInfo and v243 then v243.bundleIds else nil, 
                    organicAssetIds = if v161.isOrganic and v243 then v243.assetIds else nil, 
                    organicBundleIds = if v161.isOrganic and v243 then v243.bundleIds else nil, 
                    organicLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v161.isOrganic and l_lookData_0 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType) else nil, 
                    widgetLookType = if not (l_FFlagAXAddLookTypeEnumForLogging_0 and l_lookData_0) or v161.isOrganic then nil else l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType), 
                    organicItemPrice = if v161.isOrganic then if l_lookData_0 then l_lookData_0.totalPrice else if l_itemData_0 then l_itemData_0.lowestPrice or l_itemData_0.priceInRobux else nil else nil, 
                    widgetItemPrice = if v161.widgetAnalyticsInfo then if l_lookData_0 then l_lookData_0.totalPrice else v245.price else nil, 
                    organicTimedOption = if l_FFlagAXDurablesSupport_0 and v161.isOrganic then l_getTimedOptionForItemData_0(l_itemData_0) else nil, 
                    widgetTimedOption = if not l_FFlagAXDurablesSupport_0 or v161.isOrganic then nil else l_getTimedOptionForItemData_0(l_itemData_0), 
                    widgetAssetType = if not (not l_FFlagAddTypesToWidgetItems_0 or v161.isOrganic) and l_itemData_0 then l_itemData_0.assetType else nil, 
                    widgetBundleType = if not (not l_FFlagAddTypesToWidgetItems_0 or v161.isOrganic) and l_itemData_0 then l_itemData_0.bundleType else nil
                }), {
                    hasDeferredActions = true, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
            end;
        end;
    end, {
        v161.widgetAnalyticsInfo, 
        v161.hydratedContent, 
        l_itemId_0, 
        v248, 
        l_itemData_0, 
        v246, 
        v247, 
        l_isSelected_0, 
        v161.impressionsCategory, 
        v161.impressionsSubcategory, 
        v161.impressionsTaxonomyId, 
        v243, 
        l_lookData_0
    });
    local v255 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        local v257 = v2.useCallback(function() --[[ Line: 1125 ]]
            -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v182 (copy), l_AvatarScreen_0 (ref), v178 (copy), v76 (ref), v171 (copy), v176 (copy), v161 (copy), l_PeekViewState_0 (ref), v63 (ref), v46 (ref), l_itemData_0 (copy), v173 (copy), v177 (copy)
            if l_itemId_0 and l_itemType_0 then
                if l_itemType_0 == l_ItemTypeEnum_0.Look then
                    local v256 = 2;
                    if l_FFlagAXMISEnableMultiShopping_0 and v182 ~= l_AvatarScreen_0.MySharedAvatars then
                        v256 = 1;
                    end;
                    v178(v76(v171, v176, v161.widgetAnalyticsInfo, l_itemId_0, l_PeekViewState_0.Full, v256));
                    return;
                else
                    v178(v63({
                        itemId = l_itemId_0, 
                        itemType = l_itemType_0, 
                        itemSubType = v46.GetItemSubType(l_itemType_0, l_itemData_0), 
                        priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                        catalogAnalytics = v173, 
                        avatarRoute = v177, 
                        navigation = v176, 
                        itemDetailsPeekViewRefs = v161.itemDetailsPeekViewRefs, 
                        resultsListRef = v161.resultsListRef, 
                        widgetInfo = v161.widgetAnalyticsInfo, 
                        showFullWithNoPeekView = true
                    }));
                end;
            end;
        end, {
            v178, 
            l_itemId_0, 
            l_itemType_0, 
            l_itemData_0, 
            v171, 
            v176, 
            v161.widgetAnalyticsInfo, 
            v173, 
            v177, 
            v161.itemDetailsPeekViewRefs, 
            v161.resultsListRef
        });
        v255 = v82({
            onOpenItemDetailsPage = v257, 
            onSelectItem = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_FFlagAXCatalogMakeupSupport_0 and l_itemType_0 == v45.ItemType.Asset then v235 else if l_FFlagAXMISEnableMultiShopping_0 and l_itemType_0 == l_ItemTypeEnum_0.Look then v228 else v225
        }, v244);
    end;
    v2.useEffect(function() --[[ Line: 1187 ]]
        -- upvalues: v165 (copy), v161 (copy), v50 (ref), v49 (ref)
        local l_current_0 = v165.current;
        if l_current_0 and v161.impressionsId then
            l_current_0:SetAttribute(v161.impressionsTag, v161.impressionsId);
            local v259 = v50[v161.impressionsSchema];
            v49.writeItemAttributes(v259, l_current_0, v161);
        end;
    end, {
        v161.impressionsId, 
        v161.impressionsTag, 
        v161.impressionsSchema
    });
    local l_cardStyle_0 = v161.cardStyle;
    local l_tileWidth_0 = v161.tileWidth;
    local l_thumbailAspectRatio_0 = v161.thumbailAspectRatio;
    local v263 = l_itemData_0 and l_itemData_0.name;
    local v264 = l_itemData_0 and (l_itemData_0.lowestPrice or l_itemData_0.priceInRobux) or nil;
    local v265 = l_itemData_0 and l_itemData_0.priceStatus;
    local v266 = nil;
    if l_FFlagAXDurablesSupport_0 and l_itemData_0 and l_itemData_0.timedOptions then
        for _, v268 in l_itemData_0.timedOptions do
            if v268.selected then
                v264 = v268.price;
            end;
        end;
    end;
    if v161.itemType == l_ItemTypeEnum_0.Look then
        v264 = l_lookData_0 and l_lookData_0.totalPrice;
        v263 = l_lookData_0 and l_lookData_0.name;
        if v182 == l_AvatarScreen_0.MySharedAvatars and l_lookData_0 and l_lookData_0.owned then
            v266 = l_lookData_0.moderationStatus;
        end;
    end;
    local v273 = v2.useMemo(function() --[[ Line: 1223 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v161 (copy), l_ItemTypeEnum_0 (ref), v115 (ref), l_lookData_0 (copy), l_itemData_0 (copy)
        if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then
            if v161.isCreatorNameVisible then
                if v161.itemType == l_ItemTypeEnum_0.Look then
                    return (v115(l_lookData_0));
                else
                    local l_l_itemData_0_0 = l_itemData_0;
                    if l_l_itemData_0_0 and l_l_itemData_0_0.creator then
                        local v270 = l_l_itemData_0_0.creator.name or l_l_itemData_0_0.creatorName;
                        if v270 then
                            return {
                                name = v270, 
                                verified = l_l_itemData_0_0.creator.hasVerifiedBadge
                            };
                        end;
                    end;
                    return nil;
                end;
            else
                return nil;
            end;
        elseif v161.creatorNameTileFooterEnabled then
            if v161.itemType == l_ItemTypeEnum_0.Look then
                return (v115(l_lookData_0));
            else
                local l_l_itemData_0_1 = l_itemData_0;
                if l_l_itemData_0_1 and l_l_itemData_0_1.creator then
                    local v272 = l_l_itemData_0_1.creator.name or l_l_itemData_0_1.creatorName;
                    if v272 then
                        return {
                            name = v272, 
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
        v161.itemType, 
        v161.isCreatorNameVisible, 
        v161.creatorNameTileFooterEnabled
    });
    local v274 = if l_FFlagAXDurablesFooter_0 and v190 then v193.timedOptionDays else nil;
    local v276 = v2.useMemo(function() --[[ Line: 1247 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v161 (copy), v265 (copy), v264 (ref), l_FFlagAXDurablesFooter_0 (ref), v274 (copy), v31 (ref)
        local v275 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v161.isPriceVisible then if v265 then {
            type = "text", 
            text = v265
        } else if v264 then {
            type = "price", 
            price = v264 or 0
        } else nil else nil else if v265 then {
            type = "text", 
            text = v265
        } else if v264 then {
            type = "price", 
            price = v264 or 0
        } else nil;
        if l_FFlagAXDurablesFooter_0 and v274 and v275 then
            return {
                type = "multi", 
                contents = {
                    v275, 
                    {
                        type = "timedOption", 
                        icon = v31.Enums.IconName.Clock, 
                        text = v274
                    }
                }
            };
        else
            return v275;
        end;
    end, {
        v161.isPriceVisible, 
        v265, 
        v264, 
        v274
    });
    local v277 = v2.useCallback(function() --[[ Line: 1277 ]]
        -- upvalues: v204 (copy)
        v204(true);
    end, {
        v204
    });
    local v278 = if v168 then nil else if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v208 else v277;
    local v279 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v84(v161.itemStatusOverride, v161.itemType, v266, v193.statusText, l_itemData_0) else nil;
    local v280 = {
        ref = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v255 else v244, 
        animationTabsItemData = if v185.showAnimationTabs then l_itemData_0 else nil, 
        onActivated = if l_FFlagAXCatalogMakeupSupport_0 and l_itemType_0 == v45.ItemType.Asset then v235 else if l_FFlagAXMISEnableMultiShopping_0 and l_itemType_0 == l_ItemTypeEnum_0.Look then v228 else v225, 
        onOverlayButtonActivated = v278, 
        overlayButtonText = if v168 then nil else if l_FFlagAXMISEnableMultiShopping_0 then v193.details else if v161.itemType == l_ItemTypeEnum_0.Look then v193.detailsWithItemsCount else v193.details, 
        thumbnailRef = v165, 
        thumbnailTag = v161.impressionsTag, 
        thumbnailUrl = v205, 
        onThumbnailLoaded = v238, 
        thumbnailRect = v203, 
        priceLineContent = v276, 
        creator = v273, 
        title = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v161.isTitleVisible then v263 else nil else v263
    };
    local v281;
    if v161.itemType == l_ItemTypeEnum_0.Look then
        v281 = nil;
    else
        local v282 = if l_itemData_0 then l_itemData_0.tileRestrictionsMap else nil;
        v281 = if v282 then v282[l_ItemTileEnums_0.Restriction.Limited] and "Limited" or (v282[l_ItemTileEnums_0.Restriction.LimitedUnique] or v282[l_ItemTileEnums_0.Restriction.Collectible]) and "Collectible" or nil else nil;
    end;
    v280.itemType = v281;
    v280.itemInfo = if v161.itemType == l_ItemTypeEnum_0.Look then nil else l_itemData_0 and l_itemData_0.bundleType == v45.BundleTypeIdStrings.DynamicHead and "DynamicHead" or nil;
    v280.itemStatus = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v279 else if v161.itemType == l_ItemTypeEnum_0.Look then v117(v266) else if v193.statusText then {
        type = "text", 
        text = v193.statusText
    } else v160(l_itemData_0);
    v280.headerAspectRatio = if l_tileWidth_0 then nil else l_thumbailAspectRatio_0;
    v280.headerSize = if l_tileWidth_0 then UDim2.fromOffset(l_tileWidth_0, l_tileWidth_0 / (l_thumbailAspectRatio_0 or 1)) else nil;
    v280.isSelected = l_isSelected_0;
    v280.backgroundLayers = if l_FFlagAXLookAndFeelBackgrounds_0 and l_cardStyle_0 then l_cardStyle_0.backgroundLayers else nil;
    v280.inputBindings = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then nil else v236;
    return v280;
end;