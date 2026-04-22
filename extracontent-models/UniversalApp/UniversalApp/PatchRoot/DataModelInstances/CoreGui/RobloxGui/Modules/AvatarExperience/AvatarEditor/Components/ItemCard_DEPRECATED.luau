local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_ItemTile_0 = v3.Tile.ItemTile;
local l_ItemTileEnums_0 = v3.Tile.ItemTileEnums;
local l_SaveTile_0 = v3.Tile.SaveTile;
local l_withStyle_0 = v3.Style.withStyle;
local l_Images_0 = v3.App.ImageSet.Images;
local v9 = require(l_CorePackages_0.Packages.Roact);
local v10 = require(l_CorePackages_0.Packages.React);
local v11 = require(l_CorePackages_0.Packages.RoactRodux);
local v12 = require(l_CorePackages_0.Packages.RoactGamepad);
local v13 = require(l_CorePackages_0.Packages.t);
local l_Focusable_0 = v12.Focusable;
local v15 = require(l_CorePackages_0.Packages.Cryo);
local v16 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v19 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v20 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v24 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local l_withAdaptiveScrolling_0 = v16.Hooks.withAdaptiveScrolling;
local v26 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local l_logOnOverlayClosed_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Debug.logOnOverlayClosed;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v30 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v32 = require(l_Modules_0.LuaApp.Constants);
local v33 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v35 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v37 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v38 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v39 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v40 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v41 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v42 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local l_FullView_0 = v16.Enums.FullView;
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v46 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v47 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local l_CatalogItemCard_0 = v16.Components.CatalogItemCard.CatalogItemCard;
local l_CatalogItemCardStatusIconTypeEnum_0 = v16.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v51 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v51.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v51.Utils.getRbxthumbWithTypeSizeAndOptions;
local v54 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_ImpressionsUtil_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil;
local l_OrganicEventImpressionsSchema_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v60 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXNegativeAvatarSequenceFeatures_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXNegativeAvatarSequenceFeatures;
local v64 = game:DefineFastFlag("AXItemCardShouldNotBeAbleToActivateUntilReady", false);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXMISEnableMultiShoppingUnifiedEvents;
local v67 = l_GuiService_0:IsTenFootInterface();
local l_AddOutfitButton_0 = v41.AddOutfitButton;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v70 = v9.PureComponent:extend("ItemCard");
v70.validateProps = v13.strictInterface({
    itemId = v13.optional(v13.string), 
    isOutfit = v13.boolean, 
    isWearingAssetOrOutfit = v13.optional(v13.boolean), 
    titleFontStyle = v13.optional(v13.table), 
    hasItemFromCurrentPageEquipped = v13.optional(v13.boolean), 
    itemDetailsPeekViewRefs = v13.table, 
    resultsListRef = v13.table, 
    impressionsTag = v13.optional(v13.string), 
    impressionsSchema = v13.optional(v13.string), 
    gridInformation = v13.optional(v13.table), 
    assetTypeId = v13.optional(v13.string), 
    name = v13.optional(v13.string), 
    thumbnail = v13.optional(v13.string), 
    isUIFullView = v13.boolean, 
    outfitInfo = v13.optional(v13.table), 
    categoryInfo = v13.table, 
    lastInputGroup = v13.string, 
    avatarType = v13.string, 
    hasAvatarData = v13.boolean, 
    itemData = v13.optional(v13.table), 
    itemType = v13.optional(v13.string), 
    isEditable = v13.optional(v13.boolean), 
    isPortrait = v13.boolean, 
    disabled = if v64 then v13.boolean else nil, 
    fetchItemInfo = v13.callback, 
    toggleEquipAsset = v13.callback, 
    equipOutfitThunk = v13.callback, 
    sendAnalytics = v13.callback, 
    setFullView = v13.callback, 
    navigateWithLock = v13.callback, 
    openItemDetails = v13.callback, 
    appAnalytics = v13.table, 
    analytics = v13.table, 
    avatarExperienceAnalytics = v13.table, 
    networking = v13.callback, 
    catalogAnalytics = v13.table, 
    navigation = v13.table, 
    avatarRoute = v13.table, 
    adaptiveScrolling = v13.optional(v13.table), 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v13.optional(v13.table)
});
v70.shouldShowConfirmationDialog = function(v71) --[[ Line: 166 ]] --[[ Name: shouldShowConfirmationDialog ]]
    -- upvalues: v40 (copy)
    local v72 = not v71.props.hasItemFromCurrentPageEquipped;
    if v71.props.outfitInfo.outfitType == v40.OutfitTypes.DynamicHead and not v71.props.outfitInfo.isEditable then
        v72 = false;
    end;
    return v72;
