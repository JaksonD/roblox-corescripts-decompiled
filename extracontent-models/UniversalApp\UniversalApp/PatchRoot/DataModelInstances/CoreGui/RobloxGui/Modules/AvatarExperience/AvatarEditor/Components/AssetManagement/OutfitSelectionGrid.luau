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
local l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXFixGamepadNavigationOnOutfitManagement;
local v46 = l_Images_0["icons/navigation/pushBack"];
local v47 = l_GridMetrics_0.makeCustomMetricsGetter(v23.ItemsGridMetrics);
local v52 = v3.forwardRef(function(v48, v49) --[[ Line: 85 ]]
    -- upvalues: l_useLocalization_0 (copy), l_useDesignTokens_0 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), v7 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy)
    local v50 = l_useLocalization_0({
        loadMore = "Feature.Catalog.Action.LoadMore"
    });
    local v51 = l_useDesignTokens_0();
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or v7.Focusable.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v51.Global.Size_600), 
        ref = v49, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v48.NextSelectionUp, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v48.NextSelectionDown, 
        LayoutOrder = v48.LayoutOrder
    }, {
        LoadMoreButton = v3.createElement(l_Button_0, {
            onActivated = v48.onActivated, 
            text = v50.loadMore, 
            standardSize = l_StandardButtonSize_0.Regular, 
            buttonType = l_ButtonType_0.Secondary, 
            size = UDim2.fromScale(1, 1), 
            anchorPoint = Vector2.new(0.5, 0.5), 
            position = UDim2.fromScale(0.5, 0.5)
        })
    });
