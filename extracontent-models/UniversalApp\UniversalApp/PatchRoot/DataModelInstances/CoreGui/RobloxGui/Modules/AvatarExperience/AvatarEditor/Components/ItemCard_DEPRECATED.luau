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
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v18 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v19 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local v22 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v23 = require(l_Modules_0.AvatarExperience.Common.Components.withLastInputGroup);
local v24 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local v25 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v26 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v28 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v29 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v30 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v31 = require(l_Modules_0.LuaApp.Constants);
local v32 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v33 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v34 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v35 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v36 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v37 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v38 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v39 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v40 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v41 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v42 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v44 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v45 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v46 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v47 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_CatalogItemCard_0 = v47.Components.CatalogItemCard.CatalogItemCard;
local l_CatalogItemCardStatusIconTypeEnum_0 = v47.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v51 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v51.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v51.Utils.getRbxthumbWithTypeSizeAndOptions;
local v54 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v55 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v56 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local v60 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v61 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXNegativeAvatarSequenceFeatures_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXNegativeAvatarSequenceFeatures;
local v64 = game:DefineFastFlag("AXItemCardShouldNotBeAbleToActivateUntilReady", false);
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local v66 = l_GuiService_0:IsTenFootInterface();
local l_AddOutfitButton_0 = v40.AddOutfitButton;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v69 = v9.PureComponent:extend("ItemCard");
v69.validateProps = v13.strictInterface({
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
v69.shouldShowConfirmationDialog = function(v70) --[[ Line: 163 ]] --[[ Name: shouldShowConfirmationDialog ]]
    -- upvalues: v39 (copy)
    local v71 = not v70.props.hasItemFromCurrentPageEquipped;
    if v70.props.outfitInfo.outfitType == v39.OutfitTypes.DynamicHead and not v70.props.outfitInfo.isEditable then
        v71 = false;
    end;
    return v71;
end;
v69.getItemIconType = function(v72) --[[ Line: 175 ]] --[[ Name: getItemIconType ]]
    -- upvalues: v36 (copy), l_ItemTileEnums_0 (copy)
    local v73 = nil;
    local l_isOutfit_0 = v72.props.isOutfit;
    local l_outfitInfo_0 = v72.props.outfitInfo;
    v73 = if l_isOutfit_0 and l_outfitInfo_0 then v36.getItemIconTypeFromOutfit(l_outfitInfo_0) else l_isOutfit_0 and l_ItemTileEnums_0.ItemIconType.Bundle or nil;
    if v73 == l_ItemTileEnums_0.ItemIconType.Bundle then
        return nil;
    else
        return v73;
    end;
end;
v69.getItemStatusStyle = function(v76) --[[ Line: 193 ]] --[[ Name: getItemStatusStyle ]]
    -- upvalues: v36 (copy)
    local l_isOutfit_1 = v76.props.isOutfit;
    local l_outfitInfo_1 = v76.props.outfitInfo;
    if l_isOutfit_1 and l_outfitInfo_1 then
        return v36.getItemStatusStyleFromOutfit(l_outfitInfo_1);
    else
        return nil;
    end;
end;
v69.isEquippable = function(v79) --[[ Line: 204 ]] --[[ Name: isEquippable ]]
    return v79:getItemStatusStyle() == nil;
end;
v69.init = function(v80) --[[ Line: 208 ]] --[[ Name: init ]]
    -- upvalues: v9 (copy), v43 (copy), l_AvatarScreen_0 (copy), v37 (copy), v31 (copy), v26 (copy), v39 (copy), v36 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v64 (copy)
    v80.addOutfitButtonRef = v9.createRef();
    v80.thumbnailRef = v9.createRef();
    v80.textButtonRef = v9.createRef();
    v80.activateDetailsButton = function() --[[ Line: 213 ]]
        -- upvalues: v80 (copy), v43 (ref), l_AvatarScreen_0 (ref), v37 (ref)
        if v80:isOutfit() then
            local l_navigation_0 = v80.props.navigation;
            local v82 = {
                outfitId = v80.props.itemId, 
                ZIndex = 2, 
                showFullWithNoPeekView = not v80.props.isPortrait, 
                renderBottomBar = false, 
                NextSelectionLeft = not v80.props.isPortrait and v80.props.resultsListRef or nil, 
                outfitDetailsPeekViewRefs = v80.props.itemDetailsPeekViewRefs
            };
            local function v83() --[[ Line: 226 ]]
                -- upvalues: v43 (ref), l_navigation_0 (copy), l_AvatarScreen_0 (ref), v82 (copy)
                v43.closeFiltersAndItemDetails(l_navigation_0);
                v43.closeTryOnManager(l_navigation_0);
                l_navigation_0.navigate(l_AvatarScreen_0.OutfitDetails, v82);
            end;
            v80.props.navigateWithLock(v83);
            return;
        else
            local v84 = v37.GetItemSubType(v80.props.itemType, v80.props.itemData);
            local v85 = if v80.props.itemData then v80.props.itemData.priceInRobux else nil;
            local l_itemType_0 = v80.props.itemType;
            local v87 = {
                itemId = v80.props.itemId, 
                itemType = l_itemType_0, 
                itemSubType = v84, 
                priceInRobux = v85, 
                catalogAnalytics = v80.props.catalogAnalytics, 
                avatarRoute = v80.props.avatarRoute, 
                navigation = v80.props.navigation, 
                itemDetailsPeekViewRefs = v80.props.itemDetailsPeekViewRefs, 
                resultsListRef = v80.props.resultsListRef, 
                mountAsFullView = nil, 
                showFullWithNoPeekView = true, 
                closePreviousItemDetails = true
            };
            v80.props.openItemDetails(v87);
            return;
        end;
    end;
    v80.onOverlayClosed = function() --[[ Line: 260 ]]
        -- upvalues: v80 (copy), v31 (ref), v26 (ref)
        local v88 = v80.props.lastInputGroup == v31.InputType.Gamepad;
        v26("ItemCard", v88);
        if v88 then
            v80.props.focusController.captureFocus();
        end;
    end;
    v80.maybeShowNonBlockingR15Prompt = function() --[[ Line: 272 ]]
        -- upvalues: v80 (copy), v39 (ref), l_AvatarScreen_0 (ref)
        if v80.props.avatarType ~= v39.AvatarType.R6 then
            return;
        else
            local v89 = false;
            local v90 = nil;
            if v80.props.categoryInfo.PageType == v39.PageType.Animation then
                v89 = true;
                v90 = "Feature.Avatar.Message.R15AnimationsPrompt";
            elseif v80.props.categoryInfo.PageType == v39.PageType.Emotes then
                v89 = true;
                v90 = "Feature.Avatar.Message.R15EmotesPrompt";
            end;
            if v89 then
                local function v91() --[[ Line: 296 ]]
                    -- upvalues: v80 (ref), l_AvatarScreen_0 (ref), v90 (ref)
                    v80.props.navigation.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        onOverlayClosed = v80.onOverlayClosed, 
                        bodyTextKey = v90
                    });
                end;
                v80.props.navigateWithLock(v91);
            end;
            return;
        end;
    end;
    v80.toggleAdaptiveScrollingSelectedItem = function(v92, v93) --[[ Line: 306 ]]
        -- upvalues: v80 (copy)
        local l_adaptiveScrolling_0 = v80.props.adaptiveScrolling;
        if not l_adaptiveScrolling_0 then
            return;
        elseif v92 then
            l_adaptiveScrolling_0.setSelectedItemInstance(nil);
            return;
        else
            local l_current_0 = v80.thumbnailRef.current;
            if l_current_0 and v93 then
                l_adaptiveScrolling_0.setSelectedItemInstance(l_current_0);
            end;
            return;
        end;
    end;
    v80.onItemClick = function() --[[ Line: 324 ]]
        -- upvalues: v80 (copy), v36 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), v39 (ref), l_AvatarScreen_0 (ref), v64 (ref)
        local l_itemData_0 = v80.props.itemData;
        if l_itemData_0 and v36.isModerationPendingOrRejected(l_itemData_0.moderationStatus) then
            local v97 = nil;
            if l_FFlagAXModeratedItemsFlow_0 then
                v97 = if v80.props.assetType then v39.AssetTypeLocalized[v80.props.assetTypeId] else "Feature.Catalog.Label.Bundle";
            end;
            v80.props.navigation.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = {
                    {
                        category = v80.props.itemType, 
                        categoryLoc = v97, 
                        itemName = l_itemData_0.name
                    }
                }, 
                messageType = v36.getMessageTypeFromModerationStatus(l_itemData_0.moderationStatus)
            });
            return;
        else
            if v64 then
                if v80.props.disabled then
                    return;
                end;
            elseif not v80.props.itemId then
                return;
            elseif not v80.props.hasAvatarData then
                return;
            end;
            if v80:isEquippable() then
                v80:toggleEquip();
                return;
            else
                v80.activateDetailsButton();
                return;
            end;
        end;
    end;
