local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_CorePackages_0.Packages.Roact);
local v6 = require(l_CorePackages_0.Packages.React);
local v7 = require(l_CorePackages_0.Packages.RoactRodux);
local v8 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v8.Focusable;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_ItemCard_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceUIKit).ItemCardComponents.ItemCard;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v16 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_useFocusGuiObject_0 = v16.useFocusGuiObject;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v19 = require(l_Modules_0.AvatarExperience.Common.Hooks.useRequest);
local v20 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v22 = require(l_CorePackages_0.Packages.UIBlox);
local l_withStyle_0 = v22.Style.withStyle;
local l_Button_0 = v22.App.Button.Button;
local l_ButtonType_0 = v22.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v22.App.Button.Enum.StandardButtonSize;
local l_withTextSizeOffset_0 = v22.Core.Style.withTextSizeOffset;
local v28 = require(l_CorePackages_0.Packages.AvatarExperienceDeps);
local l_EmptyState_0 = v22.App.Indicator.EmptyState;
local l_Images_0 = v22.App.ImageSet.Images;
local l_ImageSetLabel_0 = v22.Core.ImageSet.ImageSetLabel;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceRodux);
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local _ = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.UserInventoryRecommendations);
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_FitFrameVertical_0 = v28.RoactFitComponents.FitFrameVertical;
local v37 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetOwnedItemIdsBySubtype);
local l_withNavigation_0 = require(l_CorePackages_0.Packages.RoactNavigation).withNavigation;
local v39 = require(l_Modules_0.LuaApp.Constants);
local v40 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v41 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateWithLock);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v43 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_GridMetrics_0 = v22.App.Grid.GridMetrics;
local v45 = require(l_CorePackages_0.Workspace.Packages.IxpUtils);
local l_AvatarScreen_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local v48 = require(l_Modules_0.LuaApp.Enum.RetrievalStatus);
local v49 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.EmptyPage);
local l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation;
local v51 = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AvatarEditorItemCard) else require(l_Modules_0.AvatarExperience.AvatarEditor.Components.ItemCard_DEPRECATED);
local v52 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v53 = require(l_Modules_0.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v55 = require(l_Modules_0.AvatarExperience.AvatarEditor.Utils);
local v56 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v57 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v58 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v59 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v60 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventory);
local v61 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventoryV2);
local v62 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetOutfits);
local v63 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v64 = require(l_Modules_0.AvatarExperience.AvatarEditor.Selectors.selectOwnedItemIdToIsWearing);
local v65 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.SendShopForMoreAnalytics);
local v66 = require(l_Modules_0.AvatarExperience.AvatarEditor.Services.Analytics);
local v67 = require(l_Modules_0.LuaApp.Components.SignalConnection);
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v70 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local l_ImpressionEnums_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).Enums.ImpressionEnums;
local v72 = require(l_Modules_0.AvatarExperience.Common.Components.Impressions.OrganicEventImpressionsReporter);
local l_TagBasedImpressionsDetector_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).TagBasedImpressionsDetector;
local l_useUnifiedEventImpressionsReporter_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceAnalytics).useUnifiedEventImpressionsReporter;
local v75 = require(l_Modules_0.AvatarExperience.Experiments.AXCatalogHeadCategoryCombineIXP);
local v76 = require(l_Modules_0.AvatarExperience.Flags.FStringAXImpressionsEventName);
local v77 = require(l_Modules_0.AvatarExperience.Common.Enum.RequestStatusEnum);
local l_DeviceOrientationMode_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode;
local v79 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local v80 = require(l_CorePackages_0.Packages.InputHandlers);
local l_FocusNavigationEventNameEnum_0 = v79.FocusNavigationEventNameEnum;
local v82 = game:DefineFastFlag("FixItemListHasMoreItems", false);
local v83 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local l_FFlagAXItemDetailsIxpExposure_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXItemDetailsIxpExposure;
local l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXAdaptiveScrollingFixForward_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAdaptiveScrollingFixForward;
local l_FFlagAXRootSlotBasedEditorFlag_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXRootSlotBasedEditorFlag;
local v89 = l_GuiService_0:IsTenFootInterface();
local l_ShimmerCardsToDisplay_0 = v58.ShimmerCardsToDisplay;
local l_AddOutfitButton_0 = v59.AddOutfitButton;
local v92 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
local function v98(v93, v94) --[[ Line: 144 ]] --[[ Name: useFocusNavigationBindings ]]
    -- upvalues: v16 (copy), v92 (copy), v6 (copy), l_FocusNavigationEventNameEnum_0 (copy), v80 (copy)
    local v95 = v16.useEventMap(v92, v93);
    local v97 = v6.useMemo(function() --[[ Line: 146 ]]
        -- upvalues: l_FocusNavigationEventNameEnum_0 (ref), v80 (ref), v94 (copy)
        return {
            [l_FocusNavigationEventNameEnum_0.NavigateBack] = {
                handler = v80.onRelease(function(_) --[[ Line: 149 ]]
                    -- upvalues: v94 (ref)
                    v94();
                end)
            }
        };
    end, {
        v94
    });
    return v16.useEventHandlerMap(v97, v95);
end;
local v106 = v6.forwardRef(function(v99, v100) --[[ Line: 162 ]]
    -- upvalues: v6 (copy), l_useTokens_0 (copy), l_ItemCard_0 (copy), v5 (copy), l_ImageSetLabel_0 (copy), l_Images_0 (copy)
    local v101, v102 = v6.useBinding(0);
    local v103 = l_useTokens_0();
    return v6.createElement(l_ItemCard_0, {
        Size = UDim2.fromScale(1, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        onActivated = v99.onActivated, 
        ref = v100, 
        headerSlot = v5.createElement("Frame", {
            BorderSizePixel = 0, 
            BackgroundColor3 = v103.Semantic.Color.Common.Placeholder.Color3, 
            BackgroundTransparency = v103.Semantic.Color.Common.Placeholder.Transparency, 
            ClipsDescendants = true, 
            [v6.Change.AbsoluteSize] = function(v104) --[[ Line: 176 ]]
                -- upvalues: v102 (copy)
                v102(v104.AbsoluteSize.X);
            end, 
            Size = v101:map(function(v105) --[[ Line: 179 ]]
                return UDim2.new(1, 0, 0, v105);
            end)
        }, {
            CornerRadius = v6.createElement("UICorner", {
                CornerRadius = UDim.new(0, v103.Semantic.Radius.Medium)
            }), 
            Image = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = l_Images_0["icons/menu/customize"], 
                ImageTransparency = 0, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.new(0, 36, 0, 36), 
                ScaleType = Enum.ScaleType.Stretch
            })
        })
    });
