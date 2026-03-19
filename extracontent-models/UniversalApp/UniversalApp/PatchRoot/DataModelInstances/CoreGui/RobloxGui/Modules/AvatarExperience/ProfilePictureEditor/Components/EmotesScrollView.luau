local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad;
local v3 = require(l_CorePackages_0.Packages.Cryo);
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = require(l_CorePackages_0.Packages.UIBlox);
local v7 = require(l_CorePackages_0.Packages.RoactGamepad);
local v8 = require(l_CorePackages_0.Packages.FitFrame);
local l_useFocusGuiObject_0 = require(l_CorePackages_0.Packages.ReactFocusNavigation).useFocusGuiObject;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_CorePackages_0.Packages.RoactNavigation);
local v12 = require(l_CorePackages_0.Packages.React);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local l_wasLastInputGamepad_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).wasLastInputGamepad;
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local l_Focusable_0 = v7.Focusable;
local l_FitFrameVertical_0 = v8.FitFrameVertical;
local l_GridMetrics_0 = v6.App.Grid.GridMetrics;
local l_withStyle_0 = v6.Style.withStyle;
local l_withTextSizeOffset_0 = v6.Core.Style.withTextSizeOffset;
local l_Button_0 = v6.App.Button.Button;
local l_ButtonType_0 = v6.App.Button.Enum.ButtonType;
local l_StandardButtonSize_0 = v6.App.Button.Enum.StandardButtonSize;
local v25 = require(l_Modules_0.AvatarExperience.Common.Hooks.useRequest);
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v27 = require(l_Modules_0.AvatarExperience.Common.Components.AXRefreshScrollingFrameWithLoadMore);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v29 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceNavigation);
local l_AvatarScreen_0 = v29.Enums.AvatarScreen;
local l_AvatarRoute_0 = v29.AvatarRoute.AvatarRoute;
local v32 = require(l_Modules_0.AvatarExperience.Common.Context.withAdaptiveScrolling);
local l_withNavigation_0 = v11.withNavigation;
local v34 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v35 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Utils);
local v36 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local v37 = require(l_Modules_0.AvatarExperience.Common.Constants);
local v38 = require(l_Modules_0.AvatarExperience.Common.Components.LoadableGridView);
local v39 = require(l_Modules_0.AvatarExperience.AvatarEditor.Thunks.GetUserInventory);
local v40 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Services.Analytics);
local v41 = require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Thunks.SetEmoteAssetId);
local v42 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute);
local v43 = if l_FFlagAXMigrateEquipSlotsInputBindingsToRoactGamepad_0 then require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.PPEEmoteItemTile) else require(l_Modules_0.AvatarExperience.ProfilePictureEditor.Components.PPEEmoteItemTile_DEPRECATED);
local v44 = require(l_Modules_0.AvatarExperience.Common.Components.RecommendedItems);
local v45 = require(l_Modules_0.AvatarExperience.Common.Enum.RequestStatusEnum);
local v46 = require(l_Modules_0.LuaApp.Components.LoadingBarWithTheme);
local v47 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAXEnableSlotBasedEditor);
local v48 = game:DefineFastFlag("AXEmotesScrollView3Grid", false);
local l_FFlagAXMigrateAXToGlobalAutofocus_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus;
local l_FFlagAXAdaptiveScrollingFixForward_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceFlags).FFlagAXAdaptiveScrollingFixForward;
local _ = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceCommon);
local v52 = v12.PureComponent:extend("EmotesScrollView");
local v53 = {
    [l_AvatarScreen_0.Catalog] = true, 
    [l_AvatarScreen_0.AvatarEditor] = true
};
v52.validateProps = v5.strictInterface({
    bottomBarHeight = v5.number, 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    baseRef = v5.table, 
    isFetchingMore = v5.boolean, 
    loadMoreItems = v5.callback, 
    profilePictureEditorAnalytics = v5.table, 
    navigation = v5.table, 
    items = v5.array(v5.string), 
    screenSize = v5.Vector2, 
    hasMoreItems = v5.boolean, 
    emoteAssetId = v5.optional(v5.string), 
    avatarType = v5.string, 
    setEmoteAssetId = v5.callback, 
    focusController = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then nil else v5.table, 
    avatarRoute = l_AvatarRoute_0.Interface, 
    adaptiveScrolling = v5.optional(v5.any), 
    enableContinuousLoad = v5.optional(v5.boolean), 
    focusGuiObject = if l_FFlagAXMigrateAXToGlobalAutofocus_0 then v5.optional(v5.callback) else nil
});
v52.init = function(v54) --[[ Line: 136 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy), v35 (copy), v7 (copy), l_wasLastInputGamepad_0 (copy), v37 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy)
    v54:setState({
        restorePreviousChildFocus = true, 
        loadableGridViewWidth = 0, 
        totalHeaderHeight = 0
    });
    v54.resultsListRef = v12.createRef();
    v54.absoluteSizeChanged = function(v55) --[[ Line: 144 ]]
        -- upvalues: v54 (copy)
        v54:setState({
            totalHeaderHeight = v55.AbsoluteSize.Y
        });
    end;
    v54.onFocusGained = function() --[[ Line: 150 ]]
        -- upvalues: v54 (copy)
        v54:setState({
            restorePreviousChildFocus = true
        });
    end;
    v54.onLoadableGridViewAbsoluteSizeChanged = function(v56) --[[ Line: 156 ]]
        -- upvalues: v54 (copy)
        if v54.state.loadableGridViewWidth ~= v56.AbsoluteSize.X then
            v54:setState({
                loadableGridViewWidth = v56.AbsoluteSize.X
            });
        end;
    end;
    local v57, v58, v59 = v35.getEmotesCategorySubcategoryAndInfo();
    v54.categoryIndex = v57;
    v54.subcategoryIndex = v58;
    v54.categoryInfo = v59;
    v54.assetTypeKey = v54.categoryInfo.SearchUuid;
    v54.loadableGridViewRef = v12.createRef();
    v54.recommendedItemsRef = v12.createRef();
    v54.emptyStateRef = v12.createRef();
    v54.itemDetailsPeekViewRefs = v7.createRefCache();
    v54.loadMoreButtonRef = v12.createRef();
    v54.sendShopForMoreAnalytics = function() --[[ Line: 173 ]]
        -- upvalues: v54 (copy)
        v54.props.profilePictureEditorAnalytics.clickShopForMore(v54.categoryIndex, v54.subcategoryIndex);
    end;
    v54.onLoadMoreButtonActivated = function() --[[ Line: 177 ]]
        -- upvalues: l_wasLastInputGamepad_0 (ref), v54 (copy), v37 (ref), l_FFlagAXMigrateAXToGlobalAutofocus_0 (ref)
        local v60 = l_wasLastInputGamepad_0();
        local v61 = not (v54.props.hasMoreItems and #v54.props.items == 0) and v54.props.items or nil;
        local l_ShimmerCardsToDisplay_0 = v37.ShimmerCardsToDisplay;
        local v63 = (v61 and #v61 or l_ShimmerCardsToDisplay_0) > 0;
        if v60 then
            if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
                if v54.props.focusGuiObject and v54.resultsListRef and v54.resultsListRef.current then
                    v54.props.focusGuiObject(v54.resultsListRef.current);
                end;
            else
                v54:setState({
                    restorePreviousChildFocus = true
                });
                if v63 then
                    v54.props.focusController.moveFocusTo(v54.resultsListRef);
                end;
            end;
        end;
        v54.props.loadMoreItems();
    end;
end;
v52.renderItem = function(v64, v65, v66) --[[ Line: 202 ]] --[[ Name: renderItem ]]
    -- upvalues: v12 (copy), v43 (copy)
    if typeof(v65) == "table" then
        v65 = nil;
    end;
    local v67 = v65 == v64.props.emoteAssetId;
    return v12.createElement(v43, {
        itemId = v65, 
        isSelected = v67, 
        titleFontStyle = v66, 
        itemDetailsPeekViewRefs = v64.itemDetailsPeekViewRefs, 
        resultsListRef = v64.resultsListRef
    });
end;
v52.renderWithProviders = function(v68, v69, v70, v71) --[[ Line: 218 ]] --[[ Name: renderWithProviders ]]
    -- upvalues: v37 (copy), l_GridMetrics_0 (copy), v36 (copy), v48 (copy), v47 (copy), v34 (copy), v12 (copy), l_Focusable_0 (copy), v27 (copy), l_AvatarScreen_0 (copy), l_FFlagAXAdaptiveScrollingFixForward_0 (copy), l_FitFrameVertical_0 (copy), v38 (copy), l_Button_0 (copy), l_StandardButtonSize_0 (copy), l_ButtonType_0 (copy), v46 (copy), v44 (copy)
    local v72 = v68.props.hasMoreItems and #v68.props.items == 0;
    local l_categoryInfo_0 = v68.categoryInfo;
    local v74 = not v72 and v68.props.items or nil;
    local l_ShimmerCardsToDisplay_1 = v37.ShimmerCardsToDisplay;
    local v76 = v74 and #v74 or l_ShimmerCardsToDisplay_1;
    local v77 = v76 > 0;
    local l_enableContinuousLoad_0 = v68.props.enableContinuousLoad;
    local v79 = v68.props.isFetchingMore or v72;
    local v80 = not v79 and v68.props.hasMoreItems;
    local v81 = if v80 and l_enableContinuousLoad_0 then v68.props.loadMoreItems else nil;
    local v82 = v80 and not l_enableContinuousLoad_0;
    local l_bottomBarHeight_0 = v68.props.bottomBarHeight;
    local l_Font_0 = v69.Font;
    local l_Theme_0 = v69.Theme;
    local l_Font_1 = l_Font_0.Header2.Font;
    local v87 = l_Font_0.BaseSize * l_Font_0.Header2.RelativeSize;
    local l_Header2_0 = l_Font_0.Header2;
    local v89 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
    local v90 = l_GridMetrics_0.makeCustomMetricsGetter(v36.ItemsGridMetrics);
    if v48 and v47() then
        v90 = l_GridMetrics_0.getSmallMetrics;
    end;
    if v90(v68.state.loadableGridViewWidth, v37.LoadableGridViewCellPadding).itemWidth / v89 < v37.MinTileWidthToFontHeightRatio then
        l_Header2_0 = l_Font_0.CaptionBody;
        v89 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
    end;
    v89 = v89 + v71;
    local v91 = v34.GridItemHeightGetter(v37.ItemTileType.AvatarEditorTile, v89);
    local v92 = nil;
    v92 = if v77 then v68.loadableGridViewRef else v68.emptyStateRef;
    local v93 = v70.noItemsLabel:gsub("({itemType})", v70.itemType);
    local v94 = v12.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        [v12.Change.AbsoluteSize] = v68.absoluteSizeChanged
    }, {
        SelectEmoteTextLabel = v12.createElement("TextLabel", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Font = l_Font_1, 
            TextColor3 = l_Theme_0.TextDefault.Color, 
            Text = v70.selectEmote, 
            TextSize = v87, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }, {
            Padding = v12.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 18), 
                PaddingBottom = UDim.new(0, 18)
            })
        })
    });
    local l_totalHeaderHeight_0 = v68.state.totalHeaderHeight;
    local v96 = not v68.state.restorePreviousChildFocus and v68.onFocusGained or nil;
    local l_restorePreviousChildFocus_0 = v68.state.restorePreviousChildFocus;
    local l_key_0 = v68.props.avatarRoute.current.key;
    local v99 = l_key_0 and v68.itemDetailsPeekViewRefs[l_key_0];
    local v100 = v68.props.adaptiveScrolling or {};
    return v12.createElement(l_Focusable_0.Frame, {
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
        Size = UDim2.new(1, 0, 1, -l_bottomBarHeight_0), 
        BorderSizePixel = 0, 
        NextSelectionLeft = v68.props.NextSelectionLeft, 
        NextSelectionRight = v68.props.NextSelectionRight, 
        NextSelectionDown = v68.props.NextSelectionDown, 
        NextSelectionUp = v68.props.NextSelectionUp, 
        ref = v68.props.baseRef, 
        defaultChild = v92, 
        restorePreviousChildFocus = v68.state.restorePreviousChildFocus
    }, {
        EmoteLabels = v94, 
        RefreshScrollingFrameWithLoadMore = if l_totalHeaderHeight_0 == 0 then nil else v12.createElement(v27, {
            BackgroundTransparency = 1, 
            Position = UDim2.fromOffset(0, l_totalHeaderHeight_0), 
            Size = UDim2.new(1, 0, 1, -l_totalHeaderHeight_0), 
            createEndOfScrollElement = false, 
            parentAppPage = l_AvatarScreen_0.ProfilePictureEditorEmotes, 
            ScrollingEnabled = if v100.scrollingEnabledBinding then v100.scrollingEnabledBinding:map(function(v101) --[[ Line: 330 ]]
                return v101;
            end) else l_FFlagAXAdaptiveScrollingFixForward_0 and true or v100.scrollingEnabled, 
            onCanvasPositionChanged = function(v102) --[[ Line: 338 ]] --[[ Name: onCanvasPositionChanged ]]
                -- upvalues: v100 (copy)
                local l_Y_0 = v102.CanvasPosition.Y;
                if v100.onCanvasYChanged then
                    v100.onCanvasYChanged(l_Y_0);
                end;
            end, 
            onThresholdReached = v81
        }, {
            UIListLayout = v12.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            UIPadding = v12.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, v69.Tokens.Global.Space_300)
            }), 
            ListWrapper = v77 and v12.createElement(l_Focusable_0[l_FitFrameVertical_0], {
                width = UDim.new(1, 0), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                margin = {
                    top = 0, 
                    bottom = v36.ItemsGridBottomPadding, 
                    left = v36.ItemsGridSidePadding / 2, 
                    right = v36.ItemsGridSidePadding / 2
                }, 
                NextSelectionDown = if v82 then v68.loadMoreButtonRef else v68.recommendedItemsRef, 
                ref = v68.loadableGridViewRef
            }, {
                LoadableGridView = v12.createElement(v38, {
                    getItemMetrics = if v48 then v90 else l_GridMetrics_0.makeCustomMetricsGetter(v36.ItemsGridMetrics), 
                    items = v74, 
                    totalNumItems = v76, 
                    renderItem = function(v104) --[[ Line: 380 ]] --[[ Name: renderItem ]]
                        -- upvalues: v68 (copy), l_Header2_0 (ref)
                        return v68:renderItem(v104, l_Header2_0);
                    end, 
                    getItemHeight = v91, 
                    windowHeight = v68.props.screenSize.Y, 
                    onAbsoluteSizeChanged = v68.onLoadableGridViewAbsoluteSizeChanged, 
                    onFocusGained = v96, 
                    restorePreviousChildFocus = l_restorePreviousChildFocus_0, 
                    NextSelectionRight = v99, 
                    ref = v68.resultsListRef
                })
            }), 
            NoEmotesLabel = not v77 and v12.createElement("TextLabel", {
                Size = UDim2.new(1, 0, 0, 48), 
                BackgroundTransparency = 1, 
                Font = l_Font_1, 
                TextColor3 = l_Theme_0.TextDefault.Color, 
                Text = v93, 
                TextSize = v87, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Center
            }), 
            LoadMoreButtonFrame = v82 and v12.createElement(l_Focusable_0[l_FitFrameVertical_0], {
                BackgroundTransparency = 1, 
                ref = v68.loadMoreButtonRef, 
                NextSelectionUp = v68.loadableGridViewRef, 
                NextSelectionDown = v68.recommendedItemsRef, 
                LayoutOrder = 3, 
                width = UDim.new(1, 0), 
                margin = {
                    top = 0, 
                    bottom = v36.ItemsGridBottomPadding, 
                    left = v36.ItemsGridSidePadding / 2, 
                    right = v36.ItemsGridSidePadding / 2
                }, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }, {
                LoadMoreButton = v12.createElement(l_Button_0, {
                    onActivated = v68.onLoadMoreButtonActivated, 
                    text = v70.loadMore, 
                    standardSize = l_StandardButtonSize_0.Regular, 
                    buttonType = l_ButtonType_0.Secondary, 
                    size = UDim2.fromScale(1, 1), 
                    anchorPoint = Vector2.new(0.5, 0.5), 
                    position = UDim2.fromScale(0.5, 0.5)
                })
            }), 
            LoadingBar = if v79 then v12.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 0, v69.Tokens.Global.Size_700), 
                LayoutOrder = 4
            }, {
                LoadingBar = v12.createElement(v46)
            }) else nil, 
            RecommendedItems = v12.createElement(v44, {
                LayoutOrder = 5, 
                categoryInfo = l_categoryInfo_0, 
                sendShopForMoreAnalytics = v68.sendShopForMoreAnalytics, 
                itemDetailsPeekViewRefs = v68.itemDetailsPeekViewRefs, 
                listFrameRef = v68.props.baseRef, 
                baseRef = v68.recommendedItemsRef, 
                NextSelectionUp = if v82 then v68.loadMoreButtonRef else v68.loadableGridViewRef, 
                NextSelectionDown = v68.props.NextSelectionDown
            })
        })
    });
