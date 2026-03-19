local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("CoreScriptsRoactCommon").Parent;
local v2 = require(l_Parent_0.AppCommonLib);
local v3 = require(l_Parent_0.CollectionViews);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.DiscoveryAnalytics);
local v6 = require(l_Parent_0.Foundation);
local v7 = require(l_Parent_0.GameCollections);
local v8 = require(l_Parent_0.Impressions);
local v9 = require(l_Parent_0.Localization);
local v10 = require(l_Parent_0.React);
local v11 = require(l_Parent_0.RoactServiceTags);
local v12 = require(l_Parent_0.RobloxAppHooks);
local v13 = require(l_Parent_0.SharedFlags);
local v14 = require(script.Parent.Constants);
local v15 = require(script.Parent.TraversalExperienceCard);
local v16 = require(script.Parent.TraversalTelemetry);
local v17 = game:DefineFastInt("MaxTraversalHistoryCardsPerRow709", 6);
local l_FFlagTraversalHistoryDiscoveryTelemetry_0 = v13.FFlagTraversalHistoryDiscoveryTelemetry;
local l_FFlagTraversalExpPagePaddingFixes_0 = require(script.Parent.Flags).FFlagTraversalExpPagePaddingFixes;
local l_FFlagTraversalPerfFixes_0 = require(script.Parent.Flags).FFlagTraversalPerfFixes;
local v21 = game:DefineFastFlag("TraversalUseDiscoveryCollectionViews", false);
local v22 = game:DefineFastFlag("TraversalUseXSmallCollectionItems", false);
local l_Signal_0 = v2.Signal;
local l_CollectionLayoutCalculators_0 = v3.CollectionLayoutCalculators;
local l_CollectionItemSize_0 = v3.CollectionViewTypes.CollectionItemSize;
local l_gamePlayIntent_0 = v5.Events.gamePlayIntent;
local l_IconButton_0 = v6.IconButton;
local l_IconName_0 = v6.Enums.IconName;
local l_Text_0 = v6.Text;
local l_View_0 = v6.View;
local l_ScrollView_0 = v6.ScrollView;
local l_useTokens_0 = v6.Hooks.useTokens;
local l_SendGameImpressions_0 = v7.SendGameImpressions;
local l_ImpressionsTrackerWithoutNavigation_0 = v8.ImpressionsTrackerWithoutNavigation;
local l_useViewportBounds_0 = v8.useViewportBounds;
local l_useLocalization_0 = v9.Hooks.useLocalization;
local l_AppEventIngestService_0 = v11.AppEventIngestService;
local l_RoactAnalytics_0 = v11.RoactAnalytics;
local l_useRoactService_0 = v12.useRoactService;
local function v48(v40) --[[ Line: 70 ]] --[[ Name: getCardsPerRowAndCardWidth ]]
    local l_availableWidth_0 = v40.availableWidth;
    local l_maxCardsPerRow_0 = v40.maxCardsPerRow;
    local l_minCardWidth_0 = v40.minCardWidth;
    local v44 = v40.cardGap or 0;
    local v45 = math.floor((l_availableWidth_0 + v44) / (l_minCardWidth_0 + v44));
    local v46 = math.floor((l_availableWidth_0 - v44 * (v45 - 1)) / v45);
    local v47 = math.floor((l_availableWidth_0 - v44 * (l_maxCardsPerRow_0 - 1)) / l_maxCardsPerRow_0);
    if v45 < 1 then
        return 1, l_minCardWidth_0;
    elseif v46 < v47 then
        return l_maxCardsPerRow_0, v47;
    else
        return v45, v46;
    end;
