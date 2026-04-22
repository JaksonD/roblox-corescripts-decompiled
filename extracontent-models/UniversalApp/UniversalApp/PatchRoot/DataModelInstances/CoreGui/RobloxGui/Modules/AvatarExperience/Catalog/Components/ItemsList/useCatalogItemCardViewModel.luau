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
local v30 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_useAvatarRoute_0 = v30.AvatarRoute.Hooks.useAvatarRoute;
local v32 = require(l_CorePackages_0.Packages.Foundation);
local v33 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags);
local l_FFlagAXLookAndFeelBackgrounds_0 = v33.FFlagAXLookAndFeelBackgrounds;
local l_FFlagAXCatalogItemCardFooterBackendDriven_0 = v33.FFlagAXCatalogItemCardFooterBackendDriven;
local v36 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 = v36.FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation;
local v38 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagEnableShowRobloxAsLookCreator);
local l_FFlagAddTypesToWidgetItems_0 = v33.FFlagAddTypesToWidgetItems;
local v40 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local l_AddAnalyticsMetadata_0 = v40.Actions.AddAnalyticsMetadata;
local l_SetTryOnManagerPeekViewState_0 = v40.Actions.SetTryOnManagerPeekViewState;
local l_SetLastToggledLookType_0 = v13.State.Actions.SetLastToggledLookType;
local v44 = require(l_Modules_0.AvatarExperience.Common.Actions.RemoveLookFromTryOn);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v46 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v47 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v48 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v49 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local l_WidgetConstants_0 = v13.WidgetConstants;
local v51 = require(l_Modules_0.AvatarExperience.Catalog.Http.WebApi);
local l_ImpressionsUtil_0 = v24.ImpressionsReporter.ImpressionsUtil;
local l_OrganicEventImpressionsSchema_0 = v24.ImpressionsReporter.OrganicEventImpressionsSchema;
local v54 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v55 = require(l_Modules_0.LuaApp.Enum.ToastType);
local l_FullView_0 = v10.Enums.FullView;
local _ = require(l_Modules_0.AvatarExperience.Common.Reducers.OutfitTryOn);
local v58 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local l_selectEquippedLayeredMakeupAssets_0 = v10.State.Selectors.selectEquippedLayeredMakeupAssets;
local v60 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v61 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v63 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.SendDetailedCatalogAnalytics);
local v64 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.MaybePromptForR15Upgrade);
local v65 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v66 = require(l_Modules_0.AvatarExperience.Common.Thunks.ToggleTryOnThunk);
local v67 = require(l_Modules_0.AvatarExperience.Common.Thunks.CloseAllItemDetails);
local v68 = require(l_Modules_0.AvatarExperience.Common.Actions.SetAnimationPreview);
local v69 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_logOnOverlayClosed_0 = v30.Debug.logOnOverlayClosed;
local l_useAdaptiveScrolling_0 = v10.Hooks.useAdaptiveScrolling;
local v72 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsFullViewTable);
local l_getTryOnItemReducerKey_0 = v10.Utils.getTryOnItemReducerKey;
local l_ItemTypeEnum_0 = v10.Enums.ItemTypeEnum;
local l_CatalogItemCardStatusIconTypeEnum_0 = v10.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 = v10.Constants.ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE;
local l_MAX_MAKEUP_LAYERS_0 = v10.Constants.MAX_MAKEUP_LAYERS;
local v78 = require(l_Modules_0.AvatarExperience.Common.Thunks.TryOnLookV2);
local v79 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenLookDetailsFromButton);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_sendUnifiedEventForDeferredAction_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).sendUnifiedEventForDeferredAction;
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local _ = require(script.Parent.CatalogItemCard);
local v84 = require(script.Parent.useCatalogItemCardFocusNavigationBindings);
local v85 = require(script.Parent.useCatalogItemCardFtux);
local v86 = require(script.Parent.getItemCardStatus);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 = v33.FFlagAXCatalogItemCardSelectedOverlayButtonLogging;
local l_FFlagAXDurablesSupportForPermanent_0 = v33.FFlagAXDurablesSupportForPermanent;
local l_FFlagAXMISEnableMultiShopping_0 = v33.FFlagAXMISEnableMultiShopping;
local l_FFlagAXAddLookTypeEnumForLogging_0 = v33.FFlagAXAddLookTypeEnumForLogging;
local l_FFlagAXCatalogMakeupSupport_0 = v33.FFlagAXCatalogMakeupSupport;
local v93 = require(l_Modules_0.AvatarExperience.Catalog.Stores.GetCatalogCategoriesStore);
local l_FFlagAXCatalogCategoriesStore_0 = v33.FFlagAXCatalogCategoriesStore;
local l_FFlagAXDurablesFooter_0 = v33.FFlagAXDurablesFooter;
local v96 = game:DefineFastFlag("AXDurablesFooterWithPermanent", false);
local l_FFlagAXInventoryDurablesExpiredFilter_0 = v33.FFlagAXInventoryDurablesExpiredFilter;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = v33.FFlagAXMISEnableMultiShoppingUnifiedEvents;
local l_FFlagAXWearTimeSupport_0 = v36.FFlagAXWearTimeSupport;
local l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 = v13.Constants.LOOKS_IMAGE_OFFSET_MULTIPLIERS;
local l_LOOKS_IMAGE_ZOOM_0 = v13.Constants.LOOKS_IMAGE_ZOOM;
local v102 = {
    toastMessage = "Feature.Avatar.Label.LayeredClothingR15Warning", 
    isLocalized = false, 
    toastType = v55.InformationMessage
};
local function _(v103) --[[ Line: 135 ]] --[[ Name: isBodyBundle ]]
    -- upvalues: v48 (copy)
    if v103 then
        return v103.bundleType == v48.BundleTypeIdStrings.BodyParts;
    else
        return false;
    end;
end;
local function _(v105) --[[ Line: 139 ]] --[[ Name: getItemTypeFromItemData ]]
    -- upvalues: l_ItemTileEnums_0 (copy)
    local v106 = if v105 then v105.tileRestrictionsMap else nil;
    if v106 then
        if v106[l_ItemTileEnums_0.Restriction.Limited] then
            return "Limited";
        elseif v106[l_ItemTileEnums_0.Restriction.LimitedUnique] or v106[l_ItemTileEnums_0.Restriction.Collectible] then
            return "Collectible";
        end;
    end;
    return nil;