end);
local v111 = v6.forwardRef(function(v107, v108) --[[ Line: 208 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v6 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy)
    local v109 = l_useLocalization_0({
        loadMore = "Feature.Catalog.Action.LoadMore"
    });
    local v110 = l_useDesignTokens_0();
    return v6.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or v8.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v110.Global.Size_600), 
        ref = v108, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v107.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v107.NextSelectionDown, 
        LayoutOrder = v107.LayoutOrder
    }, {
        LoadMoreButton = v6.createElement(l_Button_0, {
            onActivated = v107.onActivated, 
            text = v109.loadMore, 
            standardSize = l_StandardButtonSize_0.Regular, 
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.fromScale(1, 1), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5)
        })
    });
end);
local function _(v112) --[[ Line: 233 ]] --[[ Name: useAvatarInventoryOverride ]]
    return not v112;
end;
local v114 = v5.PureComponent:extend("ItemsList");
v114.init = function(v115) --[[ Line: 239 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v8 (copy), l_Signal_0 (copy), l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 (copy), v83 (copy), v75 (copy), v58 (copy), v59 (copy)
    v115.state = {
        listWidth = 0, 
        restorePreviousChildFocus = true, 
        ownedItemIdToIsWearing = {}, 
        hasItemFromCurrentPageEquipped = false, 
        loadableGridViewWidth = 0
    };
    v115.lastYPosition = 0;
    v115.isMounted = false;
    v115.listFrameRef = v115.props.forwardRef or v5.createRef();
    v115.scrollingFrameRef = v5.createRef();
    v115.loadableGridViewRef = v5.createRef();
    v115.recommendedItemsRef = v5.createRef();
    v115.loadMoreRef = v5.createRef();
    v115.emptyStateRef = v5.createRef();
    v115.itemDetailsPeekViewRefs = v8.createRefCache();
    v115.requestImpressionsSignal = l_Signal_0.new();
    v115.addOutfitButtonRef = if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then v5.createRef() else nil;
    v115.resultsListRef = v5.createRef();
    v115.onLoadableGridViewAbsoluteSizeChanged = function(v116) --[[ Line: 266 ]]
        -- upvalues: v115 (copy)
        if v115.state.loadableGridViewWidth ~= v116.AbsoluteSize.X then
            v115:setState({
                loadableGridViewWidth = v116.AbsoluteSize.X
            });
        end;
    end;
    v115.checkSetListWidth = function(v117) --[[ Line: 274 ]]
        -- upvalues: v115 (copy)
        if v117 and v117:IsDescendantOf(game) then
            v115:setState({
                listWidth = v117.AbsoluteSize.X
            });
        end;
    end;
    v115.loadMoreUserInventoryItems = function() --[[ Line: 282 ]]
        -- upvalues: v115 (copy), v83 (ref), v75 (ref), v58 (ref), v59 (ref)
        local l_categoryInfo_0 = v115.props.categoryInfo;
        local l_networking_0 = v115.props.networking;
        local l_isOutfitsPage_0 = v115.props.isOutfitsPage;
        local l_assetTypeKey_0 = v115.props.assetTypeKey;
        if v83() and l_categoryInfo_0.UseGetInventoryV2 or not l_isOutfitsPage_0 then
            return v115.props.getUserInventoryV2(l_networking_0, l_categoryInfo_0, v115.props.nextPageCursorKey);
        elseif v75.isEnabled() and v115.props.enableHeadCategoryCombine and l_categoryInfo_0.OutfitType == v58.OutfitTypes.DynamicHead and l_categoryInfo_0.AssetTypeIdStrings then
            return v115.props.getUserInventoryV2(l_networking_0, l_categoryInfo_0, v115.props.nextPageCursorKey);
        elseif l_isOutfitsPage_0 then
            local v122 = l_assetTypeKey_0 == v59.EditableCharacterKey;
            local l_OutfitType_0 = l_categoryInfo_0.OutfitType;
            local v124 = l_assetTypeKey_0 .. (l_OutfitType_0 or "");
            return v115.props.getOutfits(l_assetTypeKey_0, v122, v124, l_OutfitType_0);
        else
            return v115.props.getUserInventory(l_categoryInfo_0);
        end;
    end;
    v115.onFocusGained = function() --[[ Line: 312 ]]
        -- upvalues: v115 (copy)
        v115:setState({
            restorePreviousChildFocus = true
        });
    end;
    v115.setParentRestorePreviousChildFocus = function(v125) --[[ Line: 318 ]]
        -- upvalues: v115 (copy)
        if not v115.isMounted then
            return;
        else
            v115:setState({
                restorePreviousChildFocus = v125
            });
            return;
        end;
    end;
    v115.sendShopForMoreAnalytics = function() --[[ Line: 328 ]]
        -- upvalues: v115 (copy)
        v115.props.sendShopForMoreAnalytics(v115.props.avatarEditorAnalytics);
    end;
    v115.scrollBackToTop = function() --[[ Line: 332 ]]
        -- upvalues: v115 (copy)
        local l_current_0 = v115.scrollingFrameRef.current;
        if l_current_0 then
            l_current_0:ScrollToTop();
        end;
    end;
end;
v114.renderNonOutfitItemCard = function(v127, v128, v129, v130, v131) --[[ Line: 340 ]] --[[ Name: renderNonOutfitItemCard ]]
    -- upvalues: v39 (copy), v5 (copy), v51 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    local l_key_0 = v127.props.avatarRoute.current.key;
    local v133 = v39.ImpressionsEvents.AvatarItems .. if l_key_0 then string.gsub(l_key_0, "[-{}]", "") else "";
    return v5.createElement(v51, {
        itemId = v128, 
        isOutfit = false, 
        focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v129, 
        isWearingAssetOrOutfit = v127.props.ownedItemIdToIsWearing[v128], 
        titleFontStyle = v130, 
        itemDetailsPeekViewRefs = v127.itemDetailsPeekViewRefs, 
        resultsListRef = v127.resultsListRef, 
        impressionsTag = v133, 
        impressionsSchema = "defaultItem", 
        gridInformation = v131
    });
end;
v114.getShowAddOutfitButton = function(v134) --[[ Line: 359 ]] --[[ Name: getShowAddOutfitButton ]]
    -- upvalues: v89 (copy), v59 (copy)
    return not v89 and v134.props.assetTypeKey == v59.EditableCharacterKey;
end;
v114.renderNonOutfitItemCardWithOverlay = function(v135, v136, v137, v138, v139, v140) --[[ Line: 364 ]] --[[ Name: renderNonOutfitItemCardWithOverlay ]]
    -- upvalues: v5 (copy)
    if typeof(v139) == "table" then
        v139 = nil;
    end;
    if v135.props.darkenItemsGrid then
        return v5.createFragment({
            GamepadDarkOverlay = v5.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = v137.Theme.Overlay.Transparency, 
                BackgroundColor3 = v137.Theme.Overlay.Color
            }, {
                UICorner = v5.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                })
            }), 
            ItemCard = v135:renderNonOutfitItemCard(v139, v136, v138, v140)
        });
    else
        return v135:renderNonOutfitItemCard(v139, v136, v138, v140);
    end;
