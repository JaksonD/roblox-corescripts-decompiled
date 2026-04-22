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
local l_logOnOverlayClosed_0 = v18.Debug.logOnOverlayClosed;
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
local l_FullView_0 = v25.Enums.FullView;
local v55 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local l_NavigateWithLock_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Thunks.NavigateWithLock;
local v57 = require(l_Modules_0.AvatarExperience.Common.Thunks.OpenItemDetails);
local v58 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v59 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectIsPortrait);
local l_ImpressionsUtil_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.ImpressionsUtil;
local l_OrganicEventImpressionsSchema_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).ImpressionsReporter.OrganicEventImpressionsSchema;
local l_useAdaptiveScrolling_0 = v25.Hooks.useAdaptiveScrolling;
local v63 = require(l_Modules_0.AvatarExperience.Common.Selectors.selectHasAvatarData);
local v64 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v65 = require(script.Parent.useItemCardFocusNavigationBindings);
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXModeratedItemsFlow_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXModeratedItemsFlow;
local v70 = game:DefineFastFlag("AvatarEditorItemCardWaitForData", false);
local v71 = game:DefineFastFlag("AXDoNotDoubleToggleEmoteWithGamepad", false);
local v154 = v5.memo(function(v72) --[[ Line: 110 ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_useAvatarRoute_0 (copy), l_useAdaptiveScrolling_0 (copy), v5 (copy), l_useLastInput_0 (copy), l_useIsSpatial_0 (copy), l_useRoactService_0 (copy), v36 (copy), v41 (copy), v58 (copy), v42 (copy), v37 (copy), l_usePreferredInput_0 (copy), v64 (copy), l_useTokens_0 (copy), v48 (copy), v51 (copy), v50 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v40 (copy), l_AvatarScreen_0 (copy), l_FullView_0 (copy), v52 (copy), v63 (copy), v59 (copy), l_ItemTileEnums_0 (copy), v70 (copy), l_useSelector_0 (copy), v6 (copy), l_Input_0 (copy), l_logOnOverlayClosed_0 (copy), l_NavigateWithLock_0 (copy), v47 (copy), v45 (copy), l_Logging_0 (copy), v46 (copy), v53 (copy), v55 (copy), v49 (copy), v57 (copy), l_FFlagAXModeratedItemsFlow_0 (copy), l_OrganicEventImpressionsSchema_0 (copy), l_ImpressionsUtil_0 (copy), l_addUnifiedEventLogging_0 (copy), l_UnifiedEventLogEnums_0 (copy), l_FFlagAXNegativeAvatarSequenceFeatures_0 (copy), l_UnifiedEventLogConstants_0 (copy), v44 (copy), v65 (copy), v71 (copy), l_useTableWrappedCallbackRef_0 (copy), v43 (copy), l_useLocalization_0 (copy), l_CatalogItemCardStatusIconTypeEnum_0 (copy), l_CatalogItemCard_0 (copy), l_CatalogItemCardItemInfoEnum_0 (copy), l_ItemCardThumbnail_0 (copy), l_ItemTile_0 (copy), l_Focusable_0 (copy)
    local v73 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v7.useFocusController();
    local v74 = l_useDispatch_0();
    local v75 = l_useNavigation_0();
    local v76 = l_useAvatarRoute_0();
    local v77 = l_useAdaptiveScrolling_0();
    local v78 = v5.useRef(nil);
    local v79 = v5.useRef(nil);
    local v80 = l_useLastInput_0();
    local v81 = l_useIsSpatial_0();
    local v82 = l_useRoactService_0(v36);
    local v83 = l_useRoactService_0(v41);
    local v84 = l_useRoactService_0(v58);
    local v85 = l_useRoactService_0(v42);
    local v86 = l_useRoactService_0(v37);
    local v87 = l_usePreferredInput_0();
    local v88 = if v64() then l_useTokens_0() else nil;
    local l_itemId_0 = v72.itemId;
    local l_isOutfit_0 = v72.isOutfit;
    local v91 = if v72.isWearingAssetOrOutfit then v72.isWearingAssetOrOutfit else false;
    local v111 = v5.useCallback(function(v92) --[[ Line: 132 ]]
        -- upvalues: v48 (ref), l_itemId_0 (copy), l_isOutfit_0 (copy), v51 (ref), v50 (ref), l_Constants_0 (ref), l_getRbxthumbWithTypeSizeAndOptions_0 (ref), v40 (ref), l_AvatarScreen_0 (ref), l_FullView_0 (ref), v64 (ref), v76 (copy), v52 (ref), v72 (copy), v91 (copy), v63 (ref), v59 (ref), l_ItemTileEnums_0 (ref), v70 (ref)
        local v93 = v48.getAvatarEditorCategoryInfoFromState(v92);
        local v94 = v92.AvatarExperience.AvatarEditor.OutfitInfos[l_itemId_0];
        local v95 = nil;
        local v96 = nil;
        local v97 = nil;
        local v98 = if l_isOutfit_0 then v51.ItemType.Bundle else v51.ItemType.Asset;
        local v99 = v50(v92.AvatarExperience.Common, l_itemId_0, v98);
        if l_itemId_0 then
            if l_isOutfit_0 then
                v96 = not v93.HideTextUnderTile and v94 and v94.name or nil;
                local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
                v97 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, l_Outfit_0, 150);
                if v94 then
                    v97 = v97 .. "&filters=" .. v94.updateCounter;
                    if v48.isModerationPendingOrRejected(v94.moderationStatus) then
                        v97 = v40.BrokenAvatarThumbnail;
                    end;
                end;
            else
                v95 = v99 and v99.assetType or nil;
                v96 = not v93.HideTextUnderTile and v99 and v99.name or nil;
                local l_Asset_0 = l_Constants_0.RbxthumbTypes.Asset;
                v97 = l_getRbxthumbWithTypeSizeAndOptions_0(l_itemId_0, l_Asset_0, 150);
                if v99 and v99.outfitModerationStatus then
                    v97 = v97 .. ("&filters=__%*__"):format(v99.outfitModerationStatus);
                end;
                if v99 and v99.moderationStatus then
                    v97 = v97 .. "&filters=" .. (v99.updateCounter or 0);
                end;
            end;
        end;
        local l_AvatarType_0 = v92.AvatarExperience.AvatarEditor.Character.AvatarType;
        local v103 = v92.AvatarExperience.Common.FullView[l_AvatarScreen_0.AvatarEditor] == l_FullView_0.UIFullView;
        if v64() then
            v103 = v92.AvatarExperience.Common.FullView[v76.opaque.name] == l_FullView_0.UIFullView;
        end;
        local v104 = if l_isOutfit_0 and v94 then v48.getItemStatusStyleFromOutfit(v94) else nil;
        local v105 = if l_isOutfit_0 and v94 then v48.getItemIconTypeFromOutfit(v94) else nil;
        local v106 = if l_isOutfit_0 then v52.Outfits else v95;
        local v107 = if v94 then v94.isEditable else false;
        local v108 = not (v94 and v94.outfitType == v51.OutfitTypes.DynamicHead and not v107) and not v72.hasItemFromCurrentPageEquipped;
        local v109 = v94 and v94.creatingUniverseId ~= nil and string.len(v94.creatingUniverseId) > 0;
        local v110 = v91 and not (l_isOutfit_0 and not v109);
        return {
            itemData = v99, 
            itemType = v98, 
            modifiedAssetType = v106, 
            name = v96, 
            thumbnail = v97, 
            isUIFullView = v103, 
            outfitInfo = v94, 
            categoryInfo = v93, 
            avatarTypeIsR6 = l_AvatarType_0 == v51.AvatarType.R6, 
            hasAvatarData = v63(v92), 
            isPortrait = v59(v92), 
            itemStatusStyle = v104, 
            isEquippable = v104 == nil, 
            iconType = if v105 == l_ItemTileEnums_0.ItemIconType.Bundle then nil else v105, 
            shouldConfirmEquip = v108, 
            canShowDetails = v110, 
            dataLoaded = if v70 then if l_isOutfit_0 then v94 else v99 else nil
        };
    end, {
        l_itemId_0, 
        l_isOutfit_0, 
        v76
    });
    local v112 = l_useSelector_0(v111, v6.deepEqual);
    local l_categoryInfo_0 = v112.categoryInfo;
    local l_itemType_0 = v112.itemType;
    local l_itemData_0 = v112.itemData;
    local v116 = if l_itemData_0 then l_itemData_0.assetType else nil;
    local l_isPortrait_0 = v112.isPortrait;
    local v118 = false;
    if v80 == l_Input_0.Directional then
        v118 = not v81;
    end;
    local v119 = v5.useCallback(function() --[[ Line: 240 ]]
        -- upvalues: l_logOnOverlayClosed_0 (ref), v118 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v73 (copy)
        l_logOnOverlayClosed_0("ItemCard", v118);
        if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and v118 then
            v73.captureFocus();
        end;
    end, {
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v73, 
        v118
    });
    local v123 = v5.useCallback(function(v120, v121) --[[ Line: 247 ]]
        -- upvalues: v77 (copy), v78 (copy)
        if not v77 then
            return;
        elseif v120 then
            v77.setSelectedItemInstance(nil);
            return;
        else
            local l_current_0 = v78.current;
            if l_current_0 and v121 then
                v77.setSelectedItemInstance(l_current_0);
            end;
            return;
        end;
    end, {
        v77
    });
    local v126 = v5.useCallback(function() --[[ Line: 268 ]]
        -- upvalues: l_categoryInfo_0 (copy), v51 (ref), v74 (copy), l_NavigateWithLock_0 (ref), v75 (copy), l_AvatarScreen_0 (ref), v119 (copy)
        local v124 = false;
        local v125 = nil;
        if l_categoryInfo_0.PageType == v51.PageType.Animation then
            v124 = true;
            v125 = "Feature.Avatar.Message.R15AnimationsPrompt";
        elseif l_categoryInfo_0.PageType == v51.PageType.Emotes then
            v124 = true;
            v125 = "Feature.Avatar.Message.R15EmotesPrompt";
        end;
        if v124 then
            v74(l_NavigateWithLock_0(function() --[[ Line: 288 ]]
                -- upvalues: v75 (ref), l_AvatarScreen_0 (ref), v119 (ref), v125 (ref)
                v75.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                    onOverlayClosed = v119, 
                    bodyTextKey = v125
                });
            end));
        end;
    end, {
        v75, 
        v74, 
        v119
    });
    local v135 = v5.useCallback(function() --[[ Line: 298 ]]
        -- upvalues: v70 (ref), v112 (copy), v126 (copy), v51 (ref), v91 (copy), v75 (copy), l_AvatarScreen_0 (ref), v119 (copy), v74 (copy), v47 (ref), l_itemId_0 (copy), v123 (copy), l_NavigateWithLock_0 (ref), l_isOutfit_0 (copy), v45 (ref), v83 (copy), l_Logging_0 (ref), v46 (ref), v64 (ref), v53 (ref), v85 (copy), v76 (copy), l_FullView_0 (ref)
        if v70 and not v112.dataLoaded then
            return;
        else
            local l_modifiedAssetType_0 = v112.modifiedAssetType;
            if v112.avatarTypeIsR6 then
                v126();
            end;
            local v128 = l_modifiedAssetType_0 == v51.AssetTypeIdStrings.HairAccessory;
            local v129 = false;
            if v51.LayeredAssetTypes[l_modifiedAssetType_0] ~= nil then
                v129 = not v128;
            end;
            if v112.avatarTypeIsR6 and not v91 and v129 then
                v74(l_NavigateWithLock_0(function() --[[ Line: 319 ]]
                    -- upvalues: v75 (ref), l_AvatarScreen_0 (ref), v119 (ref), v74 (ref), v47 (ref), l_modifiedAssetType_0 (copy), l_itemId_0 (ref), v123 (ref), v91 (ref)
                    v75.navigate(l_AvatarScreen_0.R15UpgradePrompt, {
                        onOverlayClosed = v119, 
                        bodyTextKey = "Feature.Avatar.Label.LayeredClothingR15Warning", 
                        onSwitchSelected = function() --[[ Line: 323 ]] --[[ Name: onSwitchSelected ]]
                            -- upvalues: v74 (ref), v47 (ref), l_modifiedAssetType_0 (ref), l_itemId_0 (ref), v75 (ref), v123 (ref), v91 (ref)
                            local v130 = v74(v47(l_modifiedAssetType_0, l_itemId_0, v75));
                            v123(v91, v130);
                        end
                    });
                end));
                return;
            else
                if l_isOutfit_0 then
                    local l_outfitInfo_0 = v112.outfitInfo;
                    if l_outfitInfo_0 then
                        if v112.shouldConfirmEquip then
                            v74(l_NavigateWithLock_0(function() --[[ Line: 337 ]]
                                -- upvalues: v75 (ref), l_AvatarScreen_0 (ref), v119 (ref), l_outfitInfo_0 (copy), v123 (ref), v91 (ref)
                                v75.navigate(l_AvatarScreen_0.EquipOutfitConfirmation, {
                                    onOverlayClosed = v119, 
                                    outfitInfo = l_outfitInfo_0, 
                                    onEquip = function(v132) --[[ Line: 341 ]] --[[ Name: onEquip ]]
                                        -- upvalues: v123 (ref), v91 (ref)
                                        v123(v91, v132);
                                    end
                                });
                            end));
                        else
                            local v133 = v74(v45({
                                outfitInfo = l_outfitInfo_0, 
                                analytics = v83, 
                                navigation = v75, 
                                isSelected = v91
                            }));
                            v123(v91, v133);
                        end;
                    else
                        l_Logging_0.warn("Tried equipping a costume without any costume data!");
                    end;
                else
                    if l_modifiedAssetType_0 then
                        v74(v46(if not v91 then v83.equipAsset else v83.unequipAsset, l_itemId_0, l_modifiedAssetType_0));
                    end;
                    local v134 = v74(v47(l_modifiedAssetType_0, l_itemId_0, v75));
                    v123(v91, v134);
                end;
                if not v91 and v112.isUIFullView then
                    if v64() then
                        v74(v53(v85, v76.opaque.name, l_FullView_0.None));
                        return;
                    else
                        v74(v53(v85, l_AvatarScreen_0.AvatarEditor, l_FullView_0.None));
                    end;
                end;
                return;
            end;
        end;
    end, {
        v85, 
        v91, 
        v112.isUIFullView, 
        v112.modifiedAssetType, 
        v112.avatarTypeIsR6, 
        v112.shouldConfirmEquip, 
        v112.outfitInfo, 
        v83, 
        l_itemId_0, 
        v123, 
        v126, 
        v75, 
        v74, 
        v119, 
        if v70 then l_isOutfit_0 else nil, 
        if v70 then v112.dataLoaded else nil
    });
    local v140 = v5.useCallback(function() --[[ Line: 403 ]]
        -- upvalues: l_isOutfit_0 (copy), l_itemId_0 (copy), l_isPortrait_0 (copy), v72 (copy), v55 (ref), v75 (copy), l_AvatarScreen_0 (ref), v74 (copy), l_NavigateWithLock_0 (ref), v49 (ref), l_itemType_0 (copy), l_itemData_0 (copy), v84 (copy), v76 (copy), v57 (ref)
        if l_isOutfit_0 then
            local v136 = {
                outfitId = l_itemId_0, 
                ZIndex = 2, 
                showFullWithNoPeekView = not l_isPortrait_0, 
                renderBottomBar = false, 
                NextSelectionLeft = not l_isPortrait_0 and v72.resultsListRef or nil, 
                outfitDetailsPeekViewRefs = v72.itemDetailsPeekViewRefs
            };
            v74(l_NavigateWithLock_0(function() --[[ Line: 415 ]]
                -- upvalues: v55 (ref), v75 (ref), l_AvatarScreen_0 (ref), v136 (copy)
                v55.closeFiltersAndItemDetails(v75);
                v55.closeTryOnManager(v75);
                v75.navigate(l_AvatarScreen_0.OutfitDetails, v136);
            end));
            return;
        else
            local v137 = v49.GetItemSubType(l_itemType_0, l_itemData_0);
            local v138 = if l_itemData_0 then l_itemData_0.priceInRobux else nil;
            local v139 = {
                itemId = l_itemId_0, 
                itemType = l_itemType_0, 
                itemSubType = v137, 
                priceInRobux = v138, 
                isPortrait = l_isPortrait_0, 
                catalogAnalytics = v84, 
                avatarRoute = v76, 
                navigation = v75, 
                itemDetailsPeekViewRefs = v72.itemDetailsPeekViewRefs, 
                resultsListRef = v72.resultsListRef, 
                mountAsFullView = nil, 
                showFullWithNoPeekView = true, 
                closePreviousItemDetails = true
            };
            v74(v57(v139));
            return;
        end;
    end, {
        v74, 
        v75, 
        l_isOutfit_0, 
        l_itemId_0, 
        v84, 
        v76, 
        l_itemType_0, 
        l_itemData_0, 
        v72.itemDetailsPeekViewRefs, 
        v72.resultsListRef
    });
    local v142 = v5.useCallback(function() --[[ Line: 461 ]]
        -- upvalues: l_itemData_0 (copy), v48 (ref), l_FFlagAXModeratedItemsFlow_0 (ref), v116 (copy), v51 (ref), v75 (copy), l_AvatarScreen_0 (ref), l_itemType_0 (copy), v112 (copy), v135 (copy), v140 (copy)
        if l_itemData_0 and v48.isModerationPendingOrRejected(l_itemData_0.moderationStatus) then
            local v141 = nil;
            if l_FFlagAXModeratedItemsFlow_0 then
                v141 = if v116 then v51.AssetTypeLocalized[v116] else "Feature.Catalog.Label.Bundle";
            end;
            v75.navigate(l_AvatarScreen_0.ItemsUnavailablePrompt, {
                items = {
                    {
                        category = l_itemType_0, 
                        categoryLoc = v141, 
                        itemName = l_itemData_0.name
                    }
                }, 
                messageType = v48.getMessageTypeFromModerationStatus(l_itemData_0.moderationStatus)
            });
            return;
        elseif v112.isEquippable then
            v135();
            return;
        else
            v140();
            return;
        end;
    end, {
        v112.isEquippable, 
        v140, 
        v135
    });
    local v143 = v5.useRef(nil);
    v5.useEffect(function() --[[ Line: 491 ]]
        -- upvalues: v78 (copy), v72 (copy), l_itemId_0 (copy), l_OrganicEventImpressionsSchema_0 (ref), l_ImpressionsUtil_0 (ref), l_categoryInfo_0 (copy), l_addUnifiedEventLogging_0 (ref), v79 (copy), v91 (copy), l_UnifiedEventLogEnums_0 (ref), l_itemType_0 (copy), v116 (copy), v48 (ref), l_FFlagAXNegativeAvatarSequenceFeatures_0 (ref), l_UnifiedEventLogConstants_0 (ref), l_isOutfit_0 (copy), v143 (copy), v52 (ref), v112 (copy), v74 (copy), v44 (ref), v86 (copy), v82 (copy), v51 (ref)
        local l_current_1 = v78.current;
        if v72.impressionsTag and l_current_1 then
            l_current_1:SetAttribute(v72.impressionsTag, l_itemId_0);
            local v145 = l_OrganicEventImpressionsSchema_0[v72.impressionsSchema];
            l_ImpressionsUtil_0.writeItemAttributes(v145, l_current_1, v72);
        end;
        local l_Category_0 = l_categoryInfo_0.Category;
        local l_Subcategory_0 = l_categoryInfo_0.Subcategory;
        l_addUnifiedEventLogging_0(v79, {
            action = if v91 then l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_DESELECTED else l_UnifiedEventLogEnums_0.MarketplaceUnifiedAction.ITEM_SELECTED, 
            itemId = l_itemId_0, 
            itemType = if l_itemType_0 == "Asset" then l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.ASSET else l_UnifiedEventLogEnums_0.MarketplaceUnifiedItemType.BUNDLE, 
            assetType = v116, 
            gridPositionRow = if v72.gridInformation then v72.gridInformation.row else nil, 
            gridPositionColumn = if v72.gridInformation then v72.gridInformation.column else nil, 
            category = if l_Category_0 then v48.getAvatarEditorCategoryInfo(l_Category_0).Name else nil, 
            subcategory = if l_Category_0 and l_Subcategory_0 then v48.getAvatarEditorCategoryInfo(l_Category_0, l_Subcategory_0).Name else nil, 
            isOwnedItem = l_FFlagAXNegativeAvatarSequenceFeatures_0 and true or nil
        }, {
            sessionTagName = l_UnifiedEventLogConstants_0.L2_SESSION_TAG_NAME
        });
        if not l_itemId_0 or l_isOutfit_0 or v143.current == l_itemId_0 or l_itemId_0 == v52.AddOutfitButton then
            return;
        else
            v143.current = l_itemId_0;
            if not v112.name then
                v74(v44(v86, v82, l_itemId_0, v51.ItemType.Asset));
            end;
            return;
        end;
    end, {
        v74, 
        v86, 
        v82, 
        l_itemId_0, 
        v112.name, 
        l_isOutfit_0, 
        l_categoryInfo_0.Category, 
        l_categoryInfo_0.Subcategory, 
        l_itemType_0, 
        v91, 
        v72.gridInformation, 
        v116
    });
    local v148 = v65({
        onOpenEditorDetailsPage = if v112.canShowDetails then v140 else nil, 
        onSelectItem = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v142, 
        onSlotEmote = if not (l_categoryInfo_0.PageType == v51.PageType.Emotes) or v91 then nil else v71 and function() --[[ Line: 555 ]]

        end or v142, 
        onUnslotEmote = if l_categoryInfo_0.PageType == v51.PageType.Emotes and v91 then v71 and function() --[[ Line: 562 ]]

        end or v142 else nil
    }, v78);
    local v149 = l_useTableWrappedCallbackRef_0(v148);
    local v150 = v5.useCallback(function() --[[ Line: 570 ]]
        -- upvalues: v112 (copy), v87 (copy), l_Input_0 (ref), v5 (ref), v43 (ref), v140 (copy)
        if v112.canShowDetails and v87 ~= l_Input_0.Directional then
            return v5.createElement(v43, {
                activateButton = v140
            });
        else
            return nil;
        end;
    end, {
        v140, 
        v112.canShowDetails, 
        v87
    });
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v151 = l_useLocalization_0({
            details = "Feature.Avatar.Label.DetailsButton"
        });
        local v152 = nil;
        if l_itemData_0 and v48.isModerationPendingOrRejected(l_itemData_0.moderationStatus) then
            local v153 = if l_itemData_0.moderationStatus == Enum.ModerationStatus.NotReviewed then l_CatalogItemCardStatusIconTypeEnum_0.PendingModeration else l_CatalogItemCardStatusIconTypeEnum_0.Moderated;
            v152 = {
                type = "placeholder", 
                iconType = v153
            };
        end;
        return v5.createElement(l_CatalogItemCard_0, {
            LayoutOrder = v72.layoutOrder, 
            Size = UDim2.fromScale(1, 1), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            isSelected = v91, 
            title = v112.name, 
            itemInfo = if v112.iconType == l_ItemTileEnums_0.ItemIconType.DynamicHead then l_CatalogItemCardItemInfoEnum_0.DynamicHead else nil, 
            onActivated = if l_itemId_0 and v112.hasAvatarData then v142 else nil, 
            overlayButtonText = if v112.canShowDetails then v151.details else nil, 
            onOverlayButtonActivated = if v112.canShowDetails then v140 else nil, 
            ref = v149, 
            titleTextSize = if v64() then if v72.titleFontStyle then v72.titleFontStyle else if v88 then v88.Typography.CaptionSmall else nil else nil, 
            presentationSlot = if v112.thumbnail then v5.createElement(l_ItemCardThumbnail_0, {
                url = v112.thumbnail, 
                tag = v72.impressionsTag, 
                ref = v78
            }) else nil, 
            itemStatus = v152
        });
    else
        return v5.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ItemTile_0 else l_Focusable_0[l_ItemTile_0], {
            LayoutOrder = v72.layoutOrder, 
            isSelected = v91, 
            itemIconType = v112.iconType, 
            onActivated = if l_itemId_0 and v112.hasAvatarData then v142 else nil, 
            name = v112.name, 
            titleTextLineCount = if not l_categoryInfo_0.HideTextUnderTile then v51.ItemTileTitleMaxLines else 0, 
            titleFontStyle = if not l_categoryInfo_0.HideTextUnderTile then v72.titleFontStyle else nil, 
            thumbnail = v112.thumbnail, 
            renderTileInset = v150, 
            statusStyle = v112.itemStatusStyle, 
            key = l_itemId_0, 
            textButtonRef = v79, 
            ref = v149, 
            [v5.Tag] = v72.impressionsTag
        });
    end;
end);
return (v5.memo(v154, v6.deepEqual));