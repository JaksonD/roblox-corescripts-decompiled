local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_GameSortGroups_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes).GameSortGroups;
local v4 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol);
local l_NavigateBack_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateBack;
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_TopicContentsReducer_0 = require(l_CorePackages_0.Workspace.Packages.TopicContentsRodux).TopicContentsReducer;
local l_RefreshExpiringSortTokens_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Thunks.Games.RefreshExpiringSortTokens;
local v9 = require(l_CorePackages_0.Workspace.Packages.FetchStatusRodux);
local l_FetchStatusReducer_0 = v9.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v9.FetchStatusNamespace;
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local l_useTokens_0 = require(l_CorePackages_0.Packages.Foundation).Hooks.useTokens;
local v14 = require(l_CorePackages_0.Packages.UIBlox);
local l_LoadingStateContainer_0 = v14.App.Container.LoadingStateContainer;
local l_RetrievalStatus_1 = v14.App.Loading.Enum.RetrievalStatus;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v18 = require(l_Modules_0.LuaApp.Components.Games.GamesList);
local l_sortDeeplinkFailureCounter_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryAnalytics).Events.sortDeeplinkFailureCounter;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useNavigationProps_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppNavigation).useNavigationProps;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local v24 = game:DefineFastFlag("LuaAppDeeplinkGamesListWrapperFixBackgroundColor", false);
local v25 = game:DefineFastInt("LuaAppSortDeeplinkFetchingTimeoutInSec", 10);
local v26 = {
    InvalidSort = "InvalidSort", 
    SortTokenFetchFailed = "SortTokenFetchFailed", 
    SortTokenFetchTimeout = "SortTokenFetchTimeout"
};
local function _(v27, v28) --[[ Line: 53 ]] --[[ Name: getSortIndex ]]
    if not v28 then
        return nil;
    else
        for v29, v30 in v28 do
            if tostring(v30.topicId) == v27 then
                return v29;
            end;
        end;
        return nil;
    end;