end;
v69.toggleEquip = function(v98) --[[ Line: 369 ]] --[[ Name: toggleEquip ]]
    -- upvalues: v40 (copy), v39 (copy), l_AvatarScreen_0 (copy), l_Logging_0 (copy), v61 (copy), v42 (copy)
    local l_itemId_0 = v98.props.itemId;
    local l_isWearingAssetOrOutfit_0 = v98.props.isWearingAssetOrOutfit;
    local l_toggleEquipAsset_0 = v98.props.toggleEquipAsset;
    local l_sendAnalytics_0 = v98.props.sendAnalytics;
    local l_analytics_0 = v98.props.analytics;
    local l_equipOutfitThunk_0 = v98.props.equipOutfitThunk;
    local l_isUIFullView_0 = v98.props.isUIFullView;
    local l_navigation_1 = v98.props.navigation;
    local v107 = v98:isOutfit() and v40.Outfits or v98.props.assetTypeId;
    local function v109() --[[ Line: 388 ]]
        -- upvalues: l_toggleEquipAsset_0 (copy), v107 (copy), l_itemId_0 (copy), l_navigation_1 (copy), v98 (copy), l_isWearingAssetOrOutfit_0 (copy)
        local v108 = l_toggleEquipAsset_0(v107, l_itemId_0, l_navigation_1);
        v98.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v108);
    end;
    v98.maybeShowNonBlockingR15Prompt();
    local v110 = v98.props.avatarType == v39.AvatarType.R6;
    local v111 = v107 == v39.AssetTypeIdStrings.HairAccessory;
    local v112 = false;
    if v39.LayeredAssetTypes[v107] ~= nil then
        v112 = not v111;
    end;
    if v110 and not l_isWearingAssetOrOutfit_0 and v112 then
        local function v113() --[[ Line: 405 ]]
            -- upvalues: v98 (copy), l_AvatarScreen_0 (ref), v109 (copy)
            v98.props.navigation.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                onOverlayClosed = v98.onOverlayClosed, 
                bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                onSwitchSelected = v109
            });
        end;
        v98.props.navigateWithLock(v113);
        return;
    else
        if v98:isOutfit() then
            local l_outfitInfo_2 = v98.props.outfitInfo;
            if l_outfitInfo_2 then
                if v98:shouldShowConfirmationDialog() then
                    local function v116() --[[ Line: 420 ]]
                        -- upvalues: v98 (copy), l_AvatarScreen_0 (ref), l_outfitInfo_2 (copy), l_isWearingAssetOrOutfit_0 (copy)
                        v98.props.navigation.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
                            onOverlayClosed = v98.onOverlayClosed, 
                            outfitInfo = l_outfitInfo_2, 
                            onEquip = function(v115) --[[ Line: 424 ]] --[[ Name: onEquip ]]
                                -- upvalues: v98 (ref), l_isWearingAssetOrOutfit_0 (ref)
                                v98.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v115);
                            end
                        });
                    end;
                    v98.props.navigateWithLock(v116);
                else
                    local v117 = l_equipOutfitThunk_0(l_outfitInfo_2, l_analytics_0, l_navigation_1, l_isWearingAssetOrOutfit_0);
                    v98.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v117);
                end;
            else
                l_Logging_0.warn("Tried equipping a costume without any costume data!");
            end;
        else
            if v107 then
                if not l_isWearingAssetOrOutfit_0 then
                    l_sendAnalytics_0(l_analytics_0.equipAsset, l_itemId_0, v107);
                else
                    l_sendAnalytics_0(l_analytics_0.unequipAsset, l_itemId_0, v107);
                end;
            end;
            local v118 = l_toggleEquipAsset_0(v107, l_itemId_0, l_navigation_1);
            v98.toggleAdaptiveScrollingSelectedItem(l_isWearingAssetOrOutfit_0, v118);
        end;
        if not l_isWearingAssetOrOutfit_0 and l_isUIFullView_0 then
            if v61() then
                v98.props.setFullView(v98.props.avatarExperienceAnalytics, v98.props.avatarRoute.opaque.name, v42.None);
                return;
            else
                v98.props.setFullView(v98.props.avatarExperienceAnalytics, l_AvatarScreen_0.AvatarEditor, v42.None);
            end;
        end;
        return;
    end;
