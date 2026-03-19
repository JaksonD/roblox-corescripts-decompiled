local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.UIBlox);
local l_EmptyState_0 = v1.App.Indicator.EmptyState;
local l_LoadingStateContainer_0 = v1.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v1.App.Loading.Enum.RetrievalStatus;
local v5 = require(l_CorePackages_0.Packages.t);
local l_RoactNetworking_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).RoactNetworking;
local v7 = require(l_CorePackages_0.Packages.React);
local l_useLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).Hooks.useLocalization;
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_usePrevious_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.usePrevious;
local l_useScreenSize_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useScreenSize;
local l_useRoactService_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppHooks).useRoactService;
local v14 = require(l_CorePackages_0.Workspace.Packages.DiscoveryUtils);
local l_validateProps_0 = v14.validateProps;
local v16 = require(l_CorePackages_0.Workspace.Packages.DiscoveryTypes);
local l_AppPage_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).AppPage;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SetSearchInGamesStatus_0 = l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus;
local l_SearchRetrievalStatus_0 = l_Modules_0.LuaApp.Enum.SearchRetrievalStatus;
local l_ApiFetchGameSearchResults_0 = l_Modules_0.LuaApp.Thunks.Search.ApiFetchGameSearchResults;
local l_RemoveTextSearchResults_0 = l_Modules_0.LuaApp.Actions.RemoveTextSearchResults;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v24 = require(l_Modules_1.LuaApp.Components.Search.GamesSearchOmniFeed);
local v25 = require(l_Modules_1.LuaApp.Thunks.Search.getAutoFetchingStatus);
local v26 = require(l_Modules_1.LuaApp.Actions.RemoveSearchInGames);
local l_FFlagAppIaScrollAway_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagAppIaScrollAway;
local v28 = v5.strictInterface({
    searchUuid = v5.string, 
    omniSearchUuid = v5.optional(v5.string), 
    searchParameters = v5.table, 
    onScrollDirectionChanged = v5.optional(v5.callback), 
    isRoutedFromAutoSearch = v5.optional(v5.boolean), 
    canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v5.optional(v5.number) else nil
});
return function(v29) --[[ Line: 53 ]]
    -- upvalues: l_validateProps_0 (copy), v28 (copy), v7 (copy), l_useRoactService_0 (copy), l_RoactNetworking_0 (copy), l_useDispatch_0 (copy), l_useScreenSize_0 (copy), l_useLocalization_0 (copy), l_useSelector_0 (copy), v25 (copy), l_SearchRetrievalStatus_0 (copy), l_AppPage_0 (copy), l_ApiFetchGameSearchResults_0 (copy), v26 (copy), l_SetSearchInGamesStatus_0 (copy), l_RemoveTextSearchResults_0 (copy), l_usePrevious_0 (copy), v14 (copy), v16 (copy), l_EmptyState_0 (copy), v24 (copy), l_FFlagAppIaScrollAway_0 (copy), l_LoadingStateContainer_0 (copy), l_RetrievalStatus_0 (copy)
    l_validateProps_0(v28, v29);
    local l_searchUuid_0 = v29.searchUuid;
    local l_omniSearchUuid_0 = v29.omniSearchUuid;
    local l_searchParameters_0 = v29.searchParameters;
    local v33, v34 = v7.useState(false);
    local v35 = l_useRoactService_0(l_RoactNetworking_0);
    local v36 = l_useDispatch_0();
    local v37 = l_useScreenSize_0();
    local v38 = l_useLocalization_0({
        noResultsText = "Feature.GamePage.LabelNoSearchResults", 
        failedMessage = "Feature.EmptyStatePage.Message.NoInternet"
    });
    local v41 = l_useSelector_0(function(v39) --[[ Line: 71 ]]
        -- upvalues: v29 (copy), v25 (ref), l_searchParameters_0 (copy), l_searchUuid_0 (copy), l_SearchRetrievalStatus_0 (ref)
        local v40 = nil;
        v40 = if v29.isRoutedFromAutoSearch then v25(v39, l_searchParameters_0.searchKeyword) else v39.RequestsStatus.SearchesInGamesStatus[l_searchUuid_0] or l_SearchRetrievalStatus_0.NotStarted;
        if v40 == l_SearchRetrievalStatus_0.Removed then
            v40 = l_SearchRetrievalStatus_0.NotStarted;
        end;
        return v40;
    end);
    local v43 = l_useSelector_0(function(v42) --[[ Line: 87 ]]
        -- upvalues: l_searchUuid_0 (copy)
        return v42.Search.SearchesInGames[l_searchUuid_0];
    end);
    local v45 = l_useSelector_0(function(v44) --[[ Line: 91 ]]
        -- upvalues: l_AppPage_0 (ref), l_searchUuid_0 (copy)
        return v44.Personalization.OrderedOmniItems[l_AppPage_0.SearchPage] and v44.Personalization.OrderedOmniItems[l_AppPage_0.SearchPage][l_searchUuid_0] and v44.Personalization.OrderedOmniItems[l_AppPage_0.SearchPage][l_searchUuid_0].allItems or nil;
    end);
    local v46 = v43 and v43.paginationMethod;
    local v48 = v7.useCallback(function() --[[ Line: 101 ]]
        -- upvalues: v29 (copy), v41 (copy), l_SearchRetrievalStatus_0 (ref), v34 (copy), v36 (copy), l_ApiFetchGameSearchResults_0 (ref), v35 (copy), l_searchParameters_0 (copy), l_searchUuid_0 (copy), l_omniSearchUuid_0 (copy)
        if v29.isRoutedFromAutoSearch then
            if v41 == l_SearchRetrievalStatus_0.Done then
                v34(true);
            end;
            return;
        else
            v36(l_ApiFetchGameSearchResults_0(v35, {
                searchKeyword = l_searchParameters_0.searchKeyword, 
                searchUuid = l_searchUuid_0, 
                omniSearchUuid = l_omniSearchUuid_0, 
                isAppend = false
            })):catch(function(v47) --[[ Line: 114 ]]
                warn((("Error fetching game search results: %*"):format(v47)));
            end);
            return;
        end;
    end, {
        v29.isRoutedFromAutoSearch, 
        v41, 
        l_searchUuid_0, 
        l_omniSearchUuid_0, 
        l_searchParameters_0.searchKeyword, 
        v35
    });
    v7.useEffect(function() --[[ Line: 128 ]]
        -- upvalues: v48 (copy)
        v48();
    end, {});
    v7.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v36 (copy), v26 (ref), l_searchUuid_0 (copy), l_SetSearchInGamesStatus_0 (ref), l_SearchRetrievalStatus_0 (ref), l_RemoveTextSearchResults_0 (ref)
        return function() --[[ Line: 133 ]]
            -- upvalues: v36 (ref), v26 (ref), l_searchUuid_0 (ref), l_SetSearchInGamesStatus_0 (ref), l_SearchRetrievalStatus_0 (ref), l_RemoveTextSearchResults_0 (ref)
            v36(v26(l_searchUuid_0));
            v36(l_SetSearchInGamesStatus_0(l_searchUuid_0, l_SearchRetrievalStatus_0.Removed));
            v36(l_RemoveTextSearchResults_0(l_searchUuid_0));
        end;
    end, {
        l_searchUuid_0
    });
    local v49 = l_usePrevious_0(v41);
    v7.useEffect(function() --[[ Line: 141 ]]
        -- upvalues: v41 (copy), v49 (copy), l_SearchRetrievalStatus_0 (ref), v34 (copy)
        if v41 ~= v49 then
            if v41 == l_SearchRetrievalStatus_0.Done then
                v34(true);
                return;
            elseif v41 == l_SearchRetrievalStatus_0.NotStarted or v41 == l_SearchRetrievalStatus_0.Failed then
                v34(false);
            end;
        end;
    end, {
        v41, 
        v49
    });
    local l_noResultsText_0 = v38.noResultsText;
    local v52 = v7.useCallback(function() --[[ Line: 156 ]]
        -- upvalues: v45 (copy), v14 (ref), v37 (copy), v7 (ref), v16 (ref), l_EmptyState_0 (ref), l_noResultsText_0 (copy), v24 (ref), l_searchUuid_0 (copy), l_omniSearchUuid_0 (copy), v43 (copy), v29 (copy), v46 (copy), l_FFlagAppIaScrollAway_0 (ref)
        if not v45 or #v45 == 0 then
            local v51 = v14.getPageSideMargin(v37.X);
            return v7.createElement("Frame", {
                BackgroundTransparency = 1, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Padding = v7.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, v16.Constants.GAME_GRID_PADDING), 
                    PaddingLeft = UDim.new(0, v51), 
                    PaddingRight = UDim.new(0, v51)
                }), 
                NoResultsView = v7.createElement(l_EmptyState_0, {
                    text = l_noResultsText_0
                })
            });
        else
            return (v7.createElement(v24, {
                searchUuid = l_searchUuid_0, 
                omniSearchUuid = l_omniSearchUuid_0, 
                createEndOfScrollElement = not v43.hasMoreRows, 
                onScrollDirectionChanged = v29.onScrollDirectionChanged, 
                paginationMethod = v46, 
                canvasTopPadding = if l_FFlagAppIaScrollAway_0 then v29.canvasTopPadding else nil
            }));
        end;
    end, {
        v43, 
        l_searchUuid_0, 
        l_omniSearchUuid_0, 
        v29.onScrollDirectionChanged, 
        v37, 
        l_noResultsText_0, 
        v46, 
        v45
    });
    local l_failedMessage_0 = v38.failedMessage;
    local v54 = v7.useCallback(function() --[[ Line: 196 ]]
        -- upvalues: v7 (ref), l_EmptyState_0 (ref), v48 (copy), l_failedMessage_0 (copy)
        return v7.createElement(l_EmptyState_0, {
            onActivated = v48, 
            text = l_failedMessage_0
        });
    end, {
        v48, 
        l_failedMessage_0
    });
    return v7.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v41), 
        renderOnLoading = v33 and v52 or nil, 
        renderOnFailed = v54, 
        renderOnLoaded = v52
    });
end;