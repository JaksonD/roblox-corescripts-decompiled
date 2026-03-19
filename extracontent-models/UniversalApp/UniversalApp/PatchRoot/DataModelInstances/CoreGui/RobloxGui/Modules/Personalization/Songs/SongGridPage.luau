local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.UIBlox);
local l_useResponsiveLayout_0 = v3.Core.Layout.Responsive.useResponsiveLayout;
local l_GridMetrics_0 = v3.App.Grid.GridMetrics;
local l_useTextSizeOffset_0 = v3.Core.Style.useTextSizeOffset;
local v7 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local v9 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local l_useScreenSize_0 = v9.useScreenSize;
local l_useRoactService_0 = v9.useRoactService;
local v12 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags);
local l_RoactAnalytics_0 = v12.RoactAnalytics;
local l_AppEventIngestService_0 = v12.AppEventIngestService;
local v15 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_usePreferredInput_0 = v15.usePreferredInput;
local v17 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums);
local l_AppPage_0 = v17.AppPage;
local l_LayoutConfig_0 = v17.LayoutConfig;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v21 = require(l_Modules_0.Personalization.PersonalizationTopBar);
local v22 = require(l_Modules_0.LuaApp.Components.RefreshScrollingFrame);
local l_TopicContentsReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsReducer;
local l_TopicInfosReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicInfosRodux).TopicInfosReducer;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local v26 = require(l_CorePackages_0.Workspace.Packages.GameCollections);
local l_useGameCollectionLayoutParams_0 = v26.useGameCollectionLayoutParams;
local l_useGetGameTileHeight_0 = v26.useGetGameTileHeight;
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local l_CollectionGrid_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).CollectionGrid;
local v31 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local v32 = require(l_CorePackages_0.Workspace.Packages.GameTile);
local l_ScreenSizeImpressionsTracker_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsTracker;
local l_SendItemImpressions_0 = require(l_CorePackages_0.Workspace.Packages.UnifiedLogging).SendItemImpressions;
local l_SendItemActionEvent_0 = require(l_CorePackages_0.Workspace.Packages.UnifiedLogging).SendItemActionEvent;
local l_ContentType_0 = require(l_CorePackages_0.Workspace.Packages.UnifiedLogging).ContentType;
local l_SongTile_0 = require(l_CorePackages_0.Workspace.Packages.SongTile).SongTile;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_flaggedMutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).flaggedMutedError;
local l_GameTileConstants_0 = v32.GameTileConstants;
local l_GAME_GRID_CHILD_PADDING_0 = v7.Constants.GAME_GRID_CHILD_PADDING;
local l_WithFooter_0 = l_LayoutConfig_0.Kind.Experiences.WithFooter;
local l_SongList_0 = l_AppPage_0.SongList;
return function() --[[ Line: 75 ]]
    -- upvalues: l_useDesignTokens_0 (copy), v2 (copy), l_Signal_0 (copy), l_usePreferredInput_0 (copy), l_useRoactService_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), l_useNavigationProps_0 (copy), l_TopicInfosReducer_0 (copy), l_TopicContentsReducer_0 (copy), l_useScreenSize_0 (copy), v31 (copy), l_GridMetrics_0 (copy), l_GAME_GRID_CHILD_PADDING_0 (copy), l_useTextSizeOffset_0 (copy), l_useResponsiveLayout_0 (copy), l_WithFooter_0 (copy), v15 (copy), l_useGetGameTileHeight_0 (copy), l_GameTileConstants_0 (copy), l_useGameCollectionLayoutParams_0 (copy), l_SendItemImpressions_0 (copy), l_SongList_0 (copy), l_ContentType_0 (copy), l_flaggedMutedError_0 (copy), l_SendItemActionEvent_0 (copy), l_SongTile_0 (copy), v21 (copy), v22 (copy), v7 (copy), l_CollectionGrid_0 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v44 = l_useDesignTokens_0();
    local v45 = v2.useRef(nil);
    local v46, v47 = v2.useState(nil);
    local v48, v49 = v2.useState(nil);
    local v50 = v2.useRef(l_Signal_0.new());
    local v51 = l_usePreferredInput_0();
    local v52 = l_useRoactService_0(l_RoactAnalytics_0);
    local v53 = l_useRoactService_0(l_AppEventIngestService_0);
    local v54 = l_useLocalization_0({
        chartsTitle = "CommonUI.Features.Label.Charts"
    });
    local v56 = l_useSelector_0(function(v55) --[[ Line: 89 ]]
        return v55.TopBar.topBarHeight or 0;
    end);
    local l_sortId_0 = l_useNavigationProps_0(function(v57) --[[ Line: 93 ]]
        return {
            sortId = v57
        };
    end).sortId;
    local v59 = ("SongListPage_%*"):format(l_sortId_0);
    local v61 = l_useSelector_0(function(v60) --[[ Line: 101 ]]
        -- upvalues: l_TopicInfosReducer_0 (ref), l_sortId_0 (copy)
        return v60.Personalization[l_TopicInfosReducer_0.key][l_sortId_0];
    end);
    local v63 = l_useSelector_0(function(v62) --[[ Line: 104 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref), l_sortId_0 (copy)
        return v62.Personalization[l_TopicContentsReducer_0.key][l_sortId_0];
    end);
    local v64 = v63 and v63.entries or {};
    local v65 = l_useScreenSize_0();
    local v66 = v65 and v65.X or 0;
    local v67 = v31.getPageSideMargin(v66);
    local v68 = Vector2.new(v66 - 2 * v67, v65.Y);
    local v69 = v46 or v65;
    local v70 = Vector2.new(v68.X, v69 and v69.Y or 0);
    local l_itemWidth_0 = l_GridMetrics_0.getSmallMetrics(v70.X, l_GAME_GRID_CHILD_PADDING_0).itemWidth;
    local v72 = l_useTextSizeOffset_0();
    local v73 = l_useResponsiveLayout_0("columns", l_WithFooter_0);
    local v74 = l_useResponsiveLayout_0("gutter", l_WithFooter_0) or l_GAME_GRID_CHILD_PADDING_0;
    local v75 = l_useResponsiveLayout_0("verticalGutter", l_WithFooter_0) or v74;
    local v76 = math.floor((v70.X + v74) / (l_itemWidth_0 + v74));
    local v77 = v51 == v15.Input.Pointer;
    local v78 = l_useGetGameTileHeight_0(v77, "Narrow", v77, false, false, v72, nil, l_GameTileConstants_0.TileTextLines.Narrow.titleTextLines);
    local v79 = l_useGameCollectionLayoutParams_0("Narrow", v48, false, {
        columnGap = v74, 
        numColumns = v73 or v76, 
        sideMargin = v67
    });
    local v84 = v2.useCallback(function(v80) --[[ Line: 142 ]]
        -- upvalues: v61 (copy), v64 (copy), l_SendItemImpressions_0 (ref), v53 (copy), v52 (copy), v79 (copy), l_SongList_0 (ref), l_ContentType_0 (ref)
        if not v61 then
            return;
        elseif not v64 then
            return;
        else
            local v81 = {};
            for _, v83 in ipairs(v64) do
                table.insert(v81, {
                    id = v83.contentId
                });
            end;
            l_SendItemImpressions_0.sendFromItemCollection(v53, v52, v80, v81, v79.numColumns, l_SongList_0, 1, l_ContentType_0.Song, #v81, nil, v61.name);
            return;
        end;
    end, {
        v53, 
        v52, 
        v64, 
        v79.numColumns, 
        v61
    });
    local v88 = v2.useCallback(function(v85, v86) --[[ Line: 178 ]]
        -- upvalues: v64 (copy), l_flaggedMutedError_0 (ref), v79 (copy), l_SendItemActionEvent_0 (ref), v53 (copy), v52 (copy), l_SongList_0 (ref), l_sortId_0 (copy), l_ContentType_0 (ref)
        if not v64 then
            l_flaggedMutedError_0("SongGridPageMissingEntries", "entries is nil for handleSongClick");
            return;
        elseif v79.numColumns <= 0 then
            warn("numColumns should not be 0 or nil when calculating row number");
            return;
        else
            local v87 = math.ceil(v86 / v79.numColumns);
            l_SendItemActionEvent_0.sendFromItemCollection(v53, v52, {
                id = v85
            }, v87, v86, l_SongList_0, 1, l_sortId_0, #v64, l_ContentType_0.Song, "OpenSongDetails");
            return;
        end;
    end, {
        v53, 
        v52, 
        l_sortId_0, 
        v64
    });
    local v92 = v2.useCallback(function(v89, v90, v91) --[[ Line: 193 ]]
        -- upvalues: v2 (ref), l_SongTile_0 (ref), v77 (copy), v59 (copy), v51 (copy), v15 (ref), v88 (copy)
        return v2.createElement(l_SongTile_0, {
            contentId = v89.contentId, 
            hasBackground = v77, 
            hasOutline = v77, 
            impressionsTag = v59, 
            layoutOrder = v90, 
            size = v91, 
            useLargerFooterFont = v51 == v15.Input.Pointer, 
            reportTileOpened = function() --[[ Line: 202 ]] --[[ Name: reportTileOpened ]]
                -- upvalues: v88 (ref), v89 (copy), v90 (copy)
                v88(v89.contentId, v90);
            end, 
            isContained = v77
        }), "SongTile";
    end, {
        v51, 
        v59, 
        v88, 
        v77
    });
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1)
    }, {
        TopBar = v2.createElement(v21, {
            titleText = v54.chartsTitle
        }), 
        ScrollingFrame = v2.createElement(v22, {
            Position = UDim2.new(0, 0, 0, v56), 
            Size = UDim2.new(1, 0, 1, -v56), 
            createEndOfScrollElement = true, 
            BackgroundTransparency = v44.LuaApps.SeeAll.BackgroundTransparency, 
            onAbsoluteSizeChangedCallback = function(v93) --[[ Line: 223 ]] --[[ Name: onAbsoluteSizeChangedCallback ]]
                -- upvalues: v47 (copy)
                if v93 then
                    v47(v93.AbsoluteSize);
                end;
            end, 
            onCanvasPositionChangedCallback = function() --[[ Line: 228 ]] --[[ Name: onCanvasPositionChangedCallback ]]
                -- upvalues: v50 (copy)
                v50.current:fire();
            end, 
            ref = v45
        }, {
            Padding = v2.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v7.Constants.GAME_GRID_PADDING)
            }), 
            CollectionGrid = v2.createElement(l_CollectionGrid_0, {
                columnGap = v79.columnGap, 
                containerRef = v49, 
                getItemHeight = v78, 
                hideHeaderButton = true, 
                items = v64, 
                numColumns = v79.numColumns, 
                renderItem = v92, 
                sideMargin = v79.sideMargin, 
                title = v61 and v61.displayName or "", 
                verticalPadding = v75, 
                verticalScrollingFrameRef = v45
            }), 
            SeeAllImpressionsDetector = v2.createElement(l_ScreenSizeImpressionsTracker_0, {
                impressionsTag = v59, 
                pageContext = l_SongList_0, 
                parentRef = v45, 
                scrollViewPositionChangedSignal = v50.current, 
                sendImpressions = v84
            })
        })
    });
end;