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
local v40 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookFromTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v42 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v43 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v44 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v45 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v46 = require(l_Modules_0.AvatarExperience.Common.WidgetConstants);
local v47 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local v48 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v49 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v50 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v51 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v52 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v54 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local l_selectEquippedLayeredMakeupAssets_0 = v10.State.Selectors.selectEquippedLayeredMakeupAssets;
local v56 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v57 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v59 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v60 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local v61 = require(l_Modules_0.AvatarExperience.Catalog.Actions.SetTryOnManagerPeekViewState);
local v62 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v63 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v64 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v65 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v66 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v67 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local v68 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v69 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullViewTable);
local l_getTryOnItemReducerKey_0 = v10.Utils.getTryOnItemReducerKey;
local l_ItemTypeEnum_0 = v10.Enums.ItemTypeEnum;
local l_CatalogItemCardStatusIconTypeEnum_0 = v10.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v10.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v10.Constants.MAX_MAKEUP_LAYERS;
local v75 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v76 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenLookDetailsFromButton);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local v79 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local _ = require(script.Parent.CatalogItemCard);
local v81 = require(script.Parent.useCatalogItemCardFocusNavigationBindings);
local v82 = require(script.Parent.useCatalogItemCardFtux);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 = v32.FFlagAXCatalogItemCardSelectedOverlayButtonLogging;
local l_FFlagAXDurablesSupport_0 = v32.FFlagAXDurablesSupport;
local l_FFlagAXDurablesSupportForPermanent_0 = v32.FFlagAXDurablesSupportForPermanent;
local l_FFlagAXMISEnableMultiShopping_0 = v32.FFlagAXMISEnableMultiShopping;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v32.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXCatalogMakeupSupport_0 = v32.FFlagAXCatalogMakeupSupport;
local v90 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_FFlagAXCatalogCategoriesStore_0 = v32.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDurablesFooter_0 = v32.FFlagAXDurablesFooter;
local l_FFlagAXWearTimeSupport_0 = v35.FFlagAXWearTimeSupport;
local l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 = v13.Constants.LOOKS_IMAGE_OFFSET_MULTIPLIERS;
local l_LOOKS_IMAGE_ZOOM_0 = v13.Constants.LOOKS_IMAGE_ZOOM;
local v96 = {
    toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning", 
    isLocalized = false, 
    toastType = v51.InformationMessage
};
local function _(v97) --[[ Line: 132 ]] --[[ Name: isBodyBundle ]]
    -- upvalues: v44 (copy)
    if v97 then
        return v97.bundleType == v44.BundleTypeIdStrings.BodyParts;
    else
        return false;
    end;
end;
local function _(v99) --[[ Line: 136 ]] --[[ Name: getItemTypeFromItemData ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local v100 = if v99 then v99.tileRestrictionsMap else nil;
    if v100 then
        if v100[l_ItemTileEnums_0.Restriction.Limited] then
            return "Limited";
        elseif v100[l_ItemTileEnums_0.Restriction.LimitedUnique] or v100[l_ItemTileEnums_0.Restriction.Collectible] then
            return "Collectible";
        end;
    end;
    return nil;
end;
local function _(v102) --[[ Line: 152 ]] --[[ Name: getItemInfoFromItemData ]]
    -- upvalues: v44 (copy)
    if v102 and v102.bundleType == v44.BundleTypeIdStrings.DynamicHead then
        return "DynamicHead";
    else
        return nil;
    end;
end;
local _ = function(v104) --[[ Line: 159 ]] --[[ Name: getTimedOptionDays ]]
    for _, v106 in v104 do
        if v106.selected and v106.days > 0 then
            return v106.days;
        end;
    end;
    return nil;
end;
local function _(v108) --[[ Line: 168 ]] --[[ Name: getCreatorFromItemData ]]
    if v108 and v108.creator then
        local v109 = v108.creator.name or v108.creatorName;
        if v109 then
            return {
                name = v109, 
                verified = v108.creator.hasVerifiedBadge
            };
        end;
    end;
    return nil;
end;
local function v112(v111) --[[ Line: 178 ]] --[[ Name: getCreatorFromLookData ]]
    -- upvalues: v37 (copy), v44 (copy)
    if v111 and v111.curator and v111.curator.name and (v37() or v111.curator.name:lower() ~= v44.RobloxCreatorName:lower()) then
        return {
            name = v111.curator.name, 
            verified = if v111 and v111.curator then v111.curator.hasVerifiedBadge else nil
        };
    else
        return nil;
    end;
end;
local function v114(v113) --[[ Line: 197 ]] --[[ Name: getLookStatusFromModerationStatus ]]
    -- upvalues: v44 (copy)
    if v113 == v44.ModerationStatus.PendingModeration then
        return {
            type = "icon", 
            iconType = "PendingModeration"
        };
    elseif v113 == v44.ModerationStatus.Moderated then
        return {
            type = "icon", 
            iconType = "Moderated"
        };
    else
        return nil;
    end;
end;
local function _(v115) --[[ Line: 206 ]] --[[ Name: isValidItemId ]]
    local v116 = false;
    if v115 ~= nil then
        v116 = v115 ~= "0";
    end;
    return v116;
end;
local _ = function(v118, v119) --[[ Line: 212 ]] --[[ Name: isValidThumbnailSize ]]
    -- upvalues: v44 (copy)
    if v119 ~= nil then
        for _, v121 in v44.CatalogThumbnailTypeToSize[v119] do
            if v121 == v118 then
                return true;
            end;
        end;
    end;
    return false;
end;
local v123 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v123 = function(v124) --[[ Line: 229 ]]
        -- upvalues: l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy)
        local v125 = {};
        for _, v127 in v124 do
            if v127.selectedInTryOnManager and v127.itemType and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v127.itemSubType] then
                table.insert(v125, v127);
            end;
        end;
        return v125;
    end;
