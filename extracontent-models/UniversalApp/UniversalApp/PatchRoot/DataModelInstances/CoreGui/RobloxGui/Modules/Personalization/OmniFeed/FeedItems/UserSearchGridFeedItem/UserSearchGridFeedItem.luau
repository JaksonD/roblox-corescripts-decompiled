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
local l_FFlagLuaAppCompositionSupport_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionSupport;
local l_FFlagLuaAppCompositionAlways_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppCompositionAlways;
local l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppSearchPeopleUnifiedSchemaFields;
local v25 = game:DefineFastFlag("LuaAppUserSearchGridReactiveContainer", false);
return function(v26) --[[ Line: 48 ]] --[[ Name: UserSearchGridFeedItem ]]
    -- upvalues: v1 (copy), l_FFlagLuaAppCompositionAlways_0 (copy), l_FFlagLuaAppCompositionSupport_0 (copy), l_OmniFeedProps_0 (copy), l_useSelector_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_CollectionItemSize_0 (copy), v8 (copy), l_usePageSideMargin_0 (copy), v25 (copy), l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 (copy), l_Analytics_0 (copy), l_BreakpointConfig_0 (copy), v3 (copy), l_useUpdateFeedItemRenderedRows_0 (copy), l_AppPage_0 (copy), l_fireImpressionEvent_0 (copy), l_SearchSelectionTypeHeader_0 (copy), l_SearchTypes_0 (copy), v20 (copy), l_ScreenSizeImpressionsTracker_0 (copy)
    local v27 = v1.useRef(nil);
    local v28 = l_FFlagLuaAppCompositionAlways_0 and true or if l_FFlagLuaAppCompositionSupport_0 then v26[l_OmniFeedProps_0.key].appCompositionEnabled else nil;
    local v30 = l_useSelector_0(function(v29) --[[ Line: 56 ]]
        -- upvalues: v26 (copy)
        return v29.UsersSearchResults[v26.searchUuid];
    end);
    local v32 = l_useSelector_0(function(v31) --[[ Line: 60 ]]
        return v31.ScreenSize;
    end);
    local v33 = nil;
    if l_FFlagLuaAppCompositionAlways_0 then
        v33 = nil;
    elseif l_FFlagLuaAppLayoutParamsInContext_0 then
        local l_sduiContext_0 = v26[l_OmniFeedProps_0.key].sduiContext;
        local l_XSmall_0 = l_CollectionItemSize_0.XSmall;
        local l_l_sduiContext_0_0 = l_sduiContext_0 --[[ copy: 6 -> 24 ]];
        local l_l_XSmall_0_0 = l_XSmall_0 --[[ copy: 7 -> 25 ]];
        local v39 = v1.useCallback(function(v38) --[[ Line: 72 ]]
            -- upvalues: l_l_sduiContext_0_0 (copy), l_l_XSmall_0_0 (copy)
            return l_l_sduiContext_0_0.getPageLayoutConfig(l_l_XSmall_0_0)(v38).sideMargin;
        end, {
            l_XSmall_0, 
            l_sduiContext_0.getPageLayoutConfig
        });
        v33 = v8.useSignalState(v39);
    else
        v33 = l_usePageSideMargin_0(v26[l_OmniFeedProps_0.key].verticalScrollingFrameRef.current);
    end;
    local l_v33_0 = v33;
    local v41 = nil;
    local v42 = nil;
    if v25 then
        local v43, v44 = v1.useState(nil);
        v41 = v43;
        v42 = v44;
    else
        v41 = v27 and v27.current and v27.current.AbsoluteSize or nil;
    end;
    local v45 = nil;
    v45 = if v28 then if v41 and v41.X > 0 then v41.X else 0 else if v41 and v41.X > 0 then v41.X - 2 * l_v33_0 else 0;
    local v46 = Vector2.new(v45, v32.Y);
    local v47 = nil;
    if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then
        v47 = v26[l_OmniFeedProps_0.key].feedItemPosition;
    end;
    local v48 = l_Analytics_0({
        infoForAllEvents = {
            userSearchSessionId = v26.searchUuid, 
            sortPosition = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v47 else nil, 
            sortId = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v26.topicId else nil, 
            pageContext = if l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then v26[l_OmniFeedProps_0.key].appPage else nil
        }
    });
    local v49 = v32.X >= l_BreakpointConfig_0.getMinWidthFor(v3.Keys.Large);
    local v50 = v32.X < l_BreakpointConfig_0.getMinWidthFor(v3.Keys.Small);
    local v51 = (not not v49 or v50) and 1 or v26.topicLayoutData.numOfRows;
    if v51 < 0 then
        v51 = nil;
    end;
    local v52, v53 = v1.useState(1);
    local function v55(v54) --[[ Line: 122 ]]
        -- upvalues: v53 (copy)
        v53(v54);
    end;
    if not l_FFlagLuaAppSearchPeopleUnifiedSchemaFields_0 then
        v47 = v26[l_OmniFeedProps_0.key].feedItemPosition;
    end;
    local v56 = if v30 and v30.entries then #v30.entries else 0;
    local v57 = if v56 and v52 and v52 > 0 then math.ceil(v56 / v52) else 0;
    local v58 = if not (v51 and v51 >= 0) or v57 < v51 then v57 else v51;
    local l_feedItemStartRow_0 = v26[l_OmniFeedProps_0.key].feedItemStartRow;
    l_useUpdateFeedItemRenderedRows_0(l_AppPage_0.SearchPage, v26.searchUuid, v47, v58);
    local v61 = v1.useCallback(function(v60) --[[ Line: 148 ]]
        -- upvalues: l_fireImpressionEvent_0 (ref), v30 (copy), l_feedItemStartRow_0 (copy), v52 (copy), v48 (copy)
        l_fireImpressionEvent_0({
            impressions = v60, 
            entries = v30 and v30.entries or nil, 
            startRowNumber = l_feedItemStartRow_0, 
            itemsPerRow = v52
        }, v48.fireAnalyticsEvent);
    end, {
        v30, 
        l_feedItemStartRow_0, 
        v52, 
        v48.fireAnalyticsEvent
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ref = v27, 
        [v1.Change.AbsoluteSize] = v25 and function(v62) --[[ Line: 170 ]]
            -- upvalues: v42 (ref)
            v42(v62.AbsoluteSize);
        end or nil
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 16)
        }), 
        UIPadding = if not v28 then v1.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_v33_0), 
            PaddingRight = UDim.new(0, l_v33_0)
        }) else nil, 
        Header = if v26.topicLayoutData and v26.topicLayoutData.showHeader then v1.createElement(l_SearchSelectionTypeHeader_0, {
            LayoutOrder = 1, 
            selectionType = l_SearchTypes_0.Players
        }) else nil, 
        HydrationWrapper = v1.createElement(v20, {
            LayoutOrder = 2, 
            horizontalAlignment = Enum.HorizontalAlignment.Left, 
            windowSize = v46, 
            numberOfRowsToShow = v51, 
            shouldUseCompactTiles = true, 
            searchParameters = {
                searchKeyword = v30.keyword
            }, 
            entries = v30.entries, 
            Analytics = v48, 
            impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS", 
            subpage = "UserSearchFeedItem", 
            onItemsPerRowChanged = v55, 
            startRowNumber = l_feedItemStartRow_0, 
            itemsPerRow = v52
        }), 
        ScreenSizeImpressionsDetector = v1.createElement(l_ScreenSizeImpressionsTracker_0, {
            parentRef = v27, 
            pageContext = l_AppPage_0.SearchPage, 
            impressionsTag = "USERSEARCH_FEEDITEM_IMPRESSIONS", 
            sendImpressions = v61, 
            scrollViewPositionChangedSignal = v26[l_OmniFeedProps_0.key].scrollViewPositionChangedSignal
        })
    });
end;