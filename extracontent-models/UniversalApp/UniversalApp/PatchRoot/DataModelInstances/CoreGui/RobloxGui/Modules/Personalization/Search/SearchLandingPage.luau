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
local l_FFlagLuaAppLayoutParamsInContext_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppLayoutParamsInContext;
local l_FFlagLuaAppResetSlpSessionId_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppResetSlpSessionId;
local l_SearchLandingPage_0 = l_AppPage_0.SearchLandingPage;
SearchLandingPage = function(v32) --[[ Line: 59 ]] --[[ Name: SearchLandingPage ]]
    -- upvalues: l_useDispatch_0 (copy), l_useDesignTokens_0 (copy), l_useCurrentSquadId_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_FFlagLuaAppResetSlpSessionId_0 (copy), l_AppSessionService_0 (copy), l_SearchConstants_0 (copy), v9 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useSelector_0 (copy), l_SearchLandingPage_0 (copy), v27 (copy), l_ApiFetchSearchLandingPage_0 (copy), l_SearchLandingPageSession_0 (copy), l_SearchLandingPageSurface_0 (copy), l_useCollectionLayoutConfig_0 (copy), v12 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v28 (copy), l_Focusable_0 (copy), v26 (copy), l_AppPage_0 (copy), v11 (copy)
    local v33 = l_useDispatch_0();
    local v34 = l_useDesignTokens_0();
    local v35 = l_useCurrentSquadId_0();
    local v36 = l_useRoactService_0(l_RoactNetworking_0);
    local v37 = if l_FFlagLuaAppResetSlpSessionId_0 then l_useRoactService_0(l_AppSessionService_0) else nil;
    local v38 = l_SearchConstants_0.getSearchTokens(v34);
    local v39 = v32.scrollingFrameRef or v9.useRef(nil);
    local v40 = nil;
    local v41 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v42 = nil;
        local v43, v44 = v9.useState(nil);
        v40 = v43;
        v42 = v44;
        do
            local l_v42_0 = v42;
            v41 = v9.useCallback(function(v46) --[[ Line: 73 ]]
                -- upvalues: v39 (copy), l_v42_0 (ref)
                v39.current = v46;
                l_v42_0(v46);
            end, {});
        end;
    end;
    local v48 = l_useSelector_0(function(v47) --[[ Line: 80 ]]
        -- upvalues: l_SearchLandingPage_0 (ref)
        return v47.Personalization.OrderedOmniItems[l_SearchLandingPage_0] or nil;
    end);
    local v49 = v48 and v48.allItems or {};
    local v50 = v9.useCallback(function() --[[ Line: 87 ]]
        -- upvalues: l_FFlagLuaAppResetSlpSessionId_0 (ref), v27 (ref), v37 (copy), v35 (copy), v33 (copy), l_ApiFetchSearchLandingPage_0 (ref), v36 (copy), l_SearchLandingPageSession_0 (ref), l_SearchLandingPageSurface_0 (ref)
        if l_FFlagLuaAppResetSlpSessionId_0 then
            v27(v37, true);
        end;
        if v35 ~= "" and v35 ~= nil then
            return v33(l_ApiFetchSearchLandingPage_0(v36, l_SearchLandingPageSession_0:Get(), l_SearchLandingPageSurface_0.Party));
        else
            return v33(l_ApiFetchSearchLandingPage_0(v36, l_SearchLandingPageSession_0:Get()));
        end;
    end, {
        v33, 
        v36, 
        l_SearchLandingPageSession_0, 
        v35, 
        if l_FFlagLuaAppResetSlpSessionId_0 then v37 else nil
    });
    local l_onAbsoluteContentSizeChanged_0 = v32.onAbsoluteContentSizeChanged;
    local v52 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v40) else nil;
    local v53 = v12.useSduiContextFromRoduxAndProcessConfigs(l_SearchLandingPage_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v52 else nil);
    local v55 = l_useSelector_0(function(v54) --[[ Line: 120 ]]
        -- upvalues: l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_SearchLandingPageSession_0 (ref), l_RetrievalStatus_0 (ref)
        return v54.Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.SearchLandingPage][l_SearchLandingPageSession_0:Get()] or l_RetrievalStatus_0.NotStarted;
    end);
    if v9.useMemo(function() --[[ Line: 125 ]]
        -- upvalues: v49 (copy), l_RetrievalStatus_0 (ref), v55 (copy)
        if next(v49) ~= nil then
            return l_RetrievalStatus_0.Done;
        else
            return v55;
        end;
    end, {
        v55, 
        v49
    }) ~= l_RetrievalStatus_0.Done then
        return v9.createElement(v28, {
            Size = v32.size, 
            LayoutOrder = v32.layoutOrder, 
            onAbsoluteContentSizeChanged = l_onAbsoluteContentSizeChanged_0, 
            topPadding = v38.searchLandingPage.topPadding, 
            bottomPadding = v38.searchLandingPage.bottomPadding, 
            isCompactView = v32.isCompactView, 
            defaultContainerSize = v32.defaultContainerSize
        });
    else
        return v9.createElement(l_Focusable_0.Frame, {
            LayoutOrder = v32.layoutOrder, 
            Size = v32.size or UDim2.new(1, 0, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = v32.position or UDim2.new(0.5, 0, 0, 0), 
            BackgroundColor3 = v38.backgroundContainer.backgroundColor3, 
            BackgroundTransparency = v38.backgroundContainer.backgroundTransparency, 
            BorderSizePixel = 0, 
            ClipsDescendants = true
        }, {
            SearchOmniAutocompleteFeedView = v9.createElement(v26, {
                pageContext = l_AppPage_0.SearchLandingPage, 
                refresh = v50, 
                omniFeedItems = v49, 
                impressionsTag = "SEARCHLANDINGPAGE_FEEDITEM_IMPRESSIONS", 
                scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v41 else v39, 
                analyticsContext = v11.Constants.Context.ExperienceTile, 
                createEndOfScrollElement = false, 
                topPadding = v38.searchLandingPage.topPadding, 
                bottomPadding = v38.searchLandingPage.bottomPadding, 
                onAbsoluteContentSizeChanged = l_onAbsoluteContentSizeChanged_0, 
                sduiContext = v53, 
                scrollBarThickness = 0, 
                defaultContainerSize = v32.defaultContainerSize
            })
        });
    end;
end;
return SearchLandingPage;