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
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local v23 = game:DefineFastFlag("LuaAppUserSearchGridReactiveContainer", false);
return function(v24) --[[ Line: 46 ]] --[[ Name: UserSearchGridFeedItem ]]
    -- upvalues: v1 (copy), l_useSelector_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_OmniFeedProps_0 (copy), l_CollectionItemSize_0 (copy), v8 (copy), l_usePageSideMargin_0 (copy), v23 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_Analytics_0 (copy), l_BreakpointConfig_0 (copy), v3 (copy), l_useUpdateFeedItemRenderedRows_0 (copy), l_AppPage_0 (copy), l_fireImpressionEvent_0 (copy), l_SearchSelectionTypeHeader_0 (copy), l_SearchTypes_0 (copy), v20 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v25 = v1.useRef(nil);
    local v27 = l_useSelector_0(function(v26) --[[ Line: 49 ]]
        -- upvalues: v24 (copy)
        return v26.UsersSearchResults[v24.searchUuid];
    end);
    local v29 = l_useSelector_0(function(v28) --[[ Line: 53 ]]
        return v28.ScreenSize;
    end);
    local v30 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v24[l_OmniFeedProps_0.key].sduiContext;
        local l_XSmall_0 = l_CollectionItemSize_0.XSmall;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 5 -> 23 ]];
        local l_l_XSmall_0_0 = l_XSmall_0 --[[ copy: 6 -> 24 ]];
        local v36 = v1.useCallback(function(v35) --[[ Line: 63 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_XSmall_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_XSmall_0_0)(v35).sideMargin;
        end, {
            l_XSmall_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v30 = v8.useSignalState(v36);
    else
        v30 = l_usePageSideMargin_0(v24[l_OmniFeedProps_0.key].verticalScrollingFrameRef.current);
    end;
    local l_v30_0 = v30;
    local v38 = nil;
    local v39 = nil;
    if v23 then
        local v40, v41 = v1.useState(nil);
        v38 = v40;
        v39 = v41;
    else
        v38 = v25 and v25.current and v25.current.AbsoluteSize or nil;
    end;
    local v42 = if v38 and v38.X > 0 then v38.X - 2 * l_v30_0 else 0;
    local v43 = Vector2.new(v42, v29.Y);
    local v44 = nil;
    if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then
        v44 = v24[l_OmniFeedProps_0.key].feedItemPosition;
    end;
    local v45 = l_Analytics_0({
        infoForAllEvents = {
            userSearchSessionId = v24.searchUuid, 
            sortPosition = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v44 else nil, 
            sortId = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v24.topicId else nil, 
            pageContext = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v24[l_OmniFeedProps_0.key].appPage else nil
        }
    });
    local v46 = v29.X >= l_BreakpointConfig_0.getMinWidthFor(v3.Keys.Large);
    local v47 = v29.X < l_BreakpointConfig_0.getMinWidthFor(v3.Keys.Small);
    local v48 = (not not v46 or v47) and 1 or v24.topicLayoutData.numOfRows;
    if v48 < 0 then
        v48 = nil;
    end;
    local v49, v50 = v1.useState(1);
    local function v52(v51) --[[ Line: 108 ]]
        -- upvalues: v50 (copy)
        v50(v51);
    end;
    if not l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then
        v44 = v24[l_OmniFeedProps_0.key].feedItemPosition;
    end;
    local v53 = if v27 and v27.entries then #v27.entries else 0;
    local v54 = if v53 and v49 and v49 > 0 then math.ceil(v53 / v49) else 0;
    local v55 = if not (v48 and v48 >= 0) or v54 < v48 then v54 else v48;
    local l_feedItemStartRow_0 = v24[l_OmniFeedProps_0.key].feedItemStartRow;
    l_useUpdateFeedItemRenderedRows_0(l_AppPage_0.SearchPage, v24.searchUuid, v44, v55);
    local v58 = v1.useCallback(function(v57) --[[ Line: 134 ]]
        -- upvalues: l_fireImpressionEvent_0 (ref), v27 (copy), l_feedItemStartRow_0 (copy), v49 (copy), v45 (copy)
        l_fireImpressionEvent_0({
            impressions = v57, 
            entries = v27 and v27.entries or nil, 
            startRowNumber = l_feedItemStartRow_0, 
            itemsPerRow = v49
        }, v45.fireAnalyticsEvent);
    end, {
        v27, 
        l_feedItemStartRow_0, 
        v49, 
        v45.fireAnalyticsEvent
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ref = v25, 
        [v1.Change.AbsoluteSize] = v23 and function(v59) --[[ Line: 156 ]]
            -- upvalues: v39 (ref)
            v39(v59.AbsoluteSize);
        end or nil
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        }), 
        UIPadding = v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_v30_0), 
            PaddingRight = UDim.new(0, l_v30_0)
        }), 
        Header = if v24.topicLayoutData and v24.topicLayoutData.showHeader then v1.createElement(l_SearchSelectionTypeHeader_0, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Players
        }) else nil, 
        HydrationWrapper = v1.createElement(v20, {
            LayoutOrder = 2, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            windowSize = v43, 
            numberOfRowsToShow = v48, 
            shouldUseCompactTiles = true, 
            searchParameters = {
                searchKeyword = v27.keyword
            }, 
            entries = v27.entries, 
            Analytics = v45, 
            impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS", 
            subpage = "UserSearchFeedItem", 
            onItemsPerRowChanged = v52, 
            startRowNumber = l_feedItemStartRow_0, 
            itemsPerRow = v49
        }), 
        ScreenSizeImpressionsDetector = v1.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v25, 
            pageContext = l_AppPage_0.SearchPage, 
            impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS", 
            sendImpressions = v58, 
            scrollViewPositionChangedSignal = v24[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal
        })
    });
end;