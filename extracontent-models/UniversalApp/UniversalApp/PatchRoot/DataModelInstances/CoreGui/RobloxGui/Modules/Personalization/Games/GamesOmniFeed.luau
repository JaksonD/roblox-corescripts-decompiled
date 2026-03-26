local l_IXPService_0 = game:GetService("IXPService");
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.Navigation).useNavigation;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local v7 = require(l_CorePackages_0.Packages.UIBlox);
local l_LoadingStateContainer_0 = v7.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v7.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v7.App.Indicator.EmptyState;
local v11 = require(l_CorePackages_0.Packages.RoactNavigation);
local v12 = require(l_CorePackages_0.Packages.Promise);
local l_feedScroll_0 = require(l_CorePackages_0.Workspace.Packages.ScrollTelemetry).feedScroll;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_AppUserLayers_0 = require(l_CorePackages_0.Workspace.Packages.ExperimentLayers).AppUserLayers;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_RoactAnalytics_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactAnalytics;
local l_AppEventIngestService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppEventIngestService;
local l_RetrievalStatus_1 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v22 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_useCollectionLayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionLayoutConfig;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_DiscoverPageSession_0 = l_Modules_0.Personalization.Sessions.DiscoverPageSession;
local l_FetchGamesPageData_0 = l_Modules_0.LuaApp.Thunks.FetchGamesPageData;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v28 = require(l_Modules_1.Personalization.Sessions.PageSessionManager);
local v29 = require(l_Modules_1.LuaApp.Hooks.useLocalization);
local v30 = require(l_Modules_1.Personalization.OmniFeed.DataStore.AddLocalOmniItems);
local v31 = require(l_Modules_1.LuaApp.Actions.RefreshSiteAlertInfo);
local v32 = require(l_Modules_1.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v33 = game:DefineFastFlag("LuaAppLogDiscoverPageLayerExposure", false);
local v34 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v34.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v34.FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppChartsStickyHeader_0 = v34.FFlagLuaAppChartsStickyHeader;
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = v34.FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
local l_FFlagLuaAppFixChartsRenderOnFail_0 = v34.FFlagLuaAppFixChartsRenderOnFail;
local l_FFlagLuaAppCompositionCharts_0 = v34.FFlagLuaAppCompositionCharts;
local l_Games_0 = l_AppPage_0.Games;
local v45 = l_FFlagLuaAppFixChartsRenderOnFail_0 and function(v42) --[[ Line: 57 ]]
    -- upvalues: v29 (copy), v2 (copy), l_EmptyState_0 (copy)
    local v43 = v29({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    });
    local v44 = v2.useCallback(function() --[[ Line: 62 ]]
        -- upvalues: v42 (copy)
        v42.fetchGamesPageData();
    end, {
        v42.fetchGamesPageData
    });
    return v2.createElement(l_EmptyState_0, {
        onActivated = v44, 
        text = v43.failedMessage
    });
end or nil;
return function(v46) --[[ Line: 80 ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_useNavigation_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v2 (copy), l_useSelector_0 (copy), l_Games_0 (copy), l_useDispatch_0 (copy), v12 (copy), l_FetchGamesPageData_0 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), l_RetrievalStatus_1 (copy), v30 (copy), v31 (copy), l_feedScroll_0 (copy), v11 (copy), v33 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_useCollectionLayoutConfig_0 (copy), v22 (copy), v28 (copy), l_SessionType_0 (copy), l_DiscoverPageSession_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), v32 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), l_FFlagLuaAppCompositionCharts_0 (copy), l_FFlagLuaAppFixChartsRenderOnFail_0 (copy), v45 (copy), v29 (copy), l_EmptyState_0 (copy)
    local v47 = if l_FFlagAppIaScrollAway_0 then v46.canvasTopPadding else nil;
    local v48 = l_useRoactService_0(l_AppSessionService_0);
    local v49 = l_useRoactService_0(l_RoactNetworking_0);
    local v50 = l_useRoactService_0(l_RoactAnalytics_0);
    local v51 = l_useRoactService_0(l_AppEventIngestService_0);
    local v52 = l_useNavigation_0();
    local v53 = if not l_FFlagLuaAppLayoutParamsInContext_0 then v2.useRef(nil) else nil;
    local v54 = nil;
    local v55 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v56, v57 = v2.useState(nil);
        v54 = v56;
        v55 = v57;
    end;
    local v59 = l_useSelector_0(function(v58) --[[ Line: 93 ]]
        return v58.Startup.GamesPageDataStatus;
    end);
    local v61 = l_useSelector_0(function(v60) --[[ Line: 96 ]]
        -- upvalues: l_Games_0 (ref)
        return v60.Personalization.OrderedOmniItems[l_Games_0];
    end);
    local v62 = l_useDispatch_0();
    local v64 = l_useSelector_0(function(v63) --[[ Line: 100 ]]
        return v63.ScreenSize;
    end);
    local v66 = l_useSelector_0(function(v65) --[[ Line: 104 ]]
        return v65.Personalization.DiscoveryNextPageId;
    end);
    local v67 = v2.useRef(nil);
    local v69 = v2.useCallback(function(v68) --[[ Line: 109 ]]
        -- upvalues: v67 (copy), v12 (ref), v62 (copy), l_FetchGamesPageData_0 (ref), v49 (copy), v50 (copy)
        if v68 and v67.current == v68 then
            return v12.reject("Already fetching");
        else
            v67.current = v68;
            return (v62(l_FetchGamesPageData_0(v49, v50, v68)));
        end;
    end, {
        v62, 
        v49, 
        v50
    });
    local function v70() --[[ Line: 122 ]]
        -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v59 (copy), l_RetrievalStatus_1 (ref), v66 (copy), v69 (copy), v12 (ref)
        if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v59.status else v59) ~= l_RetrievalStatus_1.Fetching and v66 and v66 ~= "" then
            return v69(v66);
        else
            return v12.reject("Cannot load page");
        end;
    end;
    local function v72(v71) --[[ Line: 139 ]]
        -- upvalues: v62 (copy), v30 (ref), l_Games_0 (ref)
        v62(v30(v71, l_Games_0));
    end;
    local v73 = v2.useCallback(function() --[[ Line: 142 ]]
        -- upvalues: v62 (copy), v31 (ref), v69 (copy)
        v62(v31());
        return v69();
    end, {
        v62, 
        v69
    });
    local function v80(v74, v75, v76) --[[ Line: 147 ]]
        -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (ref), v54 (ref), v53 (copy), v64 (copy), l_feedScroll_0 (ref), v51 (copy), l_Games_0 (ref)
        local l_Y_0 = Enum.ScrollingDirection.Y;
        if l_Y_0 then
            local v78 = nil;
            if l_FFlagLuaAppLayoutParamsInContext_0 then
                v78 = v54 and v54.AbsoluteSize.Y or 0;
            else
                v78 = 0;
                if v53.current then
                    v78 = v53.current.AbsoluteSize.Y;
                end;
            end;
            local v79 = {
                distance = v74, 
                screenSizeX = v64.X, 
                screenSizeY = v64.Y, 
                scrollAreaSize = v78, 
                scrollDepth = if v78 > 0 then v74 / v78 else nil, 
                startDepth = if v78 > 0 then v76 / v78 else nil, 
                startPos = v76, 
                scrollDuration = v75
            };
            l_feedScroll_0(v51, l_Games_0, l_Y_0, v79);
        end;
    end;
    local v81 = v61 and v61.allItems or {};
    local v82 = v61 and v61.hasLocalItems or false;
    v2.useEffect(function() --[[ Line: 179 ]]
        -- upvalues: v82 (copy), v62 (copy), v30 (ref), l_Games_0 (ref)
        if not v82 then
            v62(v30({}, l_Games_0));
        end;
    end, {
        v82, 
        v72
    });
    local v83 = nil;
    local v84 = nil;
    if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then
        local l_status_0 = v59.status;
        v83 = if not (not (not (l_status_0 ~= l_RetrievalStatus_1.Fetching) or l_status_0 == l_RetrievalStatus_1.Failed) or v59.isRefreshFetch) and v81 and #v81 > 0 then l_RetrievalStatus_1.Done else l_status_0;
    else
        local v86, v87 = v2.useState(v59);
        v83 = v86;
        v84 = v87;
    end;
    v2.useEffect(function() --[[ Line: 199 ]]
        -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v59 (copy), l_RetrievalStatus_1 (ref), v69 (copy), v52 (copy), v11 (ref), v83 (ref), v84 (ref)
        if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v59.status else v59) == l_RetrievalStatus_1.NotStarted then
            v69();
        end;
        local v88 = v52.addListener(v11.Events.WillFocus, function() --[[ Line: 210 ]]
            -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v59 (ref), l_RetrievalStatus_1 (ref), v69 (ref)
            if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v59.status else v59) == l_RetrievalStatus_1.NotStarted then
                v69();
            end;
        end);
        if not l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 and v83 ~= l_RetrievalStatus_1.Done then
            v84(v59);
        end;
        return function() --[[ Line: 226 ]]
            -- upvalues: v88 (copy)
            if v88 ~= nil then
                v88.remove();
            end;
        end;
    end, {
        v52, 
        v59, 
        if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then nil else v83
    });
    if v33 then
        v2.useEffect(function() --[[ Line: 238 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.DiscoverPageLayer);
        end, {});
    end;
    local v89 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v54) else nil;
    local v90 = v22.useSduiContextFromRoduxAndProcessConfigs(l_Games_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v89 else nil);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PageSessionManager = v2.createElement(v28, {
            appPage = l_Games_0, 
            setPageSession = function() --[[ Line: 258 ]] --[[ Name: setPageSession ]]
                -- upvalues: v48 (copy), l_SessionType_0 (ref), l_DiscoverPageSession_0 (ref)
                if v48 ~= nil then
                    v48:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo, l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo);
                    v48:SetMetadata(l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo, l_SessionType_0.Metadata.DiscoverPage.DiscoverSessionId, l_DiscoverPageSession_0:Get());
                end;
            end
        }), 
        LoadingStateContainer = v2.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v83), 
            onRetry = v69, 
            renderOnLoaded = function() --[[ Line: 277 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v2 (ref), v32 (ref), l_Games_0 (ref), v73 (copy), v81 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v55 (ref), v53 (copy), v66 (copy), v70 (copy), v80 (copy), l_FFlagAppIaScrollAway_0 (ref), v47 (copy), v90 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v46 (copy), l_FFlagLuaAppCompositionCharts_0 (ref)
                return v2.createElement(v32, {
                    pageContext = l_Games_0, 
                    refresh = v73, 
                    omniFeedItems = v81, 
                    impressionsTag = "GAMESFEEDITEM_IMPRESSIONS", 
                    scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v55 else v53, 
                    analyticsContext = "GamesOmniFeed", 
                    hasNextPage = v66 and v66 ~= "", 
                    loadNext = v70 or nil, 
                    sendScrollEvent = v80, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v47 else nil, 
                    sduiContext = v90, 
                    topPadding = if l_FFlagLuaAppChartsStickyHeader_0 then v46.topPadding else nil, 
                    appCompositionEnabled = l_FFlagLuaAppCompositionCharts_0 and true or nil
                });
            end, 
            renderOnFailed = l_FFlagLuaAppFixChartsRenderOnFail_0 and function() --[[ Line: 297 ]]
                -- upvalues: v2 (ref), v45 (ref), v69 (copy)
                return v2.createElement(v45, {
                    fetchGamesPageData = v69
                });
            end or function() --[[ Line: 302 ]]
                -- upvalues: v29 (ref), v2 (ref), l_EmptyState_0 (ref), v69 (copy)
                return function(_) --[[ Line: 303 ]]
                    -- upvalues: v29 (ref), v2 (ref), l_EmptyState_0 (ref), v69 (ref)
                    local v92 = v29({
                        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
                    });
                    return v2.createElement(l_EmptyState_0, {
                        onActivated = v69, 
                        text = v92.failedMessage
                    });
                end;
            end
        })
    });
end;