end;
v69.isOutfit = function(v119) --[[ Line: 462 ]] --[[ Name: isOutfit ]]
    return v119.props.isOutfit;
end;
v69.wasCreatedInExperience = function(v120) --[[ Line: 466 ]] --[[ Name: wasCreatedInExperience ]]
    local l_outfitInfo_3 = v120.props.outfitInfo;
    return l_outfitInfo_3 and l_outfitInfo_3.creatingUniverseId ~= nil and string.len(l_outfitInfo_3.creatingUniverseId) > 0;
end;
v69.shouldProvideControlsToViewItemDetails = function(v122) --[[ Line: 473 ]] --[[ Name: shouldProvideControlsToViewItemDetails ]]
    if v122:isOutfit() and not v122:wasCreatedInExperience() then
        return false;
    elseif not v122.props.isWearingAssetOrOutfit then
        return false;
    else
        return true;
    end;
end;
v69.renderDetailsButton = function(v123, _, _) --[[ Line: 490 ]] --[[ Name: renderDetailsButton ]]
    -- upvalues: v66 (copy), v9 (copy), v30 (copy)
    if not v123:shouldProvideControlsToViewItemDetails() then
        return nil;
    elseif v66 then
        return nil;
    else
        return v9.createElement(v30, {
            activateButton = v123.activateDetailsButton
        });
    end;