end;
v114.renderGenericItemCard = function(v141, v142, v143, v144, v145, v146) --[[ Line: 387 ]] --[[ Name: renderGenericItemCard ]]
    -- upvalues: v59 (copy)
    if v141.props.outfitOrAsset[v145] == v59.OutfitOrAsset.Outfit then
        return v141:renderOutfitItemCard(v145, v144, v146);
    else
        return v141:renderNonOutfitItemCardWithOverlay(v142, v143, v144, v145, v146);
    end;
end;
if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 then
    v114.openCreateOrUpdateCostumeMenu = function(v147) --[[ Line: 399 ]] --[[ Name: openCreateOrUpdateCostumeMenu ]]
        -- upvalues: l_AvatarScreen_0 (copy)
        local v148 = v147.addOutfitButtonRef:getValue();
        if not v148 then
            return;
        else
            local v149 = v148.AbsolutePosition + v148.AbsoluteSize * Vector2.new(0.5, 0.5);
            local function v150() --[[ Line: 407 ]]
                -- upvalues: v147 (copy), l_AvatarScreen_0 (ref), v149 (copy)
                v147.props.navigation.navigate(l_AvatarScreen_0.CreateOrUpdateOutfitMenu, {
                    saveTilePosition = v149
                });
            end;
            v147.props.navigateWithLock(v150);
            return;
        end;
    end;
end;
v114.renderOutfitItemCard = function(v151, v152, v153, v154) --[[ Line: 416 ]] --[[ Name: renderOutfitItemCard ]]
    -- upvalues: l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 (copy), l_AddOutfitButton_0 (copy), v6 (copy), v106 (copy), v39 (copy), v5 (copy), v51 (copy)
    if typeof(v152) == "table" then
        v152 = nil;
    end;
    if l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 and v152 == l_AddOutfitButton_0 then
        return v6.createElement(v106, {
            ref = v151.addOutfitButtonRef, 
            onActivated = function() --[[ Line: 424 ]] --[[ Name: onActivated ]]
                -- upvalues: v151 (copy)
                v151:openCreateOrUpdateCostumeMenu();
            end
        });
    else
        local l_key_1 = v151.props.avatarRoute.current.key;
        local v156 = v39.ImpressionsEvents.AvatarItems .. if l_key_1 then string.gsub(l_key_1, "[-{}]", "") else "";
        return v5.createElement(v51, {
            itemId = v152, 
            isOutfit = true, 
            isWearingAssetOrOutfit = v151.props.ownedItemIdToIsWearing[v152], 
            hasItemFromCurrentPageEquipped = v151.props.hasItemFromCurrentPageEquipped, 
            titleFontStyle = v153, 
            itemDetailsPeekViewRefs = v151.itemDetailsPeekViewRefs, 
            resultsListRef = v151.resultsListRef, 
            impressionsTag = v156, 
            impressionsSchema = "defaultItem", 
            gridInformation = v154
        });
    end;
end;
v114.renderRecommendedItems = function(v157, v158, _, v160, v161) --[[ Line: 448 ]] --[[ Name: renderRecommendedItems ]]
    -- upvalues: v59 (copy), v5 (copy), v57 (copy)
    if not (v158.RecommendationsType and v158.RecommendationsType ~= v59.RecommendationsType.None and v157.props.pageFinished) then
        return nil;
    else
        local l_sendShopForMoreAnalytics_0 = v157.sendShopForMoreAnalytics;
        return v5.createElement(v57, {
            LayoutOrder = 4, 
            categoryInfo = v158, 
            sendShopForMoreAnalytics = l_sendShopForMoreAnalytics_0, 
            baseRef = v157.recommendedItemsRef, 
            NextSelectionUp = if not v157.props.darkenItemsGrid then v161 else nil, 
            itemDetailsPeekViewRefs = v157.itemDetailsPeekViewRefs, 
            listFrameRef = v160 or v157.listFrameRef
        });
    end;