end;
local function v135(v128, v129, v130) --[[ Line: 243 ]] --[[ Name: cardIsSelectedInTryOnOutfit ]]
    -- upvalues: l_FFlagAXCatalogMakeupSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_getTryOnItemReducerKey_0 (copy)
    if v129 and v128.AvatarExperience.AvatarScene.OutfitTryOn.LookId == v129 then
        return true;
    elseif l_FFlagAXCatalogMakeupSupport_0 and l_FFlagAXMISEnableMultiShopping_0 and v129 and v128.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId == v129 then
        return true;
    else
        local l_TryOnItems_0 = v128.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v132 = v128.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil;
        if v129 and v130 then
            local v133 = l_getTryOnItemReducerKey_0(v129, v130);
            if l_FFlagAXMISEnableMultiShopping_0 then
                return l_TryOnItems_0[v133] ~= nil;
            else
                local v134 = false;
                if l_TryOnItems_0[v133] ~= nil then
                    v134 = v132;
                end;
                return v134;
            end;
        else
            return false;
        end;
    end;
end;
local function v151(v136, v137, v138) --[[ Line: 271 ]] --[[ Name: selectCatalogItemCardState ]]
    -- upvalues: v135 (copy), v54 (copy), v45 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v90 (copy), v43 (copy), v44 (copy), v69 (copy), l_PeekViewState_0 (copy)
    local v139 = v135(v136, v137, v138);
    local l_LastToggledItem_0 = v136.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    local v141 = nil;
    local v142 = nil;
    local v143 = v54(v136.AvatarExperience.Common, v137, v138);
    if v143 then
        local v144, v145 = v45.GetStatus(v143);
        v141 = v144;
        v142 = v145;
    end;
    local v146 = nil;
    v146 = if l_FFlagAXCatalogCategoriesStore_0 then v90.getCatalogSelectionStore().selectedCategoryInfo(false) else v43.getCatalogCategoryInfoFromState(v136);
    local v147 = v139 and v143 and v143.bundleType == v44.BundleTypeIdStrings.Animations;
    local l_PageType_0 = v146.PageType;
    local v149 = v147 and (l_LastToggledItem_0 and l_LastToggledItem_0.itemId == v137 or l_PageType_0 == v44.PageType.Animation or l_PageType_0 == v44.PageType.AllAnimation);
    local l_viewState_0 = v136.AvatarExperience.Common.ItemDetailsPeekView.viewState;
    return {
        itemData = v143, 
        isSelected = v139, 
        statusText = v142, 
        avatarType = v136.AvatarExperience.AvatarEditor.Character.AvatarType, 
        isAvatarR6 = v136.AvatarExperience.AvatarEditor.Character.AvatarType == v44.AvatarType.R6, 
        fullView = v69(v136), 
        showAnimationTabs = v149, 
        isItemDetailsViewStateFull = l_viewState_0 == l_PeekViewState_0.Full
    };