end;
return v10.memo(v10.forwardRef(function(v49, v50) --[[ Line: 92 ]] --[[ Name: HistoryPage ]]
    -- upvalues: l_useRoactService_0 (copy), l_AppEventIngestService_0 (copy), l_RoactAnalytics_0 (copy), l_useTokens_0 (copy), l_useLocalization_0 (copy), l_FFlagTraversalExpPagePaddingFixes_0 (copy), v10 (copy), v21 (copy), v22 (copy), l_GuiService_0 (copy), l_CollectionItemSize_0 (copy), l_CollectionLayoutCalculators_0 (copy), v3 (copy), v48 (copy), v17 (copy), l_FFlagTraversalPerfFixes_0 (copy), l_Signal_0 (copy), v4 (copy), v15 (copy), v14 (copy), v16 (copy), l_FFlagTraversalHistoryDiscoveryTelemetry_0 (copy), l_gamePlayIntent_0 (copy), v5 (copy), l_useViewportBounds_0 (copy), l_SendGameImpressions_0 (copy), l_View_0 (copy), l_IconButton_0 (copy), l_IconName_0 (copy), l_Text_0 (copy), l_ScrollView_0 (copy), l_ImpressionsTrackerWithoutNavigation_0 (copy)
    local v51 = l_useRoactService_0(l_AppEventIngestService_0);
    local v52 = l_useRoactService_0(l_RoactAnalytics_0);
    local v53 = l_useTokens_0();
    local v54 = l_useLocalization_0({
        historyTitle = "CoreScripts.TopBar.Traversal.History", 
        historyDescription = "CoreScripts.InGameMenu.Traversal.HistoryDescription"
    });
    local v55 = if l_FFlagTraversalExpPagePaddingFixes_0 then v53.Gap.Large else v53.Gap.Small;
    local l_XLarge_0 = v53.Padding.XLarge;
    local v57, v58 = v10.useState(0);
    local v59 = nil;
    local v60 = nil;
    if v21 then
        local v61 = nil;
        v61 = if v22 and l_GuiService_0.ViewportDisplaySize == Enum.DisplaySize.Small then l_CollectionItemSize_0.XSmall else l_CollectionItemSize_0.Small;
        v59 = l_CollectionLayoutCalculators_0.calculateNumColumns(v57, 0, v55, v61, v53);
        v60 = v3.calculateItemWidth(v59, v55, 0, v57, 0);
    else
        local v62, v63 = v48({
            availableWidth = v57, 
            maxCardsPerRow = v17, 
            minCardWidth = v53.Size.Size_2500, 
            cardGap = v55
        });
        v59 = v62;
        v60 = v63;
    end;
    v59 = math.max(v59, 1);
    local v64 = math.floor(#v49.historyItems / v59);
    local v65 = nil;
    local v66 = nil;
    if l_FFlagTraversalPerfFixes_0 then
        v65 = v10.useRef(nil);
    else
        local v67, v68 = v10.useState(nil);
        v65 = v67;
        v66 = v68;
    end;
    local v69 = v10.useRef({});
    local v72 = v10.useCallback(function(v70, v71) --[[ Line: 132 ]]
        -- upvalues: v69 (copy)
        v69.current[v70] = v71;
    end, {});
    local v73 = v10.useRef(nil);
    local v74 = v10.useMemo(function() --[[ Line: 136 ]]
        -- upvalues: l_Signal_0 (ref)
        return l_Signal_0.new();
    end, {});
    local v78 = v4.List.map(v49.historyItems, function(v75, v76) --[[ Line: 140 ]]
        -- upvalues: v10 (ref), v15 (ref), v14 (ref), v49 (copy), v16 (ref), l_FFlagTraversalHistoryDiscoveryTelemetry_0 (ref), l_gamePlayIntent_0 (ref), v51 (copy), v5 (ref), v60 (ref), v72 (copy)
        return v10.createElement(v15, {
            key = v76, 
            name = v75.name, 
            image = v75.image, 
            impressionIndex = v76, 
            impressionTag = v14.CardImpressionTag, 
            rating = v75.rating, 
            onActivated = function() --[[ Line: 148 ]] --[[ Name: onActivated ]]
                -- upvalues: v49 (ref), v16 (ref), v75 (copy), v76 (copy), l_FFlagTraversalHistoryDiscoveryTelemetry_0 (ref), l_gamePlayIntent_0 (ref), v51 (ref), v5 (ref)
                if not v49.onCardItemActivated then
                    return;
                else
                    v16.sendHistoryPageExperienceTileClick({
                        integration_id = "history_landing_game_tile", 
                        event_type = "click", 
                        destination_universe_id = tostring(v75.universeId), 
                        recency_pos = v76
                    });
                    if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then
                        l_gamePlayIntent_0(v51, v5.Constants.Context.InExpHistoryTile, {
                            placeId = tostring(v75.placeId), 
                            universeId = tostring(v75.universeId), 
                            sortEntryIndex = tostring(v76)
                        });
                    end;
                    v49.onCardItemActivated(v75.universeId);
                    return;
                end;
            end, 
            width = v60, 
            ref = function(v77) --[[ Line: 170 ]] --[[ Name: ref ]]
                -- upvalues: v72 (ref), v76 (copy)
                v72(v76, v77);
            end
        });
    end);
    local v79 = nil;
    if l_FFlagTraversalPerfFixes_0 then
        v79 = v10.useRef(false);
    end;
    v10.useEffect(function() --[[ Line: 182 ]]
        -- upvalues: l_FFlagTraversalPerfFixes_0 (ref), v79 (ref), v65 (ref), v73 (copy), v49 (copy), v64 (copy), v59 (ref)
        if l_FFlagTraversalPerfFixes_0 and v79.current then
            return;
        elseif not (if l_FFlagTraversalPerfFixes_0 then v65.current else v65) or not v73.current or not v49.onLoadMoreHistory then
            return;
        else
            local v80 = (if l_FFlagTraversalPerfFixes_0 then v65.current else v65) * v64;
            if v80 + (if l_FFlagTraversalPerfFixes_0 then v65.current else v65) <= v73.current.AbsoluteSize.Y then
                if l_FFlagTraversalPerfFixes_0 then
                    v79.current = true;
                    local v81 = math.max(math.floor((v73.current.AbsoluteSize.Y - v80) / v65.current), 1) * v59;
                    v49.onLoadMoreHistory(v81);
                    return;
                else
                    v49.onLoadMoreHistory(v59);
                end;
            end;
            return;
        end;
    end, {
        if l_FFlagTraversalPerfFixes_0 then nil else v49.historyItems, 
        v49.onLoadMoreHistory, 
        if l_FFlagTraversalPerfFixes_0 then nil else v65, 
        v59, 
        v64
    });
    local v82 = l_useViewportBounds_0();
    local v87 = v10.useCallback(function(v83) --[[ Line: 222 ]]
        -- upvalues: l_FFlagTraversalHistoryDiscoveryTelemetry_0 (ref), v49 (copy), l_SendGameImpressions_0 (ref), v51 (copy), v52 (copy), v59 (ref), v64 (copy)
        if l_FFlagTraversalHistoryDiscoveryTelemetry_0 then
            local v84 = {};
            for v85, v86 in v49.historyItems do
                if v86 then
                    table.insert(v84, {
                        placeId = tostring(v86.placeId), 
                        universeId = tostring(v86.universeId), 
                        uiIndex = v85
                    });
                end;
            end;
            l_SendGameImpressions_0.sendFromTraversalHistoryPage(v51, v52, v83, v84, v59, v64);
        end;
    end, {
        v49.historyItems, 
        v52, 
        if l_FFlagTraversalPerfFixes_0 then nil else v57, 
        v59, 
        v51, 
        v64
    });
    local v88 = v10.useCallback(function() --[[ Line: 255 ]]
        -- upvalues: v16 (ref), v49 (copy)
        v16.sendHistoryPageBackButtonClick({
            integration_id = "history_landing_back_button", 
            event_type = "click"
        });
        v49.onHistoryClose();
    end, {
        v49.onHistoryClose
    });
    local v91 = v10.useCallback(function(v89) --[[ Line: 264 ]]
        -- upvalues: l_XLarge_0 (copy), v58 (copy), v69 (copy), l_FFlagTraversalPerfFixes_0 (ref), v65 (ref), v66 (ref)
        local v90 = v89.AbsoluteSize.X - 2 * l_XLarge_0;
        v58(v90);
        if v69.current[1] then
            if l_FFlagTraversalPerfFixes_0 then
                v65.current = v69.current[1].AbsoluteSize.Y;
                return;
            else
                v66(v69.current[1].AbsoluteSize.Y);
            end;
        end;
    end, if l_FFlagTraversalPerfFixes_0 then {
        l_XLarge_0
    } else {
        l_XLarge_0, 
        v58, 
        v66
    });
    local v97 = v10.useCallback(function(v92) --[[ Line: 277 ]]
        -- upvalues: v74 (copy), v49 (copy), l_FFlagTraversalPerfFixes_0 (ref), v65 (ref), v59 (ref)
        v74:fire();
        if not v49.onLoadMoreHistory or not if l_FFlagTraversalPerfFixes_0 then v65.current else v65 then
            return;
        else
            local l_Y_0 = v92.CanvasPosition.Y;
            local l_Y_1 = v92.AbsoluteWindowSize.Y;
            local l_Y_2 = v92.AbsoluteCanvasSize.Y;
            local v96 = if l_FFlagTraversalPerfFixes_0 then v65.current else v65;
            if l_Y_2 <= l_Y_0 + l_Y_1 + v96 then
                v49.onLoadMoreHistory(v59);
            end;
            return;
        end;
    end, {
        v49.onLoadMoreHistory, 
        if l_FFlagTraversalPerfFixes_0 then nil else v65, 
        v59, 
        v74
    });
    return v10.createElement(l_View_0, {
        tag = "col auto-xy size-full-0", 
        selectionGroup = {
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop
        }
    }, {
        TopContainer = if l_FFlagTraversalExpPagePaddingFixes_0 then v10.createElement(l_View_0, {
            tag = "size-full-0 auto-y padding-x-small padding-bottom-large"
        }, {
            ChevronButton = v10.createElement(l_IconButton_0, {
                icon = l_IconName_0.ChevronLargeLeft, 
                onActivated = v88, 
                ref = v50
            })
        }) else v10.createElement(l_IconButton_0, {
            icon = l_IconName_0.ChevronLargeLeft, 
            onActivated = v88, 
            ref = v50
        }), 
        Header = v10.createElement(l_View_0, {
            tag = "col auto-y size-full-0 " .. (l_FFlagTraversalExpPagePaddingFixes_0 and "" or "padding-left-medium padding-top-small padding-bottom-large"), 
            padding = if l_FFlagTraversalExpPagePaddingFixes_0 then {
                left = UDim.new(0, l_XLarge_0), 
                bottom = UDim.new(0, v53.Padding.XLarge)
            } else nil, 
            LayoutOrder = 1
        }, {
            Title = v10.createElement(l_Text_0, {
                Text = v54.historyTitle, 
                tag = "auto-xy text-heading-small text-truncate-split"
            }), 
            Description = v10.createElement(l_Text_0, {
                Text = v54.historyDescription, 
                tag = "auto-xy text-body-large text-truncate-split"
            })
        }), 
        ScrollContent = v10.createElement(l_ScrollView_0, {
            tag = "size-full shrink", 
            padding = if l_FFlagTraversalExpPagePaddingFixes_0 then {
                left = UDim.new(0, l_XLarge_0), 
                right = UDim.new(0, l_XLarge_0)
            } else UDim.new(0, l_XLarge_0), 
            layout = {
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = UDim.new(0, v55), 
                Wraps = true
            }, 
            scroll = {
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                CanvasSize = UDim2.new(0, 0, 0, 0), 
                ScrollingDirection = Enum.ScrollingDirection.Y
            }, 
            LayoutOrder = 2, 
            onAbsoluteSizeChanged = v91, 
            onCanvasPositionChanged = v97, 
            scrollingFrameRef = v73, 
            selection = {
                Selectable = false
            }, 
            selectionGroup = false
        }, v78), 
        TraversalHistoryCardImpressionTracker = l_FFlagTraversalHistoryDiscoveryTelemetry_0 and v10.createElement(l_ImpressionsTrackerWithoutNavigation_0, {
            parentRef = v73, 
            impressionsTag = v14.CardImpressionTag, 
            scrollViewPositionChangedSignal = v74, 
            sendImpressions = v87, 
            viewPortBounds = v82
        })
    });
end));