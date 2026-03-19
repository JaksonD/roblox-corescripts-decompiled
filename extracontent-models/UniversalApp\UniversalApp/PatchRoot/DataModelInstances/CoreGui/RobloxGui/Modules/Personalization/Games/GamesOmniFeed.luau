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
local l_Games_0 = l_AppPage_0.Games;
local v44 = l_FFlagLuaAppFixChartsRenderOnFail_0 and function(v41) --[[ Line: 56 ]]
    -- upvalues: v29 (copy), v2 (copy), l_EmptyState_0 (copy)
    local v42 = v29({
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    });
    local v43 = v2.useCallback(function() --[[ Line: 61 ]]
        -- upvalues: v41 (copy)
        v41.fetchGamesPageData();
    end, {
        v41.fetchGamesPageData
    });
    return v2.createElement(l_EmptyState_0, {
        onActivated = v43, 
        text = v42.failedMessage
    });
end or nil;
return function(v45) --[[ Line: 79 ]]
    -- upvalues: l_FFlagAppIaScrollAway_0 (copy), l_useRoactService_0 (copy), l_AppSessionService_0 (copy), l_RoactNetworking_0 (copy), l_RoactAnalytics_0 (copy), l_AppEventIngestService_0 (copy), l_useNavigation_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), v2 (copy), l_useSelector_0 (copy), l_Games_0 (copy), l_useDispatch_0 (copy), v12 (copy), l_FetchGamesPageData_0 (copy), l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), l_RetrievalStatus_1 (copy), v30 (copy), v31 (copy), l_feedScroll_0 (copy), v11 (copy), v33 (copy), l_IXPService_0 (copy), l_AppUserLayers_0 (copy), l_useCollectionLayoutConfig_0 (copy), v22 (copy), v28 (copy), l_SessionType_0 (copy), l_DiscoverPageSession_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy), v32 (copy), l_FFlagLuaAppChartsStickyHeader_0 (copy), l_FFlagLuaAppFixChartsRenderOnFail_0 (copy), v44 (copy), v29 (copy), l_EmptyState_0 (copy)
    local v46 = if l_FFlagAppIaScrollAway_0 then v45.canvasTopPadding else nil;
    local v47 = l_useRoactService_0(l_AppSessionService_0);
    local v48 = l_useRoactService_0(l_RoactNetworking_0);
    local v49 = l_useRoactService_0(l_RoactAnalytics_0);
    local v50 = l_useRoactService_0(l_AppEventIngestService_0);
    local v51 = l_useNavigation_0();
    local v52 = if not l_FFlagLuaAppLayoutParamsInContext_0 then v2.useRef(nil) else nil;
    local v53 = nil;
    local v54 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v55, v56 = v2.useState(nil);
        v53 = v55;
        v54 = v56;
    end;
    local v58 = l_useSelector_0(function(v57) --[[ Line: 92 ]]
        return v57.Startup.GamesPageDataStatus;
    end);
    local v60 = l_useSelector_0(function(v59) --[[ Line: 95 ]]
        -- upvalues: l_Games_0 (ref)
        return v59.Personalization.OrderedOmniItems[l_Games_0];
    end);
    local v61 = l_useDispatch_0();
    local v63 = l_useSelector_0(function(v62) --[[ Line: 99 ]]
        return v62.ScreenSize;
    end);
    local v65 = l_useSelector_0(function(v64) --[[ Line: 103 ]]
        return v64.Personalization.DiscoveryNextPageId;
    end);
    local v66 = v2.useRef(nil);
    local v68 = v2.useCallback(function(v67) --[[ Line: 108 ]]
        -- upvalues: v66 (copy), v12 (ref), v61 (copy), l_FetchGamesPageData_0 (ref), v48 (copy), v49 (copy)
        if v67 and v66.current == v67 then
            return v12.reject("Already fetching");
        else
            v66.current = v67;
            return (v61(l_FetchGamesPageData_0(v48, v49, v67)));
        end;
    end, {
        v61, 
        v48, 
        v49
    });
    local function v69() --[[ Line: 121 ]]
        -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v58 (copy), l_RetrievalStatus_1 (ref), v65 (copy), v68 (copy), v12 (ref)
        if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v58.status else v58) ~= l_RetrievalStatus_1.Fetching and v65 and v65 ~= "" then
            return v68(v65);
        else
            return v12.reject("Cannot load page");
        end;
    end;
    local function v71(v70) --[[ Line: 138 ]]
        -- upvalues: v61 (copy), v30 (ref), l_Games_0 (ref)
        v61(v30(v70, l_Games_0));
    end;
    local v72 = v2.useCallback(function() --[[ Line: 141 ]]
        -- upvalues: v61 (copy), v31 (ref), v68 (copy)
        v61(v31());
        return v68();
    end, {
        v61, 
        v68
    });
    local function v79(v73, v74, v75) --[[ Line: 146 ]]
        -- upvalues: l_FFlagLuaAppLayoutParamsInContext_0 (ref), v53 (ref), v52 (copy), v63 (copy), l_feedScroll_0 (ref), v50 (copy), l_Games_0 (ref)
        local l_Y_0 = Enum.ScrollingDirection.Y;
        if l_Y_0 then
            local v77 = nil;
            if l_FFlagLuaAppLayoutParamsInContext_0 then
                v77 = v53 and v53.AbsoluteSize.Y or 0;
            else
                v77 = 0;
                if v52.current then
                    v77 = v52.current.AbsoluteSize.Y;
                end;
            end;
            local v78 = {
                distance = v73, 
                screenSizeX = v63.X, 
                screenSizeY = v63.Y, 
                scrollAreaSize = v77, 
                scrollDepth = if v77 > 0 then v73 / v77 else nil, 
                startDepth = if v77 > 0 then v75 / v77 else nil, 
                startPos = v75, 
                scrollDuration = v74
            };
            l_feedScroll_0(v50, l_Games_0, l_Y_0, v78);
        end;
    end;
    local v80 = v60 and v60.allItems or {};
    local v81 = v60 and v60.hasLocalItems or false;
    v2.useEffect(function() --[[ Line: 178 ]]
        -- upvalues: v81 (copy), v61 (copy), v30 (ref), l_Games_0 (ref)
        if not v81 then
            v61(v30({}, l_Games_0));
        end;
    end, {
        v81, 
        v71
    });
    local v82 = nil;
    local v83 = nil;
    if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then
        local l_status_0 = v58.status;
        v82 = if not (not (not (l_status_0 ~= l_RetrievalStatus_1.Fetching) or l_status_0 == l_RetrievalStatus_1.Failed) or v58.isRefreshFetch) and v80 and #v80 > 0 then l_RetrievalStatus_1.Done else l_status_0;
    else
        local v85, v86 = v2.useState(v58);
        v82 = v85;
        v83 = v86;
    end;
    v2.useEffect(function() --[[ Line: 198 ]]
        -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v58 (copy), l_RetrievalStatus_1 (ref), v68 (copy), v51 (copy), v11 (ref), v82 (ref), v83 (ref)
        if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v58.status else v58) == l_RetrievalStatus_1.NotStarted then
            v68();
        end;
        local v87 = v51.addListener(v11.Events.WillFocus, function() --[[ Line: 209 ]]
            -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (ref), v58 (ref), l_RetrievalStatus_1 (ref), v68 (ref)
            if (if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v58.status else v58) == l_RetrievalStatus_1.NotStarted then
                v68();
            end;
        end);
        if not l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 and v82 ~= l_RetrievalStatus_1.Done then
            v83(v58);
        end;
        return function() --[[ Line: 225 ]]
            -- upvalues: v87 (copy)
            if v87 ~= nil then
                v87.remove();
            end;
        end;
    end, {
        v51, 
        v58, 
        if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then nil else v82
    });
    if v33 then
        v2.useEffect(function() --[[ Line: 237 ]]
            -- upvalues: l_IXPService_0 (ref), l_AppUserLayers_0 (ref)
            l_IXPService_0:LogUserLayerExposure(l_AppUserLayers_0.DiscoverPageLayer);
        end, {});
    end;
    local v88 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v53) else nil;
    local v89 = v22.useSduiContextFromRoduxAndProcessConfigs(l_Games_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v88 else nil);
    return v2.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0
    }, {
        PageSessionManager = v2.createElement(v28, {
            appPage = l_Games_0, 
            setPageSession = function() --[[ Line: 257 ]] --[[ Name: setPageSession ]]
                -- upvalues: v47 (copy), l_SessionType_0 (ref), l_DiscoverPageSession_0 (ref)
                if v47 ~= nil then
                    v47:SetSession(l_SessionType_0.StructuralIdentifier.Level1, l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo, l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo);
                    v47:SetMetadata(l_SessionType_0.StructuralIdentifier.DiscoverPageSessionInfo, l_SessionType_0.Metadata.DiscoverPage.DiscoverSessionId, l_DiscoverPageSession_0:Get());
                end;
            end
        }), 
        LoadingStateContainer = v2.createElement(l_LoadingStateContainer_0, {
            dataStatus = l_RetrievalStatus_0.fromRawValue(v82), 
            onRetry = v68, 
            renderOnLoaded = function() --[[ Line: 276 ]] --[[ Name: renderOnLoaded ]]
                -- upvalues: v2 (ref), v32 (ref), l_Games_0 (ref), v72 (copy), v80 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v54 (ref), v52 (copy), v65 (copy), v69 (copy), v79 (copy), l_FFlagAppIaScrollAway_0 (ref), v46 (copy), v89 (copy), l_FFlagLuaAppChartsStickyHeader_0 (ref), v45 (copy)
                return v2.createElement(v32, {
                    pageContext = l_Games_0, 
                    refresh = v72, 
                    omniFeedItems = v80, 
                    impressionsTag = "GAMESFEEDITEM_IMPRESSIONS", 
                    scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v54 else v52, 
                    analyticsContext = "GamesOmniFeed", 
                    hasNextPage = v65 and v65 ~= "", 
                    loadNext = v69 or nil, 
                    sendScrollEvent = v79, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v46 else nil, 
                    sduiContext = v89, 
                    topPadding = if l_FFlagLuaAppChartsStickyHeader_0 then v45.topPadding else nil
                });
            end, 
            renderOnFailed = l_FFlagLuaAppFixChartsRenderOnFail_0 and function() --[[ Line: 295 ]]
                -- upvalues: v2 (ref), v44 (ref), v68 (copy)
                return v2.createElement(v44, {
                    fetchGamesPageData = v68
                });
            end or function() --[[ Line: 300 ]]
                -- upvalues: v29 (ref), v2 (ref), l_EmptyState_0 (ref), v68 (copy)
                return function(_) --[[ Line: 301 ]]
                    -- upvalues: v29 (ref), v2 (ref), l_EmptyState_0 (ref), v68 (ref)
                    local v91 = v29({
                        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
                    });
                    return v2.createElement(l_EmptyState_0, {
                        onActivated = v68, 
                        text = v91.failedMessage
                    });
                end;
            end
        })
    });
end;