end;
local function v153(v152) --[[ Line: 319 ]]
    return v152.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v157(v154) --[[ Line: 323 ]] --[[ Name: showDurableBadge ]]
    -- upvalues: l_FFlagAXDurablesSupport_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy)
    if not l_FFlagAXDurablesSupport_0 then
        return nil;
    elseif l_FFlagAXDurablesFooter_0 then
        return nil;
    elseif not v154 or not v154.timedOptions then
        return nil;
    else
        for _, v156 in v154.timedOptions do
            if v156.selected then
                return {
                    type = "badge", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
                    text = if l_FFlagAXDurablesSupportForPermanent_0 then if v156.days > 0 then tostring(v156.days) else "" else tostring(v156.days)
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
return function(v158) --[[ Line: 391 ]] --[[ Name: useCatalogItemCardViewModel ]]
    -- upvalues: v2 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), v68 (copy), l_useRoactService_0 (copy), v42 (copy), v57 (copy), v56 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useMultiItemShoppingFtux_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_useMakeupFtux_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v151 (copy), l_useSelector_0 (copy), v6 (copy), v153 (copy), l_selectEquippedLayeredMakeupAssets_0 (copy), l_FFlagAXDurablesFooter_0 (copy), l_useLocalization_0 (copy), v45 (copy), v44 (copy), l_getThumbSizeVectorFromParamString_0 (copy), l_getZoomedSizeAndOffset_0 (copy), l_LOOKS_IMAGE_ZOOM_0 (copy), l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_ItemTypeEnum_0 (copy), v76 (copy), l_AvatarScreen_0 (copy), v79 (copy), v62 (copy), l_FFlagAXWearTimeSupport_0 (copy), v82 (copy), l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 (copy), v67 (copy), v60 (copy), v66 (copy), v52 (copy), v75 (copy), l_PeekViewState_0 (copy), v40 (copy), v61 (copy), l_AddAnalyticsMetadata_0 (copy), v59 (copy), v46 (copy), v63 (copy), v50 (copy), v96 (copy), v65 (copy), v47 (copy), v64 (copy), l_getTryOnItemReducerKey_0 (copy), v123 (ref), l_MAX_MAKEUP_LAYERS_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v3 (copy), v7 (copy), l_addUnifiedEventLogging_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), l_FFlagAXDurablesSupport_0 (copy), l_getTimedOptionForItemData_0 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy), v81 (copy), v49 (copy), v48 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v112 (copy), v31 (copy), l_ItemTileEnums_0 (copy), v114 (copy), v157 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy)
    local v159 = false;
    local v160 = false;
    local v161 = v2.useRef(nil);
    local v162 = v2.useRef(nil);
    local v163 = l_useLastInput_0();
    local v164 = l_useIsSpatial_0();
    local v165 = false;
    if v163 == v21.Input.Directional then
        v165 = not v164;
    end;
    local v166 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v167 = v68();
    local v168 = l_useRoactService_0(v42);
    local v169 = l_useRoactService_0(v57);
    local v170 = l_useRoactService_0(v56);
    local v171 = if l_FFlagAXMISEnableMultiShopping_0 then l_useMultiItemShoppingFtux_0() else nil;
    local v172 = if l_FFlagAXCatalogMakeupSupport_0 then l_useMakeupFtux_0() else nil;
    local v173 = l_useNavigation_0();
    local v174 = l_useAvatarRoute_0();
    local v175 = l_useDispatch_0();
    local l_itemId_0 = v158.itemId;
    local l_itemType_0 = v158.itemType;
    local l_lookData_0 = v158.lookData;
    local v179 = v174 and v174.opaque and v174.opaque.name;
    local v181 = v2.useCallback(function(v180) --[[ Line: 412 ]]
        -- upvalues: v151 (ref), l_itemId_0 (copy), l_itemType_0 (copy)
        return (v151(v180, l_itemId_0, l_itemType_0));
    end, {
        l_itemId_0, 
        l_itemType_0
    });
    local v182 = l_useSelector_0(v181, v6.shallowEqual);
    local v183 = if not not l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(v153) else nil;
    local v184 = if l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(l_selectEquippedLayeredMakeupAssets_0) else nil;
    local v185 = if l_lookData_0 and l_lookData_0.assets then #l_lookData_0.assets else 0;
    local v186 = if l_lookData_0 and l_lookData_0.bundles then #l_lookData_0.bundles else 0;
    local v187;
    if l_FFlagAXDurablesFooter_0 and v182 and v182.itemData and v182.itemData.timedOptions then
        for _, v189 in v182.itemData.timedOptions do
            if v189.selected and v189.days > 0 then
                v187 = v189.days;
                v159 = true;
            end;
            if v159 then
                break;
            end;
        end;
        if not v159 then
            v187 = nil;
        end;
    else
        v187 = nil;
    end;
    v159 = false;
    local v190 = l_useLocalization_0({
        statusText = v182.statusText, 
        details = "Feature.Avatar.Label.DetailsButton", 
        detailsWithItemsCount = {
            "Feature.Avatar.Label.Details"; 
            quantity = v185 + v186
        }, 
        timedOptionDays = if l_FFlagAXDurablesFooter_0 and v187 then {
            "Feature.Durables.TimeRemaining.Days"; 
            number = v187
        } else nil
    });
    local l_isSelected_0 = v182.isSelected;
    local l_itemData_0 = v182.itemData;
    local v193 = l_itemType_0 and v45.GetRbxThumbType(l_itemType_0) or nil;
    local l__150x150_0 = v44.CatalogThumbnailTypeToSize.Asset._150x150;
    if v158.thumbnailSize then
        local l_thumbnailSize_0 = v158.thumbnailSize;
        local v196;
        if v193 ~= nil then
            for _, v198 in v44.CatalogThumbnailTypeToSize[v193] do
                if v198 == l_thumbnailSize_0 then
                    v196 = true;
                    v160 = true;
                end;
                if v160 then
                    break;
                end;
            end;
        end;
        if not v160 then
            v196 = false;
        end;
        v160 = false;
        if v196 then
            l__150x150_0 = v158.thumbnailSize;
        end;
    end;
    local v199 = l_getThumbSizeVectorFromParamString_0(l__150x150_0);
    local v200 = if (if l_itemData_0 then l_itemData_0.bundleType == v44.BundleTypeIdStrings.BodyParts else false) and v199 then l_getZoomedSizeAndOffset_0(v199, l_LOOKS_IMAGE_ZOOM_0, l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0) else nil;
    local v201 = false;
    if l_itemId_0 ~= nil then
        v201 = l_itemId_0 ~= "0";
    end;
    local v202 = if v201 then ("rbxthumb://type=%*&id=%*&%*"):format(v193, l_itemId_0, l__150x150_0) else nil;
    v201 = v2.useCallback(function(v203) --[[ Line: 467 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_ItemTypeEnum_0 (ref), l_lookData_0 (copy), v170 (copy), v174 (copy), v175 (copy), v76 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v179 (copy), l_AvatarScreen_0 (ref), v79 (ref), v173 (copy), v62 (ref), v45 (ref), l_itemData_0 (copy), v158 (copy)
        if l_itemId_0 and l_itemType_0 then
            if l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 then
                l_sendUnifiedEventForDeferredAction_0({
                    action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                    elementName = "CLICK_ITEM_DETAILS"
                });
            end;
            if l_itemType_0 == l_ItemTypeEnum_0.Look then
                local v204 = {
                    lookId = l_lookData_0 and l_lookData_0.id, 
                    valueInRobux = l_lookData_0 and l_lookData_0.totalValue, 
                    catalogAnalytics = v170, 
                    avatarRoute = v174
                };
                v175(v76(v204));
                if l_FFlagAXMISEnableMultiShopping_0 and v179 ~= l_AvatarScreen_0.MySharedAvatars then
                    v175(v79(function() --[[ Line: 486 ]]
                        -- upvalues: v173 (ref), l_AvatarScreen_0 (ref)
                        v173.navigate(l_AvatarScreen_0.LookDetails);
                    end));
                    return;
                end;
            else
                v175(v62({
                    itemId = l_itemId_0, 
                    itemType = l_itemType_0, 
                    itemSubType = v45.GetItemSubType(l_itemType_0, l_itemData_0), 
                    priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                    catalogAnalytics = v170, 
                    avatarRoute = v174, 
                    navigation = v173, 
                    itemDetailsPeekViewRefs = v158.itemDetailsPeekViewRefs, 
                    resultsListRef = v158.resultsListRef, 
                    widgetInfo = v158.widgetAnalyticsInfo, 
                    showFullWithNoPeekView = v203
                }));
            end;
        end;
    end, {
        v175, 
        l_itemId_0, 
        l_itemType_0, 
        v170, 
        v174, 
        v173, 
        v158.itemDetailsPeekViewRefs, 
        v158.resultsListRef, 
        v158.widgetAnalyticsInfo, 
        l_lookData_0, 
        v179
    });
    if l_FFlagAXWearTimeSupport_0 then
        v82({
            isSelected = l_isSelected_0, 
            itemData = l_itemData_0
        });
    end;
    local v205 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        v205 = v2.useCallback(function() --[[ Line: 528 ]]
            -- upvalues: v201 (copy)
            v201(true);
        end, {
            v201
        });
    end;
    local v206 = v2.useCallback(function() --[[ Line: 534 ]]
        -- upvalues: v67 (ref), v165 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v166 (copy), l_itemId_0 (copy), v201 (copy), v175 (copy), v60 (ref), v173 (copy), l_itemType_0 (copy)
        return v175(v60(v173, l_itemId_0, l_itemType_0, function() --[[ Line: 535 ]] --[[ Name: onR15PromptWillClose ]]
            -- upvalues: v67 (ref), v165 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v166 (ref), l_itemId_0 (ref), v201 (ref)
            v67("CatalogItemCard", v165);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v165 then
                v166.captureFocus();
            end;
            if l_itemId_0 then
                v201();
            end;
        end, nil, true));
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v165, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v166, 
        l_itemId_0, 
        v201, 
        v175, 
        v173, 
        l_itemId_0, 
        l_itemType_0
    });
    local v222 = v2.useCallback(function(v207) --[[ Line: 575 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v167 (copy), v161 (copy), v179 (copy), v175 (copy), v66 (ref), v170 (copy), v52 (ref), v173 (copy), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref), v75 (ref), v168 (copy), v158 (copy), l_PeekViewState_0 (ref), v40 (ref), v61 (ref), l_AddAnalyticsMetadata_0 (ref), v59 (ref), v46 (ref), v206 (copy), v45 (ref), l_itemData_0 (copy), v63 (ref), v174 (copy), v182 (copy), v169 (copy), v44 (ref), v50 (ref), v96 (ref), v65 (ref), v47 (ref), v64 (ref)
        if not l_itemId_0 or not l_itemType_0 then
            return;
        elseif l_itemType_0 == l_ItemTypeEnum_0.Look then
            if not l_isSelected_0 then
                if v167 then
                    local v208 = if v161 then v161.current else nil;
                    if v208 ~= nil then
                        v167.setSelectedItemInstance(v208);
                    end;
                end;
                if v179 ~= nil then
                    v175(v66(v170, v179, v52.None));
                end;
                local l_v173_0 = v173;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    l_v173_0 = if v179 == l_AvatarScreen_0.MySharedAvatars then v173 else nil;
                end;
                local v210 = 2;
                if l_FFlagAXMISEnableMultiShopping_0 and v179 ~= l_AvatarScreen_0.MySharedAvatars then
                    v210 = 1;
                end;
                v175(v75(v168, l_v173_0, v158.widgetAnalyticsInfo, l_itemId_0, if l_FFlagAXMISEnableMultiShopping_0 and v179 == l_AvatarScreen_0.MySharedAvatars then l_PeekViewState_0.SuperBrief else nil, v210));
            else
                if v167 then
                    v167.setSelectedItemInstance(nil);
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    v175(v40(l_itemId_0));
                end;
                v175(v61(l_PeekViewState_0.Closed));
            end;
            if v158.isOrganic then
                if not l_isSelected_0 then
                    local l_analyticsContext_0 = v158.analyticsContext;
                    local l_analyticsItemCountPerPage_0 = v158.analyticsItemCountPerPage;
                    local l_index_0 = v158.index;
                    v175(l_AddAnalyticsMetadata_0({
                        selectedItemIndex = l_index_0
                    }));
                    v175(v59(l_analyticsContext_0, v170.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_0, l_analyticsItemCountPerPage_0, false));
                    return;
                end;
            else
                v170.widgetInteractionV2(v158.widgetAnalyticsInfo, if l_isSelected_0 then v46.ActionType.ITEM_DESELECTED else v46.ActionType.ITEM_CLICK);
            end;
            return;
        elseif v206() then
            return;
        else
            local v214 = v45.GetItemSubType(l_itemType_0, l_itemData_0);
            local l_l_isSelected_0_0 = l_isSelected_0;
            if l_FFlagAXMISEnableMultiShopping_0 then
                v175(v61(l_PeekViewState_0.Closed));
            end;
            v175(v63(v168, v170, l_itemType_0, v214, l_itemId_0, true, v174, v173, v158.widgetAnalyticsInfo, nil, if l_FFlagAXMISEnableMultiShopping_0 then v207 else nil));
            if not l_FFlagAXMISEnableMultiShopping_0 and v167 then
                v175(v61(l_PeekViewState_0.Closed));
            end;
            if v167 and l_l_isSelected_0_0 then
                v167.setSelectedItemInstance();
            end;
            if not l_l_isSelected_0_0 then
                if v167 then
                    v167.setSelectedItemInstance(v161.current);
                end;
                if l_isSelected_0 then
                    return;
                elseif v182.fullView[v174.opaque.name] == v52.UIFullView then
                    v175(v66(v169, v174.opaque.name, v52.None));
                end;
            end;
            if l_isSelected_0 then
                return;
            else
                local v216 = l_itemData_0 and l_itemData_0.assetType;
                if v182.isAvatarR6 and v216 ~= v44.AssetTypeIdStrings.HairAccessory and v44.LayeredAssetTypes[v216] ~= nil then
                    v175(v50(v96));
                end;
                if l_itemType_0 == v44.ItemType.Asset and v44.AssetTypeIdToCategory[v214] == v44.AssetCategories.Animation then
                    v175(v65(l_itemId_0, v216));
                end;
                local l_analyticsContext_1 = v158.analyticsContext;
                local l_analyticsItemCountPerPage_1 = v158.analyticsItemCountPerPage;
                local l_index_1 = v158.index;
                local l_adTrackingData_0 = v158.adTrackingData;
                v175(l_AddAnalyticsMetadata_0({
                    selectedItemIndex = l_index_1
                }));
                v175(v59(l_analyticsContext_1, v170.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_1, l_analyticsItemCountPerPage_1, false));
                if v158.widgetAnalyticsInfo then
                    local l_widgetAnalyticsInfo_0 = v158.widgetAnalyticsInfo;
                    v170.widgetInteractionV2(l_widgetAnalyticsInfo_0, v46.ActionType.ITEM_CLICK);
                end;
                if l_adTrackingData_0 then
                    v47.TrackSponsoredItemClick(v168, l_adTrackingData_0);
                end;
                if v182.isItemDetailsViewStateFull then
                    v175(v64(v173));
                end;
                return;
            end;
        end;
    end, {
        v175, 
        l_itemId_0, 
        v206, 
        l_itemData_0, 
        v168, 
        v170, 
        l_itemType_0, 
        v174, 
        v173, 
        v158.widgetAnalyticsInfo, 
        v167, 
        v182.fullView, 
        v182.isAvatarR6, 
        v182.isItemDetailsViewStateFull, 
        v169, 
        v174.opaque.name, 
        v158.analyticsContext, 
        v158.analyticsItemCountPerPage, 
        v158.index, 
        v158.adTrackingData, 
        l_isSelected_0, 
        v179
    });
    local _ = if l_FFlagAXMISEnableMultiShopping_0 then v2.useCallback(function() --[[ Line: 818 ]]
        -- upvalues: l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v179 (copy), l_AvatarScreen_0 (ref), v183 (copy), v171 (copy), v173 (copy), v222 (copy)
        local v223 = l_itemType_0 == l_ItemTypeEnum_0.Look;
        if not l_isSelected_0 and v179 ~= l_AvatarScreen_0.MySharedAvatars and v223 and v183 and next(v183) ~= nil and v171 and v171.shouldShowWearAvatarReplaceAllItemsPrompt() then
            v173.navigate(l_AvatarScreen_0.WearAvatarReplaceAllItemsPrompt, {
                onConfirm = function(v224) --[[ Line: 831 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v171 (ref), v222 (ref)
                    if v224 then
                        v171.hideWearAvatarReplaceAllItemsPrompt();
                    end;
                    v222();
                end
            });
            return;
        else
            v222();
            return;
        end;
    end, {
        l_itemType_0, 
        v222, 
        l_isSelected_0, 
        v183, 
        v171, 
        v179, 
        v173
    }) else nil;
    local v232 = if l_FFlagAXCatalogMakeupSupport_0 then v2.useCallback(function() --[[ Line: 848 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_getTryOnItemReducerKey_0 (ref), v183 (copy), v44 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v123 (ref), l_MAX_MAKEUP_LAYERS_0 (ref), v184 (copy), v172 (copy), l_itemData_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), v173 (copy), l_AvatarScreen_0 (ref), v222 (copy)
        local v226 = nil;
        if l_itemId_0 and l_itemType_0 then
            v226 = l_getTryOnItemReducerKey_0(l_itemId_0, l_itemType_0);
        end;
        local v227 = v183 and not v183[v226] and l_itemType_0 == v44.ItemType.Asset;
        local v228 = if l_FFlagAXMISEnableMultiShopping_0 and v227 and v183 then v123(v183) else nil;
        local v229 = l_FFlagAXMISEnableMultiShopping_0 and v228 and #v228 == l_MAX_MAKEUP_LAYERS_0;
        local v230 = l_FFlagAXMISEnableMultiShopping_0 and v184 and v228 and #v184 + #v228 >= l_MAX_MAKEUP_LAYERS_0;
        if v172 and v172.shouldShowMakeupMax6LayersPrompt() and l_itemData_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_itemData_0.assetType] and v227 and (v184 and #v184 == l_MAX_MAKEUP_LAYERS_0 or v229 or v230) then
            v173.navigate(l_AvatarScreen_0.MakeupMax6LayersPrompt, {
                onConfirm = function(v231) --[[ Line: 884 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v172 (ref), v222 (ref)
                    if v231 then
                        v172.hideMakeupMax6LayersPrompt();
                    end;
                    v222();
                end
            });
            if l_FFlagAXMISEnableMultiShopping_0 then
                v172.incrementSeenMakeupMax6LayersPrompt();
                return;
            end;
        else
            v222();
        end;
    end, {
        v172, 
        v173, 
        v222, 
        l_itemData_0, 
        v184, 
        v183, 
        l_itemId_0, 
        l_itemType_0
    }) else nil;
    local v233 = v2.useMemo(function() --[[ Line: 912 ]]
        -- upvalues: v3 (ref), v201 (copy), v222 (copy)
        return {
            OpenDetails = v3.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 915 ]]
                -- upvalues: v201 (ref)
                v201(true);
            end, {
                key = "Feature.Catalog.Action.OpenDetails"
            }) or nil, 
            Select = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 922 ]]
                -- upvalues: v222 (ref)
                v222();
            end, {
                key = "Feature.Avatar.Action.Select"
            }) or nil
        };
    end, {
        v222, 
        v201
    });
    local v235 = v2.useCallback(function(_) --[[ Line: 930 ]]
        -- upvalues: v158 (copy), l_itemId_0 (copy)
        if v158.onThumbnailLoaded then
            v158.onThumbnailLoaded(l_itemId_0);
        end;
    end, {
        v158.onThumbnailLoaded
    });
    local v240 = v2.useMemo(function() --[[ Line: 936 ]]
        -- upvalues: l_lookData_0 (copy), v7 (ref)
        if l_lookData_0 then
            local v237 = v7.List.map(if l_lookData_0.assets then l_lookData_0.assets else {}, function(v236) --[[ Line: 938 ]]
                return v236.id;
            end);
            local v239 = v7.List.map(if l_lookData_0.bundles then l_lookData_0.bundles else {}, function(v238) --[[ Line: 941 ]]
                return v238.id;
            end);
            return {
                assetIds = v237, 
                bundleIds = v239
            };
        else
            return {};
        end;
    end, {
        l_lookData_0
    });
    local v241 = nil;
    local v242 = v158.hydratedContent or {
        price = nil
    };
    local v243 = if v158.gridInformation then v158.gridInformation.gridPositionRow else nil;
    local v244 = if v158.gridInformation then v158.gridInformation.gridPositionColumn else nil;
    local v245 = if l_itemType_0 == "Look" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else if l_itemType_0 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
    v241 = v2.useCallback(function(v246) --[[ Line: 966 ]]
        -- upvalues: v161 (copy), v158 (copy), l_itemType_0 (copy), l_lookData_0 (copy), v242 (copy), l_itemId_0 (copy), l_itemData_0 (copy), l_addUnifiedEventLogging_0 (ref), v7 (ref), v243 (copy), v244 (copy), v245 (copy), l_isSelected_0 (copy), l_UnifiedEventLogEnums_0 (ref), v240 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), l_UnifiedEventLoggingUtils_0 (ref), l_FFlagAXDurablesSupport_0 (ref), l_getTimedOptionForItemData_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v246 then
            v161.current = v246;
            local v247 = nil;
            local v248 = nil;
            local v249 = nil;
            if v158.widgetAnalyticsInfo then
                if l_itemType_0 == "Look" then
                    v247 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v248 = if v158.widgetAnalyticsInfo then v158.widgetAnalyticsInfo.itemId ~= nil else false;
                    v249 = true;
                else
                    v247 = if v242 then v242.price ~= nil else false;
                    v248 = if v158.widgetAnalyticsInfo then v158.widgetAnalyticsInfo.itemId ~= nil else false;
                    v249 = true;
                end;
            elseif v158.isOrganic then
                if l_itemType_0 == "Look" then
                    v247 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v248 = l_itemId_0 ~= nil;
                    v249 = true;
                else
                    if l_itemData_0 then
                        local v250 = true;
                        if l_itemData_0.lowestPrice == nil then
                            v250 = l_itemData_0.priceInRobux ~= nil;
                        end;
                        v247 = v250;
                    else
                        v247 = false;
                    end;
                    v248 = l_itemId_0 ~= nil;
                    if l_itemData_0 then
                        local v251 = true;
                        if l_itemData_0.assetType == nil then
                            v251 = false;
                            if l_itemData_0.bundleType ~= nil then
                                v251 = l_itemData_0.bundleType ~= "AvatarAnimations";
                            end;
                        end;
                        v249 = v251;
                    else
                        v249 = false;
                    end;
                end;
            end;
            if v247 and v248 and v249 then
                l_addUnifiedEventLogging_0(v161, v7.Dictionary.join(v158.widgetAnalyticsInfo or {
                    itemId = l_itemId_0, 
                    assetType = if l_itemData_0 then l_itemData_0.assetType else nil, 
                    bundleType = if l_itemData_0 then l_itemData_0.bundleType else nil, 
                    gridPositionRow = v243, 
                    gridPositionColumn = v244
                }, {
                    itemType = v245, 
                    action = if l_isSelected_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                    category = v158.impressionsCategory, 
                    subcategory = v158.impressionsSubcategory, 
                    taxonomyId = v158.impressionsTaxonomyId, 
                    assetIds = if v158.widgetAnalyticsInfo and v240 then v240.assetIds else nil, 
                    bundleIds = if v158.widgetAnalyticsInfo and v240 then v240.bundleIds else nil, 
                    organicAssetIds = if v158.isOrganic and v240 then v240.assetIds else nil, 
                    organicBundleIds = if v158.isOrganic and v240 then v240.bundleIds else nil, 
                    organicLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v158.isOrganic and l_lookData_0 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType) else nil, 
                    widgetLookType = if not (l_FFlagAXAddLookTypeEnumForLogging_0 and l_lookData_0) or v158.isOrganic then nil else l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType), 
                    organicItemPrice = if v158.isOrganic then if l_lookData_0 then l_lookData_0.totalPrice else if l_itemData_0 then l_itemData_0.lowestPrice or l_itemData_0.priceInRobux else nil else nil, 
                    widgetItemPrice = if v158.widgetAnalyticsInfo then if l_lookData_0 then l_lookData_0.totalPrice else v242.price else nil, 
                    organicTimedOption = if l_FFlagAXDurablesSupport_0 and v158.isOrganic then l_getTimedOptionForItemData_0(l_itemData_0) else nil, 
                    widgetTimedOption = if not l_FFlagAXDurablesSupport_0 or v158.isOrganic then nil else l_getTimedOptionForItemData_0(l_itemData_0), 
                    widgetAssetType = if not (not l_FFlagAddTypesToWidgetItems_0 or v158.isOrganic) and l_itemData_0 then l_itemData_0.assetType else nil, 
                    widgetBundleType = if not (not l_FFlagAddTypesToWidgetItems_0 or v158.isOrganic) and l_itemData_0 then l_itemData_0.bundleType else nil
                }), {
                    hasDeferredActions = true, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
            end;
        end;
    end, {
        v158.widgetAnalyticsInfo, 
        v158.hydratedContent, 
        l_itemId_0, 
        v245, 
        l_itemData_0, 
        v243, 
        v244, 
        l_isSelected_0, 
        v158.impressionsCategory, 
        v158.impressionsSubcategory, 
        v158.impressionsTaxonomyId, 
        v240, 
        l_lookData_0
    });
    local v252 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        local v254 = v2.useCallback(function() --[[ Line: 1107 ]]
            -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v179 (copy), l_AvatarScreen_0 (ref), v175 (copy), v75 (ref), v168 (copy), v173 (copy), v158 (copy), l_PeekViewState_0 (ref), v62 (ref), v45 (ref), l_itemData_0 (copy), v170 (copy), v174 (copy)
            if l_itemId_0 and l_itemType_0 then
                if l_itemType_0 == l_ItemTypeEnum_0.Look then
                    local v253 = 2;
                    if l_FFlagAXMISEnableMultiShopping_0 and v179 ~= l_AvatarScreen_0.MySharedAvatars then
                        v253 = 1;
                    end;
                    v175(v75(v168, v173, v158.widgetAnalyticsInfo, l_itemId_0, l_PeekViewState_0.Full, v253));
                    return;
                else
                    v175(v62({
                        itemId = l_itemId_0, 
                        itemType = l_itemType_0, 
                        itemSubType = v45.GetItemSubType(l_itemType_0, l_itemData_0), 
                        priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                        catalogAnalytics = v170, 
                        avatarRoute = v174, 
                        navigation = v173, 
                        itemDetailsPeekViewRefs = v158.itemDetailsPeekViewRefs, 
                        resultsListRef = v158.resultsListRef, 
                        widgetInfo = v158.widgetAnalyticsInfo, 
                        showFullWithNoPeekView = true
                    }));
                end;
            end;
        end, {
            v175, 
            l_itemId_0, 
            l_itemType_0, 
            l_itemData_0, 
            v168, 
            v173, 
            v158.widgetAnalyticsInfo, 
            v170, 
            v174, 
            v158.itemDetailsPeekViewRefs, 
            v158.resultsListRef
        });
        v252 = v81({
            onOpenItemDetailsPage = v254, 
            onSelectItem = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_FFlagAXCatalogMakeupSupport_0 then v232 else v222
        }, v241);
    end;
    v2.useEffect(function() --[[ Line: 1165 ]]
        -- upvalues: v162 (copy), v158 (copy), v49 (ref), v48 (ref)
        local l_current_0 = v162.current;
        if l_current_0 and v158.impressionsId then
            l_current_0:SetAttribute(v158.impressionsTag, v158.impressionsId);
            local v256 = v49[v158.impressionsSchema];
            v48.writeItemAttributes(v256, l_current_0, v158);
        end;
    end, {
        v158.impressionsId, 
        v158.impressionsTag, 
        v158.impressionsSchema
    });
    local l_cardStyle_0 = v158.cardStyle;
    local l_tileWidth_0 = v158.tileWidth;
    local l_thumbailAspectRatio_0 = v158.thumbailAspectRatio;
    local v260 = l_itemData_0 and l_itemData_0.name;
    local v261 = l_itemData_0 and (l_itemData_0.lowestPrice or l_itemData_0.priceInRobux) or nil;
    local v262 = l_itemData_0 and l_itemData_0.priceStatus;
    local v263 = nil;
    if l_FFlagAXDurablesSupport_0 and l_itemData_0 and l_itemData_0.timedOptions then
        for _, v265 in l_itemData_0.timedOptions do
            if v265.selected then
                v261 = v265.price;
            end;
        end;
    end;
    if v158.itemType == l_ItemTypeEnum_0.Look then
        v261 = l_lookData_0 and l_lookData_0.totalPrice;
        v260 = l_lookData_0 and l_lookData_0.name;
        if v179 == l_AvatarScreen_0.MySharedAvatars and l_lookData_0 and l_lookData_0.owned then
            v263 = l_lookData_0.moderationStatus;
        end;
    end;
    local v270 = v2.useMemo(function() --[[ Line: 1201 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v158 (copy), l_ItemTypeEnum_0 (ref), v112 (ref), l_lookData_0 (copy), l_itemData_0 (copy)
        if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then
            if v158.isCreatorNameVisible then
                if v158.itemType == l_ItemTypeEnum_0.Look then
                    return (v112(l_lookData_0));
                else
                    local l_l_itemData_0_0 = l_itemData_0;
                    if l_l_itemData_0_0 and l_l_itemData_0_0.creator then
                        local v267 = l_l_itemData_0_0.creator.name or l_l_itemData_0_0.creatorName;
                        if v267 then
                            return {
                                name = v267, 
                                verified = l_l_itemData_0_0.creator.hasVerifiedBadge
                            };
                        end;
                    end;
                    return nil;
                end;
            else
                return nil;
            end;
        elseif v158.creatorNameTileFooterEnabled then
            if v158.itemType == l_ItemTypeEnum_0.Look then
                return (v112(l_lookData_0));
            else
                local l_l_itemData_0_1 = l_itemData_0;
                if l_l_itemData_0_1 and l_l_itemData_0_1.creator then
                    local v269 = l_l_itemData_0_1.creator.name or l_l_itemData_0_1.creatorName;
                    if v269 then
                        return {
                            name = v269, 
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
        v158.itemType, 
        v158.isCreatorNameVisible, 
        v158.creatorNameTileFooterEnabled
    });
    local v271 = if l_FFlagAXDurablesFooter_0 and v187 then v190.timedOptionDays else nil;
    local v273 = v2.useMemo(function() --[[ Line: 1225 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v158 (copy), v262 (copy), v261 (ref), l_FFlagAXDurablesFooter_0 (ref), v271 (copy), v31 (ref)
        local v272 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v158.isPriceVisible then if v262 then {
            type = "text", 
            text = v262
        } else if v261 then {
            type = "price", 
            price = v261 or 0
        } else nil else nil else if v262 then {
            type = "text", 
            text = v262
        } else if v261 then {
            type = "price", 
            price = v261 or 0
        } else nil;
        if l_FFlagAXDurablesFooter_0 and v271 and v272 then
            return {
                type = "multi", 
                contents = {
                    v272, 
                    {
                        type = "timedOption", 
                        icon = v31.Enums.IconName.Clock, 
                        text = v271
                    }
                }
            };
        else
            return v272;
        end;
    end, {
        v158.isPriceVisible, 
        v262, 
        v261, 
        v271
    });
    local v274 = v2.useCallback(function() --[[ Line: 1255 ]]
        -- upvalues: v201 (copy)
        v201(true);
    end, {
        v201
    });
    local v275 = if v165 then nil else if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v205 else v274;
    local v276 = {
        ref = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v252 else v241, 
        animationTabsItemData = if v182.showAnimationTabs then l_itemData_0 else nil, 
        onActivated = if l_FFlagAXCatalogMakeupSupport_0 then v232 else v222, 
        onOverlayButtonActivated = v275, 
        overlayButtonText = if v165 then nil else if l_FFlagAXMISEnableMultiShopping_0 then v190.details else if v158.itemType == l_ItemTypeEnum_0.Look then v190.detailsWithItemsCount else v190.details, 
        thumbnailRef = v162, 
        thumbnailTag = v158.impressionsTag, 
        thumbnailUrl = v202, 
        onThumbnailLoaded = v235, 
        thumbnailRect = v200, 
        priceLineContent = v273, 
        creator = v270, 
        title = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v158.isTitleVisible then v260 else nil else v260
    };
    local v277;
    if v158.itemType == l_ItemTypeEnum_0.Look then
        v277 = nil;
    else
        local v278 = if l_itemData_0 then l_itemData_0.tileRestrictionsMap else nil;
        v277 = if v278 then v278[l_ItemTileEnums_0.Restriction.Limited] and "Limited" or (v278[l_ItemTileEnums_0.Restriction.LimitedUnique] or v278[l_ItemTileEnums_0.Restriction.Collectible]) and "Collectible" or nil else nil;
    end;
    v276.itemType = v277;
    v276.itemInfo = if v158.itemType == l_ItemTypeEnum_0.Look then nil else l_itemData_0 and l_itemData_0.bundleType == v44.BundleTypeIdStrings.DynamicHead and "DynamicHead" or nil;
    v276.itemStatus = if v158.itemType == l_ItemTypeEnum_0.Look then v114(v263) else if v190.statusText then {
        type = "text", 
        text = v190.statusText
    } else v157(l_itemData_0);
    v276.headerAspectRatio = if l_tileWidth_0 then nil else l_thumbailAspectRatio_0;
    v276.headerSize = if l_tileWidth_0 then UDim2.fromOffset(l_tileWidth_0, l_tileWidth_0 / (l_thumbailAspectRatio_0 or 1)) else nil;
    v276.isSelected = l_isSelected_0;
    v276.backgroundLayers = if l_FFlagAXLookAndFeelBackgrounds_0 and l_cardStyle_0 then l_cardStyle_0.backgroundLayers else nil;
    v276.inputBindings = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then nil else v233;
    return v276;
end;