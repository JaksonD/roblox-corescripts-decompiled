local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.UIBlox);
local l_GridMetrics_0 = v2.App.Grid.GridMetrics;
local l_useStyle_0 = v2.Core.Style.useStyle;
local l_useTextSizeOffset_0 = v2.Core.Style.useTextSizeOffset;
local l_getExperienceTileRelativeHeight_0 = v2.App.Tile.getExperienceTileRelativeHeight;
local l_AspectRatioModeEnum_0 = v2.App.Tile.AspectRatioModeEnum;
local v8 = require(l_Parent_0.Roact);
local v9 = require(l_Parent_0.Cryo);
local v10 = require(l_Parent_0.GameTile);
local l_GameTileTypes_0 = v10.GameTileTypes;
local l_AppGameTile_0 = v10.AppGameTile;
local l_GameTileViewConfig_0 = v10.GameTileViewConfig;
local l_Symbol_0 = require(l_Parent_0.AppCommonLib).Symbol;
local v15 = require(l_Parent_0.RoactRodux);
local l_FormFactor_0 = require(l_Parent_0.FormFactor).Enums.FormFactor;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_withNavigation_0 = require(l_Parent_0.RoactNavigation).withNavigation;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useUiModeInfo_0 = require(l_Parent_0.RobloxAppHooks).useUiModeInfo;
local l_UiMode_0 = require(l_Parent_0.RobloxAppEnums).UiMode;
local v23 = require(l_Parent_0.DiscoveryTypes);
local l_GameTileConstants_0 = v10.GameTileConstants;
local v25 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v25.useBreakpointXOrSmaller;
local l_useCollectionLayout_0 = require(l_Parent_0.CollectionViews).useCollectionLayout;
local v28 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v28.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v28.FFlagLuaAppCompositionAlways;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v32 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local v33 = require(l_Modules_0.LuaApp.Components.Generic.GridView);
local v34 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft);
local v35 = game:DefineFastFlag("LuaAppFixConsoleSeeAllGridContainment", false);
local v36 = v8.PureComponent:extend("GameGrid");
local l_GAME_GRID_CHILD_PADDING_0 = v23.Constants.GAME_GRID_CHILD_PADDING;
local l_GAME_GRID_TILE_FOOTER_HEIGHT_0 = v23.Constants.GAME_GRID_TILE_FOOTER_HEIGHT;
local v39 = l_Symbol_0.named("TilePlaceHolder");
local l_Square_0 = l_AspectRatioModeEnum_0.Square;
v36.defaultProps = {
    friendFooterEnabled = false, 
    useGridTiles = false, 
    getItemMetrics = l_GridMetrics_0.getSmallMetrics, 
    horizontalAlignment = Enum.HorizontalAlignment.Center, 
    searchResultGrid = false, 
    gameEmphasis = false, 
    source = nil, 
    showFriendActivity = false, 
    gameTileLayoutType = l_GameTileTypes_0.GameTileLayoutType.Narrow
};
v36.init = function(v41) --[[ Line: 69 ]] --[[ Name: init ]]
    -- upvalues: l_GameTileConstants_0 (copy)
    v41.navigateToGameDetails = function(v42, v43) --[[ Line: 70 ]]
        -- upvalues: v41 (copy)
        v41.props.openGameDetails(v42, v43, v41.props.navigation);
    end;
    v41.state = {
        numLinesForTitle = l_GameTileConstants_0.TileTextLines[v41.props.gameTileLayoutType].titleTextLines, 
        numLinesForMetadata = if v41.props.metadataCompact then l_GameTileConstants_0.TileTextLines[v41.props.gameTileLayoutType].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v41.props.gameTileLayoutType].metadataTextLines
    };
