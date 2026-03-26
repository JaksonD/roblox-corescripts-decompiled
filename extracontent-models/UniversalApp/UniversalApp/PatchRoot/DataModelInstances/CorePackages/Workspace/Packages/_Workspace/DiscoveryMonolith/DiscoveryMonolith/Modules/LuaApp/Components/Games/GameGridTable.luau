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
local l_useCollectionLayout_0 = require(l_Parent_0.CollectionViews).useCollectionLayout;
local v23 = require(l_Parent_0.Responsive);
local l_useBreakpointXOrSmaller_0 = v23.useBreakpointXOrSmaller;
local l_DiscoveryEventErrorLogger_0 = require(l_Parent_0.DiscoveryUtils).DiscoveryEventErrorLogger;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v27 = require(l_Modules_0.LuaApp.Components.Games.AppFeaturedGameTileTwoByTwo);
local v28 = require(l_Parent_0.SharedFlags);
local l_FFlagLuaAppCompositionSupport_0 = v28.FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = v28.FFlagLuaAppCompositionAlways;
local v31 = game:DefineFastFlag("LuaAppFixGameGridTableNilRelativeHeight", false);
local function v33(v32) --[[ Line: 71 ]] --[[ Name: getCellSpan ]]
    if v32.featured then
        return 2;
    else
        return 1;
    end;