end;
v114.renderItemsList = function(v163, v164, v165) --[[ Line: 470 ]] --[[ Name: renderItemsList ]]
    -- upvalues: v48 (copy), v59 (copy), l_AddOutfitButton_0 (copy), v4 (copy), l_ShimmerCardsToDisplay_0 (copy), l_withStyle_0 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_GridMetrics_0 (copy), v58 (copy), v83 (copy), v75 (copy), v39 (copy), v52 (copy), v6 (copy), v53 (copy), l_AvatarScreen_0 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), v5 (copy), v67 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FitFrameVertical_0 (copy), l_Focusable_0 (copy), v56 (copy), v49 (copy), v72 (copy), v76 (copy), l_ImpressionEnums_0 (copy), l_TagBasedImpressionsDetector_0 (copy), v111 (copy), l_wasLastInputGamepad_0 (copy), v40 (copy)
    local l_categoryInfo_1 = v163.props.categoryInfo;
    local l_dataStatus_0 = v163.props.dataStatus;
    local l_hasMoreUserInventoryItems_0 = v163.props.hasMoreUserInventoryItems;
    local l_screenSize_0 = v163.props.screenSize;
    local l_ownedItemIds_0 = v163.state.ownedItemIds;
    local l_itemsContainsOutfits_0 = v163.state.itemsContainsOutfits;
    local l_listWidth_0 = v163.state.listWidth;
    local v173 = l_ownedItemIds_0 and #l_ownedItemIds_0 > 0 or false;
    local v174 = false;
    if l_dataStatus_0 == v48.Fetching then
        v174 = not v173;
    end;
    local v175 = true;
    if l_dataStatus_0 ~= v48.NotStarted then
        v175 = v174;
    end;
    local v176 = if v59.ItemsGridSidePadding < l_listWidth_0 then v59.ItemsGridSidePadding else 0;
    local l_l_ownedItemIds_0_0 = l_ownedItemIds_0;
    if l_ownedItemIds_0 and l_itemsContainsOutfits_0 and l_ownedItemIds_0[1] ~= l_AddOutfitButton_0 and v163:getShowAddOutfitButton() then
        l_l_ownedItemIds_0_0 = v4.List.join({
            l_AddOutfitButton_0
        }, l_ownedItemIds_0);
        v173 = true;
    end;
    local v178 = l_l_ownedItemIds_0_0 and #l_l_ownedItemIds_0_0 or l_ShimmerCardsToDisplay_0;
    local v179 = false;
    if v163.props.ownedItemIdsBySubtype[v163.props.assetTypeKey] ~= nil then
        v179 = #v163.props.ownedItemIdsBySubtype[v163.props.assetTypeKey] > 0;
    end;
    if v175 then
        l_l_ownedItemIds_0_0 = nil;
        v178 = l_ShimmerCardsToDisplay_0;
    elseif not l_l_ownedItemIds_0_0 and v179 then
        v178 = l_ShimmerCardsToDisplay_0;
    end;
    local v180 = v173 or v175 or v179;
    local v181 = v163.props.adaptiveScrolling or {};
    v163.requestImpressionsSignal:fire();
    return l_withStyle_0(function(v182) --[[ Line: 514 ]]
        -- upvalues: l_FFlagAXRootSlotBasedEditorFlag_0 (ref), l_GridMetrics_0 (ref), v59 (ref), v163 (copy), v58 (ref), v165 (copy), l_itemsContainsOutfits_0 (copy), v164 (copy), v83 (ref), v75 (ref), l_categoryInfo_1 (copy), v39 (ref), v52 (ref), v174 (copy), v175 (copy), l_hasMoreUserInventoryItems_0 (copy), v180 (copy), v6 (ref), v53 (ref), l_AvatarScreen_0 (ref), v181 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (ref), v5 (ref), v67 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), l_FitFrameVertical_0 (ref), l_Focusable_0 (ref), v176 (copy), v56 (ref), l_l_ownedItemIds_0_0 (ref), v178 (ref), l_screenSize_0 (copy), v49 (ref), v72 (ref), v76 (ref), l_ImpressionEnums_0 (ref), l_TagBasedImpressionsDetector_0 (ref), v111 (ref), l_wasLastInputGamepad_0 (ref), v40 (ref), v173 (ref)
        local v183 = nil;
        local v184 = nil;
        local l_Font_0 = v182.Font;
        v183 = if l_FFlagAXRootSlotBasedEditorFlag_0 then l_Font_0.CaptionHeader else l_Font_0.Header2;
        v184 = v183.RelativeSize * l_Font_0.BaseSize;
        if l_GridMetrics_0.makeCustomMetricsGetter(v59.ItemsGridMetrics)(v163.state.loadableGridViewWidth, v58.LoadableGridViewCellPadding).itemWidth / v184 < v58.MinTileWidthToFontHeightRatio then
            v183 = l_Font_0.CaptionBody;
            v184 = v183.RelativeSize * l_Font_0.BaseSize;
        end;
        v184 = v184 + (v165 or 0);
        local v186 = nil;
        v186 = l_itemsContainsOutfits_0 and function(v187, _, v189) --[[ Line: 534 ]]
            -- upvalues: v163 (ref), v183 (ref)
            return v163:renderOutfitItemCard(v187, v183, v189);
        end or function(v190, _, v192) --[[ Line: 538 ]]
            -- upvalues: v163 (ref), v164 (ref), v182 (copy), v183 (ref)
            return v163:renderNonOutfitItemCardWithOverlay(v164, v182, v183, v190, v192);
        end;
        if (v83() or v75.isEnabled() and v163.props.enableHeadCategoryCombine) and l_categoryInfo_1.UseGetInventoryV2 then
            v186 = function(v193, _, v195) --[[ Line: 557 ]]
                -- upvalues: v163 (ref), v164 (ref), v182 (copy), v183 (ref)
                return v163:renderGenericItemCard(v164, v182, v183, v193, v195);
            end;
        end;
        local l_forwardRef_0 = v163.props.forwardRef;
        local l_key_2 = v163.props.avatarRoute.current.key;
        local v198 = v39.ImpressionsEvents.AvatarItems .. if l_key_2 then string.gsub(l_key_2, "[-{}]", "") else "";
        local v199 = nil;
        v199 = if v163.props.categoryInfo.HideTextUnderTile then v52.GridItemHeightGetter(v58.ItemTileType.AvatarEditorTile) else v52.GridItemHeightGetter(v58.ItemTileType.AvatarEditorTile, v184);
        local l_backToTopSignal_0 = v163.props.backToTopSignal;
        local l_isFetchingMore_0 = v163.props.isFetchingMore;
        local l_enableContinuousLoad_0 = v163.props.enableContinuousLoad;
        local v203 = l_isFetchingMore_0 or v174 or v175;
        local v204 = not v203 and l_hasMoreUserInventoryItems_0;
        local v205 = if v204 and l_enableContinuousLoad_0 then v163.props.loadMoreItems else nil;
        local v206 = v204 and not l_enableContinuousLoad_0;
        local v207 = if v206 then v163.loadMoreRef else if v180 then v163.loadableGridViewRef else v163.props.NextSelectionUp;
        local v208 = l_categoryInfo_1.RecommendationsType and l_categoryInfo_1.RecommendationsType ~= v59.RecommendationsType.None and v163.props.pageFinished;
        return v6.createElement(v53, {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            createEndOfScrollElement = false, 
            parentAppPage = l_AvatarScreen_0.AvatarEditor, 
            ScrollingEnabled = if v181.scrollingEnabledBinding then v181.scrollingEnabledBinding:map(function(v209) --[[ Line: 601 ]]
                return v209;
            end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v181.scrollingEnabled, 
            [v5.Ref] = v163.scrollingFrameRef, 
            onCanvasPositionChanged = function(v210) --[[ Line: 608 ]] --[[ Name: onCanvasPositionChanged ]]
                -- upvalues: v163 (ref), v181 (ref)
                v163.requestImpressionsSignal:fire();
                local l_Y_0 = v210.CanvasPosition.Y;
                if v181 and v181.onCanvasYChanged then
                    v181.onCanvasYChanged(l_Y_0);
                end;
            end, 
            onThresholdReached = v205
        }, {
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            UIPadding = v6.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v182.Tokens.Global.Space_400)
            }), 
            BackToTopSignal = if l_backToTopSignal_0 then v6.createElement(v67, {
                signal = l_backToTopSignal_0, 
                callback = v163.scrollBackToTop
            }) else nil, 
            ListWrapper = v6.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_FitFrameVertical_0 else l_Focusable_0[l_FitFrameVertical_0], {
                width = UDim.new(1, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = v163.props.darkenItemsGrid and v182.Theme.Overlay.Transparency or 1, 
                BackgroundColor3 = v163.props.darkenItemsGrid and v182.Theme.Overlay.Color or nil, 
                margin = {
                    top = v59.ItemsGridTopPadding, 
                    bottom = v59.ItemsGridBottomPadding, 
                    left = v176 / 2, 
                    right = v176 / 2
                }, 
                ref = v163.loadableGridViewRef, 
                defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v163.resultsListRef
            }, {
                LoadableGridView = v180 and v6.createElement(v56, {
                    getItemMetrics = l_GridMetrics_0.makeCustomMetricsGetter(v59.ItemsGridMetrics), 
                    items = l_l_ownedItemIds_0_0, 
                    totalNumItems = v178, 
                    renderItem = v186, 
                    getItemHeight = v199, 
                    windowHeight = l_screenSize_0.Y, 
                    NextSelectionDown = if v206 then v163.loadMoreRef else v163.recommendedItemsRef, 
                    NextSelectionUp = v163.props.NextSelectionUp, 
                    NextSelectionRight = l_key_2 and v163.itemDetailsPeekViewRefs[l_key_2], 
                    onFocusGained = not v163.state.restorePreviousChildFocus and v163.onFocusGained or nil, 
                    restorePreviousChildFocus = v163.state.restorePreviousChildFocus, 
                    onAbsoluteSizeChanged = v163.onLoadableGridViewAbsoluteSizeChanged, 
                    ref = v163.resultsListRef
                }) or v6.createElement(v49, {
                    page = l_categoryInfo_1, 
                    NextSelectionUp = v163.props.NextSelectionUp, 
                    NextSelectionDown = if v206 then v163.loadMoreRef else v163.recommendedItemsRef
                }), 
                ImpressionsReporter = v5.createElement(v72, {
                    parentRef = v163.loadableGridViewRef, 
                    pageFilter = function() --[[ Line: 678 ]] --[[ Name: pageFilter ]]
                        -- upvalues: l_key_2 (copy), v163 (ref)
                        return l_key_2 == v163.props.navigation.state.key;
                    end, 
                    onRequestImpressionsSignal = v163.requestImpressionsSignal, 
                    eventContext = v76(), 
                    eventName = "marketplaceOrganicFELog", 
                    impressionsTag = v198, 
                    impressionsSchema = "defaultItem", 
                    requestId = "", 
                    surface = l_ImpressionEnums_0.MarketplaceSurfaceType.MARKETPLACE_USER_INVENTORY, 
                    searchUuid = v163.props.searchUuid
                }), 
                UnifiedImpressionsReporter = v6.createElement(l_TagBasedImpressionsDetector_0, {
                    parentRef = v163.loadableGridViewRef, 
                    pageFilter = function() --[[ Line: 692 ]] --[[ Name: pageFilter ]]
                        -- upvalues: l_key_2 (copy), v163 (ref)
                        return l_key_2 == v163.props.navigation.state.key;
                    end, 
                    requestImpressionsSignal = v163.requestImpressionsSignal, 
                    extensions = v163.props.tagBasedImpressionsDetectorExtensions
                }), 
                LoadMoreButton = if v206 then v6.createElement(v111, {
                    onActivated = function() --[[ Line: 700 ]] --[[ Name: onActivated ]]
                        -- upvalues: l_wasLastInputGamepad_0 (ref), v163 (ref), v180 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v164 (ref)
                        if l_wasLastInputGamepad_0() then
                            v163:setState({
                                restorePreviousChildFocus = true
                            });
                            if v180 then
                                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                                    if v163.props.focusGuiObject and v163.resultsListRef.current then
                                        v163.props.focusGuiObject(v163.resultsListRef.current);
                                    end;
                                else
                                    v164.moveFocusTo(v163.resultsListRef);
                                end;
                            end;
                        end;
                        v163.props.loadMoreItems();
                    end, 
                    LayoutOrder = 3, 
                    ref = v163.loadMoreRef, 
                    NextSelectionDown = if v208 then v163.recommendedItemsRef else nil, 
                    NextSelectionUp = if v180 then v163.resultsListRef else v163.props.NextSelectionUp
                }) else nil, 
                LoadingBar = if v203 then v6.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 0, v182.Tokens.Global.Size_700), 
                    LayoutOrder = 3
                }, {
                    LoadingBar = v6.createElement(v40)
                }) else nil
            }), 
            RecommendedItems = v163:renderRecommendedItems(l_categoryInfo_1, v173, l_forwardRef_0, v207)
        });
    end);
