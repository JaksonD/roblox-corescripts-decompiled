local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.Packages.FitFrame);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_Focusable_0 = v7.Focusable;
local l_FitFrameVertical_0 = v8.FitFrameVertical;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_ItemTile_0 = v6.Tile.ItemTile;
local l_withStyle_0 = v6.Style.withStyle;
local l_EmptyState_0 = v6.App.Indicator.EmptyState;
local l_Images_0 = v6.App.ImageSet.Images;
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v22 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v23 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v24 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v25 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v26 = require(l_CorePackages_0.Workspace.Packages.UserLib);
local l_Constants_0 = v26.Utils.Constants;
local l_getRbxthumbWithTypeSizeAndOptions_0 = v26.Utils.getRbxthumbWithTypeSizeAndOptions;
local v29 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetEditableOutfits);
local v30 = require(l_Modules_0.AvatarExperience.AvatarEditor.Components.AssetManagement.OutfitSelectionGridItem);
local v31 = require(l_Modules_0.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore);
local v32 = require(l_Modules_0.AvatarExperience.Common.Enum.RequestStatusEnum);
local v33 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v36 = require(l_Modules_0.AvatarExperience.Common.Hooks.useRequest);
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v6.App.Button.Enum.StandardButtonSize;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXUpdateSlotBasedEditorToastAndPrompts;
local l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation;
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local v45 = l_Images_0["icons/navigation/pushBack"];
local v46 = l_GridMetrics_0.makeCustomMetricsGetter(v23.ItemsGridMetrics);
local v51 = v3.forwardRef(function(v47, v48) --[[ Line: 82 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy)
    local v49 = l_useLocalization_0({
        loadMore = "Feature.Catalog.Action.LoadMore"
    });
    local v50 = l_useDesignTokens_0();
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or v7.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v50.Global.Size_600), 
        ref = v48, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v47.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v47.NextSelectionDown, 
        LayoutOrder = v47.LayoutOrder
    }, {
        LoadMoreButton = v3.createElement(l_Button_0, {
            onActivated = v47.onActivated, 
            text = v49.loadMore, 
            standardSize = l_StandardButtonSize_0.Regular, 
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.fromScale(1, 1), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5)
        })
    });
end);
local v52 = v3.PureComponent:extend("OutfitSelectionGrid");
v52.validateProps = v5.strictInterface({
    onToggleOutfitCard = v5.optional(v5.callback), 
    selectedOutfits = v5.array(v5.string), 
    selectionUpdated = v5.callback, 
    canScrollUpdated = v5.optional(v5.callback), 
    multiSelect = v5.optional(v5.boolean), 
    goBack = v5.callback, 
    pageOwner = v5.string, 
    loadMoreItems = v5.callback, 
    isFetchingMore = v5.boolean, 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    forwardRef = v5.table, 
    showCustomOutfitNames = v5.boolean, 
    enableContinuousLoad = v5.boolean, 
    outfitInfos = v5.table, 
    editableOwnedOutfitIds = v5.array(v5.string), 
    screenSize = v5.Vector2, 
    hasMoreItems = v5.boolean, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.table, 
    focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v5.optional(v5.callback) else nil
});
v52.defaultProps = {
    multiSelect = false
};
v52.getItemIconType = function(v53, v54) --[[ Line: 149 ]] --[[ Name: getItemIconType ]]
    -- upvalues: v22 (copy)
    local l_outfitInfos_0 = v53.props.outfitInfos;
    local v56 = l_outfitInfos_0 and l_outfitInfos_0[v54];
    if v56 then
        return v22.getItemIconTypeFromOutfit(v56);
    else
        return nil;
    end;