end;
local function _(v108) --[[ Line: 155 ]] --[[ Name: getItemInfoFromItemData ]]
    -- upvalues: v48 (copy)
    if v108 and v108.bundleType == v48.BundleTypeIdStrings.DynamicHead then
        return "DynamicHead";
    else
        return nil;
    end;
end;
local function v113(v110) --[[ Line: 162 ]] --[[ Name: getTimedOptionDays ]]
    -- upvalues: v96 (copy)
    for _, v112 in v110 do
        if v96 then
            if v112.selected then
                return v112.days;
            end;
        elseif v112.selected and v112.days > 0 then
            return v112.days;
        end;
    end;
    if v96 then
        return 0;
    else
        return nil;
    end;
end;
local function _(v114) --[[ Line: 182 ]] --[[ Name: getCreatorFromItemData ]]
    if v114 and v114.creator then
        local v115 = v114.creator.name or v114.creatorName;
        if v115 then
            return {
                name = v115, 
                verified = v114.creator.hasVerifiedBadge
            };
        end;
    end;
    return nil;
end;
local function v118(v117) --[[ Line: 192 ]] --[[ Name: getCreatorFromLookData ]]
    -- upvalues: v38 (copy), v48 (copy)
    if v117 and v117.curator and v117.curator.name and (v38() or v117.curator.name:lower() ~= v48.RobloxCreatorName:lower()) then
        return {
            name = v117.curator.name, 
            verified = if v117 and v117.curator then v117.curator.hasVerifiedBadge else nil
        };
    else
        return nil;
    end;
end;
local function v120(v119) --[[ Line: 211 ]] --[[ Name: getLookStatusFromModerationStatus ]]
    -- upvalues: v48 (copy)
    if v119 == v48.ModerationStatus.PendingModeration then
        return {
            type = "icon", 
            iconType = "PendingModeration"
        };
    elseif v119 == v48.ModerationStatus.Moderated then
        return {
            type = "icon", 
            iconType = "Moderated"
        };
    else
        return nil;
    end;
end;
local function _(v121) --[[ Line: 220 ]] --[[ Name: isValidItemId ]]
    local v122 = false;
    if v121 ~= nil then
        v122 = v121 ~= "0";
    end;
    return v122;
end;
local _ = function(v124, v125) --[[ Line: 226 ]] --[[ Name: isValidThumbnailSize ]]
    -- upvalues: v48 (copy)
    if v125 ~= nil then
        for _, v127 in v48.CatalogThumbnailTypeToSize[v125] do
            if v127 == v124 then
                return true;
            end;
        end;
    end;
    return false;
end;
local v129 = nil;
if l_FFlagAXMISEnableMultiShopping_0 then
    v129 = function(v130) --[[ Line: 243 ]]
        -- upvalues: l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy)
        local v131 = {};
        for _, v133 in v130 do
            if v133.selectedInTryOnManager and v133.itemType and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[v133.itemSubType] then
                table.insert(v131, v133);
            end;
        end;
        return v131;
    end;
end;
local function v141(v134, v135, v136) --[[ Line: 257 ]] --[[ Name: cardIsSelectedInTryOnOutfit ]]
    -- upvalues: l_FFlagAXCatalogMakeupSupport_0 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_getTryOnItemReducerKey_0 (copy)
    if v135 and v134.AvatarExperience.AvatarScene.OutfitTryOn.LookId == v135 then
        return true;
    elseif l_FFlagAXCatalogMakeupSupport_0 and l_FFlagAXMISEnableMultiShopping_0 and v135 and v134.AvatarExperience.AvatarScene.OutfitTryOn.MakeupLookId == v135 then
        return true;
    else
        local l_TryOnItems_0 = v134.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
        local v138 = v134.AvatarExperience.AvatarScene.OutfitTryOn.LookId == nil;
        if v135 and v136 then
            local v139 = l_getTryOnItemReducerKey_0(v135, v136);
            if l_FFlagAXMISEnableMultiShopping_0 then
                return l_TryOnItems_0[v139] ~= nil;
            else
                local v140 = false;
                if l_TryOnItems_0[v139] ~= nil then
                    v140 = v138;
                end;
                return v140;
            end;
        else
            return false;
        end;
    end;
end;
local function v157(v142, v143, v144) --[[ Line: 285 ]] --[[ Name: selectCatalogItemCardState ]]
    -- upvalues: v141 (copy), v58 (copy), v49 (copy), l_FFlagAXCatalogCategoriesStore_0 (copy), v93 (copy), v47 (copy), v48 (copy), v72 (copy), l_PeekViewState_0 (copy)
    local v145 = v141(v142, v143, v144);
    local l_LastToggledItem_0 = v142.AvatarExperience.AvatarScene.OutfitTryOn.LastToggledItem;
    local v147 = nil;
    local v148 = nil;
    local v149 = v58(v142.AvatarExperience.Common, v143, v144);
    if v149 then
        local v150, v151 = v49.GetStatus(v149);
        v147 = v150;
        v148 = v151;
    end;
    local v152 = nil;
    v152 = if l_FFlagAXCatalogCategoriesStore_0 then v93.getCatalogSelectionStore().selectedCategoryInfo(false) else v47.getCatalogCategoryInfoFromState(v142);
    local v153 = v145 and v149 and v149.bundleType == v48.BundleTypeIdStrings.Animations;
    local l_PageType_0 = v152.PageType;
    local v155 = v153 and (l_LastToggledItem_0 and l_LastToggledItem_0.itemId == v143 or l_PageType_0 == v48.PageType.Animation or l_PageType_0 == v48.PageType.AllAnimation);
    local l_viewState_0 = v142.AvatarExperience.Common.ItemDetailsPeekView.viewState;
    return {
        itemData = v149, 
        isSelected = v145, 
        statusText = v148, 
        avatarType = v142.AvatarExperience.AvatarEditor.Character.AvatarType, 
        isAvatarR6 = v142.AvatarExperience.AvatarEditor.Character.AvatarType == v48.AvatarType.R6, 
        fullView = v72(v142), 
        showAnimationTabs = v155, 
        isItemDetailsViewStateFull = l_viewState_0 == l_PeekViewState_0.Full
    };