end;
v70.getItemIconType = function(v73) --[[ Line: 178 ]] --[[ Name: getItemIconType ]]
    -- upvalues: v37 (copy), l_ItemTileEnums_0 (copy)
    local v74 = nil;
    local l_isOutfit_0 = v73.props.isOutfit;
    local l_outfitInfo_0 = v73.props.outfitInfo;
    v74 = if l_isOutfit_0 and l_outfitInfo_0 then v37.getItemIconTypeFromOutfit(l_outfitInfo_0) else l_isOutfit_0 and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    if v74 == l_ItemTileEnums_0.ItemIconType.Bundle then
        return nil;
    else
        return v74;
    end;
end;
v70.getItemStatusStyle = function(v77) --[[ Line: 196 ]] --[[ Name: getItemStatusStyle ]]
    -- upvalues: v37 (copy)
    local l_isOutfit_1 = v77.props.isOutfit;
    local l_outfitInfo_1 = v77.props.outfitInfo;
    if l_isOutfit_1 and l_outfitInfo_1 then
        return v37.getItemStatusStyleFromOutfit(l_outfitInfo_1);
    else
        return nil;
    end;
end;
v70.isEquippable = function(v80) --[[ Line: 207 ]] --[[ Name: isEquippable ]]
    return v80:getItemStatusStyle() == nil;