end;
v69.render = function(v126) --[[ Line: 507 ]] --[[ Name: render ]]
    -- upvalues: l_withLocalization_0 (copy), l_withStyle_0 (copy)
    return l_withLocalization_0({
        more = "CommonUI.Features.Label.More"
    })(function(v127) --[[ Line: 510 ]]
        -- upvalues: l_withStyle_0 (ref), v126 (copy)
        return l_withStyle_0(function(v128) --[[ Line: 511 ]]
            -- upvalues: v126 (ref), v127 (copy)
            return v126:renderWithProviders(v127, v128);
        end);
    end);
end;
v69.renderWithProviders = function(v129, v130, v131) --[[ Line: 517 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v12 (copy), l_AddOutfitButton_0 (copy), v9 (copy), l_SaveTile_0 (copy), l_Images_0 (copy), v31 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v39 (copy), v36 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), v10 (copy), l_CatalogItemCard_0 (copy), l_Focusable_0 (copy), l_ItemTile_0 (copy)
    local l_itemId_1 = v129.props.itemId;
    local l_name_0 = v129.props.name;
    local l_thumbnail_0 = v129.props.thumbnail;
    local l_isWearingAssetOrOutfit_1 = v129.props.isWearingAssetOrOutfit;
    local l_itemData_1 = v129.props.itemData;
    return v12.withFocusController(function(v137) --[[ Line: 524 ]]
        -- upvalues: l_itemId_1 (copy), l_AddOutfitButton_0 (ref), v9 (ref), l_SaveTile_0 (ref), l_Images_0 (ref), v129 (copy), v31 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v39 (ref), l_isWearingAssetOrOutfit_1 (copy), v12 (ref), l_itemData_1 (copy), v36 (ref), l_CatalogItemCardStatusIconTypeEnum_0 (ref), v10 (ref), l_CatalogItemCard_0 (ref), l_Focusable_0 (ref), l_ItemTile_0 (ref), l_name_0 (copy), l_thumbnail_0 (copy), v130 (copy), v131 (copy)
        if l_itemId_1 == l_AddOutfitButton_0 then
            return v9.createElement(l_SaveTile_0, {
                thumbnail = l_Images_0["icons/menu/customize"], 
                onActivated = function() --[[ Line: 528 ]] --[[ Name: onActivated ]]
                    -- upvalues: v129 (ref), v31 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v137 (copy)
                    v129:openCreateOrUpdateCostumeMenu(function() --[[ Line: 529 ]]
                        -- upvalues: v129 (ref), v31 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v137 (ref)
                        local v138 = v129.props.lastInputGroup == v31.InputType.Gamepad;
                        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v138 then
                            v137.captureFocus();
                        end;
                    end);
                end, 
                thumbnailTransparency = 0, 
                [v9.Ref] = v129.addOutfitButtonRef
            });
        else
            local v139 = if v129.props.categoryInfo.PageType == v39.PageType.Emotes then l_isWearingAssetOrOutfit_1 and "Feature.Avatar.Action.UnslotEmote" or "Feature.Avatar.Action.SlotEmote" else nil;
            local v140 = v129:shouldProvideControlsToViewItemDetails();
            local v141 = {
                SelectSlot = v12.Input.onBegin(Enum.KeyCode.ButtonA, v129.onItemClick, {
                    key = v139
                }), 
                MoreDetails = if v140 then v12.Input.onBegin(Enum.KeyCode.ButtonX, v129.activateDetailsButton, {
                    key = "CommonUI.Features.Label.More"
                }) else nil
            };
            local v142 = 0;
            local v143 = nil;
            if not v129.props.categoryInfo.HideTextUnderTile then
                v142 = v39.ItemTileTitleMaxLines;
                v143 = v129.props.titleFontStyle;
            end;
            if l_itemData_1 and v36.isModerationPendingOrRejected(l_itemData_1.moderationStatus) then
                local v144 = if l_itemData_1.moderationStatus == Enum.ModerationStatus.NotReviewed then l_CatalogItemCardStatusIconTypeEnum_0.PendingModeration else l_CatalogItemCardStatusIconTypeEnum_0.Moderated;
                return v10.createElement(l_CatalogItemCard_0, {
                    Size = UDim2.fromScale(1, 1), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    isSelected = l_isWearingAssetOrOutfit_1, 
                    onActivated = v129.onItemClick, 
                    ref = v129.textButtonRef, 
                    itemStatus = {
                        type = "placeholder", 
                        iconType = v144
                    }
                });
            else
                return v9.createElement(l_Focusable_0[l_ItemTile_0], {
                    LayoutOrder = v129.props.layoutOrder, 
                    isSelected = l_isWearingAssetOrOutfit_1, 
                    itemIconType = v129:getItemIconType(), 
                    onActivated = v129.onItemClick, 
                    name = l_name_0, 
                    titleTextLineCount = v142, 
                    titleFontStyle = v143, 
                    thumbnail = l_thumbnail_0, 
                    renderTileInset = function() --[[ Line: 594 ]] --[[ Name: renderTileInset ]]
                        -- upvalues: v129 (ref), v130 (ref), v131 (ref)
                        return v129:renderDetailsButton(v130, v131);
                    end, 
                    inputBindings = v141, 
                    statusStyle = v129:getItemStatusStyle(), 
                    key = l_itemId_1, 
                    textButtonRef = v129.textButtonRef, 
                    [v9.Ref] = v129.thumbnailRef, 
                    [v10.Tag] = v129.props.impressionsTag
                });
            end;
        end;
    end);
end;
v69.openCreateOrUpdateCostumeMenu = function(v145, v146) --[[ Line: 609 ]] --[[ Name: openCreateOrUpdateCostumeMenu ]]
    -- upvalues: l_AvatarScreen_0 (copy)
    local v147 = v145.addOutfitButtonRef:getValue();
    if not v147 then
        return;
    else
        local v148 = v147.AbsolutePosition + v147.AbsoluteSize * Vector2.new(0.5, 0.5);
        local function v149() --[[ Line: 617 ]]
            -- upvalues: v145 (copy), l_AvatarScreen_0 (ref), v148 (copy), v146 (copy)
            v145.props.navigation.navigate(l_AvatarScreen_0.CreateOrUpdateOutfitMenu, {
                saveTilePosition = v148, 
                onOverlayClosed = v146
            });
        end;
        v145.props.navigateWithLock(v149);
        return;
    end;
end;
v69.checkFetchInfo = function(v150) --[[ Line: 626 ]] --[[ Name: checkFetchInfo ]]
    -- upvalues: l_AddOutfitButton_0 (copy), v39 (copy)
    if v150:isOutfit() then
        return;
    else
        local l_itemId_2 = v150.props.itemId;
        if l_itemId_2 == l_AddOutfitButton_0 then
            return;
        else
            if l_itemId_2 and not v150.props.name then
                v150.props.fetchItemInfo(v150.props.networking, v150.props.appAnalytics, l_itemId_2, v39.ItemType.Asset);
            end;
            return;
        end;
    end;
end;
v69.setImpressionAttributes = function(v152) --[[ Line: 642 ]] --[[ Name: setImpressionAttributes ]]
    -- upvalues: v56 (copy), v55 (copy)
    local v153 = v152.thumbnailRef and v152.thumbnailRef:getValue();
    if v152.props.impressionsTag and v153 then
        v153:SetAttribute(v152.props.impressionsTag, v152.props.itemId);
        local v154 = v56[v152.props.impressionsSchema];
        v55.writeItemAttributes(v154, v153, v152.props);
    end;
end;
v69.addUnifiedEventLogging = function(v155) --[[ Line: 652 ]] --[[ Name: addUnifiedEventLogging ]]
    -- upvalues: l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), v36 (copy), l_FFlagAXNegativeAvatarSequenceFeatures_0 (copy), l_UnifiedEventLogConstants_0 (copy)
    l_addUnifiedEventLogging_0(v155.textButtonRef, {
        action = if v155.props.isWearingAssetOrOutfit then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
        itemId = v155.props.itemId, 
        itemType = if v155.props.itemType == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
        assetType = v155.props.itemData and v155.props.itemData.assetType or nil, 
        gridPositionRow = if v155.props.gridInformation then v155.props.gridInformation.row else nil, 
        gridPositionColumn = if v155.props.gridInformation then v155.props.gridInformation.column else nil, 
        category = if v155.props.categoryInfo.Category then v36.getAvatarEditorCategoryInfo(v155.props.categoryInfo.Category).Name else nil, 
        subcategory = if v155.props.categoryInfo.Category and v155.props.categoryInfo.Subcategory then v36.getAvatarEditorCategoryInfo(v155.props.categoryInfo.Category, v155.props.categoryInfo.Subcategory).Name else nil, 
        isOwnedItem = l_FFlagAXNegativeAvatarSequenceFeatures_0 and true or nil
    }, {
        hasDeferredActions = true, 
        sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
    });
