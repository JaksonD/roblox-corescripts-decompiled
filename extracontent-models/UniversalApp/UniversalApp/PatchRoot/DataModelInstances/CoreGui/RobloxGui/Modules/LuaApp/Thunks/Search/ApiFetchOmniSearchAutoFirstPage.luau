local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Promise);
local l_PerformFetch_0 = require(l_CorePackages_0.Workspace.Packages.Http).PerformFetch;
local l_SearchTypes_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppEnums).SearchTypes;
local l_Modules_0 = require(l_CorePackages_0.Workspace.Packages.DiscoveryMonolith).Modules;
local l_SetSearchInGamesStatus_0 = l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus;
local l_SearchRetrievalStatus_0 = l_Modules_0.LuaApp.Enum.SearchRetrievalStatus;
local l_SearchGetOmniSearch_0 = l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch;
local l_HandleGameSearchResults_0 = l_Modules_0.LuaApp.Thunks.Search.HandleGameSearchResults;
local l_Modules_1 = game:GetService("CoreGui").RobloxGui.Modules;
local v10 = require(l_Modules_1.LuaApp.Actions.SetSearchType);
local v11 = require(l_Modules_1.LuaApp.Enum.OmniSearchVerticalType);
local v12 = require(l_Modules_1.LuaApp.Components.UserSearch.Thunks.HandleUserSearchResults);
local v13 = require(l_Modules_1.LuaApp.Thunks.Search.getAutoFetchName);
return function(v14, v15) --[[ Line: 27 ]]
    -- upvalues: l_PerformFetch_0 (copy), v13 (copy), l_SetSearchInGamesStatus_0 (copy), l_SearchRetrievalStatus_0 (copy), l_SearchGetOmniSearch_0 (copy), v11 (copy), l_SearchTypes_0 (copy), v10 (copy), v12 (copy), l_HandleGameSearchResults_0 (copy), v1 (copy)
    return l_PerformFetch_0.Single(v13(v15.searchKeyword), function(v16) --[[ Line: 28 ]]
        -- upvalues: v15 (copy), l_SetSearchInGamesStatus_0 (ref), l_SearchRetrievalStatus_0 (ref), l_SearchGetOmniSearch_0 (ref), v14 (copy), v11 (ref), l_SearchTypes_0 (ref), v10 (ref), v12 (ref), l_HandleGameSearchResults_0 (ref), v1 (ref)
        local v17 = {
            searchQuery = v15.searchKeyword, 
            sessionId = v15.searchUuid, 
            verticalType = "auto", 
            globalSessionId = v15.omniSearchUuid
        };
        v16:dispatch(l_SetSearchInGamesStatus_0(v15.searchUuid, l_SearchRetrievalStatus_0.Fetching));
        return l_SearchGetOmniSearch_0(v14, v17):andThen(function(v18) --[[ Line: 36 ]]
            -- upvalues: v11 (ref), l_SearchTypes_0 (ref), v16 (copy), v10 (ref), v15 (ref), l_SetSearchInGamesStatus_0 (ref), l_SearchRetrievalStatus_0 (ref), v12 (ref), v14 (ref), l_HandleGameSearchResults_0 (ref)
            local v19 = if v18.responseBody.vertical == v11.User then l_SearchTypes_0.Players else l_SearchTypes_0.Games;
            v16:dispatch(v10(v15.searchUuid, v19));
            if v19 == l_SearchTypes_0.Players then
                v16:dispatch(l_SetSearchInGamesStatus_0(v15.searchUuid, l_SearchRetrievalStatus_0.NotStarted));
                return v16:dispatch(v12(v14, v15, v18));
            else
                return v16:dispatch(l_HandleGameSearchResults_0(v14, v15, v18));
            end;
        end, function(v20) --[[ Line: 50 ]]
            -- upvalues: v16 (copy), l_SetSearchInGamesStatus_0 (ref), v15 (ref), l_SearchRetrievalStatus_0 (ref), v1 (ref)
            v16:dispatch(l_SetSearchInGamesStatus_0(v15.searchUuid, l_SearchRetrievalStatus_0.Failed));
            return v1.reject(v20);
        end);
    end);
end;