end;
v36.didUpdate = function(v44, v45, _) --[[ Line: 81 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GameTileConstants_0 (copy)
    if v45.metadataCompact ~= v44.props.metadataCompact then
        v44:setState({
            numLinesForMetadata = if v44.props.metadataCompact then l_GameTileConstants_0.TileTextLines[v44.props.gameTileLayoutType].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v44.props.gameTileLayoutType].metadataTextLines
        });
    end;
end;
v36.renderItem = function(v47, v48, v49, v50, v51) --[[ Line: 91 ]] --[[ Name: renderItem ]]
    -- upvalues: v8 (copy), v32 (copy), v39 (copy), v35 (copy), l_UiMode_0 (copy), l_AppGameTile_0 (copy)
    local l_reportGameDetailOpened_0 = v47.props.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v47.props.reportExperienceLaunched;
    local l_source_0 = v47.props.source;
    local l_hideGameStats_0 = v47.props.hideGameStats;
    if type(v48) == "table" and v48.featured then
        return v8.createElement(v32, {
            layoutOrder = v50, 
            entry = v48, 
            size = v49, 
            index = v48.realGameEntryIndex or v50, 
            source = l_source_0, 
            reportGameDetailOpened = l_reportGameDetailOpened_0, 
            reportExperienceLaunched = l_reportExperienceLaunched_0, 
            impressionsTag = v47.props.impressionsTag, 
            launchExperienceEventContext = v47.props.launchExperienceEventContext
        });
    elseif type(v48) == "userdata" and v48 == v39 then
        return v8.createElement("Frame", {
            LayoutOrder = v50, 
            Size = UDim2.new(0, v49.X, 0, v49.Y), 
            BackgroundTransparency = 1
        });
    else
        local v56 = v35 and v47.props.uiModeInfo and v47.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        return v8.createElement(l_AppGameTile_0, {
            layoutOrder = v50, 
            entry = v48, 
            Size = UDim2.new(0, v49.X, 0, v49.Y), 
            index = v48.realGameEntryIndex or v50, 
            source = l_source_0, 
            reportGameDetailOpened = l_reportGameDetailOpened_0, 
            reportExperienceLaunched = l_reportExperienceLaunched_0, 
            hideGameStats = l_hideGameStats_0, 
            referralSource = v47.props.referralSource, 
            rowNum = v51, 
            showFriendActivity = v47.props.showFriendActivity, 
            impressionsTag = v47.props.impressionsTag, 
            friendFooterEnabled = if v47.props.useGridTiles then v47.props.friendFooterEnabled else nil, 
            useGridTile = v47.props.useGridTiles, 
            launchExperienceEventContext = v47.props.launchExperienceEventContext, 
            playerCountStyle = v47.props.playerCountStyle, 
            isSponsoredFooterAllowed = v47.props.isSponsoredFooterAllowed, 
            topicId = v47.props.topicId, 
            gameTileLayoutType = v47.props.gameTileLayoutType, 
            navigateToGameDetails = v47.navigateToGameDetails, 
            playButtonStyle = v47.props.playButtonStyle, 
            isContained = v56 and true or nil, 
            textSizeOffset = v47.props.textSizeOffset, 
            contentTextLineCount = v47.state.numLinesForTitle, 
            metadataTextLineCount = v47.state.numLinesForMetadata, 
            isNarrowScreenXSmall = v47.props.isNarrowScreenXSmall
        });
    end;
end;
v36.render = function(v57) --[[ Line: 151 ]] --[[ Name: render ]]
    -- upvalues: l_GridMetrics_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_UiMode_0 (copy), l_FormFactor_0 (copy), l_GameTileViewConfig_0 (copy), l_GAME_GRID_TILE_FOOTER_HEIGHT_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), v34 (copy), l_getExperienceTileRelativeHeight_0 (copy), l_Square_0 (copy), v39 (copy), v9 (copy), v8 (copy), v33 (copy)
    local l_entries_0 = v57.props.entries;
    local l_LayoutOrder_0 = v57.props.LayoutOrder;
    local l_numberOfRowsToShow_0 = v57.props.numberOfRowsToShow;
    local l_windowSize_0 = v57.props.windowSize;
    local l_screenSize_0 = v57.props.screenSize;
    local l_horizontalAlignment_0 = v57.props.horizontalAlignment;
    local l_searchResultGrid_0 = v57.props.searchResultGrid;
    local v65 = nil;
    local v66 = l_searchResultGrid_0 and l_GridMetrics_0.getMediumMetrics or v57.props.getItemMetrics;
    local v67 = nil;
    local v68 = nil;
    local v69 = nil;
    if v57.props.useGridTiles then
        local v70 = nil;
        local v71 = nil;
        local v72 = nil;
        if l_FFlagLuaAppCompositionSupport_0 and v57.props.appCompositionActive then
            local l_collectionLayout_0 = v57.props.collectionLayout;
            v72 = l_collectionLayout_0.itemsPerRow;
            v70 = l_collectionLayout_0.gutter;
            v71 = l_collectionLayout_0.verticalGap;
        elseif v57.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            v72 = 5;
            v70 = v57.props.designTokens.Global.Space_300;
            v71 = 51;
        elseif v57.props.formFactor == l_FormFactor_0.WIDE then
            v72 = 4;
            v70 = 8;
            v71 = 28;
        else
            v72 = 2;
            v70 = 8;
            v71 = 28;
        end;
        v67 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v70, v72).itemWidth;
        v68 = l_GameTileViewConfig_0.getTileHeight(v57.props.designTokens, v67, v57.props.gameTileLayoutType, false, false, false, v57.props.textSizeOffset, nil, v57.state.numLinesForTitle, v57.state.numLinesForMetadata);
        v69 = Vector2.new(v70, v71);
    else
        local l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_GAME_GRID_TILE_FOOTER_HEIGHT_0;
        v69 = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0 * 2);
        if l_FFlagLuaAppCompositionSupport_0 and v57.props.appCompositionActive then
            local l_collectionLayout_1 = v57.props.collectionLayout;
            v69 = Vector2.new(l_collectionLayout_1.gutter, l_collectionLayout_1.verticalGap);
            v67 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, l_collectionLayout_1.gutter, l_collectionLayout_1.itemsPerRow).itemWidth;
            l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_GameTileViewConfig_0.getFooterHeight(v57.props.designTokens, false, false, false, v57.props.textSizeOffset, 0, v57.state.numLinesForTitle, v57.props.foundationTokens, true, v57.state.numLinesForMetadata);
        elseif v57.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            v69 = Vector2.new(v57.props.cellSpacingHorizontal, v57.props.cellSpacingVertical);
            v67 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v69.X, 8).itemWidth;
        else
            v67 = v66(l_windowSize_0.X, l_GAME_GRID_CHILD_PADDING_0).itemWidth;
            l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_GameTileViewConfig_0.getFooterHeight(v57.props.designTokens, false, false, false, v57.props.textSizeOffset, 0, v57.state.numLinesForTitle, v57.props.foundationTokens, true, v57.state.numLinesForMetadata);
        end;
        if v34() then
            l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_getExperienceTileRelativeHeight_0(v57.props.style, l_Square_0, 2).Offset;
        end;
        v68 = math.floor(v67 + l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0);
    end;
    local v76 = Vector2.new(v67, v68);
    if l_searchResultGrid_0 and #l_entries_0 > 0 and v57.props.gameEmphasis then
        v65 = {};
        table.insert(v65, v39);
        table.insert(v65, v39);
        local v77 = math.floor((l_windowSize_0.X + v69.X) / (v76.X + v69.X)) - 2;
        local v78 = 2;
        while v78 < v77 + 2 do
            if v78 <= #l_entries_0 then
                table.insert(v65, v9.Dictionary.join(l_entries_0[v78], {
                    realGameEntryIndex = v78
                }));
            else
                table.insert(v65, v39);
            end;
            v78 = v78 + 1;
        end;
        table.insert(v65, v9.Dictionary.join(l_entries_0[1], {
            featured = true, 
            realGameEntryIndex = 1
        }));
        table.insert(v65, v39);
        for v79 = v78, #l_entries_0 do
            table.insert(v65, v9.Dictionary.join(l_entries_0[v79], {
                realGameEntryIndex = v79
            }));
        end;
    end;
    return v8.createElement(v33, {
        layoutOrder = l_LayoutOrder_0, 
        items = v65 or l_entries_0, 
        renderItem = function(...) --[[ Line: 316 ]] --[[ Name: renderItem ]]
            -- upvalues: v57 (copy)
            return v57:renderItem(...);
        end, 
        windowAbsoluteSize = l_windowSize_0, 
        screenSize = l_screenSize_0, 
        itemAbsoluteSize = v76, 
        cellPaddingOffset = v69, 
        numberOfRowsToShow = l_numberOfRowsToShow_0, 
        horizontalAlignment = l_horizontalAlignment_0, 
        onItemsPerRowChanged = v57.props.onItemsPerRowChanged
    });
