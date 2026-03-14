local l_CorePackages_0 = game:GetService("CorePackages");
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.Promise);
local v5 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local l_useDispatch_0 = v5.Hooks.RoactRodux.useDispatch;
local l_useSelector_0 = v5.Hooks.RoactRodux.useSelector;
local v8 = require(l_CorePackages_0.Packages.UIBlox);
local l_RetrievalStatus_0 = v8.App.Loading.Enum.RetrievalStatus;
local l_LoadingStateContainer_0 = v8.App.Container.LoadingStateContainer;
local l_EmptyState_0 = v8.App.Indicator.EmptyState;
local l_Images_0 = v8.App.ImageSet.Images;
local v13 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi);
local l_useCollectionLayoutConfig_0 = require(l_CorePackages_0.Workspace.Packages.CollectionViews).useCollectionLayoutConfig;
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useDesignTokens_0 = require(l_CorePackages_0.Workspace.Packages.Style).useDesignTokens;
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_RemoveSduiRootConfig_0 = require(l_CorePackages_0.Workspace.Packages.ServerDrivenUi).RemoveSduiRootConfig;
local l_RemoveTextSearchResults_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Actions.RemoveTextSearchResults;
local l_getTopSearchResultsFetchName_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils).getTopSearchResultsFetchName;
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v23 = require(l_Modules_0.Personalization.OmniFeed.FeedViews.OmniFeedViewLoadMore);
local v24 = require(l_Modules_0.LuaApp.Thunks.Search.ApiFetchTopSearchResults.ApiFetchTopSearchResults);
local v25 = require(l_Modules_0.LuaApp.Actions.RemoveSearchInGames);
local v26 = require(l_CorePackages_0.Workspace.Packages.SharedFlags);
local l_FFlagAppIaScrollAway_0 = v26.FFlagAppIaScrollAway;
local l_FFlagLuaAppLayoutParamsInContext_0 = v26.FFlagLuaAppLayoutParamsInContext;
local l_SearchPage_0 = l_AppPage_0.SearchPage;
local v30 = l_Images_0["icons/status/oof_xlarge"];
return function(v31) --[[ Line: 62 ]] --[[ Name: TopResultsSearchPage ]]
    -- upvalues: l_useLocalization_0 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), v3 (copy), v24 (copy), v4 (copy), l_RemoveSduiRootConfig_0 (copy), l_SearchPage_0 (copy), v25 (copy), l_RemoveTextSearchResults_0 (copy), l_useSelector_0 (copy), l_PerformFetch_0 (copy), l_getTopSearchResultsFetchName_0 (copy), l_RetrievalStatus_0 (copy), l_useDesignTokens_0 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (copy), l_useCollectionLayoutConfig_0 (copy), v13 (copy), l_LoadingStateContainer_0 (copy), l_EmptyState_0 (copy), v23 (copy), l_FFlagAppIaScrollAway_0 (copy), v30 (copy)
    local v32 = l_useLocalization_0({
        requestFailed = "Feature.Toast.NetworkingError.SomethingIsWrong", 
        noResultsFound = "CommonUI.Controls.NoResultsFound"
    });
    local v33 = l_useRoactService_0(l_RoactNetworking_0);
    local v34 = l_useDispatch_0();
    local v35 = v3.useCallback(function() --[[ Line: 71 ]]
        -- upvalues: v34 (copy), v24 (ref), v33 (copy), v31 (copy), v4 (ref)
        return v34(v24(v33, {
            keyword = v31.searchParameters.searchKeyword, 
            searchUuid = v31.searchUuid, 
            omniSearchUuid = v31.omniSearchUuid, 
            searchVertical = "blended"
        })):catch(function() --[[ Line: 77 ]]
            -- upvalues: v4 (ref)
            return v4.resolve();
        end);
    end, {
        v31.searchParameters.searchKeyword, 
        v31.searchUuid, 
        v31.omniSearchUuid
    });
    v3.useEffect(function() --[[ Line: 86 ]]
        -- upvalues: v35 (copy)
        v35();
    end, {
        v35
    });
    v3.useEffect(function() --[[ Line: 90 ]]
        -- upvalues: v34 (copy), l_RemoveSduiRootConfig_0 (ref), l_SearchPage_0 (ref), v31 (copy), v25 (ref), l_RemoveTextSearchResults_0 (ref)
        return function() --[[ Line: 91 ]]
            -- upvalues: v34 (ref), l_RemoveSduiRootConfig_0 (ref), l_SearchPage_0 (ref), v31 (ref), v25 (ref), l_RemoveTextSearchResults_0 (ref)
            v34(l_RemoveSduiRootConfig_0((("%*_%*"):format(l_SearchPage_0, v31.searchUuid))));
            v34(v25(v31.searchUuid));
            v34(l_RemoveTextSearchResults_0(v31.searchUuid));
        end;
    end, {
        v31.searchUuid, 
        v34
    });
    local v38 = l_useSelector_0(function(v36) --[[ Line: 98 ]]
        -- upvalues: l_PerformFetch_0 (ref), l_getTopSearchResultsFetchName_0 (ref), v31 (copy), l_RetrievalStatus_0 (ref)
        local v37 = l_PerformFetch_0.GetStatus(v36, l_getTopSearchResultsFetchName_0("blended", v31.searchUuid));
        return l_RetrievalStatus_0.fromRawValue(v37);
    end);
    local v39 = v38 == l_RetrievalStatus_0.Done;
    local v40, v41 = v3.useState(v39);
    v3.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v40 (copy), v39 (copy), v41 (copy)
        if not v40 and v39 then
            v41(true);
        end;
    end, {
        v40, 
        v39
    });
    local v44 = l_useSelector_0(function(v42) --[[ Line: 113 ]]
        -- upvalues: l_SearchPage_0 (ref), v31 (copy)
        local v43 = v42.Personalization.OrderedOmniItems[l_SearchPage_0] and v42.Personalization.OrderedOmniItems[l_SearchPage_0][v31.searchUuid] or nil;
        return v43 and v43.allItems or {};
    end);
    local l_Size_300_0 = l_useDesignTokens_0().Global.Size_300;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    if l_FFlagLuaAppLayoutParamsInContext_0 then
        local v49, v50 = v3.useState(nil);
        v46 = v49;
        v47 = v50;
    else
        v48 = v3.useRef(nil);
    end;
    local v51 = if l_FFlagLuaAppLayoutParamsInContext_0 then l_useCollectionLayoutConfig_0(v46) else nil;
    local v52 = v13.useSduiContextFromRoduxAndProcessConfigs(l_SearchPage_0, if l_FFlagLuaAppLayoutParamsInContext_0 then v51 else nil, (("%*_%*"):format(l_SearchPage_0, v31.searchUuid)));
    return v3.createElement(l_LoadingStateContainer_0, {
        dataStatus = if v40 then l_RetrievalStatus_0.Done else v38, 
        renderOnFailed = function() --[[ Line: 141 ]] --[[ Name: renderOnFailed ]]
            -- upvalues: v3 (ref), l_EmptyState_0 (ref), v35 (copy), v32 (copy)
            return v3.createElement(l_EmptyState_0, {
                onActivated = v35, 
                text = v32.requestFailed
            });
        end, 
        renderOnLoaded = function() --[[ Line: 147 ]] --[[ Name: renderOnLoaded ]]
            -- upvalues: v44 (copy), v3 (ref), v23 (ref), l_Size_300_0 (copy), l_SearchPage_0 (ref), v35 (copy), v31 (copy), l_FFlagLuaAppLayoutParamsInContext_0 (ref), v47 (ref), v48 (ref), l_FFlagAppIaScrollAway_0 (ref), v52 (copy), l_EmptyState_0 (ref), v30 (ref), v32 (copy)
            if v44 and #v44 > 0 then
                return (v3.createElement(v23, {
                    topPadding = l_Size_300_0, 
                    pageContext = l_SearchPage_0, 
                    refresh = v35, 
                    omniFeedItems = v44, 
                    createEndOfScrollElement = true, 
                    onScrollDirectionChanged = v31.onScrollDirectionChanged, 
                    impressionsTag = "TOPSEARCHRESULTS_FEEDITEM_IMPRESSIONS", 
                    analyticsContext = "TOPSEARCH_OMNIFEED", 
                    scrollingFrameRef = if l_FFlagLuaAppLayoutParamsInContext_0 then v47 else v48, 
                    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v31.canvasTopPadding else nil, 
                    sduiContext = v52
                }));
            else
                return (v3.createElement(l_EmptyState_0, {
                    icon = v30, 
                    text = v32.noResultsFound
                }));
            end;
        end
    });
end;