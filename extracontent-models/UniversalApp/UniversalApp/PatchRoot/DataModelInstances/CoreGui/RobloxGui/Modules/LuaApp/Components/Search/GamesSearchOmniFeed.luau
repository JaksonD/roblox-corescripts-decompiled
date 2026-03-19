local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local _ = require(l_CorePackages_0.Workspace.Packages.AppCommonLib);
local l_feedScroll_0 = require(l_CorePackages_0.Workspace.Packages.ScrollTelemetry).feedScroll;
local l_mutedError_0 = require(l_CorePackages_0.Workspace.Packages.Loggers).mutedError;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_Context_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics).Constants.Context;
local v13 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_useCollectionLayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionLayoutConfig;
local l_OmniFeedTypes_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).OmniFeedTypes;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_FetchDataWithErrorToasts_0 = l_Modules_0.LuaApp.Thunks.FetchDataWithErrorToasts;
local l_SearchRetrievalStatus_0 = l_Modules_0.LuaApp.Enum.SearchRetrievalStatus;
local l_ApiFetchGameSearchResults_0 = l_Modules_0.LuaApp.Thunks.Search.ApiFetchGameSearchResults;
local l_PaginationMethod_0 = l_Modules_0.LuaApp.Enum.PaginationMethod;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v22 = require(l_Modules_1.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v23 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v23.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v23.FFlagLuaAppLayoutParamsInContext;
return function(v26) --[[ Line: 48 ]]
    -- upvalues: l_AppPage_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v1 (copy), l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_AppEventIngestService_0 (copy), l_useSelector_0 (copy), l_useDispatch_0 (copy), l_FetchDataWithErrorToasts_0 (copy), l_ApiFetchGameSearchResults_0 (copy), l_mutedError_0 (copy), l_feedScroll_0 (copy), l_PaginationMethod_0 (copy), l_useCollectionLayoutConfig_0 (copy), v13 (copy), v22 (copy), l_Context_0 (copy), l_SearchRetrievalStatus_0 (copy), l_OmniFeedTypes_0 (copy), l_FFlagAppIaScrollAway_0 (copy)
    local l_SearchPage_0 = l_AppPage_0.SearchPage;
    local v28 = if not l_FFlagLuaAppLayoutParamsInContext_0 then v1.useRef(nil) else nil;
    local v29 = nil;
    local v30 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v31, v32 = v1.useState(nil);
        v29 = v31;
        v30 = v32;
    end;
    local v33 = l_useLocalization_0({
        loadMoreButtonText = "Search.GlobalSearch.Action.LoadMore"
    });
    local l_searchUuid_0 = v26.searchUuid;
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    local v36 = l_useRoactService_0(l_AppEventIngestService_0);
    local v38 = l_useSelector_0(function(v37) --[[ Line: 63 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v37.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v40 = l_useSelector_0(function(v39) --[[ Line: 66 ]]
        -- upvalues: l_searchUuid_0 (copy)
        if l_searchUuid_0 and v39.SearchesParameters[l_searchUuid_0] then
            return v39.SearchesParameters[l_searchUuid_0].searchKeyword;
        else
            return nil;
        end;
    end);
    local v42 = l_useSelector_0(function(v41) --[[ Line: 72 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v41.RequestsStatus.SearchesInGamesStatus[l_searchUuid_0];
    end);
    local v44 = l_useSelector_0(function(v43) --[[ Line: 75 ]]
        -- upvalues: l_SearchPage_0 (copy), l_searchUuid_0 (copy)
        return v43.Personalization.OrderedOmniItems[l_SearchPage_0] and v43.Personalization.OrderedOmniItems[l_SearchPage_0][l_searchUuid_0] or nil;
    end);
    local v45 = v44 and v44.allItems or {};
    local v47 = l_useSelector_0(function(v46) --[[ Line: 81 ]]
        return v46.ScreenSize;
    end);
    local v48 = l_useDispatch_0();
    local function v49() --[[ Line: 86 ]]
        -- upvalues: v48 (copy), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchGameSearchResults_0 (ref), v35 (copy), v40 (copy), v26 (copy)
        return v48(l_FetchDataWithErrorToasts_0(l_ApiFetchGameSearchResults_0(v35, {
            searchKeyword = v40, 
            searchUuid = v26.searchUuid, 
            omniSearchUuid = v26.omniSearchUuid, 
            isAppend = true
        })));
    end;
    local v50 = v1.useCallback(function() --[[ Line: 94 ]]
        -- upvalues: v48 (copy), l_FetchDataWithErrorToasts_0 (ref), l_ApiFetchGameSearchResults_0 (ref), v35 (copy), v40 (copy), l_searchUuid_0 (copy), v26 (copy)
        return v48(l_FetchDataWithErrorToasts_0(l_ApiFetchGameSearchResults_0(v35, {
            searchKeyword = v40, 
            searchUuid = l_searchUuid_0, 
            omniSearchUuid = v26.omniSearchUuid, 
            isAppend = false
        })));
    end, {
        v48, 
        v35, 
        v40, 
        l_searchUuid_0, 
        v26.omniSearchUuid
    });
    local function v58(v51, v52, v53) --[[ Line: 103 ]]
        -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (ref), v29 (ref), v28 (copy), l_mutedError_0 (ref), v47 (copy), l_feedScroll_0 (ref), v36 (copy), l_SearchPage_0 (copy)
        local v54 = if l_FFlagLuaAppLayoutParamsInContext_0 then v29 else v28.current;
        local v55 = if v54 then v54.ScrollingDirection else nil;
        if v55 then
            local v56 = 0;
            if v54 then
                if v55 == Enum.ScrollingDirection.X then
                    v56 = v54.AbsoluteSize.X;
                elseif v55 == Enum.ScrollingDirection.Y then
                    v56 = v54.AbsoluteSize.Y;
                else
                    l_mutedError_0((("Direction %* is an unsupported option for feedScroll event"):format(v55.Name)));
                end;
            end;
            local v57 = {
                distance = v51, 
                screenSizeX = v47.X, 
                screenSizeY = v47.Y, 
                scrollAreaSize = v56, 
                scrollDepth = if v56 > 0 then v51 / v56 else nil, 
                startDepth = if v56 > 0 then v53 / v56 else nil, 
                startPos = v53, 
                scrollDuration = v52
            };
            l_feedScroll_0(v36, l_SearchPage_0, v55, v57);
        end;
    end;
    local v59 = false;
    if v26.paginationMethod == l_PaginationMethod_0.Button then
        v59 = v38.hasMoreRows;
    end;
    local v60 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v29) else nil;
    local v61 = v13.useSduiContextFromRoduxAndProcessConfigs(l_SearchPage_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v60 else nil, (("%*_%*"):format(l_SearchPage_0, l_searchUuid_0)));
    return v1.createElement(v22, {
        pageContext = l_SearchPage_0, 
        refresh = v50, 
        omniFeedItems = v45, 
        impressionsTag = "SEARCHRESULTS_FEEDITEM_IMPRESSIONS", 
        scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v30 else v28, 
        analyticsContext = l_Context_0.SearchExperienceTile, 
        loadNext = v38.hasMoreRows and v42 ~= l_SearchRetrievalStatus_0.Fetching and v49 or nil, 
        createEndOfScrollElement = v26.createEndOfScrollElement, 
        onScrollDirectionChanged = v26.onScrollDirectionChanged, 
        topPadding = v45[1] and v45[1].treatmentType == l_OmniFeedTypes_0.SearchGameGrid and 26 or 0, 
        sendScrollEvent = v58, 
        hasNextPage = v59, 
        loadMoreButtonText = if v59 and v42 ~= l_SearchRetrievalStatus_0.Fetching and v49 then v33.loadMoreButtonText else nil, 
        canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v26.canvasTopPadding else nil, 
        sduiContext = v61
    });
end;