end;
v114.render = function(v212) --[[ Line: 748 ]] --[[ Name: render ]]
    -- upvalues: l_withTextSizeOffset_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v8 (copy)
    return l_withTextSizeOffset_0(function(v213) --[[ Line: 749 ]]
        -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v212 (copy), v8 (ref)
        if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
            return v212:renderWithProviders(nil, v213);
        else
            return v8.withFocusController(function(v214) --[[ Line: 753 ]]
                -- upvalues: v212 (ref), v213 (copy)
                return v212:renderWithProviders(v214, v213);
            end);
        end;
    end);
end;
v114.renderWithProviders = function(v215, v216, v217) --[[ Line: 759 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v48 (copy), l_withLocalization_0 (copy), v5 (copy), l_EmptyState_0 (copy), l_wasLastInputGamepad_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 (copy), l_Focusable_0 (copy), l_AvatarScreen_0 (copy), v8 (copy)
    local v218 = v215.props.dataStatus == v48.Failed;
    local v220 = l_withLocalization_0({
        noItemsFound = "Feature.Catalog.Response.NoItemsFound"
    })(function(v219) --[[ Line: 765 ]]
        -- upvalues: v5 (ref), l_EmptyState_0 (ref), v215 (copy), l_wasLastInputGamepad_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v216 (copy)
        return v5.createElement(l_EmptyState_0, {
            onActivated = function() --[[ Line: 771 ]]
                -- upvalues: v215 (ref), l_wasLastInputGamepad_0 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v216 (ref)
                v215.loadMoreUserInventoryItems();
                if l_wasLastInputGamepad_0() then
                    v215:setState({
                        restorePreviousChildFocus = false
                    });
                    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                        if v215.props.focusGuiObject and v215.props.NextSelectionUp and v215.props.NextSelectionUp.current then
                            v215.props.focusGuiObject();
                            return;
                        end;
                    else
                        v216.moveFocusTo(v215.props.NextSelectionUp);
                    end;
                end;
            end or v215.loadMoreUserInventoryItems, 
            text = v219.noItemsFound, 
            [v5.Ref] = v215.emptyStateRef, 
            NextSelectionUp = v215.props.NextSelectionUp
        });
    end);
    local v221 = false;
    if v215.props.ownedItemIdsBySubtype[v215.props.assetTypeKey] ~= nil then
        v221 = #v215.props.ownedItemIdsBySubtype[v215.props.assetTypeKey] > 0;
    end;
    local v222 = v215:getShowAddOutfitButton();
    local v223 = nil;
    v223 = if v218 then v215.emptyStateRef else if v221 or v222 then v215.loadableGridViewRef else v215.recommendedItemsRef;
    local l_name_0 = v215.props.avatarRoute.current.name;
    local l_forwardRef_1 = v215.props.forwardRef;
    if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then
        return v5.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Ref] = v215.props.focusNavigationRef
        }, v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Change.AbsoluteSize] = v215.checkSetListWidth, 
            [v5.Event.AncestryChanged] = v215.checkSetListWidth, 
            [v5.Ref] = l_forwardRef_1 or v215.listFrameRef, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v223, 
            restorePreviousChildFocus = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v215.state.restorePreviousChildFocus, 
            onFocusChanged = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v215.props.onFocusChanged
        }, {
            FailedState = v218 and v220, 
            ItemsList = not v218 and v215:renderItemsList(v216, v217)
        }));
    else
        return v5.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 1, 0), 
            [v5.Change.AbsoluteSize] = v215.checkSetListWidth, 
            [v5.Event.AncestryChanged] = v215.checkSetListWidth, 
            [v5.Ref] = l_forwardRef_1 or v215.listFrameRef, 
            defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v223, 
            restorePreviousChildFocus = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v215.state.restorePreviousChildFocus, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else l_name_0 ~= l_AvatarScreen_0.ItemDetails and {
                NavUp = v8.Input.onBegin(Enum.KeyCode.ButtonB, function() --[[ Line: 861 ]]
                    -- upvalues: v215 (copy), v216 (copy)
                    if v215.props.NextSelectionUp then
                        v216.moveFocusTo(v215.props.NextSelectionUp);
                        return;
                    else
                        if v215.props.buttonBInputRef then
                            v216.moveFocusTo(v215.props.buttonBInputRef);
                        end;
                        return;
                    end;
                end)
            } or nil, 
            onFocusChanged = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v215.props.onFocusChanged
        }, {
            FailedState = v218 and v220, 
            ItemsList = not v218 and v215:renderItemsList(v216, v217)
        });
    end;
