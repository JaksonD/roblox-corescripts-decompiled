local l_CorePackages_0 = game:GetService("CorePackages");
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local v5 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks);
local v6 = require(l_CorePackages_0.Workspace.Packages.SquadsCore);
local l_useRoactService_0 = v5.useRoactService;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v9 = require(l_CorePackages_0.Packages.React);
local l_Focusable_0 = require(l_CorePackages_0.Packages.RoactGamepad).Focusable;
local v11 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics);
local v12 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_useCollectionLayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionLayoutConfig;
local v14 = require(l_CorePackages_0.Workspace.Packages.FetchStatusRodux);
local l_FetchStatusReducer_0 = v14.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v14.FetchStatusNamespace;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_useCurrentSquadId_0 = v6.Hooks.useCurrentSquadId;
local l_SearchLandingPageSurface_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).SearchLandingPageSurface;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SearchConstants_0 = l_Modules_0.Personalization.Search.SearchConstants;
local l_SearchLandingPageSession_0 = l_Modules_0.Personalization.Sessions.SearchLandingPageSession;
local l_ApiFetchSearchLandingPage_0 = l_Modules_0.LuaApp.Thunks.Search.ApiFetchSearchLandingPage;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v26 = require(l_Modules_1.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v27 = require(l_Modules_1.Personalization.Sessions.setSearchLandingPageSessionInfo);
local v28 = require(script.Parent.SearchLandingPageSkeleton);
local l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage;
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppResetSlpSessionId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppResetSlpSessionId;
local l_SearchLandingPage_0 = l_AppPage_0.SearchLandingPage;
SearchLandingPage = function(v33) --[[ Line: 62 ]] --[[ Name: SearchLandingPage ]]
    -- upvalues: l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (copy), l_useCurrentSquadId_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_FFlagLuaAppResetSlpSessionId_0 (copy), l_AppSessionService_0 (copy), l_SearchConstants_0 (copy), v9 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useSelector_0 (copy), l_SearchLandingPage_0 (copy), v27 (copy), l_ApiFetchSearchLandingPage_0 (copy), l_SearchLandingPageSession_0 (copy), l_SearchLandingPageSurface_0 (copy), l_useCollectionLayoutConfig_0 (copy), v12 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v28 (copy), l_Focusable_0 (copy), v26 (copy), l_AppPage_0 (copy), v11 (copy)
    local v34 = l_useDispatch_0();
    local v35 = l_useDesignTokens_0();
    local v36 = nil;
    if l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 then
        v36 = l_useCurrentSquadId_0();
    end;
    local v37 = l_useRoactService_0(l_RoactNetworking_0);
    local v38 = if l_FFlagLuaAppResetSlpSessionId_0 then l_useRoactService_0(l_AppSessionService_0) else nil;
    local v39 = l_SearchConstants_0.getSearchTokens(v35);
    local v40 = v33.scrollingFrameRef or v9.useRef(nil);
    local v41 = nil;
    local v42 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v43 = nil;
        local v44, v45 = v9.useState(nil);
        v41 = v44;
        v43 = v45;
        do
            local l_v43_0 = v43;
            v42 = v9.useCallback(function(v47) --[[ Line: 79 ]]
                -- upvalues: v40 (copy), l_v43_0 (ref)
                v40.current = v47;
                l_v43_0(v47);
            end, {});
        end;
    end;
    local v49 = l_useSelector_0(function(v48) --[[ Line: 86 ]]
        -- upvalues: l_SearchLandingPage_0 (ref)
        return v48.Personalization.OrderedOmniItems[l_SearchLandingPage_0] or nil;
    end);
    local v50 = v49 and v49.allItems or {};
    local v51 = v9.useCallback(function() --[[ Line: 93 ]]
        -- upvalues: l_FFlagLuaAppResetSlpSessionId_0 (ref), v27 (ref), v38 (copy), l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 (ref), v36 (ref), v34 (copy), l_ApiFetchSearchLandingPage_0 (ref), v37 (copy), l_SearchLandingPageSession_0 (ref), l_SearchLandingPageSurface_0 (ref)
        if l_FFlagLuaAppResetSlpSessionId_0 then
            v27(v38, true);
        end;
        if l_FFlagLuaAppEnablePartySurfaceForFetchSearchLandingPage_0 and v36 ~= "" and v36 ~= nil then
            return v34(l_ApiFetchSearchLandingPage_0(v37, l_SearchLandingPageSession_0:Get(), l_SearchLandingPageSurface_0.Party));
        else
            return v34(l_ApiFetchSearchLandingPage_0(v37, l_SearchLandingPageSession_0:Get()));
        end;
    end, {
        v34, 
        v37, 
        l_SearchLandingPageSession_0, 
        v36, 
        if l_FFlagLuaAppResetSlpSessionId_0 then v38 else nil
    });
    local l_onAbsoluteContentSizeChanged_0 = v33.onAbsoluteContentSizeChanged;
    local v53 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v41) else nil;
    local v54 = v12.useSduiContextFromRoduxAndProcessConfigs(l_SearchLandingPage_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v53 else nil);
    local v56 = l_useSelector_0(function(v55) --[[ Line: 130 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_SearchLandingPageSession_0 (ref), l_RetrievalStatus_0 (ref)
        return v55.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.SearchLandingPage][l_SearchLandingPageSession_0:Get()] or l_RetrievalStatus_0.NotStarted;
    end);
    if v9.useMemo(function() --[[ Line: 135 ]]
        -- upvalues: v50 (copy), l_RetrievalStatus_0 (ref), v56 (copy)
        if next(v50) ~= nil then
            return l_RetrievalStatus_0.Done;
        else
            return v56;
        end;
    end, {
        v56, 
        v50
    }) ~= l_RetrievalStatus_0.Done then
        return v9.createElement(v28, {
            Size = v33.size, 
            LayoutOrder = v33.layoutOrder, 
            onAbsoluteContentSizeChanged = l_onAbsoluteContentSizeChanged_0, 
            topPadding = v39.searchLandingPage.topPadding, 
            bottomPadding = v39.searchLandingPage.bottomPadding, 
            isCompactView = v33.isCompactView, 
            defaultContainerSize = v33.defaultContainerSize
        });
    else
        return v9.createElement(l_Focusable_0.Frame, {
            LayoutOrder = v33.layoutOrder, 
            Size = v33.size or UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = v33.position or UDim2.new(0.5, 0, 0, 0), 
            BackgroundColor3 = v39.backgroundContainer.backgroundColor3, 
            BackgroundTransparency = v39.backgroundContainer.backgroundTransparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            SearchOmniAutocompleteFeedView = v9.createElement(v26, {
                pageContext = l_AppPage_0.SearchLandingPage, 
                refresh = v51, 
                omniFeedItems = v50, 
                impressionsTag = "SEARCHLANDINGPAGE_FEEDITEM_IMPRESSIONS", 
                scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v42 else v40, 
                analyticsContext = v11.Constants.Context.ExperienceTile, 
                createEndOfScrollElement = false, 
                topPadding = v39.searchLandingPage.topPadding, 
                bottomPadding = v39.searchLandingPage.bottomPadding, 
                onAbsoluteContentSizeChanged = l_onAbsoluteContentSizeChanged_0, 
                sduiContext = v54, 
                scrollBarThickness = 0, 
                defaultContainerSize = v33.defaultContainerSize
            })
        });
    end;
end;
return SearchLandingPage;