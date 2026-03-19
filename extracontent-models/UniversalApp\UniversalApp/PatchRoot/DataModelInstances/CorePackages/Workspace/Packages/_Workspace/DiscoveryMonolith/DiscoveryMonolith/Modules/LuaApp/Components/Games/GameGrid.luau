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
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v28 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local v29 = require(l_Modules_0.LuaApp.Components.Generic.GridView);
local v30 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppUpdateGameSortGridRowHeight10ft);
local v31 = game:DefineFastFlag("LuaAppFixConsoleSeeAllGridContainment", false);
local v32 = v8.PureComponent:extend("GameGrid");
local l_GAME_GRID_CHILD_PADDING_0 = v23.Constants.GAME_GRID_CHILD_PADDING;
local l_GAME_GRID_TILE_FOOTER_HEIGHT_0 = v23.Constants.GAME_GRID_TILE_FOOTER_HEIGHT;
local v35 = l_Symbol_0.named("TilePlaceHolder");
local l_Square_0 = l_AspectRatioModeEnum_0.Square;
v32.defaultProps = {
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
v32.init = function(v37) --[[ Line: 63 ]] --[[ Name: init ]]
    -- upvalues: l_GameTileConstants_0 (copy)
    v37.navigateToGameDetails = function(v38, v39) --[[ Line: 64 ]]
        -- upvalues: v37 (copy)
        v37.props.openGameDetails(v38, v39, v37.props.navigation);
    end;
    v37.state = {
        numLinesForTitle = l_GameTileConstants_0.TileTextLines[v37.props.gameTileLayoutType].titleTextLines, 
        numLinesForMetadata = if v37.props.metadataCompact then l_GameTileConstants_0.TileTextLines[v37.props.gameTileLayoutType].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v37.props.gameTileLayoutType].metadataTextLines
    };
