local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v3 = require(l_CorePackages_0.Workspace.Packages.Responsive);
local l_BreakpointConfig_0 = v3.BreakpointConfig;
local l_ScreenSizeImpressionsTracker_0 = require(l_CorePackages_0.Workspace.Packages.Impressions).ScreenSizeImpressionsTracker;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local v8 = require(l_CorePackages_0.Packages.SignalsReact);
local v9 = require(l_CorePackages_0.Workspace.Packages.CollectionViews);
local l_CollectionItemSize_0 = v9.CollectionViewTypes.CollectionItemSize;
local l_usePageSideMargin_0 = v9.usePageSideMargin;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_OmniFeedProps_0 = l_Modules_0.Personalization.OmniFeed.OmniFeedProps;
local l_SearchSelectionTypeHeader_0 = l_Modules_0.LuaApp.Components.Search.SearchTypeSelection.SearchSelectionTypeHeader;
local l_useUpdateFeedItemRenderedRows_0 = l_Modules_0.Personalization.OmniFeed.DataStore.useUpdateFeedItemRenderedRows;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v17 = require(l_Modules_1.LuaApp.Components.UserSearch.api);
local l_Analytics_0 = v17.Analytics.Analytics;
local l_fireImpressionEvent_0 = v17.Analytics.fireImpressionEvent;
local v20 = require(l_Modules_1.LuaApp.Components.UserSearch.Players.PlayerGridWithUserSearchHydrationLayerWrapper);
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local v22 = game:DefineFastFlag("LuaAppUserSearchGridReactiveContainer", false);
return function(v23) --[[ Line: 44 ]] --[[ Name: UserSearchGridFeedItem ]]
    -- upvalues: v1 (copy), l_useSelector_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_OmniFeedProps_0 (copy), l_CollectionItemSize_0 (copy), v8 (copy), l_usePageSideMargin_0 (copy), v22 (copy), l_Analytics_0 (copy), l_BreakpointConfig_0 (copy), v3 (copy), l_useUpdateFeedItemRenderedRows_0 (copy), l_AppPage_0 (copy), l_fireImpressionEvent_0 (copy), l_SearchSelectionTypeHeader_0 (copy), l_SearchTypes_0 (copy), v20 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v24 = v1.useRef(nil);
    local v26 = l_useSelector_0(function(v25) --[[ Line: 47 ]]
        -- upvalues: v23 (copy)
        return v25.UsersSearchResults[v23.searchUuid];
    end);
    local v28 = l_useSelector_0(function(v27) --[[ Line: 51 ]]
        return v27.ScreenSize;
    end);
    local v29 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v23[l_OmniFeedProps_0.key].sduiContext;
        local l_XSmall_0 = l_CollectionItemSize_0.XSmall;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 5 -> 23 ]];
        local l_l_XSmall_0_0 = l_XSmall_0 --[[ copy: 6 -> 24 ]];
        local v35 = v1.useCallback(function(v34) --[[ Line: 61 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_XSmall_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_XSmall_0_0)(v34).sideMargin;
        end, {
            l_XSmall_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v29 = v8.useSignalState(v35);
    else
        v29 = l_usePageSideMargin_0(v23[l_OmniFeedProps_0.key].verticalScrollingFrameRef.current);
    end;
    local l_v29_0 = v29;
    local v37 = nil;
    local v38 = nil;
    if v22 then
        local v39, v40 = v1.useState(nil);
        v37 = v39;
        v38 = v40;
    else
        v37 = v24 and v24.current and v24.current.AbsoluteSize or nil;
    end;
    local v41 = if v37 and v37.X > 0 then v37.X - 2 * l_v29_0 else 0;
    local v42 = Vector2.new(v41, v28.Y);
    local v43 = l_Analytics_0({
        infoForAllEvents = {
            userSearchSessionId = v23.searchUuid
        }
    });
    local v44 = v28.X >= l_BreakpointConfig_0.getMinWidthFor(v3.Keys.Large);
    local v45 = v28.X < l_BreakpointConfig_0.getMinWidthFor(v3.Keys.Small);
    local v46 = (not not v44 or v45) and 1 or v23.topicLayoutData.numOfRows;
    if v46 < 0 then
        v46 = nil;
    end;
    local v47, v48 = v1.useState(1);
    local function v50(v49) --[[ Line: 98 ]]
        -- upvalues: v48 (copy)
        v48(v49);
    end;
    local l_feedItemPosition_0 = v23[l_OmniFeedProps_0.key].feedItemPosition;
    local v52 = if v26 and v26.entries then #v26.entries else 0;
    local v53 = if v52 and v47 and v47 > 0 then math.ceil(v52 / v47) else 0;
    local v54 = if not (v46 and v46 >= 0) or v53 < v46 then v53 else v46;
    local l_feedItemStartRow_0 = v23[l_OmniFeedProps_0.key].feedItemStartRow;
    l_useUpdateFeedItemRenderedRows_0(l_AppPage_0.SearchPage, v23.searchUuid, l_feedItemPosition_0, v54);
    local v57 = v1.useCallback(function(v56) --[[ Line: 122 ]]
        -- upvalues: l_fireImpressionEvent_0 (ref), v26 (copy), l_feedItemStartRow_0 (copy), v47 (copy), v43 (copy)
        l_fireImpressionEvent_0({
            impressions = v56, 
            entries = v26 and v26.entries or nil, 
            startRowNumber = l_feedItemStartRow_0, 
            itemsPerRow = v47
        }, v43.fireAnalyticsEvent);
    end, {
        v26, 
        l_feedItemStartRow_0, 
        v47, 
        v43.fireAnalyticsEvent
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ref = v24, 
        [v1.Change.AbsoluteSize] = v22 and function(v58) --[[ Line: 144 ]]
            -- upvalues: v38 (ref)
            v38(v58.AbsoluteSize);
        end or nil
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_v29_0), 
            PaddingRight = UDim.new(0, l_v29_0)
        }), 
        Header = if v23.topicLayoutData and v23.topicLayoutData.showHeader then v1.createElement(l_SearchSelectionTypeHeader_0, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Players
        }) else nil, 
        HydrationWrapper = v1.createElement(v20, {
            LayoutOrder = 2, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            windowSize = v42, 
            numberOfRowsToShow = v46, 
            shouldUseCompactTiles = true, 
            searchParameters = {
                searchKeyword = v26.keyword
            }, 
            entries = v26.entries, 
            Analytics = v43, 
            impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS", 
            subpage = "UserSearchFeedItem", 
            onItemsPerRowChanged = v50, 
            startRowNumber = l_feedItemStartRow_0, 
            itemsPerRow = v47
        }), 
        ScreenSizeImpressionsDetector = v1.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v24, 
            pageContext = l_AppPage_0.SearchPage, 
            impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS", 
            sendImpressions = v57, 
            scrollViewPositionChangedSignal = v23[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal
        })
    });
end;