end;
local v86 = l_withNavigation_0((v15.connect(function(v80, _) --[[ Line: 329 ]]
    return {
        formFactor = v80.FormFactor
    };
end, function(v82) --[[ Line: 333 ]]
    -- upvalues: l_OpenGameDetails_0 (copy)
    return {
        openGameDetails = function(v83, v84, v85) --[[ Line: 335 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v82 (copy), l_OpenGameDetails_0 (ref)
            v82(l_OpenGameDetails_0(v83, v85, v84));
        end
    };
end)(v36)));
local l_v86_0 = v86 --[[ copy: 42 -> 43 ]];
v36 = function(v88) --[[ Line: 344 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useTextSizeOffset_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v25 (copy), l_GameTileTypes_0 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_useCollectionLayout_0 (copy), v10 (copy), v9 (copy), v8 (copy), l_v86_0 (copy)
    local v89 = l_useDesignTokens_0();
    local v90 = l_useTokens_0();
    local v91 = l_useUiModeInfo_0();
    local v92 = l_useTextSizeOffset_0();
    local v93 = l_useBreakpointXOrSmaller_0(v25.Keys.Small);
    local v94 = if v88.gameTileLayoutType then v93 and v88.gameTileLayoutType == l_GameTileTypes_0.GameTileLayoutType.Narrow and v92 > 0 else v93 and v92 > 0;
    local v95 = l_useBreakpointXOrSmaller_0(v25.Keys.XSmall);
    local v96 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v88.appCompositionEnabled;
    local v97 = if l_FFlagLuaAppCompositionSupport_0 then l_useCollectionLayout_0(v10.getGameTileCollectionItemSize(v88.gameTileLayoutType or l_GameTileTypes_0.GameTileLayoutType.Narrow)) else nil;
    local v98 = v9.Dictionary.join(v88, {
        uiModeInfo = v91, 
        cellSpacingHorizontal = v89.Global.Space_300, 
        cellSpacingVertical = v89.Global.Space_400, 
        designTokens = v89, 
        textSizeOffset = v92, 
        foundationTokens = v90, 
        metadataCompact = v94, 
        isNarrowScreenXSmall = v95, 
        appCompositionActive = if l_FFlagLuaAppCompositionSupport_0 then v96 else nil, 
        collectionLayout = if l_FFlagLuaAppCompositionSupport_0 then v97 else nil
    });
    return v8.createElement(l_v86_0, v98);
end;
if v34() then
    v86 = v36;
    v36 = function(v99) --[[ Line: 386 ]]
        -- upvalues: l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v9 (copy), v8 (copy), v86 (copy)
        local v100 = l_useStyle_0();
        local v101 = l_useTextSizeOffset_0();
        local v102 = v9.Dictionary.join(v99, {
            style = v100, 
            textSizeOffset = v101
        });
        return v8.createElement(v86, v102);
    end;
end;
return v36;