end;
v32.didUpdate = function(v40, v41, _) --[[ Line: 75 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_GameTileConstants_0 (copy)
    if v41.metadataCompact ~= v40.props.metadataCompact then
        v40:setState({
            numLinesForMetadata = if v40.props.metadataCompact then l_GameTileConstants_0.TileTextLines[v40.props.gameTileLayoutType].largeMetadataTextLines else l_GameTileConstants_0.TileTextLines[v40.props.gameTileLayoutType].metadataTextLines
        });
    end;
end;
v32.renderItem = function(v43, v44, v45, v46, v47) --[[ Line: 85 ]] --[[ Name: renderItem ]]
    -- upvalues: v8 (copy), v28 (copy), v35 (copy), v31 (copy), l_UiMode_0 (copy), l_AppGameTile_0 (copy)
    local l_reportGameDetailOpened_0 = v43.props.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v43.props.reportExperienceLaunched;
    local l_source_0 = v43.props.source;
    local l_hideGameStats_0 = v43.props.hideGameStats;
    if type(v44) == "table" and v44.featured then
        return v8.createElement(v28, {
            layoutOrder = v46, 
            entry = v44, 
            size = v45, 
            index = v44.realGameEntryIndex or v46, 
            source = l_source_0, 
            reportGameDetailOpened = l_reportGameDetailOpened_0, 
            reportExperienceLaunched = l_reportExperienceLaunched_0, 
            impressionsTag = v43.props.impressionsTag, 
            launchExperienceEventContext = v43.props.launchExperienceEventContext
        });
    elseif type(v44) == "userdata" and v44 == v35 then
        return v8.createElement("Frame", {
            LayoutOrder = v46, 
            Size = UDim2.new(0, v45.X, 0, v45.Y), 
            BackgroundTransparency = 1
        });
    else
        local v52 = v31 and v43.props.uiModeInfo and v43.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot;
        return v8.createElement(l_AppGameTile_0, {
            layoutOrder = v46, 
            entry = v44, 
            Size = UDim2.new(0, v45.X, 0, v45.Y), 
            index = v44.realGameEntryIndex or v46, 
            source = l_source_0, 
            reportGameDetailOpened = l_reportGameDetailOpened_0, 
            reportExperienceLaunched = l_reportExperienceLaunched_0, 
            hideGameStats = l_hideGameStats_0, 
            referralSource = v43.props.referralSource, 
            rowNum = v47, 
            showFriendActivity = v43.props.showFriendActivity, 
            impressionsTag = v43.props.impressionsTag, 
            friendFooterEnabled = if v43.props.useGridTiles then v43.props.friendFooterEnabled else nil, 
            useGridTile = v43.props.useGridTiles, 
            launchExperienceEventContext = v43.props.launchExperienceEventContext, 
            playerCountStyle = v43.props.playerCountStyle, 
            isSponsoredFooterAllowed = v43.props.isSponsoredFooterAllowed, 
            topicId = v43.props.topicId, 
            gameTileLayoutType = v43.props.gameTileLayoutType, 
            navigateToGameDetails = v43.navigateToGameDetails, 
            playButtonStyle = v43.props.playButtonStyle, 
            isContained = v52 and true or nil, 
            textSizeOffset = v43.props.textSizeOffset, 
            contentTextLineCount = v43.state.numLinesForTitle, 
            metadataTextLineCount = v43.state.numLinesForMetadata, 
            isNarrowScreenXSmall = v43.props.isNarrowScreenXSmall
        });
    end;
end;
v32.render = function(v53) --[[ Line: 145 ]] --[[ Name: render ]]
    -- upvalues: l_GridMetrics_0 (copy), l_UiMode_0 (copy), l_FormFactor_0 (copy), l_GameTileViewConfig_0 (copy), l_GAME_GRID_TILE_FOOTER_HEIGHT_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), v30 (copy), l_getExperienceTileRelativeHeight_0 (copy), l_Square_0 (copy), v35 (copy), v9 (copy), v8 (copy), v29 (copy)
    local l_entries_0 = v53.props.entries;
    local l_LayoutOrder_0 = v53.props.LayoutOrder;
    local l_numberOfRowsToShow_0 = v53.props.numberOfRowsToShow;
    local l_windowSize_0 = v53.props.windowSize;
    local l_screenSize_0 = v53.props.screenSize;
    local l_horizontalAlignment_0 = v53.props.horizontalAlignment;
    local l_searchResultGrid_0 = v53.props.searchResultGrid;
    local v61 = nil;
    local v62 = l_searchResultGrid_0 and l_GridMetrics_0.getMediumMetrics or v53.props.getItemMetrics;
    local v63 = nil;
    local v64 = nil;
    local v65 = nil;
    if v53.props.useGridTiles then
        local v66 = nil;
        local v67 = nil;
        local v68 = nil;
        if v53.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            v68 = 5;
            v66 = v53.props.designTokens.Global.Space_300;
            v67 = 51;
        elseif v53.props.formFactor == l_FormFactor_0.WIDE then
            v68 = 4;
            v66 = 8;
            v67 = 28;
        else
            v68 = 2;
            v66 = 8;
            v67 = 28;
        end;
        v63 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v66, v68).itemWidth;
        v64 = l_GameTileViewConfig_0.getTileHeight(v53.props.designTokens, v63, v53.props.gameTileLayoutType, false, false, false, v53.props.textSizeOffset, nil, v53.state.numLinesForTitle, v53.state.numLinesForMetadata);
        v65 = Vector2.new(v66, v67);
    else
        local l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_GAME_GRID_TILE_FOOTER_HEIGHT_0;
        v65 = Vector2.new(l_GAME_GRID_CHILD_PADDING_0, l_GAME_GRID_CHILD_PADDING_0 * 2);
        if v53.props.uiModeInfo.uiMode == l_UiMode_0.TenFoot then
            v65 = Vector2.new(v53.props.cellSpacingHorizontal, v53.props.cellSpacingVertical);
            v63 = l_GridMetrics_0.getMetricsForFixedColumns(l_windowSize_0.X, v65.X, 8).itemWidth;
        else
            v63 = v62(l_windowSize_0.X, l_GAME_GRID_CHILD_PADDING_0).itemWidth;
            l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_GameTileViewConfig_0.getFooterHeight(v53.props.designTokens, false, false, false, v53.props.textSizeOffset, 0, v53.state.numLinesForTitle, v53.props.foundationTokens, true, v53.state.numLinesForMetadata);
        end;
        if v30() then
            l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0 = l_getExperienceTileRelativeHeight_0(v53.props.style, l_Square_0, 2).Offset;
        end;
        v64 = math.floor(v63 + l_l_GAME_GRID_TILE_FOOTER_HEIGHT_0_0);
    end;
    local v70 = Vector2.new(v63, v64);
    if l_searchResultGrid_0 and #l_entries_0 > 0 and v53.props.gameEmphasis then
        v61 = {};
        table.insert(v61, v35);
        table.insert(v61, v35);
        local v71 = math.floor((l_windowSize_0.X + v65.X) / (v70.X + v65.X)) - 2;
        local v72 = 2;
        while v72 < v71 + 2 do
            if v72 <= #l_entries_0 then
                table.insert(v61, v9.Dictionary.join(l_entries_0[v72], {
                    realGameEntryIndex = v72
                }));
            else
                table.insert(v61, v35);
            end;
            v72 = v72 + 1;
        end;
        table.insert(v61, v9.Dictionary.join(l_entries_0[1], {
            featured = true, 
            realGameEntryIndex = 1
        }));
        table.insert(v61, v35);
        for v73 = v72, #l_entries_0 do
            table.insert(v61, v9.Dictionary.join(l_entries_0[v73], {
                realGameEntryIndex = v73
            }));
        end;
    end;
    return v8.createElement(v29, {
        layoutOrder = l_LayoutOrder_0, 
        items = v61 or l_entries_0, 
        renderItem = function(...) --[[ Line: 285 ]] --[[ Name: renderItem ]]
            -- upvalues: v53 (copy)
            return v53:renderItem(...);
        end, 
        windowAbsoluteSize = l_windowSize_0, 
        screenSize = l_screenSize_0, 
        itemAbsoluteSize = v70, 
        cellPaddingOffset = v65, 
        numberOfRowsToShow = l_numberOfRowsToShow_0, 
        horizontalAlignment = l_horizontalAlignment_0, 
        onItemsPerRowChanged = v53.props.onItemsPerRowChanged
    });
