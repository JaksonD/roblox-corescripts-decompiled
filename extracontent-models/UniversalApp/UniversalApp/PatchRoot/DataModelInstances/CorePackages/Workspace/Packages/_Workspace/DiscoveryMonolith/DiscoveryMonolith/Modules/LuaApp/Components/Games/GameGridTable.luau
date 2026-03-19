local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local v4 = require(l_Parent_0.LuauPolyfill);
local v5 = require(l_Parent_0.UIBlox);
local l_ResponsiveGrid_0 = v5.App.Container.Grid.ResponsiveGrid;
local l_ResponsiveLayoutProvider_0 = v5.Core.Layout.Responsive.ResponsiveLayoutProvider;
local v8 = require(l_Parent_0.GameTile);
local l_GameTileConstants_0 = v8.GameTileConstants;
local l_GameTileLayoutType_0 = v8.GameTileTypes.GameTileLayoutType;
local l_GameTileViewConfig_0 = v8.GameTileViewConfig;
local l_AppGameTile_0 = v8.AppGameTile;
local l_LayoutConfig_0 = require(l_Parent_0.RobloxAppEnums).LayoutConfig;
local l_useResponsiveLayout_0 = v5.Core.Layout.Responsive.useResponsiveLayout;
local l_useTextSizeOffset_0 = v5.Core.Style.useTextSizeOffset;
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_Parent_0.Navigation).useNavigation;
local l_OpenGameDetails_0 = require(l_Parent_0.GameDetail).OpenGameDetails;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
local l_useTokens_0 = require(l_Parent_0.Foundation).Hooks.useTokens;
local l_useGameCollectionLayoutParams_0 = require(l_Parent_0.GameCollections).useGameCollectionLayoutParams;
local v22 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v22.useBreakpointXOrSmaller;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v26 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local v27 = game:DefineFastFlag("LuaAppFixGameGridTableNilRelativeHeight", false);
local function v29(v28) --[[ Line: 64 ]] --[[ Name: getCellSpan ]]
    if v28.featured then
        return 2;
    else
        return 1;
    end;