end;
v70.init = function(v81) --[[ Line: 211 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v44 (copy), l_AvatarScreen_0 (copy), v38 (copy), v32 (copy), l_logOnOverlayClosed_0 (copy), v40 (copy), v37 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v64 (copy)
    v81.addOutfitButtonRef = v9.createRef();
    v81.thumbnailRef = v9.createRef();
    v81.textButtonRef = v9.createRef();
    v81.activateDetailsButton = function() --[[ Line: 216 ]]
        -- upvalues: v81 (copy), v44 (ref), l_AvatarScreen_0 (ref), v38 (ref)
        if v81:isOutfit() then
            local l_navigation_0 = v81.props.navigation;
            local v83 = {
                outfitId = v81.props.itemId, 
                ZIndex = 2, 
                showFullWithNoPeekView = not v81.props.isPortrait, 
                renderBottomBar = false, 
                NextSelectionLeft = not v81.props.isPortrait and v81.props.resultsListRef or nil, 
                outfitDetailsPeekViewRefs = v81.props.itemDetailsPeekViewRefs
            };
            local function v84() --[[ Line: 229 ]]
                -- upvalues: v44 (ref), l_navigation_0 (copy), l_AvatarScreen_0 (ref), v83 (copy)
                v44.closeFiltersAndItemDetails(l_navigation_0);
                v44.closeTryOnManager(l_navigation_0);
                l_navigation_0.navigate(l_AvatarScreen_0.OutfitDetails, v83);
            end;
            v81.props.navigateWithLock(v84);
            return;
        else
            local v85 = v38.GetItemSubType(v81.props.itemType, v81.props.itemData);
            local v86 = if v81.props.itemData then v81.props.itemData.priceInRobux else nil;
            local l_itemType_0 = v81.props.itemType;
            local v88 = {
                itemId = v81.props.itemId, 
                itemType = l_itemType_0, 
                itemSubType = v85, 
                priceInRobux = v86, 
                catalogAnalytics = v81.props.catalogAnalytics, 
                avatarRoute = v81.props.avatarRoute, 
                navigation = v81.props.navigation, 
                itemDetailsPeekViewRefs = v81.props.itemDetailsPeekViewRefs, 
                resultsListRef = v81.props.resultsListRef, 
                mountAsFullView = nil, 
                showFullWithNoPeekView = true, 
                closePreviousItemDetails = true
            };
            v81.props.openItemDetails(v88);
            return;
        end;
    end;
    v81.onOverlayClosed = function() --[[ Line: 263 ]]
        -- upvalues: v81 (copy), v32 (ref), l_logOnOverlayClosed_0 (ref)
        local v89 = v81.props.lastInputGroup == v32.InputType.Gamepad;
        l_logOnOverlayClosed_0("ItemCard", v89);
        if v89 then
            v81.props.focusController.captureFocus();
        end;
    end;
    v81.maybeShowNonBlockingR15Prompt = function() --[[ Line: 275 ]]
        -- upvalues: v81 (copy), v40 (ref), l_AvatarScreen_0 (ref)
        if v81.props.avatarType ~= v40.AvatarType.R6 then
            return;
        else
            local v90 = false;
            local v91 = nil;
            if v81.props.categoryInfo.PageType == v40.PageType.Animation then
                v90 = true;
                v91 = "Feature.Avatar.Message.R15AnimationsPrompt";
            elseif v81.props.categoryInfo.PageType == v40.PageType.Emotes then
                v90 = true;
                v91 = "Feature.Avatar.Message.R15EmotesPrompt";
            end;
            if v90 then
                local function v92() --[[ Line: 299 ]]
                    -- upvalues: v81 (ref), l_AvatarScreen_0 (ref), v91 (ref)
                    v81.props.navigation.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        onOverlayClosed = v81.onOverlayClosed, 
                        bodyTextKey = v91
                    });
                end;
                v81.props.navigateWithLock(v92);
            end;
            return;
        end;
    end;
    v81.toggleAdaptiveScrollingSelectedItem = function(v93, v94) --[[ Line: 309 ]]
        -- upvalues: v81 (copy)
        local l_adaptiveScrolling_0 = v81.props.adaptiveScrolling;
        if not l_adaptiveScrolling_0 then
            return;
        elseif v93 then
            l_adaptiveScrolling_0.setSelectedItemInstance(nil);
            return;
        else
            local l_current_0 = v81.thumbnailRef.current;
            if l_current_0 and v94 then
                l_adaptiveScrolling_0.setSelectedItemInstance(l_current_0);
            end;
            return;
        end;
    end;
    v81.onItemClick = function() --[[ Line: 327 ]]
        -- upvalues: v81 (copy), v37 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), v40 (ref), l_AvatarScreen_0 (ref), v64 (ref)
        local l_itemData_0 = v81.props.itemData;
        if l_itemData_0 and v37.isModerationPendingOrRejected(l_itemData_0.moderationStatus) then
            local v98 = nil;
            if l_FFlagAXModeratedItemsFlow_0 then
                v98 = if v81.props.assetType then v40.AssetTypeLocalized[v81.props.assetTypeId] else "Feature.Catalog.Label.Bundle";
            end;
            v81.props.navigation.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = {
                    {
                        category = v81.props.itemType, 
                        categoryLoc = v98, 
                        itemName = l_itemData_0.name
                    }
                }, 
                messageType = v37.getMessageTypeFromModerationStatus(l_itemData_0.moderationStatus)
            });
            return;
        else
            if v64 then
                if v81.props.disabled then
                    return;
                end;
            elseif not v81.props.itemId then
                return;
            elseif not v81.props.hasAvatarData then
                return;
            end;
            if v81:isEquippable() then
                v81:toggleEquip();
                return;
            else
                v81.activateDetailsButton();
                return;
            end;
        end;
    end;