end;
local function v237(v226, v227, v228) --[[ Line: 881 ]] --[[ Name: getOwnedItemIds ]]
    local v229 = {};
    if not v228 then
        return v229;
    else
        local v230 = v226[v228];
        if not v230 then
            return v229;
        elseif not v227 or #v227 == 0 then
            return v230;
        else
            local v231 = {};
            local v232 = 0;
            for v233 = 1, #v227 do
                local v234 = v227[v233];
                v231[v234] = true;
                v229[v233] = v234;
                v232 = v233;
            end;
            for v235 = 1, #v230 do
                local v236 = v230[v235];
                if not v231[v236] then
                    v232 = v232 + 1;
                    v229[v232] = v236;
                end;
            end;
            return v229;
        end;
    end;
end;
v114.getEquippedOutfit = function(v238, v239) --[[ Line: 919 ]] --[[ Name: getEquippedOutfit ]]
    -- upvalues: v55 (copy)
    local l_outfitInfos_0 = v238.props.outfitInfos;
    local l_ownedItemIdsBySubtype_0 = v238.props.ownedItemIdsBySubtype;
    local l_avatarType_0 = v238.props.avatarType;
    local l_bodyColor3s_0 = v238.props.bodyColor3s;
    local l_equippedAssets_0 = v238.props.equippedAssets;
    local l_scales_0 = v238.props.scales;
    local v246 = l_ownedItemIdsBySubtype_0[v239];
    if not v246 then
        return nil;
    else
        for _, v248 in v246 do
            local v249 = l_outfitInfos_0[tostring(v248)];
            if v249 and v55.isWearingOutfitNoState(v249, l_avatarType_0, l_bodyColor3s_0, l_equippedAssets_0, l_scales_0) then
                return v248;
            end;
        end;
        return nil;
    end;
end;
v114.updateItems = function(v250, v251) --[[ Line: 947 ]] --[[ Name: updateItems ]]
    -- upvalues: v58 (copy), v55 (copy), v4 (copy), v237 (copy), l_AddOutfitButton_0 (copy)
    local l_assetTypeKey_1 = v250.props.assetTypeKey;
    local l_categoryInfo_2 = v250.props.categoryInfo;
    local l_equippedEmote_0 = v250.props.equippedEmote;
    local l_equippedAssets_1 = v250.props.equippedAssets;
    local l_isOutfitsPage_1 = v250.props.isOutfitsPage;
    local l_initialEquippedAssets_0 = v250.state.initialEquippedAssets;
    local l_ownedItemIdsBySubtype_1 = v250.props.ownedItemIdsBySubtype;
    local v259 = l_categoryInfo_2.PageType == v58.PageType.Emotes;
    local v260 = {};
    if v251 then
        local v261 = nil;
        if v259 then
            v261 = l_equippedEmote_0 and {
                [l_equippedEmote_0.assetId] = {}
            } or {};
            if l_equippedEmote_0 then
                table.insert(v260, l_equippedEmote_0.assetId);
            end;
        elseif l_isOutfitsPage_1 then
            local v262 = v250:getEquippedOutfit(l_assetTypeKey_1);
            v261 = v262 and {
                [v262] = {}
            } or {};
            if v262 then
                table.insert(v260, v262);
            end;
        else
            local v263 = v55.getEquippedAssetIdsForCategory(l_equippedAssets_1, l_categoryInfo_2);
            v261 = v263;
            v260 = v4.Dictionary.join(v260, v263);
        end;
        if next(v261) ~= nil then
            v250.props.dispatchSetOwnedItemIdsBySubtype(l_assetTypeKey_1, v260);
        end;
        l_initialEquippedAssets_0 = v261;
        v250:setState({
            initialEquippedAssets = v261
        });
    end;
    local v264 = v237(l_ownedItemIdsBySubtype_1, l_initialEquippedAssets_0, l_assetTypeKey_1);
    if v264 and l_isOutfitsPage_1 and v264[1] ~= l_AddOutfitButton_0 and v250:getShowAddOutfitButton() then
        v264 = v4.List.join({
            l_AddOutfitButton_0
        }, v264);
    end;
    v250:setState({
        ownedItemIds = v264, 
        itemsContainsOutfits = l_isOutfitsPage_1
    });
end;
v114.didMount = function(v265) --[[ Line: 1007 ]] --[[ Name: didMount ]]
    -- upvalues: v48 (copy)
    v265.isMounted = true;
    local v266 = v265.props.forwardRef or v265.listFrameRef;
    v265.checkSetListWidth(v266.current);
    if v265.props.dataStatus == v48.NotStarted then
        v265.loadMoreUserInventoryItems();
        return;
    else
        v265:updateItems(true);
        return;
    end;
end;
v114.willUnmount = function(v267) --[[ Line: 1023 ]] --[[ Name: willUnmount ]]
    v267.isMounted = false;
