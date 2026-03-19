local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.UIBlox);
local l_ItemTile_0 = v2.Tile.ItemTile;
local l_ItemTileEnums_0 = v2.Tile.ItemTileEnums;
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Packages.tutils);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v7.Focusable;
local l_Logging_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Logging;
local v10 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v10.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v10.Utils.getRbxthumbWithTypeSizeAndOptions;
local l_UnifiedEventLogEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogEnums;
local l_addUnifiedEventLogging_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).addUnifiedEventLogging;
local l_UnifiedEventLogConstants_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).UnifiedEventLogConstants;
local l_FFlagAXNegativeAvatarSequenceFeatures_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXNegativeAvatarSequenceFeatures;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v18 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v18.Enums.AvatarScreen;
local l_useAvatarRoute_0 = v18.AvatarRoute.Hooks.useAvatarRoute;
local v21 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useSelector_0 = v21.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v21.Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local v25 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local l_useTableWrappedCallbackRef_0 = v25.Utils.RoactGamepadMigration.useTableWrappedCallbackRef;
local l_CatalogItemCard_0 = v25.Components.CatalogItemCard.CatalogItemCard;
local l_CatalogItemCardItemInfoEnum_0 = v25.Components.CatalogItemCard.CatalogItemCardItemInfoEnum;
local l_ItemCardThumbnail_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail;
local l_CatalogItemCardStatusIconTypeEnum_0 = v25.Components.CatalogItemCard.CatalogItemCardStatusIconTypeEnum;
local v31 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_usePreferredInput_0 = v31.usePreferredInput;
local l_useLastInput_0 = v31.useLastInput;
local l_useIsSpatial_0 = v31.useIsSpatial;
local l_Input_0 = v31.Input;
local v36 = require(l_Modules_0.LuaApp.Services.RoactAnalytics);
local v37 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v38 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.logOnOverlayClosed);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v40 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v41 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v42 = require(l_Modules_0.AvatarExperience.Common.Services.Analytics);
local v43 = require(l_Modules_0.AvatarExperience.Common.Components.ItemTileDetailButton);
local v44 = require(l_Modules_0.AvatarExperience.Catalog.Thunks.FetchAssetOrBundleInfo);
local v45 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.EquipOutfit);
local v46 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendAnalytics);
local v47 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset);
local v48 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v49 = require(l_Modules_0.AvatarExperience.Catalog.CatalogUtils);
local v50 = require(l_Modules_0.AvatarExperience.Common.Selectors.ItemData);
local v51 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v52 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v53 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v54 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
local v55 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v56 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local v57 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v58 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v59 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local v60 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.ImpressionsUtil);
local v61 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsSchema);
local v62 = require(l_Modules_0.AvatarExperience.Common.Context.useAdaptiveScrolling);
local v63 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v64 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v65 = require(script.Parent.useItemCardFocusNavigationBindings);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local v70 = game:DefineFastFlag("AvatarEditorItemCardWaitForData", false);
local v153 = v5.memo(function(v71) --[[ Line: 108 ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), v62 (copy), v5 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), l_useRoactService_0 (copy), v36 (copy), v41 (copy), v58 (copy), v42 (copy), v37 (copy), l_usePreferredInput_0 (copy), v64 (copy), l_useTokens_0 (copy), v48 (copy), v51 (copy), v50 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v40 (copy), l_AvatarScreen_0 (copy), v54 (copy), v52 (copy), v63 (copy), v59 (copy), l_ItemTileEnums_0 (copy), v70 (copy), l_useSelector_0 (copy), v6 (copy), l_Input_0 (copy), v38 (copy), v56 (copy), v47 (copy), v45 (copy), l_Logging_0 (copy), v46 (copy), v53 (copy), v55 (copy), v49 (copy), v57 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), v61 (copy), v60 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXNegativeAvatarSequenceFeatures_0 (copy), l_UnifiedEventLogConstants_0 (copy), v44 (copy), v65 (copy), l_useTableWrappedCallbackRef_0 (copy), v43 (copy), l_useLocalization_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_CatalogItemCard_0 (copy), l_CatalogItemCardItemInfoEnum_0 (copy), l_ItemCardThumbnail_0 (copy), l_ItemTile_0 (copy), l_Focusable_0 (copy)
    local v72 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
    local v73 = l_useDispatch_0();
    local v74 = l_useNavigation_0();
    local v75 = l_useAvatarRoute_0();
    local v76 = v62();
    local v77 = v5.useRef(nil);
    local v78 = v5.useRef(nil);
    local v79 = l_useLastInput_0();
    local v80 = l_useIsSpatial_0();
    local v81 = l_useRoactService_0(v36);
    local v82 = l_useRoactService_0(v41);
    local v83 = l_useRoactService_0(v58);
    local v84 = l_useRoactService_0(v42);
    local v85 = l_useRoactService_0(v37);
    local v86 = l_usePreferredInput_0();
    local v87 = if v64() then l_useTokens_0() else nil;
    local l_itemId_0 = v71.itemId;
    local l_isOutfit_0 = v71.isOutfit;
    local v90 = if v71.isWearingAssetOrOutfit then v71.isWearingAssetOrOutfit else false;
    local v110 = v5.useCallback(function(v91) --[[ Line: 130 ]]
        -- upvalues: v48 (ref), l_itemId_0 (copy), l_isOutfit_0 (copy), v51 (ref), v50 (ref), l_Constants_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v40 (ref), l_AvatarScreen_0 (ref), v54 (ref), v64 (ref), v75 (copy), v52 (ref), v71 (copy), v90 (copy), v63 (ref), v59 (ref), l_ItemTileEnums_0 (ref), v70 (ref)
        local v92 = v48.getAvatarEditorCategoryInfoFromState(v91);
        local v93 = v91.AvatarExperience.AvatarEditor.OutfitInfos[l_itemId_0];
        local v94 = nil;
        local v95 = nil;
        local v96 = nil;
        local v97 = if l_isOutfit_0 then v51.ItemType.Bundle else v51.ItemType.Asset;
        local v98 = v50(v91.AvatarExperience.Common, l_itemId_0, v97);
        if l_itemId_0 then
            if l_isOutfit_0 then
                v95 = not v92.HideTextUnderTile and v93 and v93.name or nil;
                local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
                v96 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, l_Outfit_0, 150);
                if v93 then
                    v96 = v96 .. "&filters=" .. v93.updateCounter;
                    if v48.isModerationPendingOrRejected(v93.moderationStatus) then
                        v96 = v40.BrokenAvatarThumbnail;
                    end;
                end;
            else
                v94 = v98 and v98.assetType or nil;
                v95 = not v92.HideTextUnderTile and v98 and v98.name or nil;
                local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
                v96 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, l_Asset_0, 150);
                if v98 and v98.outfitModerationStatus then
                    v96 = v96 .. ("&filters=__%*__"):format(v98.outfitModerationStatus);
                end;
                if v98 and v98.moderationStatus then
                    v96 = v96 .. "&filters=" .. (v98.updateCounter or 0);
                end;
            end;
        end;
        local l_AvatarType_0 = v91.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v102 = v91.AvatarExperience.Common.FullView[l_AvatarScreen_0.AvatarEditor] == v54.UIFullView;
        if v64() then
            v102 = v91.AvatarExperience.Common.FullView[v75.opaque.name] == v54.UIFullView;
        end;
        local v103 = if l_isOutfit_0 and v93 then v48.getItemStatusStyleFromOutfit(v93) else nil;
        local v104 = if l_isOutfit_0 and v93 then v48.getItemIconTypeFromOutfit(v93) else nil;
        local v105 = if l_isOutfit_0 then v52.Outfits else v94;
        local v106 = if v93 then v93.isEditable else false;
        local v107 = not (v93 and v93.outfitType == v51.OutfitTypes.DynamicHead and not v106) and not v71.hasItemFromCurrentPageEquipped;
        local v108 = v93 and v93.creatingUniverseId ~= nil and string.len(v93.creatingUniverseId) > 0;
        local v109 = v90 and not (l_isOutfit_0 and not v108);
        return {
            itemData = v98, 
            itemType = v97, 
            modifiedAssetType = v105, 
            name = v95, 
            thumbnail = v96, 
            isUIFullView = v102, 
            outfitInfo = v93, 
            categoryInfo = v92, 
            avatarTypeIsR6 = l_AvatarType_0 == v51.AvatarType.R6, 
            hasAvatarData = v63(v91), 
            isPortrait = v59(v91), 
            itemStatusStyle = v103, 
            isEquippable = v103 == nil, 
            iconType = if v104 == l_ItemTileEnums_0.ItemIconType.Bundle then nil else v104, 
            shouldConfirmEquip = v107, 
            canShowDetails = v109, 
            dataLoaded = if v70 then if l_isOutfit_0 then v93 else v98 else nil
        };
    end, {
        l_itemId_0, 
        l_isOutfit_0, 
        v75
    });
    local v111 = l_useSelector_0(v110, v6.deepEqual);
    local l_categoryInfo_0 = v111.categoryInfo;
    local l_itemType_0 = v111.itemType;
    local l_itemData_0 = v111.itemData;
    local v115 = if l_itemData_0 then l_itemData_0.assetType else nil;
    local l_isPortrait_0 = v111.isPortrait;
    local v117 = false;
    if v79 == l_Input_0.Directional then
        v117 = not v80;
    end;
    local v118 = v5.useCallback(function() --[[ Line: 238 ]]
        -- upvalues: v38 (ref), v117 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v72 (copy)
        v38("ItemCard", v117);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v117 then
            v72.captureFocus();
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v72, 
        v117
    });
    local v122 = v5.useCallback(function(v119, v120) --[[ Line: 245 ]]
        -- upvalues: v76 (copy), v77 (copy)
        if not v76 then
            return;
        elseif v119 then
            v76.setSelectedItemInstance(nil);
            return;
        else
            local l_current_0 = v77.current;
            if l_current_0 and v120 then
                v76.setSelectedItemInstance(l_current_0);
            end;
            return;
        end;
    end, {
        v76
    });
    local v125 = v5.useCallback(function() --[[ Line: 266 ]]
        -- upvalues: l_categoryInfo_0 (copy), v51 (ref), v73 (copy), v56 (ref), v74 (copy), l_AvatarScreen_0 (ref), v118 (copy)
        local v123 = false;
        local v124 = nil;
        if l_categoryInfo_0.PageType == v51.PageType.Animation then
            v123 = true;
            v124 = "Feature.Avatar.Message.R15AnimationsPrompt";
        elseif l_categoryInfo_0.PageType == v51.PageType.Emotes then
            v123 = true;
            v124 = "Feature.Avatar.Message.R15EmotesPrompt";
        end;
        if v123 then
            v73(v56(function() --[[ Line: 286 ]]
                -- upvalues: v74 (ref), l_AvatarScreen_0 (ref), v118 (ref), v124 (ref)
                v74.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                    onOverlayClosed = v118, 
                    bodyTextKey = v124
                });
            end));
        end;
    end, {
        v74, 
        v73, 
        v118
    });
    local v134 = v5.useCallback(function() --[[ Line: 296 ]]
        -- upvalues: v70 (ref), v111 (copy), v125 (copy), v51 (ref), v90 (copy), v74 (copy), l_AvatarScreen_0 (ref), v118 (copy), v73 (copy), v47 (ref), l_itemId_0 (copy), v122 (copy), v56 (ref), l_isOutfit_0 (copy), v45 (ref), v82 (copy), l_Logging_0 (ref), v46 (ref), v64 (ref), v53 (ref), v84 (copy), v75 (copy), v54 (ref)
        if v70 and not v111.dataLoaded then
            return;
        else
            local l_modifiedAssetType_0 = v111.modifiedAssetType;
            if v111.avatarTypeIsR6 then
                v125();
            end;
            local v127 = l_modifiedAssetType_0 == v51.AssetTypeIdStrings.HairAccessory;
            local v128 = false;
            if v51.LayeredAssetTypes[l_modifiedAssetType_0] ~= nil then
                v128 = not v127;
            end;
            if v111.avatarTypeIsR6 and not v90 and v128 then
                v73(v56(function() --[[ Line: 317 ]]
                    -- upvalues: v74 (ref), l_AvatarScreen_0 (ref), v118 (ref), v73 (ref), v47 (ref), l_modifiedAssetType_0 (copy), l_itemId_0 (ref), v122 (ref), v90 (ref)
                    v74.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        onOverlayClosed = v118, 
                        bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                        onSwitchSelected = function() --[[ Line: 321 ]] --[[ Name: onSwitchSelected ]]
                            -- upvalues: v73 (ref), v47 (ref), l_modifiedAssetType_0 (ref), l_itemId_0 (ref), v74 (ref), v122 (ref), v90 (ref)
                            local v129 = v73(v47(l_modifiedAssetType_0, l_itemId_0, v74));
                            v122(v90, v129);
                        end
                    });
                end));
                return;
            else
                if l_isOutfit_0 then
                    local l_outfitInfo_0 = v111.outfitInfo;
                    if l_outfitInfo_0 then
                        if v111.shouldConfirmEquip then
                            v73(v56(function() --[[ Line: 335 ]]
                                -- upvalues: v74 (ref), l_AvatarScreen_0 (ref), v118 (ref), l_outfitInfo_0 (copy), v122 (ref), v90 (ref)
                                v74.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
                                    onOverlayClosed = v118, 
                                    outfitInfo = l_outfitInfo_0, 
                                    onEquip = function(v131) --[[ Line: 339 ]] --[[ Name: onEquip ]]
                                        -- upvalues: v122 (ref), v90 (ref)
                                        v122(v90, v131);
                                    end
                                });
                            end));
                        else
                            local v132 = v73(v45({
                                outfitInfo = l_outfitInfo_0, 
                                analytics = v82, 
                                navigation = v74, 
                                isSelected = v90
                            }));
                            v122(v90, v132);
                        end;
                    else
                        l_Logging_0.warn("Tried equipping a costume without any costume data!");
                    end;
                else
                    if l_modifiedAssetType_0 then
                        v73(v46(if not v90 then v82.equipAsset else v82.unequipAsset, l_itemId_0, l_modifiedAssetType_0));
                    end;
                    local v133 = v73(v47(l_modifiedAssetType_0, l_itemId_0, v74));
                    v122(v90, v133);
                end;
                if not v90 and v111.isUIFullView then
                    if v64() then
                        v73(v53(v84, v75.opaque.name, v54.None));
                        return;
                    else
                        v73(v53(v84, l_AvatarScreen_0.AvatarEditor, v54.None));
                    end;
                end;
                return;
            end;
        end;
    end, {
        v84, 
        v90, 
        v111.isUIFullView, 
        v111.modifiedAssetType, 
        v111.avatarTypeIsR6, 
        v111.shouldConfirmEquip, 
        v111.outfitInfo, 
        v82, 
        l_itemId_0, 
        v122, 
        v125, 
        v74, 
        v73, 
        v118, 
        if v70 then l_isOutfit_0 else nil, 
        if v70 then v111.dataLoaded else nil
    });
    local v139 = v5.useCallback(function() --[[ Line: 401 ]]
        -- upvalues: l_isOutfit_0 (copy), l_itemId_0 (copy), l_isPortrait_0 (copy), v71 (copy), v55 (ref), v74 (copy), l_AvatarScreen_0 (ref), v73 (copy), v56 (ref), v49 (ref), l_itemType_0 (copy), l_itemData_0 (copy), v83 (copy), v75 (copy), v57 (ref)
        if l_isOutfit_0 then
            local v135 = {
                outfitId = l_itemId_0, 
                ZIndex = 2, 
                showFullWithNoPeekView = not l_isPortrait_0, 
                renderBottomBar = false, 
                NextSelectionLeft = not l_isPortrait_0 and v71.resultsListRef or nil, 
                outfitDetailsPeekViewRefs = v71.itemDetailsPeekViewRefs
            };
            v73(v56(function() --[[ Line: 413 ]]
                -- upvalues: v55 (ref), v74 (ref), l_AvatarScreen_0 (ref), v135 (copy)
                v55.closeFiltersAndItemDetails(v74);
                v55.closeTryOnManager(v74);
                v74.navigate(l_AvatarScreen_0.OutfitDetails, v135);
            end));
            return;
        else
            local v136 = v49.GetItemSubType(l_itemType_0, l_itemData_0);
            local v137 = if l_itemData_0 then l_itemData_0.priceInRobux else nil;
            local v138 = {
                itemId = l_itemId_0, 
                itemType = l_itemType_0, 
                itemSubType = v136, 
                priceInRobux = v137, 
                isPortrait = l_isPortrait_0, 
                catalogAnalytics = v83, 
                avatarRoute = v75, 
                navigation = v74, 
                itemDetailsPeekViewRefs = v71.itemDetailsPeekViewRefs, 
                resultsListRef = v71.resultsListRef, 
                mountAsFullView = nil, 
                showFullWithNoPeekView = true, 
                closePreviousItemDetails = true
            };
            v73(v57(v138));
            return;
        end;
    end, {
        v73, 
        v74, 
        l_isOutfit_0, 
        l_itemId_0, 
        v83, 
        v75, 
        l_itemType_0, 
        l_itemData_0, 
        v71.itemDetailsPeekViewRefs, 
        v71.resultsListRef
    });
    local v141 = v5.useCallback(function() --[[ Line: 459 ]]
        -- upvalues: l_itemData_0 (copy), v48 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), v115 (copy), v51 (ref), v74 (copy), l_AvatarScreen_0 (ref), l_itemType_0 (copy), v111 (copy), v134 (copy), v139 (copy)
        if l_itemData_0 and v48.isModerationPendingOrRejected(l_itemData_0.moderationStatus) then
            local v140 = nil;
            if l_FFlagAXModeratedItemsFlow_0 then
                v140 = if v115 then v51.AssetTypeLocalized[v115] else "Feature.Catalog.Label.Bundle";
            end;
            v74.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = {
                    {
                        category = l_itemType_0, 
                        categoryLoc = v140, 
                        itemName = l_itemData_0.name
                    }
                }, 
                messageType = v48.getMessageTypeFromModerationStatus(l_itemData_0.moderationStatus)
            });
            return;
        elseif v111.isEquippable then
            v134();
            return;
        else
            v139();
            return;
        end;
    end, {
        v111.isEquippable, 
        v139, 
        v134
    });
    local v142 = v5.useRef(nil);
    v5.useEffect(function() --[[ Line: 489 ]]
        -- upvalues: v77 (copy), v71 (copy), l_itemId_0 (copy), v61 (ref), v60 (ref), l_categoryInfo_0 (copy), l_addUnifiedEventLogging_0 (ref), v78 (copy), v90 (copy), l_UnifiedEventLogEnums_0 (ref), l_itemType_0 (copy), v115 (copy), v48 (ref), l_FFlagAXNegativeAvatarSequenceFeatures_0 (ref), l_UnifiedEventLogConstants_0 (ref), l_isOutfit_0 (copy), v142 (copy), v52 (ref), v111 (copy), v73 (copy), v44 (ref), v85 (copy), v81 (copy), v51 (ref)
        local l_current_1 = v77.current;
        if v71.impressionsTag and l_current_1 then
            l_current_1:SetAttribute(v71.impressionsTag, l_itemId_0);
            local v144 = v61[v71.impressionsSchema];
            v60.writeItemAttributes(v144, l_current_1, v71);
        end;
        local l_Category_0 = l_categoryInfo_0.Category;
        local l_Subcategory_0 = l_categoryInfo_0.Subcategory;
        l_addUnifiedEventLogging_0(v78, {
            action = if v90 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
            itemId = l_itemId_0, 
            itemType = if l_itemType_0 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
            assetType = v115, 
            gridPositionRow = if v71.gridInformation then v71.gridInformation.row else nil, 
            gridPositionColumn = if v71.gridInformation then v71.gridInformation.column else nil, 
            category = if l_Category_0 then v48.getAvatarEditorCategoryInfo(l_Category_0).Name else nil, 
            subcategory = if l_Category_0 and l_Subcategory_0 then v48.getAvatarEditorCategoryInfo(l_Category_0, l_Subcategory_0).Name else nil, 
            isOwnedItem = l_FFlagAXNegativeAvatarSequenceFeatures_0 and true or nil
        }, {
            sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
        });
        if not l_itemId_0 or l_isOutfit_0 or v142.current == l_itemId_0 or l_itemId_0 == v52.AddOutfitButton then
            return;
        else
            v142.current = l_itemId_0;
            if not v111.name then
                v73(v44(v85, v81, l_itemId_0, v51.ItemType.Asset));
            end;
            return;
        end;
    end, {
        v73, 
        v85, 
        v81, 
        l_itemId_0, 
        v111.name, 
        l_isOutfit_0, 
        l_categoryInfo_0.Category, 
        l_categoryInfo_0.Subcategory, 
        l_itemType_0, 
        v90, 
        v71.gridInformation, 
        v115
    });
    local v147 = v65({
        onOpenEditorDetailsPage = if v111.canShowDetails then v139 else nil, 
        onSelectItem = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v141, 
        onSlotEmote = if not (l_categoryInfo_0.PageType == v51.PageType.Emotes) or v90 then nil else v141, 
        onUnslotEmote = if l_categoryInfo_0.PageType == v51.PageType.Emotes and v90 then v141 else nil
    }, v77);
    local v148 = l_useTableWrappedCallbackRef_0(v147);
    local v149 = v5.useCallback(function() --[[ Line: 560 ]]
        -- upvalues: v111 (copy), v86 (copy), l_Input_0 (ref), v5 (ref), v43 (ref), v139 (copy)
        if v111.canShowDetails and v86 ~= l_Input_0.Directional then
            return v5.createElement(v43, {
                activateButton = v139
            });
        else
            return nil;
        end;
    end, {
        v139, 
        v111.canShowDetails, 
        v86
    });
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v150 = l_useLocalization_0({
            details = "Feature.Avatar.Label.DetailsButton"
        });
        local v151 = nil;
        if l_itemData_0 and v48.isModerationPendingOrRejected(l_itemData_0.moderationStatus) then
            local v152 = if l_itemData_0.moderationStatus == Enum.ModerationStatus.NotReviewed then l_CatalogItemCardStatusIconTypeEnum_0.PendingModeration else l_CatalogItemCardStatusIconTypeEnum_0.Moderated;
            v151 = {
                type = "placeholder", 
                iconType = v152
            };
        end;
        return v5.createElement(l_CatalogItemCard_0, {
            LayoutOrder = v71.layoutOrder, 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            isSelected = v90, 
            title = v111.name, 
            itemInfo = if v111.iconType == l_ItemTileEnums_0.ItemIconType.DynamicHead then l_CatalogItemCardItemInfoEnum_0.DynamicHead else nil, 
            onActivated = if l_itemId_0 and v111.hasAvatarData then v141 else nil, 
            overlayButtonText = if v111.canShowDetails then v150.details else nil, 
            onOverlayButtonActivated = if v111.canShowDetails then v139 else nil, 
            ref = v148, 
            titleTextSize = if v64() then if v71.titleFontStyle then v71.titleFontStyle else if v87 then v87.Typography.CaptionSmall else nil else nil, 
            presentationSlot = if v111.thumbnail then v5.createElement(l_ItemCardThumbnail_0, {
                url = v111.thumbnail, 
                tag = v71.impressionsTag, 
                ref = v77
            }) else nil, 
            itemStatus = v151
        });
    else
        return v5.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ItemTile_0 else l_Focusable_0[l_ItemTile_0], {
            LayoutOrder = v71.layoutOrder, 
            isSelected = v90, 
            itemIconType = v111.iconType, 
            onActivated = if l_itemId_0 and v111.hasAvatarData then v141 else nil, 
            name = v111.name, 
            titleTextLineCount = if not l_categoryInfo_0.HideTextUnderTile then v51.ItemTileTitleMaxLines else 0, 
            titleFontStyle = if not l_categoryInfo_0.HideTextUnderTile then v71.titleFontStyle else nil, 
            thumbnail = v111.thumbnail, 
            renderTileInset = v149, 
            statusStyle = v111.itemStatusStyle, 
            key = l_itemId_0, 
            textButtonRef = v78, 
            ref = v148, 
            [v5.Tag] = v71.impressionsTag
        });
    end;
end);
return (v5.memo(v153, v6.deepEqual));