end;
v69.didUpdate = function(v156, v157) --[[ Line: 680 ]] --[[ Name: didUpdate ]]
    v156:setImpressionAttributes();
    v156:addUnifiedEventLogging();
    if v157.itemId == v156.props.itemId then
        return;
    else
        v156:checkFetchInfo();
        return;
    end;
end;
v69.didMount = function(v158) --[[ Line: 695 ]] --[[ Name: didMount ]]
    v158:setImpressionAttributes();
    v158:addUnifiedEventLogging();
    v158:checkFetchInfo();
end;
v69 = l_RoactServices_0.connect({
    appAnalytics = v18, 
    analytics = v28, 
    catalogAnalytics = v46, 
    avatarExperienceAnalytics = v29, 
    networking = v19
})(v69);
v69 = v24((v23((v22((l_withNavigation_0(v11.connect(function(v159, v160) --[[ Line: 711 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v36 (copy), v64 (copy), v39 (copy), v38 (copy), v60 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v25 (copy), l_AvatarScreen_0 (copy), v42 (copy), v61 (copy), v54 (copy)
    local l_itemId_3 = v160.itemId;
    local v162 = v36.getAvatarEditorCategoryInfoFromState(v159);
    local v163 = v159.AvatarExperience.AvatarEditor.OutfitInfos[l_itemId_3];
    local v164 = v64 and true or nil;
    local v165 = nil;
    local v166 = nil;
    local v167 = nil;
    local v168 = if v160.isOutfit then v39.ItemType.Bundle else v39.ItemType.Asset;
    local v169 = v38(v159.AvatarExperience.Common, v160.itemId, v168);
    local v170 = if v163 then v163.isEditable else false;
    local v171 = if v64 then v60(v159) else nil;
    if l_itemId_3 then
        if v160.isOutfit then
            v166 = v163 and v163.name or nil;
            local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
            v167 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_3, l_Outfit_0, 150);
            if v163 then
                v167 = v167 .. "&filters=" .. v163.updateCounter;
                if v36.isModerationPendingOrRejected(v163.moderationStatus) then
                    v167 = v25.BrokenAvatarThumbnail;
                end;
            end;
            v164 = if v64 then not v171 else nil;
        else
            v165 = v169 and v169.assetType or nil;
            v166 = v169 and v169.name or nil;
            local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
            v167 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_3, l_Asset_0, 150);
            if v169 and v169.outfitModerationStatus then
                v167 = v167 .. ("&filters=__%*__"):format(v169.outfitModerationStatus);
            end;
            if v169 and v169.moderationStatus then
                v167 = v167 .. "&filters=" .. (v169.updateCounter or 0);
            end;
            v164 = if v64 then not v169 or not v171 else nil;
        end;
    end;
    local l_AvatarType_0 = v159.AvatarExperience.AvatarEditor.Character.AvatarType;
    local v175 = v159.AvatarExperience.Common.FullView[l_AvatarScreen_0.AvatarEditor] == v42.UIFullView;
    if v61() then
        v175 = v159.AvatarExperience.Common.FullView[v160.avatarRoute.opaque.name] == v42.UIFullView;
    end;
    return {
        itemData = v169, 
        itemType = v168, 
        isEditable = v170, 
        assetTypeId = v165, 
        name = v166, 
        thumbnail = v167, 
        isUIFullView = v175, 
        outfitInfo = v163, 
        categoryInfo = v162, 
        avatarType = l_AvatarType_0, 
        hasAvatarData = if v64 then v171 else v60(v159), 
        isPortrait = v54(v159), 
        disabled = if v64 then v164 else nil
    };
end, function(v176) --[[ Line: 787 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v32 (copy), v35 (copy), v33 (copy), v34 (copy), v41 (copy), v44 (copy), v45 (copy)
    return {
        fetchItemInfo = function(v177, v178, v179, v180) --[[ Line: 789 ]] --[[ Name: fetchItemInfo ]]
            -- upvalues: v176 (copy), v32 (ref)
            return v176(v32(v177, v178, v179, v180));
        end, 
        toggleEquipAsset = function(v181, v182, v183) --[[ Line: 792 ]] --[[ Name: toggleEquipAsset ]]
            -- upvalues: v176 (copy), v35 (ref)
            return v176(v35(v181, v182, v183));
        end, 
        equipOutfitThunk = function(v184, v185, v186, v187) --[[ Line: 795 ]] --[[ Name: equipOutfitThunk ]]
            -- upvalues: v176 (copy), v33 (ref)
            local v188 = {
                outfitInfo = v184, 
                analytics = v185, 
                navigation = v186, 
                isSelected = v187
            };
            return v176(v33(v188));
        end, 
        sendAnalytics = function(v189, v190, v191) --[[ Line: 804 ]] --[[ Name: sendAnalytics ]]
            -- upvalues: v176 (copy), v34 (ref)
            v176(v34(v189, v190, v191));
        end, 
        setFullView = function(v192, v193, v194) --[[ Line: 807 ]] --[[ Name: setFullView ]]
            -- upvalues: v176 (copy), v41 (ref)
            v176(v41(v192, v193, v194));
        end, 
        navigateWithLock = function(v195) --[[ Line: 810 ]] --[[ Name: navigateWithLock ]]
            -- upvalues: v176 (copy), v44 (ref)
            v176(v44(v195));
        end, 
        openItemDetails = function(v196) --[[ Line: 813 ]] --[[ Name: openItemDetails ]]
            -- upvalues: v176 (copy), v45 (ref)
            v176(v45(v196));
        end
    };
end)(v69), nil)))))));
if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
    return v69;
else
    return function(v197) --[[ Line: 830 ]]
        -- upvalues: v12 (copy), v9 (copy), v69 (ref), v15 (copy)
        return v12.withFocusController(function(v198) --[[ Line: 831 ]]
            -- upvalues: v9 (ref), v69 (ref), v15 (ref), v197 (copy)
            return v9.createElement(v69, v15.Dictionary.join(v197, {
                focusController = v198
            }));
        end);
    end;
end;