end;
v52.init = function(v57) --[[ Line: 160 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v23 (copy), l_wasLastInputGamepad_0 (copy), v24 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v57.loadableGridViewRef = v3.createRef();
    v57.emptyStateRef = v3.createRef();
    v57.loadMoreRef = v3.createRef();
    local v58 = 0;
    local v59 = 0;
    local function _() --[[ Line: 167 ]] --[[ Name: checkCanScroll ]]
        -- upvalues: v57 (copy), v23 (ref), v59 (ref), v58 (ref)
        if v57.props.canScrollUpdated then
            local v60 = v23.ItemsGridTopPadding + v23.ItemsGridBottomPadding;
            v57.props.canScrollUpdated(v59 + v60 > v58);
        end;
    end;
    v57.absoluteSizeChanged = function(v62) --[[ Line: 174 ]]
        -- upvalues: v58 (ref), v57 (copy), v23 (ref), v59 (ref)
        v58 = v62.AbsoluteSize.Y;
        if v57.props.canScrollUpdated then
            local v63 = v23.ItemsGridTopPadding + v23.ItemsGridBottomPadding;
            v57.props.canScrollUpdated(v59 + v63 > v58);
        end;
    end;
    v57.contentSizeChanged = function(v64) --[[ Line: 179 ]]
        -- upvalues: v59 (ref), v57 (copy), v23 (ref), v58 (ref)
        v59 = v64.AbsoluteContentSize.Y;
        if v57.props.canScrollUpdated then
            local v65 = v23.ItemsGridTopPadding + v23.ItemsGridBottomPadding;
            v57.props.canScrollUpdated(v59 + v65 > v58);
        end;
    end;
    v57.onLoadMoreButtonActivated = function() --[[ Line: 184 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v57 (copy), v24 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local v66 = l_wasLastInputGamepad_0();
        local v67 = not (v57.props.hasMoreItems and #v57.props.editableOwnedOutfitIds == 0) and v57.props.editableOwnedOutfitIds or nil;
        local l_ShimmerCardsToDisplay_0 = v24.ShimmerCardsToDisplay;
        local v69 = (v67 and #v67 or l_ShimmerCardsToDisplay_0) > 0;
        if v66 then
            v57:setState({
                restorePreviousChildFocus = true
            });
            if v69 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v57.props.focusGuiObject and v57.loadableGridViewRef.current then
                        v57.props.focusGuiObject(v57.loadableGridViewRef.current);
                    end;
                else
                    v57.props.focusController.moveFocusTo(v57.loadableGridViewRef);
                end;
            end;
        end;
        v57.props.loadMoreItems();
    end;
end;
v52.renderItem = function(v70, v71) --[[ Line: 209 ]] --[[ Name: renderItem ]]
    -- upvalues: v2 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v24 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), v3 (copy), v30 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ItemTile_0 (copy), l_Focusable_0 (copy), v7 (copy)
    if typeof(v71) == "table" then
        v71 = nil;
    end;
    local v72 = v2.List.find(v70.props.selectedOutfits, v71) ~= nil;
    local function v74() --[[ Line: 215 ]] --[[ Name: toggleSelectOutfit ]]
        -- upvalues: v70 (copy), v72 (copy), v2 (ref), v71 (ref)
        if v70.props.multiSelect then
            local v73 = nil;
            v73 = if v72 then v2.List.removeValue(v70.props.selectedOutfits, v71) else v2.List.join(v70.props.selectedOutfits, {
                v71
            });
            v70.props.selectionUpdated(v73);
            return;
        else
            if v72 then
                v70.props.selectionUpdated({});
                if v70.props.onToggleOutfitCard then
                    v70.props.onToggleOutfitCard(false);
                    return;
                end;
            else
                v70.props.selectionUpdated({
                    v71
                });
                if v70.props.onToggleOutfitCard then
                    v70.props.onToggleOutfitCard(true, v71);
                end;
            end;
            return;
        end;
    end;
    local v75 = nil;
    local v76 = nil;
    if v71 then
        local v77 = v70.props.outfitInfos[tostring(v71)];
        v75 = v77 and v77.name or nil;
        local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
        v76 = l_getRbxthumbWithTypeSizeAndOptions_0(v71, l_Outfit_0, 150);
        if v77 then
            v76 = v76 .. "&filters=" .. v77.updateCounter;
        end;
    end;
    local l_ItemTileTitleMaxLines_0 = v24.ItemTileTitleMaxLines;
    if not v70.props.showCustomOutfitNames then
        l_ItemTileTitleMaxLines_0 = 0;
    end;
    if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then
        return v3.createElement(v30, {
            isSelected = v72, 
            multiSelect = v70.props.multiSelect, 
            itemIconType = v70:getItemIconType(v71), 
            toggleSelectOutfit = v74, 
            name = v75, 
            titleTextLineCount = l_ItemTileTitleMaxLines_0, 
            thumbnail = v76, 
            itemId = v71, 
            selectionUpdated = v70.props.selectionUpdated, 
            selectedOutfits = v70.props.selectedOutfits, 
            onToggleOutfitCard = v70.props.onToggleOutfitCard
        });
    else
        return v3.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ItemTile_0 else l_Focusable_0[l_ItemTile_0], {
            isSelected = v72, 
            multiSelect = v70.props.multiSelect, 
            itemIconType = v70:getItemIconType(v71), 
            onActivated = v74, 
            name = v75, 
            titleTextLineCount = l_ItemTileTitleMaxLines_0, 
            thumbnail = v76, 
            Selectable = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                ToggleSelect = v7.Input.onBegin(Enum.KeyCode.ButtonA, v74, {
                    key = v72 and "Feature.Avatar.Action.Unselect" or "Feature.Avatar.Action.Select"
                })
            }
        });
    end;
end;
v52.renderWithProviders = function(v80, v81, v82) --[[ Line: 293 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v24 (copy), v22 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v31 (copy), l_FitFrameVertical_0 (copy), v23 (copy), v25 (copy), v46 (copy), v51 (copy), v33 (copy), l_EmptyState_0 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), v45 (copy)
    local v83 = v80.props.hasMoreItems and #v80.props.editableOwnedOutfitIds == 0;
    local v84 = not v83 and v80.props.editableOwnedOutfitIds or nil;
    local l_ShimmerCardsToDisplay_1 = v24.ShimmerCardsToDisplay;
    local v86 = v84 and #v84 or l_ShimmerCardsToDisplay_1;
    local v87 = v86 > 0;
    local l_Font_0 = v81.Font;
    local v89 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v90 = nil;
    v90 = if v80.props.showCustomOutfitNames then v22.GridItemHeightGetter(v24.ItemTileType.BundleItemTile, v89) else v22.GridItemHeightGetter(v24.ItemTileType.BundleItemTileNoText);
    local v91 = nil;
    v91 = if v87 then v80.loadableGridViewRef else v80.emptyStateRef;
    local v92 = v82.noItemsLabel:gsub("({itemType})", v82.itemType);
    local l_forwardRef_0 = v80.props.forwardRef;
    local l_isFetchingMore_0 = v80.props.isFetchingMore;
    local l_enableContinuousLoad_0 = v80.props.enableContinuousLoad;
    local v96 = l_isFetchingMore_0 or v83;
    local v97 = not v96 and v80.props.hasMoreItems;
    local v98 = if v97 and l_enableContinuousLoad_0 then v80.props.loadMoreItems else nil;
    local v99 = v97 and not l_enableContinuousLoad_0;
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Change.AbsoluteSize] = v80.absoluteSizeChanged, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v80.props.NextSelectionLeft, 
        NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v80.props.NextSelectionRight, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v80.props.NextSelectionDown, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v80.props.NextSelectionUp, 
        ref = l_forwardRef_0, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v91, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
    }, {
        RefreshScrollingFrameWithLoadMore = v87 and v3.createElement(v31, {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            createEndOfScrollElement = false, 
            parentAppPage = v80.props.pageOwner, 
            onThresholdReached = v98
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                [v3.Change.AbsoluteContentSize] = v80.contentSizeChanged
            }), 
            ListWrapper = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, 0), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1, 
                margin = {
                    top = v23.ItemsGridTopPadding, 
                    bottom = v23.ItemsGridBottomPadding, 
                    left = v23.ItemsGridSidePadding / 2, 
                    right = v23.ItemsGridSidePadding / 2
                }
            }, {
                LoadableGridView = v3.createElement(v25, {
                    getItemMetrics = v46, 
                    items = v84, 
                    totalNumItems = v86, 
                    renderItem = function(v100) --[[ Line: 381 ]] --[[ Name: renderItem ]]
                        -- upvalues: v80 (copy)
                        return v80:renderItem(v100);
                    end, 
                    getItemHeight = v90, 
                    windowHeight = v80.props.screenSize.Y, 
                    ref = v80.loadableGridViewRef, 
                    NextSelectionDown = if v51 then v80.loadMoreRef else nil
                })
            }), 
            LoadMoreButton = if v99 and v51 then v3.createElement(v51, {
                onActivated = v80.onLoadMoreButtonActivated, 
                LayoutOrder = 2, 
                ref = v80.loadMoreRef, 
                NextSelectionUp = v80.loadableGridViewRef
            }) else nil, 
            LoadingBar = if v96 then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v81.Tokens.Global.Size_700), 
                LayoutOrder = 3
            }, {
                LoadingBar = v3.createElement(v33)
            }) else nil
        }), 
        EmptyState = not v87 and v3.createElement(l_EmptyState_0, {
            buttonIcon = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "" or v45, 
            icon = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "" or nil, 
            buttonText = if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then v82.backLabel else nil, 
            iconSize = if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then UDim2.fromScale(0, 0) else nil, 
            onActivated = v80.props.goBack, 
            text = v92, 
            ref = v80.emptyStateRef
        })
    });