end;
v70.toggleEquip = function(v99) --[[ Line: 372 ]] --[[ Name: toggleEquip ]]
    -- upvalues: v41 (copy), v40 (copy), l_AvatarScreen_0 (copy), l_Logging_0 (copy), v61 (copy), l_FullView_0 (copy)
    local l_itemId_0 = v99.props.itemId;
    local l_isWearingAssetOrOutfit_0 = v99.props.isWearingAssetOrOutfit;
    local l_toggleEquipAsset_0 = v99.props.toggleEquipAsset;
    local l_sendAnalytics_0 = v99.props.sendAnalytics;
    local l_analytics_0 = v99.props.analytics;
    local l_equipOutfitThunk_0 = v99.props.equipOutfitThunk;
    local l_isUIFullView_0 = v99.props.isUIFullView;
    local l_navigation_1 = v99.props.navigation;
    local v108 = v99:isOutfit() and v41.Outfits or v99.props.assetTypeId;
    local function v110() --[[ Line: 391 ]]
        -- upvalues: l_toggleEquipAsset_0 (copy), v108 (copy), l_itemId_0 (copy), l_navigation_1 (copy), v99 (copy), l_isWearingAssetOrOutfit_0 (copy)
        local v109 = l_toggleEquipAsset_0(v108, l_itemId_0, l_navigation_1);
        v99.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v109);
    end;
    v99.maybeShowNonBlockingR15Prompt();
    local v111 = v99.props.avatarType == v40.AvatarType.R6;
    local v112 = v108 == v40.AssetTypeIdStrings.HairAccessory;
    local v113 = false;
    if v40.LayeredAssetTypes[v108] ~= nil then
        v113 = not v112;
    end;
    if v111 and not l_isWearingAssetOrOutfit_0 and v113 then
        local function v114() --[[ Line: 408 ]]
            -- upvalues: v99 (copy), l_AvatarScreen_0 (ref), v110 (copy)
            v99.props.navigation.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v99.onOverlayClosed, 
                bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                onSwitchSelected = v110
            });
        end;
        v99.props.navigateWithLock(v114);
        return;
    else
        if v99:isOutfit() then
            local l_outfitInfo_2 = v99.props.outfitInfo;
            if l_outfitInfo_2 then
                if v99:shouldShowConfirmationDialog() then
                    local function v117() --[[ Line: 423 ]]
                        -- upvalues: v99 (copy), l_AvatarScreen_0 (ref), l_outfitInfo_2 (copy), l_isWearingAssetOrOutfit_0 (copy)
                        v99.props.navigation.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
                            onOverlayClosed = v99.onOverlayClosed, 
                            outfitInfo = l_outfitInfo_2, 
                            onEquip = function(v116) --[[ Line: 427 ]] --[[ Name: onEquip ]]
                                -- upvalues: v99 (ref), l_isWearingAssetOrOutfit_0 (ref)
                                v99.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v116);
                            end
                        });
                    end;
                    v99.props.navigateWithLock(v117);
                else
                    local v118 = l_equipOutfitThunk_0(l_outfitInfo_2, l_analytics_0, l_navigation_1, l_isWearingAssetOrOutfit_0);
                    v99.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v118);
                end;
            else
                l_Logging_0.warn("Tried equipping a costume without any costume data!");
            end;
        else
            if v108 then
                if not l_isWearingAssetOrOutfit_0 then
                    l_sendAnalytics_0(l_analytics_0.equipAsset, l_itemId_0, v108);
                else
                    l_sendAnalytics_0(l_analytics_0.unequipAsset, l_itemId_0, v108);
                end;
            end;
            local v119 = l_toggleEquipAsset_0(v108, l_itemId_0, l_navigation_1);
            v99.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v119);
        end;
        if not l_isWearingAssetOrOutfit_0 and l_isUIFullView_0 then
            if v61() then
                v99.props.setFullView(v99.props.avatarExperienceAnalytics, v99.props.avatarRoute.opaque.name, l_FullView_0.None);
                return;
            else
                v99.props.setFullView(v99.props.avatarExperienceAnalytics, l_AvatarScreen_0.AvatarEditor, l_FullView_0.None);
            end;
        end;
        return;
    end;
end;
v70.isOutfit = function(v120) --[[ Line: 465 ]] --[[ Name: isOutfit ]]
    return v120.props.isOutfit;