end;
return function(v34) --[[ Line: 75 ]] --[[ Name: GameGridTable ]]
    -- upvalues: l_LayoutConfig_0 (copy), l_useTokens_0 (copy), v2 (copy), v4 (copy), l_useDispatch_0 (copy), l_useNavigation_0 (copy), l_OpenGameDetails_0 (copy), l_useTextSizeOffset_0 (copy), l_useResponsiveLayout_0 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_useCollectionLayout_0 (copy), v8 (copy), l_GameTileLayoutType_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_useBreakpointXOrSmaller_0 (copy), v23 (copy), l_useDesignTokens_0 (copy), l_GameTileConstants_0 (copy), l_GameTileViewConfig_0 (copy), v31 (copy), l_DiscoveryEventErrorLogger_0 (copy), v27 (copy), l_AppGameTile_0 (copy), l_useSelector_0 (copy), l_ResponsiveGrid_0 (copy), v33 (copy), l_ResponsiveLayoutProvider_0 (copy)
    local v35 = nil;
    v35 = if v34.useGridTiles then l_LayoutConfig_0.Kind.Experiences.GridTile else l_LayoutConfig_0.Kind.Experiences.WithFooter;
    local v36 = l_useTokens_0();
    local v37 = v34.entries or {};
    local v38 = v34.gameEmphasis or false;
    local v44 = v2.useMemo(function() --[[ Line: 87 ]]
        -- upvalues: v4 (ref), v37 (copy), v38 (copy)
        return v4.Array.map(v37, function(v39, v40) --[[ Line: 88 ]]
            -- upvalues: v4 (ref), v38 (ref)
            local l_assign_0 = v4.Object.assign;
            local v42 = {
                index = v40
            };
            local v43 = false;
            if v40 == 1 then
                v43 = v38;
            end;
            v42.featured = v43;
            return l_assign_0(v42, v39);
        end);
    end, {
        v37, 
        v38
    });
    local v45 = l_useDispatch_0();
    local v46 = l_useNavigation_0();
    local v49 = v2.useCallback(function(v47, v48) --[[ Line: 99 ]]
        -- upvalues: v45 (copy), l_OpenGameDetails_0 (ref), v46 (copy)
        v45(l_OpenGameDetails_0(v47, v46, v48));
    end, {
        v46
    });
    local v50 = v34.windowSize or Vector2.one;
    local v51 = l_useTextSizeOffset_0();
    local l_source_0 = v34.source;
    local l_referralSource_0 = v34.referralSource;
    local l_hideGameStats_0 = v34.hideGameStats;
    local v55 = v34.useHoverTile == nil or v34.useHoverTile;
    local l_reportGameDetailOpened_0 = v34.reportGameDetailOpened;
    local l_reportExperienceLaunched_0 = v34.reportExperienceLaunched;
    local v58 = v34.showFriendActivity or false;
    local v59 = l_useResponsiveLayout_0("relativeHeight", v35);
    local v60 = l_FFlagLuaAppCompositionAlways_0 or l_FFlagLuaAppCompositionSupport_0 and v34.appCompositionEnabled;
    local v61 = if l_FFlagLuaAppCompositionSupport_0 then l_useCollectionLayout_0(v8.getGameTileCollectionItemSize(v34.gameTileLayoutType or l_GameTileLayoutType_0.Narrow)) else nil;
    local v62 = v34.enableCollectionLayout or v60;
    local v63, v64 = v2.useState(nil);
    local v65 = l_useGameCollectionLayoutParams_0(v34.gameTileLayoutType or l_GameTileLayoutType_0.Narrow, v63, false);
    local v66 = v2.useRef(1);
    local v67 = l_useResponsiveLayout_0("columns", v35);
    local v68 = if v60 then v61.itemsPerRow else if v62 then v65.numColumns else v67;
    local v69 = l_useBreakpointXOrSmaller_0(v23.Keys.XSmall);
    v2.useEffect(function() --[[ Line: 137 ]]
        -- upvalues: v66 (copy), v68 (copy), v34 (copy)
        if v66.current ~= v68 then
            v66.current = v68;
            if v34.onItemsPerRowChanged then
                v34.onItemsPerRowChanged(v68);
            end;
        end;
    end, {
        v68, 
        v66, 
        v34.onItemsPerRowChanged
    });
    local v70 = l_useDesignTokens_0();
    local v71 = l_GameTileConstants_0.TileTextLines[v34.gameTileLayoutType or l_GameTileLayoutType_0.Narrow];
    local v72 = l_GameTileViewConfig_0.getFooterHeight(v70, true, false, false, v51, nil, v71.titleTextLines, v36, true);
    if v31 and (v59 == nil or v59.Scale == nil) then
        l_DiscoveryEventErrorLogger_0.reportError("GameGridTable_NilRelativeHeight", "relativeHeight is nil", {
            rowKind = tostring(v35), 
            relativeHeightType = typeof(v59), 
            relativeHeightValue = tostring(v59), 
            responsiveLayoutColumns = tostring(v67), 
            useGridTiles = tostring(v34.useGridTiles or false), 
            enableCollectionLayout = tostring(v34.enableCollectionLayout or false), 
            gameTileLayoutType = tostring(v34.gameTileLayoutType or "nil")
        });
    else
        v59 = UDim.new(v59.Scale, v72);
    end;
    local v75 = v2.useCallback(function(v73, v74) --[[ Line: 175 ]]
        -- upvalues: v2 (ref), v27 (ref), l_source_0 (copy), l_reportGameDetailOpened_0 (copy), l_reportExperienceLaunched_0 (copy), v34 (copy), l_AppGameTile_0 (ref), l_hideGameStats_0 (copy), l_referralSource_0 (copy), v58 (copy), v55 (copy), v49 (copy), v51 (copy), v69 (copy)
        if v73.featured then
            return v2.createElement(v27, {
                entry = v73, 
                index = v73.realGameEntryIndex or v73.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hasBackground = true, 
                hasActionRow = true, 
                isDynamic = true, 
                impressionsTag = v34.impressionsTag, 
                launchExperienceEventContext = v34.launchExperienceEventContext
            });
        else
            return v2.createElement(l_AppGameTile_0, {
                entry = v73, 
                index = v73.realGameEntryIndex or v73.index, 
                source = l_source_0, 
                reportGameDetailOpened = l_reportGameDetailOpened_0, 
                reportExperienceLaunched = l_reportExperienceLaunched_0, 
                hideGameStats = l_hideGameStats_0, 
                referralSource = l_referralSource_0, 
                rowNum = math.ceil(v73.index / (v74.columns or 1)), 
                showFriendActivity = v58, 
                playerCountStyle = v34.playerCountStyle, 
                isSponsoredFooterAllowed = v34.isSponsoredFooterAllowed, 
                useHoverTile = v55, 
                useGridTile = v34.useGridTiles, 
                friendFooterEnabled = v34.useGridTiles and true or nil, 
                impressionsTag = v34.impressionsTag, 
                launchExperienceEventContext = v34.launchExperienceEventContext, 
                topicId = v34.topicId, 
                gameTileLayoutType = v34.gameTileLayoutType, 
                navigateToGameDetails = v49, 
                playButtonStyle = v34.playButtonStyle, 
                isContained = true, 
                textSizeOffset = v51, 
                isNarrowScreenXSmall = v69
            });
        end;
    end, {
        l_source_0, 
        l_referralSource_0, 
        l_hideGameStats_0, 
        v58, 
        l_reportGameDetailOpened_0, 
        l_reportExperienceLaunched_0, 
        v34.impressionsTag, 
        v34.launchExperienceEventContext, 
        v34.playerCountStyle, 
        v34.useGridTiles, 
        v34.isSponsoredFooterAllowed, 
        v34.playButtonStyle, 
        v69
    });
    local v76 = if v34.screenSize then v34.screenSize.Y else v50.Y;
    local v78 = l_useSelector_0(function(v77) --[[ Line: 236 ]]
        if v77.ScreenSize then
            return v77.ScreenSize.X;
        else
            return nil;
        end;
    end);
    local v79 = l_useResponsiveLayout_0("verticalGutter", v35);
    local v80 = if v60 then v61.verticalGap else v79;
    local v81 = if v60 then v61.gutter else v65.columnGap;
    local v82 = v60 and 0 or v65.sideMargin;
    local v86 = v2.useMemo(function() --[[ Line: 249 ]]
        -- upvalues: v62 (copy), v70 (copy), l_FFlagLuaAppCompositionSupport_0 (ref), v68 (copy), v81 (copy), v82 (copy), v80 (copy), v59 (ref)
        if not v62 then
            return nil;
        else
            local l_Layout_0 = v70.LuaApps.Layout;
            if l_FFlagLuaAppCompositionSupport_0 and not l_Layout_0 then
                return nil;
            else
                local l_grid_0 = l_Layout_0.grid;
                local l_tiles_0 = l_Layout_0.tiles;
                return {
                    columns = v68, 
                    gutter = v81, 
                    margin = v82, 
                    verticalGutter = v80, 
                    relativeHeight = v59, 
                    hoverTileTopOffset = l_tiles_0.hover.topOffset, 
                    hoverTileBottomOffset = l_tiles_0.hover.bottomOffset, 
                    hoverTileHorizontalOffset = l_tiles_0.hover.horizontalOffset, 
                    scrollableMaxTilesPerRow = l_grid_0.default.scrollableMaxTilesPerRow
                };
            end;
        end;
    end, {
        v62, 
        v70.LuaApps.Layout, 
        v68, 
        v81, 
        v82, 
        v80, 
        v59
    });
    local v87 = v2.createElement(l_ResponsiveGrid_0, {
        ref = v64, 
        kind = v35, 
        data = v44, 
        renderItem = v75, 
        layoutOrder = v34.LayoutOrder, 
        getCellColspan = v33, 
        getCellRowspan = v33, 
        relativeHeight = v59, 
        absoluteWindowTop = -v76, 
        absoluteWindowHeight = v76 * 3, 
        enableDeferredRefPropEvents = true
    });
    if v62 then
        v87 = v2.createElement(l_ResponsiveLayoutProvider_0, {
            width = v78, 
            config = v86
        }, {
            ResponsiveGrid = v87
        });
    end;
    return v87;
end;