end;
v114.didUpdate = function(v268, v269, _) --[[ Line: 1027 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v48 (copy)
    local l_name_1 = v268.props.avatarRoute.current.name;
    local l_name_2 = v268.props.avatarRoute.opaque.name;
    local l_name_3 = v269.avatarRoute.opaque.name;
    local l_categoryInfo_3 = v268.props.categoryInfo;
    local l_dataStatus_1 = v268.props.dataStatus;
    local l_dataStatus_2 = v269.dataStatus;
    local l_ownedItemIdsBySubtype_2 = v268.props.ownedItemIdsBySubtype;
    local v278 = v268.props.emoteSlot ~= v269.emoteSlot;
    local v279 = v268.props.assetTypeKey ~= v269.assetTypeKey;
    local v280 = v268.props.categoryIndex ~= v269.categoryIndex;
    local v281 = v268.props.subcategoryIndex ~= v269.subcategoryIndex;
    local v282 = false;
    if v268.props.categoryIndex == 1 then
        v282 = v268.props.subcategoryIndex == 1;
    end;
    local v283 = l_ownedItemIdsBySubtype_2 ~= v269.ownedItemIdsBySubtype;
    local v284 = v280 or v281 or v282;
    local v285 = true;
    if l_name_1 ~= l_AvatarScreen_0.AvatarEditor then
        v285 = l_name_2 == l_AvatarScreen_0.AvatarEditor;
    end;
    if v285 and v284 and l_categoryInfo_3.RenderItemTiles and l_dataStatus_1 == v48.NotStarted then
        v268.loadMoreUserInventoryItems();
    end;
    if v280 or v281 then
        local l_current_1 = v268.scrollingFrameRef.current;
        if l_current_1 then
            l_current_1.CanvasPosition = Vector2.new(0, 0);
        end;
        v268:setState({
            restorePreviousChildFocus = false
        });
    end;
    local v287 = false;
    if l_dataStatus_1 == v48.Done then
        v287 = l_dataStatus_2 == v48.Fetching;
    end;
    if v279 or v278 or v283 or v287 then
        v268:updateItems(v279 or v278 or v287);
    end;
    if l_name_2 ~= l_name_3 and l_name_2 == l_AvatarScreen_0.AvatarEditor then
        local v288 = v268.scrollingFrameRef:getValue();
        if v288 then
            v288.CanvasPosition = Vector2.new(0, 0);
            v268.setParentRestorePreviousChildFocus(false);
        end;
    end;
end;
local function v310(v289, v290) --[[ Line: 1085 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v52 (copy), v55 (copy), v48 (copy), v83 (copy), v75 (copy), l_PerformFetch_0 (copy), v82 (copy), v64 (copy), l_FFlagAXRootSlotBasedEditorFlag_0 (copy), l_DeviceOrientationMode_0 (copy)
    local l_category_0 = v289.AvatarExperience.AvatarEditor.Categories.category;
    local l_subcategory_0 = v289.AvatarExperience.AvatarEditor.Categories.subcategory;
    local l_selectedSlot_0 = v289.AvatarExperience.AvatarEditor.EquippedEmotes.selectedSlot;
    local l_slotInfo_0 = v289.AvatarExperience.AvatarEditor.EquippedEmotes.slotInfo;
    local v295 = v52.getAvatarEditorCategoryInfoFromState(v289);
    local v296 = v295.RenderOutfitItemTiles == true;
    local v297 = v55.selectAssetTypeKey(v289);
    local l_Failed_0 = v48.Failed;
    local v299 = false;
    local v300 = nil;
    if v83() or v75.isEnabled() and v290.enableHeadCategoryCombine or not v296 then
        v300 = v295 and v295.UseGetInventoryV2 or not v296;
    end;
    local v301 = v52.getNextPageCursorKey(v297, v296, v295.OutfitType);
    local v302 = nil;
    local v303 = nil;
    if v297 then
        local l_subButton_0 = v289.AvatarExperience.AvatarEditor.Categories.subButton;
        local v305, v306 = v55.getSearchUuidAndAssetTypes(v295, l_subButton_0);
        v302 = v305;
        v303 = v306;
        if (v83() or v75.isEnabled() and v290.enableHeadCategoryCombine or not v296) and v300 and v302 then
            l_Failed_0 = l_PerformFetch_0.GetStatus(v289, v302);
            v301 = v302;
        elseif v296 then
            v305 = v52.getPerformFetchKey(v297, v296, v295.OutfitType);
            l_Failed_0 = l_PerformFetch_0.GetStatus(v289, v305);
        else
            v305 = v52.getPerformFetchKey(v297, v296, v295.OutfitType);
            l_Failed_0 = l_PerformFetch_0.GetStatus(v289, v305);
        end;
        v299 = not v289.AvatarExperience.AvatarEditor.PageFinished[if v82 then v301 else v297];
    end;
    local v307, v308 = v64(v289, v297);
    local l_BodyColor3s_0 = v289.AvatarExperience.AvatarEditor.Character.BodyColor3s;
    return {
        pageFinished = v289.AvatarExperience.AvatarEditor.PageFinished[v301], 
        nextPageCursorKey = if v75.isEnabled() then v301 else nil, 
        categoryInfo = v295, 
        dataStatus = l_Failed_0, 
        hasMoreUserInventoryItems = v299, 
        assetTypeKey = v297, 
        categoryIndex = l_category_0, 
        subcategoryIndex = l_subcategory_0, 
        emoteSlot = l_selectedSlot_0, 
        equippedEmote = l_slotInfo_0[l_selectedSlot_0], 
        isOutfitsPage = v296, 
        ownedItemIdToIsWearing = v307, 
        hasItemFromCurrentPageEquipped = v308, 
        outfitInfos = v289.AvatarExperience.AvatarEditor.OutfitInfos, 
        avatarType = v289.AvatarExperience.AvatarEditor.Character.AvatarType, 
        bodyColor3s = l_BodyColor3s_0, 
        scales = v289.AvatarExperience.AvatarEditor.Character.AvatarScales, 
        equippedAssets = v289.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        outfitOrAsset = v289.AvatarExperience.AvatarEditor.Character.OutfitOrAsset, 
        ownedItemIdsBySubtype = v289.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype, 
        screenSize = v289.ScreenSize, 
        isPortrait = if l_FFlagAXRootSlotBasedEditorFlag_0 then v289.DeviceOrientation == l_DeviceOrientationMode_0.Portrait else nil, 
        recommendationData = nil, 
        userInventoryRecommendationsFetchStatus = nil, 
        analyticsMetadata = v289.AvatarExperience.AnalyticsMetadata, 
        searchUuid = v302
    };
end;
local function v324(v311) --[[ Line: 1192 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v60 (copy), v61 (copy), v62 (copy), v65 (copy), l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 (copy), v41 (copy), v37 (copy)
    return {
        getUserInventory = function(v312) --[[ Line: 1194 ]] --[[ Name: getUserInventory ]]
            -- upvalues: v311 (copy), v60 (ref)
            return v311(v60(v312));
        end, 
        getUserInventoryV2 = function(v313, v314, v315) --[[ Line: 1198 ]] --[[ Name: getUserInventoryV2 ]]
            -- upvalues: v311 (copy), v61 (ref)
            return v311(v61(v313, v314, v315));
        end, 
        getOutfits = function(v316, v317, v318, v319) --[[ Line: 1202 ]] --[[ Name: getOutfits ]]
            -- upvalues: v311 (copy), v62 (ref)
            return v311(v62(v316, v317, v318, v319));
        end, 
        sendShopForMoreAnalytics = function(v320) --[[ Line: 1206 ]] --[[ Name: sendShopForMoreAnalytics ]]
            -- upvalues: v311 (copy), v65 (ref)
            v311(v65(v320));
        end, 
        navigateWithLock = l_FFlagAXMigrateAvatarEditorItemCardInputBindingsToFocusNavigation_0 and function(v321) --[[ Line: 1211 ]]
            -- upvalues: v311 (copy), v41 (ref)
            v311(v41(v321));
        end or nil, 
        dispatchSetOwnedItemIdsBySubtype = function(v322, v323) --[[ Line: 1216 ]] --[[ Name: dispatchSetOwnedItemIdsBySubtype ]]
            -- upvalues: v311 (copy), v37 (ref)
            return v311(v37(v322, v323));
        end
    };
end;
v114 = l_RoactServices_0.connect({
    networking = v43, 
    avatarEditorAnalytics = v66
})(v114);
v114 = v70((l_withNavigation_0((v63((v7.connect(v310, v324)(v114)))))));
if v75.isEnabled() then
    v114 = v45.connectTestVariables({
        enableHeadCategoryCombine = v75.EnableHeadCategoryCombination
    })(v114);
end;
v114 = l_RoactAppPolicy_0.connect(function(v325, _) --[[ Line: 1241 ]]
    return {
        enableContinuousLoad = v325.getEnableContinuousLoad()
    };
end)(v114);
local function v328(v327) --[[ Line: 1247 ]] --[[ Name: selectCategoryInfo ]]
    -- upvalues: v52 (copy)
    return v52.getAvatarEditorCategoryInfoFromState(v327);
end;
local function v330(v329) --[[ Line: 1251 ]] --[[ Name: selectAssetTypeKey ]]
    -- upvalues: v55 (copy)
    return v55.selectAssetTypeKey(v329);
end;
return v5.forwardRef(function(v331, v332) --[[ Line: 1255 ]]
    -- upvalues: l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 (copy), v8 (copy), v20 (copy), v43 (copy), l_useDispatch_0 (copy), l_useSelector_0 (copy), v328 (copy), v330 (copy), v45 (copy), v75 (copy), l_FFlagAXItemDetailsIxpExposure_0 (copy), l_useUnifiedEventImpressionsReporter_0 (copy), v6 (copy), v52 (copy), v55 (copy), v83 (copy), v61 (copy), v58 (copy), v59 (copy), v62 (copy), v60 (copy), v19 (copy), v77 (copy), l_useFocusGuiObject_0 (copy), v98 (copy), v5 (copy), v114 (ref), v4 (copy)
    local l_NextSelectionUp_0 = v331.NextSelectionUp;
    local l_buttonBInputRef_0 = v331.buttonBInputRef;
    local v335 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v8.useFocusController() else nil;
    local v336 = v20(v43);
    local v337 = l_useDispatch_0();
    local v338 = l_useSelector_0(v328);
    local v339 = l_useSelector_0(v330);
    local v340 = v45.useTestVariables(v75.EnableHeadCategoryCombination);
    local v341 = v75.isEnabled();
    local v342 = nil;
    if l_FFlagAXItemDetailsIxpExposure_0 then
        local v343 = l_useUnifiedEventImpressionsReporter_0();
        local l_v343_0 = v343 --[[ copy: 12 -> 19 ]];
        v342 = v6.useMemo(function() --[[ Line: 1272 ]]
            -- upvalues: l_v343_0 (copy)
            return {
                l_v343_0
            };
        end, {
            v343
        });
    end;
    local v352 = v6.useCallback(function() --[[ Line: 1277 ]]
        -- upvalues: v338 (copy), v52 (ref), v339 (copy), v55 (ref), v83 (ref), v341 (copy), v340 (copy), v337 (copy), v61 (ref), v336 (copy), v58 (ref), v59 (ref), v62 (ref), v60 (ref)
        local v345 = v338.RenderOutfitItemTiles == true;
        local v346 = v52.getNextPageCursorKey(v339, v345, v338.OutfitType);
        local v347, _ = v55.getSearchUuidAndAssetTypes(v338, nil);
        if v339 and (v83() or v341 and v340) and v338 and v338.UseGetInventoryV2 and v347 then
            v346 = v347;
        end;
        if v83() and v338.UseGetInventoryV2 or not v345 then
            return v337(v61(v336, v338, v346));
        elseif v341 and v340 and v338.OutfitType == v58.OutfitTypes.DynamicHead and v338.AssetTypeIdStrings then
            return v337(v61(v336, v338, v346));
        elseif v345 then
            local v349 = v339 == v59.EditableCharacterKey;
            local l_OutfitType_1 = v338.OutfitType;
            local v351 = v339 .. (l_OutfitType_1 or "");
            return v337(v62(v339, v349, v351, l_OutfitType_1));
        else
            return v337(v60(v338));
        end;
    end, {
        v336, 
        v337, 
        v338, 
        v339, 
        v340, 
        v341
    });
    local v353, v354 = v19(v352);
    local v355 = v353.status == v77.Pending;
    local v356 = nil;
    local v357 = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_useFocusGuiObject_0() else nil;
    if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then
        local v358 = v6.useCallback(function() --[[ Line: 1333 ]]
            -- upvalues: l_NextSelectionUp_0 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref), v357 (copy), v335 (copy), l_buttonBInputRef_0 (copy)
            if l_NextSelectionUp_0 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v357 and l_NextSelectionUp_0.current then
                        v357(l_NextSelectionUp_0.current);
                        return;
                    end;
                else
                    v335.moveFocusTo(l_NextSelectionUp_0.current);
                    return;
                end;
            elseif l_buttonBInputRef_0 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v357 and l_buttonBInputRef_0 and l_buttonBInputRef_0.current then
                        v357(l_buttonBInputRef_0.current);
                        return;
                    end;
                else
                    v335.moveFocusTo(l_buttonBInputRef_0);
                end;
            end;
        end, {
            l_NextSelectionUp_0, 
            l_buttonBInputRef_0, 
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v357 else v335
        });
        v356 = v98(nil, v358);
    end;
    return v5.createElement(v114, v4.Dictionary.join(v331, {
        forwardRef = v332, 
        focusNavigationRef = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v356 else nil, 
        focusController = if not l_FFlagAXMigrateAXToGlobalAutofocus_0 and l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then v335 else nil, 
        focusGuiObject = v357, 
        loadMoreItems = v354, 
        isFetchingMore = v355, 
        tagBasedImpressionsDetectorExtensions = v342
    }));
end);