end;
local function v159(v158) --[[ Line: 333 ]]
    return v158.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems;
end;
local function v163(v160) --[[ Line: 337 ]] --[[ Name: showDurableBadge ]]
    -- upvalues: l_FFlagAXDurablesFooter_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_FFlagAXDurablesSupportForPermanent_0 (copy)
    if l_FFlagAXDurablesFooter_0 then
        return nil;
    elseif not v160 or not v160.timedOptions then
        return nil;
    else
        for _, v162 in v160.timedOptions do
            if v162.selected then
                return {
                    type = "badge", 
                    iconType = l_CatalogItemCardStatusIconTypeEnum_0.Durable, 
                    text = if l_FFlagAXDurablesSupportForPermanent_0 then if v162.days > 0 then tostring(v162.days) else "" else tostring(v162.days)
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
return function(v164) --[[ Line: 402 ]] --[[ Name: useCatalogItemCardViewModel ]]
    -- upvalues: v2 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), v21 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusController_0 (copy), l_useAdaptiveScrolling_0 (copy), l_useRoactService_0 (copy), v46 (copy), v61 (copy), v60 (copy), l_FFlagAXMISEnableMultiShopping_0 (copy), l_useMultiItemShoppingFtux_0 (copy), l_FFlagAXCatalogMakeupSupport_0 (copy), l_useMakeupFtux_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useDispatch_0 (copy), v157 (copy), l_useSelector_0 (copy), v6 (copy), v159 (copy), l_selectEquippedLayeredMakeupAssets_0 (copy), l_FFlagAXDurablesFooter_0 (copy), v113 (copy), l_useLocalization_0 (copy), v49 (copy), v48 (copy), l_getThumbSizeVectorFromParamString_0 (copy), l_getZoomedSizeAndOffset_0 (copy), l_LOOKS_IMAGE_ZOOM_0 (copy), l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_sendUnifiedEventForDeferredAction_0 (copy), l_ItemTypeEnum_0 (copy), v79 (copy), l_AvatarScreen_0 (copy), l_SetLastToggledLookType_0 (copy), l_NavigateWithLock_0 (copy), v65 (copy), l_FFlagAXWearTimeSupport_0 (copy), v85 (copy), l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 (copy), l_logOnOverlayClosed_0 (copy), v64 (copy), v69 (copy), l_FullView_0 (copy), v78 (copy), l_PeekViewState_0 (copy), v44 (copy), l_SetTryOnManagerPeekViewState_0 (copy), l_AddAnalyticsMetadata_0 (copy), v63 (copy), l_WidgetConstants_0 (copy), v66 (copy), v54 (copy), v102 (copy), v68 (copy), v51 (copy), v67 (copy), l_getTryOnItemReducerKey_0 (copy), v129 (ref), l_MAX_MAKEUP_LAYERS_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (copy), v3 (copy), v7 (copy), l_addUnifiedEventLogging_0 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (copy), l_UnifiedEventLoggingUtils_0 (copy), l_getTimedOptionForItemData_0 (copy), l_FFlagAddTypesToWidgetItems_0 (copy), l_UnifiedEventLogConstants_0 (copy), v84 (copy), l_OrganicEventImpressionsSchema_0 (copy), l_ImpressionsUtil_0 (copy), l_FFlagAXCatalogItemCardFooterBackendDriven_0 (copy), v118 (copy), v96 (copy), v32 (copy), l_FFlagAXInventoryDurablesExpiredFilter_0 (copy), v86 (copy), l_ItemTileEnums_0 (copy), v120 (copy), v163 (copy), l_FFlagAXLookAndFeelBackgrounds_0 (copy)
    local v165 = false;
    local v166 = v2.useRef(nil);
    local v167 = v2.useRef(nil);
    local v168 = l_useLastInput_0();
    local v169 = l_useIsSpatial_0();
    local v170 = false;
    if v168 == v21.Input.Directional then
        v170 = not v169;
    end;
    local v171 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_useFocusController_0();
    local v172 = l_useAdaptiveScrolling_0();
    local v173 = l_useRoactService_0(v46);
    local v174 = l_useRoactService_0(v61);
    local v175 = l_useRoactService_0(v60);
    local v176 = if l_FFlagAXMISEnableMultiShopping_0 then l_useMultiItemShoppingFtux_0() else nil;
    local v177 = if l_FFlagAXCatalogMakeupSupport_0 then l_useMakeupFtux_0() else nil;
    local v178 = l_useNavigation_0();
    local v179 = l_useAvatarRoute_0();
    local v180 = l_useDispatch_0();
    local l_itemId_0 = v164.itemId;
    local l_itemType_0 = v164.itemType;
    local l_lookData_0 = v164.lookData;
    local v184 = v179 and v179.opaque and v179.opaque.name;
    local v186 = v2.useCallback(function(v185) --[[ Line: 423 ]]
        -- upvalues: v157 (ref), l_itemId_0 (copy), l_itemType_0 (copy)
        return (v157(v185, l_itemId_0, l_itemType_0));
    end, {
        l_itemId_0, 
        l_itemType_0
    });
    local v187 = l_useSelector_0(v186, v6.shallowEqual);
    local v188 = if not not l_FFlagAXMISEnableMultiShopping_0 or l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(v159) else nil;
    local v189 = if l_FFlagAXCatalogMakeupSupport_0 then l_useSelector_0(l_selectEquippedLayeredMakeupAssets_0) else nil;
    local v190 = if l_lookData_0 and l_lookData_0.assets then #l_lookData_0.assets else 0;
    local v191 = if l_lookData_0 and l_lookData_0.bundles then #l_lookData_0.bundles else 0;
    local v192 = if l_FFlagAXDurablesFooter_0 and v187 and v187.itemData and v187.itemData.timedOptions then v113(v187.itemData.timedOptions) else nil;
    local v193 = l_useLocalization_0({
        statusText = v187.statusText, 
        details = "Feature.Avatar.Label.DetailsButton", 
        detailsWithItemsCount = {
            "Feature.Avatar.Label.Details"; 
            quantity = v190 + v191
        }, 
        timedOptionDays = if l_FFlagAXDurablesFooter_0 and v192 and v192 > 0 then {
            "Feature.Durables.TimeRemaining.Days"; 
            number = v192
        } else nil
    });
    local l_isSelected_0 = v187.isSelected;
    local l_itemData_0 = v187.itemData;
    local v196 = if l_itemType_0 then v49.GetRbxThumbType(l_itemType_0) else nil;
    local l__150x150_0 = v48.CatalogThumbnailTypeToSize.Asset._150x150;
    if v164.thumbnailSize then
        local l_thumbnailSize_0 = v164.thumbnailSize;
        local v199;
        if v196 ~= nil then
            for _, v201 in v48.CatalogThumbnailTypeToSize[v196] do
                if v201 == l_thumbnailSize_0 then
                    v199 = true;
                    v165 = true;
                end;
                if v165 then
                    break;
                end;
            end;
        end;
        if not v165 then
            v199 = false;
        end;
        v165 = false;
        if v199 then
            l__150x150_0 = v164.thumbnailSize;
        end;
    end;
    local v202 = l_getThumbSizeVectorFromParamString_0(l__150x150_0);
    local v203 = if (if l_itemData_0 then l_itemData_0.bundleType == v48.BundleTypeIdStrings.BodyParts else false) and v202 then l_getZoomedSizeAndOffset_0(v202, l_LOOKS_IMAGE_ZOOM_0, l_LOOKS_IMAGE_OFFSET_MULTIPLIERS_0) else nil;
    local v204 = false;
    if l_itemId_0 ~= nil then
        v204 = l_itemId_0 ~= "0";
    end;
    local v205 = if v204 then ("rbxthumb://type=%*&id=%*&%*"):format(v196, l_itemId_0, l__150x150_0) else nil;
    v204 = v2.useCallback(function(v206) --[[ Line: 482 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_UnifiedEventLogEnums_0 (ref), l_sendUnifiedEventForDeferredAction_0 (ref), l_ItemTypeEnum_0 (ref), l_lookData_0 (copy), v175 (copy), v179 (copy), v180 (copy), v79 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v184 (copy), l_AvatarScreen_0 (ref), l_SetLastToggledLookType_0 (ref), l_NavigateWithLock_0 (ref), v178 (copy), v65 (ref), v49 (ref), l_itemData_0 (copy), v164 (copy)
        if l_itemId_0 and l_itemType_0 then
            if l_FFlagAXCatalogItemCardSelectedOverlayButtonLogging_0 then
                if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then
                    local v207 = nil;
                    if l_itemType_0 == "Asset" then
                        v207 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET;
                    elseif l_itemType_0 == "Bundle" then
                        v207 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
                    elseif l_itemType_0 == "Look" then
                        v207 = l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK;
                    end;
                    l_sendUnifiedEventForDeferredAction_0({
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                        elementName = "CLICK_ITEM_DETAILS", 
                        itemId = l_itemId_0, 
                        itemType = v207
                    });
                else
                    l_sendUnifiedEventForDeferredAction_0({
                        action = l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.UI_ELEMENT_CLICK, 
                        elementName = "CLICK_ITEM_DETAILS"
                    });
                end;
            end;
            if l_itemType_0 == l_ItemTypeEnum_0.Look then
                local v208 = {
                    lookId = l_lookData_0 and l_lookData_0.id, 
                    valueInRobux = l_lookData_0 and l_lookData_0.totalValue, 
                    catalogAnalytics = v175, 
                    avatarRoute = v179
                };
                v180(v79(v208));
                if l_FFlagAXMISEnableMultiShopping_0 and v184 ~= l_AvatarScreen_0.MySharedAvatars then
                    if l_lookData_0 then
                        v180(l_SetLastToggledLookType_0({
                            lastToggledLookType = l_lookData_0.lookType
                        }));
                    end;
                    v180(l_NavigateWithLock_0(function() --[[ Line: 525 ]]
                        -- upvalues: v178 (ref), l_AvatarScreen_0 (ref)
                        v178.navigate(l_AvatarScreen_0.LookDetails);
                    end));
                    return;
                end;
            else
                v180(v65({
                    itemId = l_itemId_0, 
                    itemType = l_itemType_0, 
                    itemSubType = v49.GetItemSubType(l_itemType_0, l_itemData_0), 
                    priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                    catalogAnalytics = v175, 
                    avatarRoute = v179, 
                    navigation = v178, 
                    itemDetailsPeekViewRefs = v164.itemDetailsPeekViewRefs, 
                    resultsListRef = v164.resultsListRef, 
                    widgetInfo = v164.widgetAnalyticsInfo, 
                    showFullWithNoPeekView = v206
                }));
            end;
        end;
    end, {
        v180, 
        l_itemId_0, 
        l_itemType_0, 
        v175, 
        v179, 
        v178, 
        v164.itemDetailsPeekViewRefs, 
        v164.resultsListRef, 
        v164.widgetAnalyticsInfo, 
        l_lookData_0, 
        v184
    });
    if l_FFlagAXWearTimeSupport_0 then
        v85({
            isSelected = l_isSelected_0, 
            itemData = l_itemData_0
        });
    end;
    local v209 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        v209 = v2.useCallback(function() --[[ Line: 567 ]]
            -- upvalues: v204 (copy)
            v204(true);
        end, {
            v204
        });
    end;
    local v210 = v2.useCallback(function() --[[ Line: 573 ]]
        -- upvalues: l_logOnOverlayClosed_0 (ref), v170 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v171 (copy), l_itemId_0 (copy), v204 (copy), v180 (copy), v64 (ref), v178 (copy), l_itemType_0 (copy)
        return v180(v64(v178, l_itemId_0, l_itemType_0, function() --[[ Line: 574 ]] --[[ Name: onR15PromptWillClose ]]
            -- upvalues: l_logOnOverlayClosed_0 (ref), v170 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v171 (ref), l_itemId_0 (ref), v204 (ref)
            l_logOnOverlayClosed_0("CatalogItemCard", v170);
            if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v170 then
                v171.captureFocus();
            end;
            if l_itemId_0 then
                v204();
            end;
        end, nil, true));
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v170, 
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v171, 
        l_itemId_0, 
        v204, 
        v180, 
        v178, 
        l_itemId_0, 
        l_itemType_0
    });
    local v225 = v2.useCallback(function(v211) --[[ Line: 614 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v172 (copy), v166 (copy), v184 (copy), v180 (copy), v69 (ref), v175 (copy), l_FullView_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), l_AvatarScreen_0 (ref), v78 (ref), v173 (copy), v178 (copy), v164 (copy), l_PeekViewState_0 (ref), v44 (ref), l_SetTryOnManagerPeekViewState_0 (ref), l_AddAnalyticsMetadata_0 (ref), v63 (ref), l_WidgetConstants_0 (ref), v210 (copy), v49 (ref), l_itemData_0 (copy), v66 (ref), v179 (copy), v187 (copy), v174 (copy), v48 (ref), v54 (ref), v102 (ref), v68 (ref), v51 (ref), v67 (ref)
        if not l_itemId_0 or not l_itemType_0 then
            return;
        elseif l_itemType_0 == l_ItemTypeEnum_0.Look then
            if not l_isSelected_0 then
                if v172 then
                    local v212 = if v166 then v166.current else nil;
                    if v212 ~= nil then
                        v172.setSelectedItemInstance(v212);
                    end;
                end;
                if v184 ~= nil then
                    v180(v69(v175, v184, l_FullView_0.None));
                end;
                local v213 = 2;
                if l_FFlagAXMISEnableMultiShopping_0 and v184 ~= l_AvatarScreen_0.MySharedAvatars then
                    v213 = 1;
                end;
                v180(v78(v173, v178, v164.widgetAnalyticsInfo, l_itemId_0, if l_FFlagAXMISEnableMultiShopping_0 then l_PeekViewState_0.SuperBrief else nil, v213));
            else
                if v172 then
                    v172.setSelectedItemInstance(nil);
                end;
                if l_FFlagAXMISEnableMultiShopping_0 then
                    v180(v44(l_itemId_0));
                end;
                v180(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Closed));
            end;
            if v164.isOrganic then
                if not l_isSelected_0 then
                    local l_analyticsContext_0 = v164.analyticsContext;
                    local l_analyticsItemCountPerPage_0 = v164.analyticsItemCountPerPage;
                    local l_index_0 = v164.index;
                    v180(l_AddAnalyticsMetadata_0({
                        selectedItemIndex = l_index_0
                    }));
                    v180(v63(l_analyticsContext_0, v175.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_0, l_analyticsItemCountPerPage_0, false));
                    return;
                end;
            else
                v175.widgetInteractionV2(v164.widgetAnalyticsInfo, if l_isSelected_0 then l_WidgetConstants_0.ActionType.ITEM_DESELECTED else l_WidgetConstants_0.ActionType.ITEM_CLICK);
            end;
            return;
        elseif v210() then
            return;
        else
            local v217 = v49.GetItemSubType(l_itemType_0, l_itemData_0);
            local l_l_isSelected_0_0 = l_isSelected_0;
            if l_FFlagAXMISEnableMultiShopping_0 then
                v180(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Closed));
            end;
            v180(v66(v173, v175, l_itemType_0, v217, l_itemId_0, true, v179, v178, v164.widgetAnalyticsInfo, nil, if l_FFlagAXMISEnableMultiShopping_0 then v211 else nil));
            if not l_FFlagAXMISEnableMultiShopping_0 and v172 then
                v180(l_SetTryOnManagerPeekViewState_0(l_PeekViewState_0.Closed));
            end;
            if v172 and l_l_isSelected_0_0 then
                v172.setSelectedItemInstance();
            end;
            if not l_l_isSelected_0_0 then
                if v172 then
                    v172.setSelectedItemInstance(v166.current);
                end;
                if l_isSelected_0 then
                    return;
                elseif v187.fullView[v179.opaque.name] == l_FullView_0.UIFullView then
                    v180(v69(v174, v179.opaque.name, l_FullView_0.None));
                end;
            end;
            if l_isSelected_0 then
                return;
            else
                local v219 = l_itemData_0 and l_itemData_0.assetType;
                if v187.isAvatarR6 and v219 ~= v48.AssetTypeIdStrings.HairAccessory and v48.LayeredAssetTypes[v219] ~= nil then
                    v180(v54(v102));
                end;
                if l_itemType_0 == v48.ItemType.Asset and v48.AssetTypeIdToCategory[v217] == v48.AssetCategories.Animation then
                    v180(v68(l_itemId_0, v219));
                end;
                local l_analyticsContext_1 = v164.analyticsContext;
                local l_analyticsItemCountPerPage_1 = v164.analyticsItemCountPerPage;
                local l_index_1 = v164.index;
                local l_adTrackingData_0 = v164.adTrackingData;
                v180(l_AddAnalyticsMetadata_0({
                    selectedItemIndex = l_index_1
                }));
                v180(v63(l_analyticsContext_1, v175.clickCatalogItem, l_itemId_0, l_itemType_0, l_index_1, l_analyticsItemCountPerPage_1, false));
                if v164.widgetAnalyticsInfo then
                    local l_widgetAnalyticsInfo_0 = v164.widgetAnalyticsInfo;
                    v175.widgetInteractionV2(l_widgetAnalyticsInfo_0, l_WidgetConstants_0.ActionType.ITEM_CLICK);
                end;
                if l_adTrackingData_0 then
                    v51.TrackSponsoredItemClick(v173, l_adTrackingData_0);
                end;
                if v187.isItemDetailsViewStateFull then
                    v180(v67(v178));
                end;
                return;
            end;
        end;
    end, {
        v180, 
        l_itemId_0, 
        v210, 
        l_itemData_0, 
        v173, 
        v175, 
        l_itemType_0, 
        v179, 
        v178, 
        v164.widgetAnalyticsInfo, 
        v172, 
        v187.fullView, 
        v187.isAvatarR6, 
        v187.isItemDetailsViewStateFull, 
        v174, 
        v179.opaque.name, 
        v164.analyticsContext, 
        v164.analyticsItemCountPerPage, 
        v164.index, 
        v164.adTrackingData, 
        l_isSelected_0, 
        v184
    });
    local v228 = if l_FFlagAXMISEnableMultiShopping_0 then v2.useCallback(function() --[[ Line: 847 ]]
        -- upvalues: l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_isSelected_0 (copy), v184 (copy), l_AvatarScreen_0 (ref), v188 (copy), l_lookData_0 (copy), v48 (ref), v176 (copy), v178 (copy), v225 (copy)
        local v226 = l_itemType_0 == l_ItemTypeEnum_0.Look;
        if not l_isSelected_0 and v184 ~= l_AvatarScreen_0.MySharedAvatars and v226 and v188 and next(v188) ~= nil and l_lookData_0 and l_lookData_0.lookType ~= v48.LookType.Makeup and v176 and v176.shouldShowWearAvatarReplaceAllItemsPrompt() then
            v178.navigate(l_AvatarScreen_0.WearAvatarReplaceAllItemsPrompt, {
                onConfirm = function(v227) --[[ Line: 862 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v176 (ref), v225 (ref)
                    if v227 then
                        v176.hideWearAvatarReplaceAllItemsPrompt();
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
        v188, 
        v176, 
        v184, 
        v178, 
        l_lookData_0
    }) else nil;
    local v235 = if l_FFlagAXCatalogMakeupSupport_0 then v2.useCallback(function() --[[ Line: 888 ]]
        -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_getTryOnItemReducerKey_0 (ref), v188 (copy), v48 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v129 (ref), l_MAX_MAKEUP_LAYERS_0 (ref), v189 (copy), v177 (copy), l_itemData_0 (copy), l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0 (ref), v178 (copy), l_AvatarScreen_0 (ref), v225 (copy)
        local v229 = nil;
        if l_itemId_0 and l_itemType_0 then
            v229 = l_getTryOnItemReducerKey_0(l_itemId_0, l_itemType_0);
        end;
        local v230 = v188 and not v188[v229] and l_itemType_0 == v48.ItemType.Asset;
        local v231 = if l_FFlagAXMISEnableMultiShopping_0 and v230 and v188 then v129(v188) else nil;
        local v232 = l_FFlagAXMISEnableMultiShopping_0 and v231 and #v231 == l_MAX_MAKEUP_LAYERS_0;
        local v233 = l_FFlagAXMISEnableMultiShopping_0 and v189 and v231 and #v189 + #v231 >= l_MAX_MAKEUP_LAYERS_0;
        if v177 and v177.shouldShowMakeupMax6LayersPrompt() and l_itemData_0 and l_ASSET_TYPE_ID_STRING_TO_MAKEUP_TYPE_0[l_itemData_0.assetType] and v230 and (v189 and #v189 == l_MAX_MAKEUP_LAYERS_0 or v232 or v233) then
            v178.navigate(l_AvatarScreen_0.MakeupMax6LayersPrompt, {
                onConfirm = function(v234) --[[ Line: 924 ]] --[[ Name: onConfirm ]]
                    -- upvalues: v177 (ref), v225 (ref)
                    if v234 then
                        v177.hideMakeupMax6LayersPrompt();
                    end;
                    v225();
                end
            });
            if l_FFlagAXMISEnableMultiShopping_0 then
                v177.incrementSeenMakeupMax6LayersPrompt();
                return;
            end;
        else
            v225();
        end;
    end, {
        v177, 
        v178, 
        v225, 
        l_itemData_0, 
        v189, 
        v188, 
        l_itemId_0, 
        l_itemType_0
    }) else nil;
    local v236 = v2.useMemo(function() --[[ Line: 952 ]]
        -- upvalues: v3 (ref), v204 (copy), v225 (copy)
        return {
            OpenDetails = v3.Input.onBegin(Enum.KeyCode.ButtonL3, function() --[[ Line: 955 ]]
                -- upvalues: v204 (ref)
                v204(true);
            end, {
                key = "Feature.Catalog.Action.OpenDetails"
            }) or nil, 
            Select = v3.Input.onBegin(Enum.KeyCode.ButtonA, function() --[[ Line: 962 ]]
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
    local v238 = v2.useCallback(function(_) --[[ Line: 970 ]]
        -- upvalues: v164 (copy), l_itemId_0 (copy)
        if v164.onThumbnailLoaded then
            v164.onThumbnailLoaded(l_itemId_0);
        end;
    end, {
        v164.onThumbnailLoaded
    });
    local v243 = v2.useMemo(function() --[[ Line: 976 ]]
        -- upvalues: l_lookData_0 (copy), v7 (ref)
        if l_lookData_0 then
            local v240 = v7.List.map(if l_lookData_0.assets then l_lookData_0.assets else {}, function(v239) --[[ Line: 978 ]]
                return v239.id;
            end);
            local v242 = v7.List.map(if l_lookData_0.bundles then l_lookData_0.bundles else {}, function(v241) --[[ Line: 981 ]]
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
    local v245 = v164.hydratedContent or {
        price = nil
    };
    local v246 = if v164.gridInformation then v164.gridInformation.gridPositionRow else nil;
    local v247 = if v164.gridInformation then v164.gridInformation.gridPositionColumn else nil;
    local v248 = if l_itemType_0 == "Look" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.LOOK else if l_itemType_0 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE;
    v244 = v2.useCallback(function(v249) --[[ Line: 1006 ]]
        -- upvalues: v166 (copy), v164 (copy), l_itemType_0 (copy), l_lookData_0 (copy), v245 (copy), l_itemId_0 (copy), l_itemData_0 (copy), l_addUnifiedEventLogging_0 (ref), v7 (ref), v246 (copy), v247 (copy), v248 (copy), l_isSelected_0 (copy), l_UnifiedEventLogEnums_0 (ref), v243 (copy), l_FFlagAXAddLookTypeEnumForLogging_0 (ref), l_UnifiedEventLoggingUtils_0 (ref), l_getTimedOptionForItemData_0 (ref), l_FFlagAddTypesToWidgetItems_0 (ref), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (ref), l_UnifiedEventLogConstants_0 (ref)
        if v249 then
            v166.current = v249;
            local v250 = nil;
            local v251 = nil;
            local v252 = nil;
            if v164.widgetAnalyticsInfo then
                if l_itemType_0 == "Look" then
                    v250 = if l_lookData_0 then l_lookData_0.totalPrice ~= nil else false;
                    v251 = if v164.widgetAnalyticsInfo then v164.widgetAnalyticsInfo.itemId ~= nil else false;
                    v252 = true;
                else
                    v250 = if v245 then v245.price ~= nil else false;
                    v251 = if v164.widgetAnalyticsInfo then v164.widgetAnalyticsInfo.itemId ~= nil else false;
                    v252 = true;
                end;
            elseif v164.isOrganic then
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
                l_addUnifiedEventLogging_0(v166, v7.Dictionary.join(v164.widgetAnalyticsInfo or {
                    itemId = l_itemId_0, 
                    assetType = if l_itemData_0 then l_itemData_0.assetType else nil, 
                    bundleType = if l_itemData_0 then l_itemData_0.bundleType else nil, 
                    gridPositionRow = v246, 
                    gridPositionColumn = v247
                }, {
                    itemType = v248, 
                    action = if l_isSelected_0 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
                    category = v164.impressionsCategory, 
                    subcategory = v164.impressionsSubcategory, 
                    taxonomyId = v164.impressionsTaxonomyId, 
                    assetIds = if v164.widgetAnalyticsInfo and v243 then v243.assetIds else nil, 
                    bundleIds = if v164.widgetAnalyticsInfo and v243 then v243.bundleIds else nil, 
                    organicAssetIds = if v164.isOrganic and v243 then v243.assetIds else nil, 
                    organicBundleIds = if v164.isOrganic and v243 then v243.bundleIds else nil, 
                    organicLookType = if l_FFlagAXAddLookTypeEnumForLogging_0 and v164.isOrganic and l_lookData_0 then l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType) else nil, 
                    widgetLookType = if not (l_FFlagAXAddLookTypeEnumForLogging_0 and l_lookData_0) or v164.isOrganic then nil else l_UnifiedEventLoggingUtils_0.formatLookTypeAttribute(l_lookData_0.lookType), 
                    organicItemPrice = if v164.isOrganic then if l_lookData_0 then l_lookData_0.totalPrice else if l_itemData_0 then l_itemData_0.lowestPrice or l_itemData_0.priceInRobux else nil else nil, 
                    widgetItemPrice = if v164.widgetAnalyticsInfo then if l_lookData_0 then l_lookData_0.totalPrice else v245.price else nil, 
                    organicTimedOption = if v164.isOrganic then l_getTimedOptionForItemData_0(l_itemData_0) else nil, 
                    widgetTimedOption = if not v164.isOrganic then l_getTimedOptionForItemData_0(l_itemData_0) else nil, 
                    widgetAssetType = if not (not l_FFlagAddTypesToWidgetItems_0 or v164.isOrganic) and l_itemData_0 then l_itemData_0.assetType else nil, 
                    widgetBundleType = if not (not l_FFlagAddTypesToWidgetItems_0 or v164.isOrganic) and l_itemData_0 then l_itemData_0.bundleType else nil
                }), {
                    hasDeferredActions = true, 
                    isSelected = if l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 then l_isSelected_0 else nil, 
                    sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
                });
            end;
        end;
    end, {
        v164.widgetAnalyticsInfo, 
        v164.hydratedContent, 
        l_itemId_0, 
        v248, 
        l_itemData_0, 
        v246, 
        v247, 
        l_isSelected_0, 
        v164.impressionsCategory, 
        v164.impressionsSubcategory, 
        v164.impressionsTaxonomyId, 
        v243, 
        l_lookData_0
    });
    local v255 = nil;
    if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then
        local v257 = v2.useCallback(function() --[[ Line: 1146 ]]
            -- upvalues: l_itemId_0 (copy), l_itemType_0 (copy), l_ItemTypeEnum_0 (ref), l_FFlagAXMISEnableMultiShopping_0 (ref), v184 (copy), l_AvatarScreen_0 (ref), v180 (copy), v78 (ref), v173 (copy), v178 (copy), v164 (copy), l_PeekViewState_0 (ref), v65 (ref), v49 (ref), l_itemData_0 (copy), v175 (copy), v179 (copy)
            if l_itemId_0 and l_itemType_0 then
                if l_itemType_0 == l_ItemTypeEnum_0.Look then
                    local v256 = 2;
                    if l_FFlagAXMISEnableMultiShopping_0 and v184 ~= l_AvatarScreen_0.MySharedAvatars then
                        v256 = 1;
                    end;
                    v180(v78(v173, v178, v164.widgetAnalyticsInfo, l_itemId_0, l_PeekViewState_0.Full, v256));
                    return;
                else
                    v180(v65({
                        itemId = l_itemId_0, 
                        itemType = l_itemType_0, 
                        itemSubType = v49.GetItemSubType(l_itemType_0, l_itemData_0), 
                        priceInRobux = if l_itemData_0 then l_itemData_0.priceInRobux else nil, 
                        catalogAnalytics = v175, 
                        avatarRoute = v179, 
                        navigation = v178, 
                        itemDetailsPeekViewRefs = v164.itemDetailsPeekViewRefs, 
                        resultsListRef = v164.resultsListRef, 
                        widgetInfo = v164.widgetAnalyticsInfo, 
                        showFullWithNoPeekView = true
                    }));
                end;
            end;
        end, {
            v180, 
            l_itemId_0, 
            l_itemType_0, 
            l_itemData_0, 
            v173, 
            v178, 
            v164.widgetAnalyticsInfo, 
            v175, 
            v179, 
            v164.itemDetailsPeekViewRefs, 
            v164.resultsListRef
        });
        v255 = v84({
            onOpenItemDetailsPage = v257, 
            onSelectItem = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_FFlagAXCatalogMakeupSupport_0 and l_itemType_0 == v48.ItemType.Asset then v235 else if l_FFlagAXMISEnableMultiShopping_0 and l_itemType_0 == l_ItemTypeEnum_0.Look then v228 else v225
        }, v244);
    end;
    v2.useEffect(function() --[[ Line: 1208 ]]
        -- upvalues: v167 (copy), v164 (copy), l_OrganicEventImpressionsSchema_0 (ref), l_ImpressionsUtil_0 (ref)
        local l_current_0 = v167.current;
        if l_current_0 and v164.impressionsId then
            l_current_0:SetAttribute(v164.impressionsTag, v164.impressionsId);
            local v259 = l_OrganicEventImpressionsSchema_0[v164.impressionsSchema];
            l_ImpressionsUtil_0.writeItemAttributes(v259, l_current_0, v164);
        end;
    end, {
        v164.impressionsId, 
        v164.impressionsTag, 
        v164.impressionsSchema
    });
    local l_cardStyle_0 = v164.cardStyle;
    local l_tileWidth_0 = v164.tileWidth;
    local l_thumbailAspectRatio_0 = v164.thumbailAspectRatio;
    local v263 = l_itemData_0 and l_itemData_0.name;
    local v264 = l_itemData_0 and (l_itemData_0.lowestPrice or l_itemData_0.priceInRobux) or nil;
    local v265 = l_itemData_0 and l_itemData_0.priceStatus;
    local v266 = nil;
    if l_itemData_0 and l_itemData_0.timedOptions then
        for _, v268 in l_itemData_0.timedOptions do
            if v268.selected then
                v264 = v268.price;
            end;
        end;
    end;
    if v164.itemType == l_ItemTypeEnum_0.Look then
        v264 = l_lookData_0 and l_lookData_0.totalPrice;
        v263 = l_lookData_0 and l_lookData_0.name;
        if v184 == l_AvatarScreen_0.MySharedAvatars and l_lookData_0 and l_lookData_0.owned then
            v266 = l_lookData_0.moderationStatus;
        end;
    end;
    local v273 = v2.useMemo(function() --[[ Line: 1244 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v164 (copy), l_ItemTypeEnum_0 (ref), v118 (ref), l_lookData_0 (copy), l_itemData_0 (copy)
        if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then
            if v164.isCreatorNameVisible then
                if v164.itemType == l_ItemTypeEnum_0.Look then
                    return (v118(l_lookData_0));
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
        elseif v164.creatorNameTileFooterEnabled then
            if v164.itemType == l_ItemTypeEnum_0.Look then
                return (v118(l_lookData_0));
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
        v164.itemType, 
        v164.isCreatorNameVisible, 
        v164.creatorNameTileFooterEnabled
    });
    local v274 = if l_FFlagAXDurablesFooter_0 and v192 and v192 > 0 then v193.timedOptionDays else nil;
    local v276 = v2.useMemo(function() --[[ Line: 1272 ]]
        -- upvalues: l_FFlagAXCatalogItemCardFooterBackendDriven_0 (ref), v164 (copy), v265 (copy), v264 (ref), v96 (ref), v192 (copy), v32 (ref), v274 (copy), l_FFlagAXDurablesFooter_0 (ref)
        local v275 = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v164.isPriceVisible then if v265 then {
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
        if v96 and v192 then
            return {
                type = "multi", 
                contents = {
                    v275, 
                    {
                        type = "timedOption", 
                        icon = v32.Enums.IconName.Clock, 
                        text = v274 or ""
                    }
                }
            };
        elseif l_FFlagAXDurablesFooter_0 and v274 and v275 then
            return {
                type = "multi", 
                contents = {
                    v275, 
                    {
                        type = "timedOption", 
                        icon = v32.Enums.IconName.Clock, 
                        text = v274
                    }
                }
            };
        else
            return v275;
        end;
    end, {
        v164.isPriceVisible, 
        v265, 
        v264, 
        v274, 
        v192
    });
    local v277 = v2.useCallback(function() --[[ Line: 1316 ]]
        -- upvalues: v204 (copy)
        v204(true);
    end, {
        v204
    });
    local v278 = if v170 then nil else if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v209 else v277;
    local v279 = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v86(v164.itemStatusOverride, v164.itemType, v266, v193.statusText, l_itemData_0) else nil;
    local v280 = {
        ref = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then v255 else v244, 
        animationTabsItemData = if v187.showAnimationTabs then l_itemData_0 else nil, 
        onActivated = if l_FFlagAXCatalogMakeupSupport_0 and l_itemType_0 == v48.ItemType.Asset then v235 else if l_FFlagAXMISEnableMultiShopping_0 and l_itemType_0 == l_ItemTypeEnum_0.Look then v228 else v225, 
        onOverlayButtonActivated = v278, 
        overlayButtonText = if v170 then nil else if l_FFlagAXMISEnableMultiShopping_0 then v193.details else if v164.itemType == l_ItemTypeEnum_0.Look then v193.detailsWithItemsCount else v193.details, 
        thumbnailRef = v167, 
        thumbnailTag = v164.impressionsTag, 
        thumbnailUrl = v205, 
        onThumbnailLoaded = v238, 
        thumbnailRect = v203, 
        priceLineContent = v276, 
        creator = v273, 
        title = if l_FFlagAXCatalogItemCardFooterBackendDriven_0 then if v164.isTitleVisible then v263 else nil else v263
    };
    local v281;
    if v164.itemType == l_ItemTypeEnum_0.Look then
        v281 = nil;
    else
        local v282 = if l_itemData_0 then l_itemData_0.tileRestrictionsMap else nil;
        v281 = if v282 then v282[l_ItemTileEnums_0.Restriction.Limited] and "Limited" or (v282[l_ItemTileEnums_0.Restriction.LimitedUnique] or v282[l_ItemTileEnums_0.Restriction.Collectible]) and "Collectible" or nil else nil;
    end;
    v280.itemType = v281;
    v280.itemInfo = if v164.itemType == l_ItemTypeEnum_0.Look then nil else l_itemData_0 and l_itemData_0.bundleType == v48.BundleTypeIdStrings.DynamicHead and "DynamicHead" or nil;
    v280.itemStatus = if l_FFlagAXInventoryDurablesExpiredFilter_0 then v279 else if v164.itemType == l_ItemTypeEnum_0.Look then v120(v266) else if v193.statusText then {
        type = "text", 
        text = v193.statusText
    } else v163(l_itemData_0);
    v280.headerAspectRatio = if l_tileWidth_0 then nil else l_thumbailAspectRatio_0;
    v280.headerSize = if l_tileWidth_0 then UDim2.fromOffset(l_tileWidth_0, l_tileWidth_0 / (l_thumbailAspectRatio_0 or 1)) else nil;
    v280.isSelected = l_isSelected_0;
    v280.backgroundLayers = if l_FFlagAXLookAndFeelBackgrounds_0 and l_cardStyle_0 then l_cardStyle_0.backgroundLayers else nil;
    v280.inputBindings = if l_FFlagAXMigrateCatalogItemCardInputBindingsToFocusNavigation_0 then nil else v236;
    return v280;
end;