end);
local v53 = v3.PureComponent:extend("OutfitSelectionGrid");
v53.validateProps = v5.strictInterface({
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
v53.defaultProps = {
    multiSelect = false
};
v53.getItemIconType = function(v54, v55) --[[ Line: 152 ]] --[[ Name: getItemIconType ]]
    -- upvalues: v22 (copy)
    local l_outfitInfos_0 = v54.props.outfitInfos;
    local v57 = l_outfitInfos_0 and l_outfitInfos_0[v55];
    if v57 then
        return v22.getItemIconTypeFromOutfit(v57);
    else
        return nil;
    end;
end;
v53.init = function(v58) --[[ Line: 163 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v23 (copy), l_wasLastInputGamepad_0 (copy), v24 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v58.loadableGridViewRef = v3.createRef();
    v58.emptyStateRef = v3.createRef();
    v58.loadMoreRef = v3.createRef();
    local v59 = 0;
    local v60 = 0;
    local function _() --[[ Line: 170 ]] --[[ Name: checkCanScroll ]]
        -- upvalues: v58 (copy), v23 (ref), v60 (ref), v59 (ref)
        if v58.props.canScrollUpdated then
            local v61 = v23.ItemsGridTopPadding + v23.ItemsGridBottomPadding;
            v58.props.canScrollUpdated(v60 + v61 > v59);
        end;
    end;
    v58.absoluteSizeChanged = function(v63) --[[ Line: 177 ]]
        -- upvalues: v59 (ref), v58 (copy), v23 (ref), v60 (ref)
        v59 = v63.AbsoluteSize.Y;
        if v58.props.canScrollUpdated then
            local v64 = v23.ItemsGridTopPadding + v23.ItemsGridBottomPadding;
            v58.props.canScrollUpdated(v60 + v64 > v59);
        end;
    end;
    v58.contentSizeChanged = function(v65) --[[ Line: 182 ]]
        -- upvalues: v60 (ref), v58 (copy), v23 (ref), v59 (ref)
        v60 = v65.AbsoluteContentSize.Y;
        if v58.props.canScrollUpdated then
            local v66 = v23.ItemsGridTopPadding + v23.ItemsGridBottomPadding;
            v58.props.canScrollUpdated(v60 + v66 > v59);
        end;
    end;
    v58.onLoadMoreButtonActivated = function() --[[ Line: 187 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v58 (copy), v24 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local v67 = l_wasLastInputGamepad_0();
        local v68 = not (v58.props.hasMoreItems and #v58.props.editableOwnedOutfitIds == 0) and v58.props.editableOwnedOutfitIds or nil;
        local l_ShimmerCardsToDisplay_0 = v24.ShimmerCardsToDisplay;
        local v70 = (v68 and #v68 or l_ShimmerCardsToDisplay_0) > 0;
        if v67 then
            v58:setState({
                restorePreviousChildFocus = true
            });
            if v70 then
                if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                    if v58.props.focusGuiObject and v58.loadableGridViewRef.current then
                        v58.props.focusGuiObject(v58.loadableGridViewRef.current);
                    end;
                else
                    v58.props.focusController.moveFocusTo(v58.loadableGridViewRef);
                end;
            end;
        end;
        v58.props.loadMoreItems();
    end;
end;
v53.renderItem = function(v71, v72) --[[ Line: 212 ]] --[[ Name: renderItem ]]
    -- upvalues: v2 (copy), l_Constants_0 (copy), l_getRbxthumbWithTypeSizeAndOptions_0 (copy), v24 (copy), l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 (copy), v3 (copy), v30 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_ItemTile_0 (copy), l_Focusable_0 (copy), v7 (copy)
    if typeof(v72) == "table" then
        v72 = nil;
    end;
    local v73 = v2.List.find(v71.props.selectedOutfits, v72) ~= nil;
    local function v75() --[[ Line: 218 ]] --[[ Name: toggleSelectOutfit ]]
        -- upvalues: v71 (copy), v73 (copy), v2 (ref), v72 (ref)
        if v71.props.multiSelect then
            local v74 = nil;
            v74 = if v73 then v2.List.removeValue(v71.props.selectedOutfits, v72) else v2.List.join(v71.props.selectedOutfits, {
                v72
            });
            v71.props.selectionUpdated(v74);
            return;
        else
            if v73 then
                v71.props.selectionUpdated({});
                if v71.props.onToggleOutfitCard then
                    v71.props.onToggleOutfitCard(false);
                    return;
                end;
            else
                v71.props.selectionUpdated({
                    v72
                });
                if v71.props.onToggleOutfitCard then
                    v71.props.onToggleOutfitCard(true, v72);
                end;
            end;
            return;
        end;
    end;
    local v76 = nil;
    local v77 = nil;
    if v72 then
        local v78 = v71.props.outfitInfos[tostring(v72)];
        v76 = v78 and v78.name or nil;
        local l_Outfit_0 = l_Constants_0.RbxthumbTypes.Outfit;
        v77 = l_getRbxthumbWithTypeSizeAndOptions_0(v72, l_Outfit_0, 150);
        if v78 then
            v77 = v77 .. "&filters=" .. v78.updateCounter;
        end;
    end;
    local l_ItemTileTitleMaxLines_0 = v24.ItemTileTitleMaxLines;
    if not v71.props.showCustomOutfitNames then
        l_ItemTileTitleMaxLines_0 = 0;
    end;
    if l_FFlagAXMigrateManageOutfitPageInputBindingsToFocusNavigation_0 then
        return v3.createElement(v30, {
            isSelected = v73, 
            multiSelect = v71.props.multiSelect, 
            itemIconType = v71:getItemIconType(v72), 
            toggleSelectOutfit = v75, 
            name = v76, 
            titleTextLineCount = l_ItemTileTitleMaxLines_0, 
            thumbnail = v77, 
            itemId = v72, 
            selectionUpdated = v71.props.selectionUpdated, 
            selectedOutfits = v71.props.selectedOutfits, 
            onToggleOutfitCard = v71.props.onToggleOutfitCard
        });
    else
        return v3.createElement(if l_FFlagAXMigrateAXToGlobalAutofocus_0 then l_ItemTile_0 else l_Focusable_0[l_ItemTile_0], {
            isSelected = v73, 
            multiSelect = v71.props.multiSelect, 
            itemIconType = v71:getItemIconType(v72), 
            onActivated = v75, 
            name = v76, 
            titleTextLineCount = l_ItemTileTitleMaxLines_0, 
            thumbnail = v77, 
            Selectable = l_FFlagAXMigrateAXToGlobalAutofocus_0 and true or nil, 
            inputBindings = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else {
                ToggleSelect = v7.Input.onBegin(Enum.KeyCode.ButtonA, v75, {
                    key = v73 and "Feature.Avatar.Action.Unselect" or "Feature.Avatar.Action.Select"
                })
            }
        });
    end;
end;
v53.renderWithProviders = function(v81, v82, v83) --[[ Line: 296 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v24 (copy), v22 (copy), v3 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_Focusable_0 (copy), v31 (copy), l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 (copy), l_FitFrameVertical_0 (copy), v23 (copy), v25 (copy), v47 (copy), v52 (copy), v33 (copy), l_EmptyState_0 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy), v46 (copy)
    local v84 = v81.props.hasMoreItems and #v81.props.editableOwnedOutfitIds == 0;
    local v85 = not v84 and v81.props.editableOwnedOutfitIds or nil;
    local l_ShimmerCardsToDisplay_1 = v24.ShimmerCardsToDisplay;
    local v87 = v85 and #v85 or l_ShimmerCardsToDisplay_1;
    local v88 = v87 > 0;
    local l_Font_0 = v82.Font;
    local v90 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local v91 = nil;
    v91 = if v81.props.showCustomOutfitNames then v22.GridItemHeightGetter(v24.ItemTileType.BundleItemTile, v90) else v22.GridItemHeightGetter(v24.ItemTileType.BundleItemTileNoText);
    local v92 = nil;
    v92 = if v88 then v81.loadableGridViewRef else v81.emptyStateRef;
    local v93 = v83.noItemsLabel:gsub("({itemType})", v83.itemType);
    local l_forwardRef_0 = v81.props.forwardRef;
    local l_isFetchingMore_0 = v81.props.isFetchingMore;
    local l_enableContinuousLoad_0 = v81.props.enableContinuousLoad;
    local v97 = l_isFetchingMore_0 or v84;
    local v98 = not v97 and v81.props.hasMoreItems;
    local v99 = if v98 and l_enableContinuousLoad_0 then v81.props.loadMoreItems else nil;
    local v100 = v98 and not l_enableContinuousLoad_0;
    return v3.createElement(l_FFlagAXMigrateAXToGlobalAutofocus_0 and "Frame" or l_Focusable_0.Frame, {
        BackgroundTransparency = 1, 
        Size = UDim2.fromScale(1, 1), 
        [v3.Change.AbsoluteSize] = v81.absoluteSizeChanged, 
        NextSelectionLeft = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v81.props.NextSelectionLeft, 
        NextSelectionRight = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v81.props.NextSelectionRight, 
        NextSelectionDown = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v81.props.NextSelectionDown, 
        NextSelectionUp = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v81.props.NextSelectionUp, 
        ref = l_forwardRef_0, 
        defaultChild = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v92, 
        restorePreviousChildFocus = not l_FFlagAXMigrateAXToGlobalAutofocus_0 or nil
    }, {
        RefreshScrollingFrameWithLoadMore = v88 and v3.createElement(v31, {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, 0), 
            Size = UDim2.fromScale(1, 1), 
            createEndOfScrollElement = false, 
            parentAppPage = v81.props.pageOwner, 
            onThresholdReached = v99, 
            Selectable = not l_FFlagAXFixGamepadNavigationOnOutfitManagement_0 and nil
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                [v3.Change.AbsoluteContentSize] = v81.contentSizeChanged
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
                    getItemMetrics = v47, 
                    items = v85, 
                    totalNumItems = v87, 
                    renderItem = function(v101) --[[ Line: 385 ]] --[[ Name: renderItem ]]
                        -- upvalues: v81 (copy)
                        return v81:renderItem(v101);
                    end, 
                    getItemHeight = v91, 
                    windowHeight = v81.props.screenSize.Y, 
                    ref = v81.loadableGridViewRef, 
                    NextSelectionDown = if v52 then v81.loadMoreRef else nil
                })
            }), 
            LoadMoreButton = if v100 and v52 then v3.createElement(v52, {
                onActivated = v81.onLoadMoreButtonActivated, 
                LayoutOrder = 2, 
                ref = v81.loadMoreRef, 
                NextSelectionUp = v81.loadableGridViewRef
            }) else nil, 
            LoadingBar = if v97 then v3.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v82.Tokens.Global.Size_700), 
                LayoutOrder = 3
            }, {
                LoadingBar = v3.createElement(v33)
            }) else nil
        }), 
        EmptyState = not v88 and v3.createElement(l_EmptyState_0, {
            buttonIcon = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "" or v46, 
            icon = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "" or nil, 
            buttonText = if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then v83.backLabel else nil, 
            iconSize = if l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 then UDim2.fromScale(0, 0) else nil, 
            onActivated = v81.props.goBack, 
            text = v93, 
            ref = v81.emptyStateRef
        })
    });
end;
v53.render = function(v102) --[[ Line: 430 ]] --[[ Name: render ]]
    -- upvalues: l_withStyle_0 (copy), l_withLocalization_0 (copy), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (copy)
    return l_withStyle_0(function(v103) --[[ Line: 431 ]]
        -- upvalues: l_withLocalization_0 (ref), l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 (ref), v102 (copy)
        return l_withLocalization_0({
            itemType = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Avatars" or "Feature.Catalog.Label.Characters", 
            noItemsLabel = "Feature.Avatar.Label.NoItems", 
            backLabel = l_FFlagAXUpdateSlotBasedEditorToastAndPrompts_0 and "Feature.Avatar.Label.Back" or nil
        })(function(v104) --[[ Line: 438 ]]
            -- upvalues: v102 (ref), v103 (copy)
            return v102:renderWithProviders(v103, v104);
        end);
    end);
end;
v53.didMount = function(v105) --[[ Line: 444 ]] --[[ Name: didMount ]]
    if v105.props.hasMoreItems then
        v105.props.loadMoreItems();
    end;
end;
v53.didUpdate = function(v106, v107, _) --[[ Line: 450 ]] --[[ Name: didUpdate ]]
    -- upvalues: v2 (copy)
    if v106.props.multiSelect ~= v107.multiSelect and not v106.props.multiSelect then
        v106.props.selectionUpdated({});
    end;
    local v109 = v106.props.editableOwnedOutfitIds ~= v107.editableOwnedOutfitIds;
    local v110 = v106.props.selectedOutfits ~= v107.selectedOutfits;
    if v109 or v110 then
        local v111 = {};
        local v112 = false;
        for _, v114 in v106.props.selectedOutfits do
            if v2.List.find(v106.props.editableOwnedOutfitIds, v114) then
                v111[#v111 + 1] = v114;
            else
                v112 = true;
            end;
        end;
        if v112 then
            v106.props.selectionUpdated(v111);
        end;
    end;
end;
v53 = l_RoactAppPolicy_0.connect(function(v115, _) --[[ Line: 481 ]]
    return {
        showCustomOutfitNames = v115.getCustomOutfitNames(), 
        enableContinuousLoad = v115.getEnableContinuousLoad()
    };
end)(v53);
v53 = v4.connect(function(v117, _) --[[ Line: 488 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v23 (copy)
    local v119 = not v117.AvatarExperience.AvatarEditor.PageFinished[v23.EditableCharacterKey];
    local l_OutfitInfos_0 = v117.AvatarExperience.AvatarEditor.OutfitInfos;
    return {
        editableOwnedOutfitIds = v117.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[v23.EditableCharacterKey] or {}, 
        outfitInfos = l_OutfitInfos_0, 
        screenSize = v117.ScreenSize, 
        hasMoreItems = v119
    };
end)(v53);
return v3.forwardRef(function(v121, v122) --[[ Line: 506 ]]
    -- upvalues: l_useDispatch_0 (copy), v3 (copy), v29 (copy), v36 (copy), v32 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v53 (ref), v2 (copy), v7 (copy)
    local v123 = l_useDispatch_0();
    local v124 = v3.useCallback(function() --[[ Line: 509 ]]
        -- upvalues: v123 (copy), v29 (ref)
        return v123(v29());
    end, {});
    local v125, v126 = v36(v124);
    local v127 = v125.status == v32.Pending;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v128 = l_useFocusGuiObject_0();
        return v3.createElement(v53, v2.Dictionary.join(v121, {
            forwardRef = v122, 
            loadMoreItems = v126, 
            isFetchingMore = v127, 
            focusGuiObject = v128
        }));
    else
        return v7.withFocusController(function(v129) --[[ Line: 529 ]]
            -- upvalues: v3 (ref), v53 (ref), v2 (ref), v121 (copy), v122 (copy), v126 (copy), v127 (copy)
            return v3.createElement(v53, v2.Dictionary.join(v121, {
                forwardRef = v122, 
                loadMoreItems = v126, 
                isFetchingMore = v127, 
                focusController = v129
            }));
        end);
    end;
end);