end;
v52.render = function(v101) --[[ Line: 426 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy)
    return l_withStyle_0(function(v102) --[[ Line: 427 ]]
        -- upvalues: l_withLocalization_0 (ref), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v101 (copy)
        return l_withLocalization_0({
            itemType = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Avatars" or "Feature.Catalog.Label.Characters", 
            noItemsLabel = "Feature.Avatar.Label.NoItems", 
            backLabel = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Back" or nil
        })(function(v103) --[[ Line: 434 ]]
            -- upvalues: v101 (ref), v102 (copy)
            return v101:renderWithProviders(v102, v103);
        end);
    end);
end;
v52.didMount = function(v104) --[[ Line: 440 ]] --[[ Name: didMount ]]
    if v104.props.hasMoreItems then
        v104.props.loadMoreItems();
    end;
end;
v52.didUpdate = function(v105, v106, _) --[[ Line: 446 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    if v105.props.multiSelect ~= v106.multiSelect and not v105.props.multiSelect then
        v105.props.selectionUpdated({});
    end;
    local v108 = v105.props.editableOwnedOutfitIds ~= v106.editableOwnedOutfitIds;
    local v109 = v105.props.selectedOutfits ~= v106.selectedOutfits;
    if v108 or v109 then
        local v110 = {};
        local v111 = false;
        for _, v113 in v105.props.selectedOutfits do
            if v2.List.find(v105.props.editableOwnedOutfitIds, v113) then
                v110[#v110 + 1] = v113;
            else
                v111 = true;
            end;
        end;
        if v111 then
            v105.props.selectionUpdated(v110);
        end;
    end;
end;
v52 = l_RoactAppPolicy_0.connect(function(v114, _) --[[ Line: 477 ]]
    return {
        showCustomOutfitNames = v114.getCustomOutfitNames(), 
        enableContinuousLoad = v114.getEnableContinuousLoad()
    };
end)(v52);
v52 = v4.connect(function(v116, _) --[[ Line: 484 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v23 (copy)
    local v118 = not v116.AvatarExperience.AvatarEditor.PageFinished[v23.EditableCharacterKey];
    local l_OutfitInfos_0 = v116.AvatarExperience.AvatarEditor.OutfitInfos;
    return {
        editableOwnedOutfitIds = v116.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v23.EditableCharacterKey] or {}, 
        outfitInfos = l_OutfitInfos_0, 
        screenSize = v116.ScreenSize, 
        hasMoreItems = v118
    };
end)(v52);
return v3.forwardRef(function(v120, v121) --[[ Line: 502 ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v29 (copy), v36 (copy), v32 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v52 (ref), v2 (copy), v7 (copy)
    local v122 = l_useDispatch_0();
    local v123 = v3.useCallback(function() --[[ Line: 505 ]]
        -- upvalues: v122 (copy), v29 (ref)
        return v122(v29());
    end, {});
    local v124, v125 = v36(v123);
    local v126 = v124.status == v32.Pending;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v127 = l_useFocusGuiObject_0();
        return v3.createElement(v52, v2.Dictionary.join(v120, {
            forwardRef = v121, 
            loadMoreItems = v125, 
            isFetchingMore = v126, 
            focusGuiObject = v127
        }));
    else
        return v7.withFocusController(function(v128) --[[ Line: 525 ]]
            -- upvalues: v3 (ref), v52 (ref), v2 (ref), v120 (copy), v121 (copy), v125 (copy), v126 (copy)
            return v3.createElement(v52, v2.Dictionary.join(v120, {
                forwardRef = v121, 
                loadMoreItems = v125, 
                isFetchingMore = v126, 
                focusController = v128
            }));
        end);
    end;
end);