end;
local v80 = l_withNavigation_0((v15.connect(function(v74, _) --[[ Line: 298 ]]
    return {
        formFactor = v74.FormFactor
    };
end, function(v76) --[[ Line: 302 ]]
    -- upvalues: l_OpenGameDetails_0 (copy)
    return {
        openGameDetails = function(v77, v78, v79) --[[ Line: 304 ]] --[[ Name: openGameDetails ]]
            -- upvalues: v76 (copy), l_OpenGameDetails_0 (ref)
            v76(l_OpenGameDetails_0(v77, v79, v78));
        end
    };
end)(v32)));
local l_v80_0 = v80 --[[ copy: 37 -> 38 ]];
v32 = function(v82) --[[ Line: 313 ]]
    -- upvalues: l_useDesignTokens_0 (copy), l_useTokens_0 (copy), l_useUiModeInfo_0 (copy), l_useTextSizeOffset_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v25 (copy), l_GameTileTypes_0 (copy), v9 (copy), v8 (copy), l_v80_0 (copy)
    local v83 = l_useDesignTokens_0();
    local v84 = l_useTokens_0();
    local v85 = l_useUiModeInfo_0();
    local v86 = l_useTextSizeOffset_0();
    local v87 = l_useBreakpointXOrSmaller_0(v25.Keys.Small);
    local v88 = if v82.gameTileLayoutType then v87 and v82.gameTileLayoutType == l_GameTileTypes_0.GameTileLayoutType.Narrow and v86 > 0 else v87 and v86 > 0;
    local v89 = l_useBreakpointXOrSmaller_0(v25.Keys.XSmall);
    local v90 = v9.Dictionary.join(v82, {
        uiModeInfo = v85, 
        cellSpacingHorizontal = v83.Global.Space_300, 
        cellSpacingVertical = v83.Global.Space_400, 
        designTokens = v83, 
        textSizeOffset = v86, 
        foundationTokens = v84, 
        metadataCompact = v88, 
        isNarrowScreenXSmall = v89
    });
    return v8.createElement(l_v80_0, v90);
end;
if v30() then
    v80 = v32;
    v32 = function(v91) --[[ Line: 343 ]]
        -- upvalues: l_useStyle_0 (copy), l_useTextSizeOffset_0 (copy), v9 (copy), v8 (copy), v80 (copy)
        local v92 = l_useStyle_0();
        local v93 = l_useTextSizeOffset_0();
        local v94 = v9.Dictionary.join(v91, {
            style = v92, 
            textSizeOffset = v93
        });
        return v8.createElement(v80, v94);
    end;
end;
return v32;