end;
return function(v30) --[[ Line: 68 ]] --[[ Name: GameGridTable ]]
    -- upvalues: l_LayoutConfig_0 (copy), l_useTokens_0 (copy), v2 (copy), v4 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_OpenGameDetails_0 (copy), l_useTextSizeOffset_0 (copy), l_useResponsiveLayout_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_GameTileLayoutType_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v22 (copy), l_useDesignTokens_0 (copy), l_GameTileConstants_0 (copy), l_GameTileViewConfig_0 (copy), v27 (copy), l_DiscoveryEventErrorLogger_0 (copy), v26 (copy), l_AppGameTile_0 (copy), l_useSelector_0 (copy), l_ResponsiveGrid_0 (copy), v29 (copy), l_ResponsiveLayoutProvider_0 (copy)
    local v31 = nil;
    v31 = if v30.useGridTiles then l_LayoutConfig_0.Kind.Experiences.GridTile else l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v32 = l_useTokens_0();
    local v33 = v30.entries or {};
    local v34 = v30.gameEmphasis or false;
    local v40 = v2.useMemo(function() --[[ Line: 80 ]]
        -- upvalues: v4 (ref), v33 (copy), v34 (copy)
        return v4.Array.map(v33, function(v35, v36) --[[ Line: 81 ]]
            -- upvalues: v4 (ref), v34 (ref)
            local l_assign_0 = v4.Object.assign;
            local v38 = {
                index = v36
            };
            local v39 = false;
            if v36 == 1 then
                v39 = v34;
            end;
            v38.featured = v39;
            return l_assign_0(v38, v35);
        end);
    end, {
        v33, 
        v34
    });
    local v41 = l_useDispatch_0();
    local v42 = l_useNavigation_0();
    local v45 = v2.useCallback(function(v43, v44) --[[ Line: 92 ]]
        -- upvalues: v41 (copy), l_OpenGameDetails_0 (ref), v42 (copy)
        v41(l_OpenGameDetails_0(v43, v42, v44));
    end, {
        v42
    });
    local v46 = v30.windowSize or Vector2.one;
    local v47 = l_useTextSizeOffset_0();
    local l_source_0 = v30.source;
    local l_referralSource_0 = v30.referralSource;
    local l_hideGameStats_0 = v30.hideGameStats;
    local v51 = v30.useHoverTile == nil or v30.useHoverTile;
    local l_reportGameDetailOpened_0 = v30.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v30.reportExperienceLaunched;
    local v54 = v30.showFriendActivity or false;
    local v55 = l_useResponsiveLayout_0("relativeHeight", v31);
    local l_enableCollectionLayout_0 = v30.enableCollectionLayout;
    local v57, v58 = v2.useState(nil);
    local v59 = l_useGameCollectionLayoutParams_0(v30.gameTileLayoutType or l_GameTileLayoutType_0.Narrow, v57, false);
    local v60 = v2.useRef(1);
    local v61 = l_useResponsiveLayout_0("columns", v31);
    local v62 = if l_enableCollectionLayout_0 then v59.numColumns else v61;
    local v63 = l_useBreakpointXOrSmaller_0(v22.Keys.XSmall);
    v2.useEffect(function() --[[ Line: 120 ]]
        -- upvalues: v60 (copy), v62 (copy), v30 (copy)
        if v60.current ~= v62 then
            v60.current = v62;
            if v30.onItemsPerRowChanged then
                v30.onItemsPerRowChanged(v62);
            end;
        end;
    end, {
        v62, 
        v60, 
        v30.onItemsPerRowChanged
    });
    local v64 = l_useDesignTokens_0();
    local v65 = l_GameTileConstants_0.TileTextLines[v30.gameTileLayoutType or l_GameTileLayoutType_0.Narrow];
    local v66 = l_GameTileViewConfig_0.getFooterHeight(v64, true, false, false, v47, nil, v65.titleTextLines, v32, true);
    if v27 and (v55 == nil or v55.Scale == nil) then
        l_DiscoveryEventErrorLogger_0.reportError("GameGridTable_NilRelativeHeight", "relativeHeight is nil", {
            rowKind = tostring(v31), 
            relativeHeightType = typeof(v55), 
            relativeHeightValue = tostring(v55), 
            responsiveLayoutColumns = tostring(v61), 
            useGridTiles = tostring(v30.useGridTiles or false), 
            enableCollectionLayout = tostring(v30.enableCollectionLayout or false), 
            gameTileLayoutType = tostring(v30.gameTileLayoutType or "nil")
        });
    else
        v55 = UDim.new(v55.Scale, v66);
    end;
    local v69 = v2.useCallback(function(v67, v68) --[[ Line: 158 ]]
        -- upvalues: v2 (ref), v26 (ref), l_source_0 (copy), l_reportGameDetailOpened_0 (copy), l_reportExperienceLaunched_0 (copy), v30 (copy), l_AppGameTile_0 (ref), l_hideGameStats_0 (copy), l_referralSource_0 (copy), v54 (copy), v51 (copy), v45 (copy), v47 (copy), v63 (copy)
        if v67.featured then
            return v2.createElement(v26, {
                entry = v67, 
                index = v67.realGameEntryIndex or v67.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hasBackground = true, 
                hasActionRow = true, 
                isDynamic = true, 
                impressionsTag = v30.impressionsTag, 
                launchExperienceEventContext = v30.launchExperienceEventContext
            });
        else
            return v2.createElement(l_AppGameTile_0, {
                entry = v67, 
                index = v67.realGameEntryIndex or v67.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hideGameStats = l_hideGameStats_0, 
                referralSource = l_referralSource_0, 
                rowNum = math.ceil(v67.index / (v68.columns or 1)), 
                showFriendActivity = v54, 
                playerCountStyle = v30.playerCountStyle, 
                isSponsoredFooterAllowed = v30.isSponsoredFooterAllowed, 
                useHoverTile = v51, 
                useGridTile = v30.useGridTiles, 
                friendFooterEnabled = v30.useGridTiles and true or nil, 
                impressionsTag = v30.impressionsTag, 
                launchExperienceEventContext = v30.launchExperienceEventContext, 
                topicId = v30.topicId, 
                gameTileLayoutType = v30.gameTileLayoutType, 
                navigateToGameDetails = v45, 
                playButtonStyle = v30.playButtonStyle, 
                isContained = true, 
                textSizeOffset = v47, 
                isNarrowScreenXSmall = v63
            });
        end;
    end, {
        l_source_0, 
        l_referralSource_0, 
        l_hideGameStats_0, 
        v54, 
        l_reportGameDetailOpened_0, 
        l_reportExperienceLaunched_0, 
        v30.impressionsTag, 
        v30.launchExperienceEventContext, 
        v30.playerCountStyle, 
        v30.useGridTiles, 
        v30.isSponsoredFooterAllowed, 
        v30.playButtonStyle, 
        v63
    });
    local v70 = if v30.screenSize then v30.screenSize.Y else v46.Y;
    local v72 = l_useSelector_0(function(v71) --[[ Line: 219 ]]
        if v71.ScreenSize then
            return v71.ScreenSize.X;
        else
            return nil;
        end;
    end);
    local v73 = l_useResponsiveLayout_0("verticalGutter", v31);
    local v77 = v2.useMemo(function() --[[ Line: 229 ]]
        -- upvalues: l_enableCollectionLayout_0 (copy), v64 (copy), v62 (copy), v59 (copy), v73 (copy), v55 (ref)
        if not l_enableCollectionLayout_0 then
            return nil;
        else
            local l_Layout_0 = v64.LuaApps.Layout;
            local l_grid_0 = l_Layout_0.grid;
            local l_tiles_0 = l_Layout_0.tiles;
            return {
                columns = v62, 
                gutter = v59.columnGap, 
                margin = v59.sideMargin, 
                verticalGutter = v73, 
                relativeHeight = v55, 
                hoverTileTopOffset = l_tiles_0.hover.topOffset, 
                hoverTileBottomOffset = l_tiles_0.hover.bottomOffset, 
                hoverTileHorizontalOffset = l_tiles_0.hover.horizontalOffset, 
                scrollableMaxTilesPerRow = l_grid_0.default.scrollableMaxTilesPerRow
            };
        end;
    end, {
        l_enableCollectionLayout_0, 
        v64.LuaApps.Layout, 
        v62, 
        v59.columnGap, 
        v59.sideMargin, 
        v73, 
        v55
    });
    local v78 = v2.createElement(l_ResponsiveGrid_0, {
        ref = v58, 
        kind = v31, 
        data = v40, 
        renderItem = v69, 
        layoutOrder = v30.LayoutOrder, 
        getCellColspan = v29, 
        getCellRowspan = v29, 
        relativeHeight = v55, 
        absoluteWindowTop = -v70, 
        absoluteWindowHeight = v70 * 3, 
        enableDeferredRefPropEvents = true
    });
    if l_enableCollectionLayout_0 then
        v78 = v2.createElement(l_ResponsiveLayoutProvider_0, {
            width = v72, 
            config = v77
        }, {
            ResponsiveGrid = v78
        });
    end;
    return v78;
end;