end;
return function() --[[ Line: 68 ]] --[[ Name: DeeplinkGamesListWrapper ]]
    -- upvalues: l_useNavigationProps_0 (copy), l_useDispatch_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useTokens_0 (copy), l_useSelector_0 (copy), l_TopicContentsReducer_0 (copy), l_AppPage_0 (copy), l_FetchStatusNamespace_0 (copy), l_GameSortGroups_0 (copy), l_FetchStatusReducer_0 (copy), l_RetrievalStatus_0 (copy), v1 (copy), l_RefreshExpiringSortTokens_0 (copy), v4 (copy), l_sortDeeplinkFailureCounter_0 (copy), v26 (copy), l_NavigateBack_0 (copy), v25 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_1 (copy), v18 (copy), v24 (copy)
    local v34 = l_useNavigationProps_0(function(_, v33) --[[ Line: 69 ]]
        return {
            isOmni = v33.isOmni, 
            sortName = v33.sortName
        };
    end);
    local v35 = l_useDispatch_0();
    local v36 = l_useRoactService_0(l_RoactNetworking_0);
    local v37 = l_useTokens_0();
    local v39 = l_useSelector_0(function(v38) --[[ Line: 80 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref)
        return v38.Personalization[l_TopicContentsReducer_0.key];
    end);
    local v41 = l_useSelector_0(function(v40) --[[ Line: 84 ]]
        -- upvalues: v34 (copy), l_AppPage_0 (ref)
        if v34.isOmni then
            return v40.OmniRecommendations and v40.OmniRecommendations[l_AppPage_0.Home] and v40.OmniRecommendations[l_AppPage_0.Home].sorts;
        else
            return nil;
        end;
    end);
    local v45 = l_useSelector_0(function(v42) --[[ Line: 94 ]]
        -- upvalues: l_TopicContentsReducer_0 (ref), v34 (copy), l_FetchStatusNamespace_0 (ref), l_AppPage_0 (ref), l_GameSortGroups_0 (ref), l_FetchStatusReducer_0 (ref), l_RetrievalStatus_0 (ref)
        if not v42.Personalization[l_TopicContentsReducer_0.key][v34.sortName] then
            local v43 = nil;
            local v44 = nil;
            if v34.isOmni then
                v43 = l_FetchStatusNamespace_0.OmniRecommendations;
                v44 = l_AppPage_0.Home;
            else
                v43 = l_FetchStatusNamespace_0.GameSortToken;
                v44 = l_GameSortGroups_0.GamesList;
            end;
            return v42.Personalization[l_FetchStatusReducer_0.key][v43][v44];
        else
            return l_RetrievalStatus_0.Done;
        end;
    end);
    local v46 = v1.useRef(nil);
    local v47 = v1.useCallback(function() --[[ Line: 115 ]]
        -- upvalues: v46 (copy)
        if v46.current then
            task.cancel(v46.current);
            v46.current = nil;
        end;
    end, {});
    v1.useEffect(function() --[[ Line: 123 ]]
        -- upvalues: v45 (copy), l_RetrievalStatus_0 (ref), v34 (copy), v35 (copy), l_RefreshExpiringSortTokens_0 (ref), v36 (copy), l_GameSortGroups_0 (ref), v47 (copy), v39 (copy), v4 (ref), l_sortDeeplinkFailureCounter_0 (ref), v26 (ref), l_NavigateBack_0 (ref)
        if v45 == l_RetrievalStatus_0.NotStarted then
            if not v34.isOmni then
                v35(l_RefreshExpiringSortTokens_0(v36, {
                    l_GameSortGroups_0.GamesList
                }));
                return;
            end;
        elseif v45 == l_RetrievalStatus_0.Done then
            v47();
            if not v39[v34.sortName] then
                v4.default:logRobloxTelemetryCounter(l_sortDeeplinkFailureCounter_0, 1, {
                    reason = v26.InvalidSort, 
                    sortName = v34.sortName, 
                    isOmni = v34.isOmni
                });
                v35(l_NavigateBack_0());
                return;
            end;
        elseif v45 == l_RetrievalStatus_0.Failed then
            v47();
            v4.default:logRobloxTelemetryCounter(l_sortDeeplinkFailureCounter_0, 1, {
                reason = v26.SortTokenFetchFailed, 
                sortName = v34.sortName, 
                isOmni = v34.isOmni
            });
            v35(l_NavigateBack_0());
        end;
    end, {
        v34.sortName, 
        v34.isOmni, 
        v45, 
        v39, 
        v35, 
        v36, 
        v47
    });
    v1.useEffect(function() --[[ Line: 164 ]]
        -- upvalues: v25 (ref), v46 (copy), v4 (ref), l_sortDeeplinkFailureCounter_0 (ref), v26 (ref), v34 (copy), v35 (copy), l_NavigateBack_0 (ref), v47 (copy)
        local l_v25_0 = v25;
        if l_v25_0 >= 0 then
            v46.current = task.delay(l_v25_0, function() --[[ Line: 168 ]]
                -- upvalues: v4 (ref), l_sortDeeplinkFailureCounter_0 (ref), v26 (ref), v34 (ref), v35 (ref), l_NavigateBack_0 (ref)
                v4.default:logRobloxTelemetryCounter(l_sortDeeplinkFailureCounter_0, 1, {
                    reason = v26.SortTokenFetchTimeout, 
                    sortName = v34.sortName, 
                    isOmni = v34.isOmni
                });
                v35(l_NavigateBack_0());
            end);
        end;
        return function() --[[ Line: 179 ]]
            -- upvalues: v47 (ref)
            v47();
        end;
    end, {
        v34.sortName, 
        v34.isOmni, 
        v35, 
        v47
    });
    local v53 = v1.useMemo(function() --[[ Line: 184 ]]
        -- upvalues: v34 (copy), v41 (copy)
        local l_sortName_0 = v34.sortName;
        local l_v41_0 = v41;
        if not l_v41_0 then
            return nil;
        else
            for v51, v52 in l_v41_0 do
                if tostring(v52.topicId) == l_sortName_0 then
                    return v51;
                end;
            end;
            return nil;
        end;
    end, {
        v34.sortName, 
        v41
    });
    local v54 = v1.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_1.fromRawValue(v45), 
        renderOnLoaded = function() --[[ Line: 190 ]] --[[ Name: renderOnLoaded ]]
            -- upvalues: v1 (ref), v18 (ref), v34 (copy), v53 (copy)
            return v1.createElement(v18, {
                pageContext = "Deeplink", 
                initialSortName = v34.sortName, 
                initialSortIndex = v53, 
                isOmni = v34.isOmni
            });
        end
    });
    local v55 = if v24 then v37.Color.Surface.Surface_0 else nil;
    if v24 then
        return (v1.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v55.Color3, 
            BackgroundTransparency = v55.Transparency, 
            BorderSizePixel = 0
        }, {
            GamesList = v54
        }));
    else
        return v54;
    end;
end;