end;
v52.render = function(v105) --[[ Line: 454 ]] --[[ Name: render ]]
    -- upvalues: l_withTextSizeOffset_0 (copy), l_withStyle_0 (copy), l_withLocalization_0 (copy)
    return l_withTextSizeOffset_0(function(v106) --[[ Line: 455 ]]
        -- upvalues: l_withStyle_0 (ref), l_withLocalization_0 (ref), v105 (copy)
        return l_withStyle_0(function(v107) --[[ Line: 456 ]]
            -- upvalues: l_withLocalization_0 (ref), v105 (ref), v106 (copy)
            return l_withLocalization_0({
                itemType = "Feature.Catalog.Label.Emotes", 
                noItemsLabel = "Feature.Avatar.Label.NoItems", 
                selectEmote = "Feature.Avatar.Message.SelectEmote", 
                loadMore = "Feature.Catalog.Action.LoadMore"
            })(function(v108) --[[ Line: 462 ]]
                -- upvalues: v105 (ref), v107 (copy), v106 (ref)
                return v105:renderWithProviders(v107, v108, v106);
            end);
        end);
    end);
end;
v52.didUpdate = function(v109, v110) --[[ Line: 469 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_AvatarScreen_0 (copy), v53 (copy)
    local l_name_0 = v109.props.avatarRoute.current.name;
    local l_name_1 = v110.avatarRoute.current.name;
    if l_name_0 == l_AvatarScreen_0.ProfilePictureEditorEmotes then
        if not v109.state.restorePreviousChildFocus then
            v109:setState({
                restorePreviousChildFocus = true
            });
            return;
        end;
    elseif v53[l_name_0] and l_name_1 == l_AvatarScreen_0.ProfilePictureEditorEmotes and v109.state.restorePreviousChildFocus then
        v109:setState({
            restorePreviousChildFocus = false
        });
    end;
end;
v52.didMount = function(v113) --[[ Line: 490 ]] --[[ Name: didMount ]]
    if v113.props.hasMoreItems then
        v113.props.loadMoreItems();
    end;
end;
v52 = l_withNavigation_0(l_RoactServices_0.connect({
    profilePictureEditorAnalytics = v40
})(v52), nil);
v52 = v32((v42((v4.connect(function(v114, _) --[[ Line: 502 ]] --[[ Name: mapStateToProps ]]
    -- upvalues: v35 (copy)
    local _, _, v118 = v35.getEmotesCategorySubcategoryAndInfo();
    assert(v118.SearchUuid, "categoryInfo.SearchUuid is not nil: silences type checker");
    local l_SearchUuid_0 = v118.SearchUuid;
    local v120 = not v114.AvatarExperience.AvatarEditor.PageFinished[l_SearchUuid_0];
    local v121 = v114.AvatarExperience.AvatarEditor.Character.OwnedItemIdsBySubtype[l_SearchUuid_0] or {};
    local l_emoteAssetId_0 = v114.AvatarExperience.ProfilePictureEditor.ProfilePictureParams.emoteAssetId;
    local l_AvatarType_0 = v114.AvatarExperience.AvatarEditor.Character.AvatarType;
    return {
        items = v121, 
        screenSize = v114.ScreenSize, 
        hasMoreItems = v120, 
        emoteAssetId = l_emoteAssetId_0, 
        avatarType = l_AvatarType_0
    };
end, function(v124) --[[ Line: 525 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v41 (copy)
    return {
        setEmoteAssetId = function(v125, v126) --[[ Line: 527 ]] --[[ Name: setEmoteAssetId ]]
            -- upvalues: v124 (copy), v41 (ref)
            return v124(v41(v125, v126));
        end
    };
end)(v52)))));
v52 = l_RoactAppPolicy_0.connect(function(v127, _) --[[ Line: 539 ]]
    return {
        enableContinuousLoad = v127.getEnableContinuousLoad()
    };
end)(v52);
return function(v129) --[[ Line: 545 ]]
    -- upvalues: l_useDispatch_0 (copy), v35 (copy), v12 (copy), v39 (copy), v25 (copy), v45 (copy), l_FFlagAXMigrateAXToGlobalAutofocus_0 (copy), l_useFocusGuiObject_0 (copy), v52 (ref), v3 (copy), v7 (copy)
    local v130 = l_useDispatch_0();
    local _, _, v133 = v35.getEmotesCategorySubcategoryAndInfo();
    local v134 = v12.useCallback(function() --[[ Line: 549 ]]
        -- upvalues: v130 (copy), v39 (ref), v133 (copy)
        return v130(v39(v133));
    end, {
        v133
    });
    local v135, v136 = v25(v134);
    local v137 = v135.status == v45.Pending;
    if l_FFlagAXMigrateAXToGlobalAutofocus_0 then
        local v138 = l_useFocusGuiObject_0();
        return v12.createElement(v52, v3.Dictionary.join(v129, {
            loadMoreItems = v136, 
            isFetchingMore = v137, 
            focusGuiObject = v138
        }));
    else
        return v7.withFocusController(function(v139) --[[ Line: 569 ]]
            -- upvalues: v12 (ref), v52 (ref), v3 (ref), v129 (copy), v136 (copy), v137 (copy)
            return v12.createElement(v52, v3.Dictionary.join(v129, {
                focusController = v139, 
                loadMoreItems = v136, 
                isFetchingMore = v137
            }));
        end);
    end;
end;