end;
v70.wasCreatedInExperience = function(v121) --[[ Line: 469 ]] --[[ Name: wasCreatedInExperience ]]
    local l_outfitInfo_3 = v121.props.outfitInfo;
    return l_outfitInfo_3 and l_outfitInfo_3.creatingUniverseId ~= nil and string.len(l_outfitInfo_3.creatingUniverseId) > 0;
end;
v70.shouldProvideControlsToViewItemDetails = function(v123) --[[ Line: 476 ]] --[[ Name: shouldProvideControlsToViewItemDetails ]]
    if v123:isOutfit() and not v123:wasCreatedInExperience() then
        return false;
    elseif not v123.props.isWearingAssetOrOutfit then
        return false;
    else
        return true;
    end;
end;
v70.renderDetailsButton = function(v124, _, _) --[[ Line: 493 ]] --[[ Name: renderDetailsButton ]]
    -- upvalues: v67 (copy), v9 (copy), v31 (copy)
    if not v124:shouldProvideControlsToViewItemDetails() then
        return nil;
    elseif v67 then
        return nil;
    else
        return v9.createElement(v31, {
            activateButton = v124.activateDetailsButton
        });
    end;
end;
v70.render = function(v127) --[[ Line: 510 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy)
    return l_withLocalization_0({
        more = "CommonUI.Features.Label.More"
    })(function(v128) --[[ Line: 513 ]]
        -- upvalues: l_withStyle_0 (ref), v127 (copy)
        return l_withStyle_0(function(v129) --[[ Line: 514 ]]
            -- upvalues: v127 (ref), v128 (copy)
            return v127:renderWithProviders(v128, v129);
        end);
    end);
end;
v70.renderWithProviders = function(v130, v131, v132) --[[ Line: 520 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v12 (copy), l_AddOutfitButton_0 (copy), v9 (copy), l_SaveTile_0 (copy), l_Images_0 (copy), v32 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v40 (copy), v37 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), v10 (copy), l_CatalogItemCard_0 (copy), l_Focusable_0 (copy), l_ItemTile_0 (copy)
    local l_itemId_1 = v130.props.itemId;
    local l_name_0 = v130.props.name;
    local l_thumbnail_0 = v130.props.thumbnail;
    local l_isWearingAssetOrOutfit_1 = v130.props.isWearingAssetOrOutfit;
    local l_itemData_1 = v130.props.itemData;
    return v12.withFocusController(function(v138) --[[ Line: 527 ]]
        -- upvalues: l_itemId_1 (copy), l_AddOutfitButton_0 (ref), v9 (ref), l_SaveTile_0 (ref), l_Images_0 (ref), v130 (copy), v32 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v40 (ref), l_isWearingAssetOrOutfit_1 (copy), v12 (ref), l_itemData_1 (copy), v37 (ref), l_CatalogItemCardStatusIconTypeEnum_0 (ref), v10 (ref), l_CatalogItemCard_0 (ref), l_Focusable_0 (ref), l_ItemTile_0 (ref), l_name_0 (copy), l_thumbnail_0 (copy), v131 (copy), v132 (copy)
        if l_itemId_1 == l_AddOutfitButton_0 then
            return v9.createElement(l_SaveTile_0, {
                thumbnail = l_Images_0["icons/menu/customize"], 
                onActivated = function() --[[ Line: 531 ]] --[[ Name: onActivated ]]
                    -- upvalues: v130 (ref), v32 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v138 (copy)
                    v130:openCreateOrUpdateCostumeMenu(function() --[[ Line: 532 ]]
                        -- upvalues: v130 (ref), v32 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v138 (ref)
                        local v139 = v130.props.lastInputGroup == v32.InputType.Gamepad;
                        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v139 then
                            v138.captureFocus();
                        end;
                    end);
                end, 
                thumbnailTransparency = 0, 
                [v9.Ref] = v130.addOutfitButtonRef
            });
        else
            local v140 = if v130.props.categoryInfo.PageType == v40.PageType.Emotes then l_isWearingAssetOrOutfit_1 and "Feature.Avatar.Action.UnslotEmote" or "Feature.Avatar.Action.SlotEmote" else nil;
            local v141 = v130:shouldProvideControlsToViewItemDetails();
            local v142 = {
                SelectSlot = v12.Input.onBegin(Enum.KeyCode.ButtonA, v130.onItemClick, {
                    key = v140
                }), 
                MoreDetails = if v141 then v12.Input.onBegin(Enum.KeyCode.ButtonX, v130.activateDetailsButton, {
                    key = "CommonUI.Features.Label.More"
                }) else nil
            };
            local v143 = 0;
            local v144 = nil;
            if not v130.props.categoryInfo.HideTextUnderTile then
                v143 = v40.ItemTileTitleMaxLines;
                v144 = v130.props.titleFontStyle;
            end;
            if l_itemData_1 and v37.isModerationPendingOrRejected(l_itemData_1.moderationStatus) then
                local v145 = if l_itemData_1.moderationStatus == Enum.ModerationStatus.NotReviewed then l_CatalogItemCardStatusIconTypeEnum_0.PendingModeration else l_CatalogItemCardStatusIconTypeEnum_0.Moderated;
                return v10.createElement(l_CatalogItemCard_0, {
                    Size = UDim2.fromScale(1, 1), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    isSelected = l_isWearingAssetOrOutfit_1, 
                    onActivated = v130.onItemClick, 
                    ref = v130.textButtonRef, 
                    itemStatus = {
                        type = "placeholder", 
                        iconType = v145
                    }
                });
            else
                return v9.createElement(l_Focusable_0[l_ItemTile_0], {
                    LayoutOrder = v130.props.layoutOrder, 
                    isSelected = l_isWearingAssetOrOutfit_1, 
                    itemIconType = v130:getItemIconType(), 
                    onActivated = v130.onItemClick, 
                    name = l_name_0, 
                    titleTextLineCount = v143, 
                    titleFontStyle = v144, 
                    thumbnail = l_thumbnail_0, 
                    renderTileInset = function() --[[ Line: 597 ]] --[[ Name: renderTileInset ]]
                        -- upvalues: v130 (ref), v131 (ref), v132 (ref)
                        return v130:renderDetailsButton(v131, v132);
                    end, 
                    inputBindings = v142, 
                    statusStyle = v130:getItemStatusStyle(), 
                    key = l_itemId_1, 
                    textButtonRef = v130.textButtonRef, 
                    [v9.Ref] = v130.thumbnailRef, 
                    [v10.Tag] = v130.props.impressionsTag
                });
            end;
        end;
    end);
end;
v70.openCreateOrUpdateCostumeMenu = function(v146, v147) --[[ Line: 612 ]] --[[ Name: openCreateOrUpdateCostumeMenu ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v148 = v146.addOutfitButtonRef:getValue();
    if not v148 then
        return;
    else
        local v149 = v148.AbsolutePosition + v148.AbsoluteSize * Vector2.new(0.5, 0.5);
        local function v150() --[[ Line: 620 ]]
            -- upvalues: v146 (copy), l_AvatarScreen_0 (ref), v149 (copy), v147 (copy)
            v146.props.navigation.navigate(l_AvatarScreen_0.CreateOrUpdateOutfitMenu, {
                saveTilePosition = v149, 
                onOverlayClosed = v147
            });
        end;
        v146.props.navigateWithLock(v150);
        return;
    end;
end;
v70.checkFetchInfo = function(v151) --[[ Line: 629 ]] --[[ Name: checkFetchInfo ]]
    -- upvalues: l_AddOutfitButton_0 (copy), v40 (copy)
    if v151:isOutfit() then
        return;
    else
        local l_itemId_2 = v151.props.itemId;
        if l_itemId_2 == l_AddOutfitButton_0 then
            return;
        else
            if l_itemId_2 and not v151.props.name then
                v151.props.fetchItemInfo(v151.props.networking, v151.props.appAnalytics, l_itemId_2, v40.ItemType.Asset);
            end;
            return;
        end;
    end;
end;
v70.setImpressionAttributes = function(v153) --[[ Line: 645 ]] --[[ Name: setImpressionAttributes ]]
    -- upvalues: l_OrganicEventImpressionsSchema_0 (copy), l_ImpressionsUtil_0 (copy)
    local v154 = v153.thumbnailRef and v153.thumbnailRef:getValue();
    if v153.props.impressionsTag and v154 then
        v154:SetAttribute(v153.props.impressionsTag, v153.props.itemId);
        local v155 = l_OrganicEventImpressionsSchema_0[v153.props.impressionsSchema];
        l_ImpressionsUtil_0.writeItemAttributes(v155, v154, v153.props);
    end;
end;
v70.addUnifiedEventLogging = function(v156) --[[ Line: 655 ]] --[[ Name: addUnifiedEventLogging ]]
    -- upvalues: l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), v37 (copy), l_FFlagAXNegativeAvatarSequenceFeatures_0 (copy), l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    l_addUnifiedEventLogging_0(v156.textButtonRef, {
        action = if v156.props.isWearingAssetOrOutfit then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
        itemId = v156.props.itemId, 
        itemType = if v156.props.itemType == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
        assetType = v156.props.itemData and v156.props.itemData.assetType or nil, 
        gridPositionRow = if v156.props.gridInformation then v156.props.gridInformation.row else nil, 
        gridPositionColumn = if v156.props.gridInformation then v156.props.gridInformation.column else nil, 
        category = if v156.props.categoryInfo.Category then v37.getAvatarEditorCategoryInfo(v156.props.categoryInfo.Category).Name else nil, 
        subcategory = if v156.props.categoryInfo.Category and v156.props.categoryInfo.Subcategory then v37.getAvatarEditorCategoryInfo(v156.props.categoryInfo.Category, v156.props.categoryInfo.Subcategory).Name else nil, 
        isOwnedItem = l_FFlagAXNegativeAvatarSequenceFeatures_0 and true or nil
    }, {
        hasDeferredActions = not l_FFlagAXMISEnableMultiShoppingUnifiedEvents_0 or nil, 
        sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
    });
end;
v70.didUpdate = function(v157, v158) --[[ Line: 683 ]] --[[ Name: didUpdate ]]
    v157:setImpressionAttributes();
    v157:addUnifiedEventLogging();
    if v158.itemId == v157.props.itemId then
        return;
    else
        v157:checkFetchInfo();
        return;
    end;
end;
v70.didMount = function(v159) --[[ Line: 698 ]] --[[ Name: didMount ]]
    v159:setImpressionAttributes();
    v159:addUnifiedEventLogging();
    v159:checkFetchInfo();
end;
v70 = l_RoactServices_0.connect({
    appAnalytics = v19, 
    analytics = v29, 
    catalogAnalytics = v47, 
    avatarExperienceAnalytics = v30, 
    networking = v20
})(v70);
v70 = l_withAdaptiveScrolling_0((v24((v23((l_withNavigation_0(v11.connect(function(v160, v161) --[[ Line: 714 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v37 (copy), v64 (copy), v40 (copy), v39 (copy), v60 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v26 (copy), l_AvatarScreen_0 (copy), l_FullView_0 (copy), v61 (copy), v54 (copy)
    local l_itemId_3 = v161.itemId;
    local v163 = v37.getAvatarEditorCategoryInfoFromState(v160);
    local v164 = v160.AvatarExperience.AvatarEditor.OutfitInfos[l_itemId_3];
    local v165 = v64 and true or nil;
    local v166 = nil;
    local v167 = nil;
    local v168 = nil;
    local v169 = if v161.isOutfit then v40.ItemType.Bundle else v40.ItemType.Asset;
    local v170 = v39(v160.AvatarExperience.Common, v161.itemId, v169);
    local v171 = if v164 then v164.isEditable else false;
    local v172 = if v64 then v60(v160) else nil;
    if l_itemId_3 then
        if v161.isOutfit then
            v167 = v164 and v164.name or nil;
            local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
            v168 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_3, l_Outfit_0, 150);
            if v164 then
                v168 = v168 .. "&filters=" .. v164.updateCounter;
                if v37.isModerationPendingOrRejected(v164.moderationStatus) then
                    v168 = v26.BrokenAvatarThumbnail;
                end;
            end;
            v165 = if v64 then not v172 else nil;
        else
            v166 = v170 and v170.assetType or nil;
            v167 = v170 and v170.name or nil;
            local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
            v168 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_3, l_Asset_0, 150);
            if v170 and v170.outfitModerationStatus then
                v168 = v168 .. ("&filters=__%*__"):format(v170.outfitModerationStatus);
            end;
            if v170 and v170.moderationStatus then
                v168 = v168 .. "&filters=" .. (v170.updateCounter or 0);
            end;
            v165 = if v64 then not v170 or not v172 else nil;
        end;
    end;
    local l_AvatarType_0 = v160.AvatarExperience.AvatarEditor.Character.AvatarType;
    local v176 = v160.AvatarExperience.Common.FullView[l_AvatarScreen_0.AvatarEditor] == l_FullView_0.UIFullView;
    if v61() then
        v176 = v160.AvatarExperience.Common.FullView[v161.avatarRoute.opaque.name] == l_FullView_0.UIFullView;
    end;
    return {
        itemData = v170, 
        itemType = v169, 
        isEditable = v171, 
        assetTypeId = v166, 
        name = v167, 
        thumbnail = v168, 
        isUIFullView = v176, 
        outfitInfo = v164, 
        categoryInfo = v163, 
        avatarType = l_AvatarType_0, 
        hasAvatarData = if v64 then v172 else v60(v160), 
        isPortrait = v54(v160), 
        disabled = if v64 then v165 else nil
    };
end, function(v177) --[[ Line: 790 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v33 (copy), v36 (copy), v34 (copy), v35 (copy), v42 (copy), l_NavigateWithLock_0 (copy), v46 (copy)
    return {
        fetchItemInfo = function(v178, v179, v180, v181) --[[ Line: 792 ]] --[[ Name: fetchItemInfo ]]
            -- upvalues: v177 (copy), v33 (ref)
            return v177(v33(v178, v179, v180, v181));
        end, 
        toggleEquipAsset = function(v182, v183, v184) --[[ Line: 795 ]] --[[ Name: toggleEquipAsset ]]
            -- upvalues: v177 (copy), v36 (ref)
            return v177(v36(v182, v183, v184));
        end, 
        equipOutfitThunk = function(v185, v186, v187, v188) --[[ Line: 798 ]] --[[ Name: equipOutfitThunk ]]
            -- upvalues: v177 (copy), v34 (ref)
            local v189 = {
                outfitInfo = v185, 
                analytics = v186, 
                navigation = v187, 
                isSelected = v188
            };
            return v177(v34(v189));
        end, 
        sendAnalytics = function(v190, v191, v192) --[[ Line: 807 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v177 (copy), v35 (ref)
            v177(v35(v190, v191, v192));
        end, 
        setFullView = function(v193, v194, v195) --[[ Line: 810 ]] --[[ Name: setFullView ]]
            -- upvalues: v177 (copy), v42 (ref)
            v177(v42(v193, v194, v195));
        end, 
        navigateWithLock = function(v196) --[[ Line: 813 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v177 (copy), l_NavigateWithLock_0 (ref)
            v177(l_NavigateWithLock_0(v196));
        end, 
        openItemDetails = function(v197) --[[ Line: 816 ]] --[[ Name: openItemDetails ]]
            -- upvalues: v177 (copy), v46 (ref)
            v177(v46(v197));
        end
    };
end)(v70), nil)))))));
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v70;
else
    return function(v198) --[[ Line: 833 ]]
        -- upvalues: v12 (copy), v9 (copy), v70 (ref), v15 (copy)
        return v12.withFocusController(function(v199) --[[ Line: 834 ]]
            -- upvalues: v9 (ref), v70 (ref), v15 (ref), v198 (copy)
            return v9.createElement(v70, v15.Dictionary.join(v198, {
                focusController = v199
            }));
        end);
    end;
end;