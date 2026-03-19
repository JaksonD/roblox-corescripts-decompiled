local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_ReportToDiagByCountryCode_0 = require(l_Parent_0.Analytics).ReportToDiagByCountryCode;
local v3 = require(l_Parent_0.Promise);
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v5 = require(l_Modules_0.LuaApp.Actions.SetSearchInGamesStatus);
local v6 = require(l_Modules_0.LuaApp.Enum.SearchRetrievalStatus);
local v7 = require(l_Modules_0.LuaApp.Http.Requests.SearchGetOmniSearch);
local v8 = require(l_Modules_0.LuaApp.Thunks.Search.HandleGameSearchResults);
local v9 = tonumber(settings():GetFVariable("PercentReportingGamesListRTT"));
return function(v10, v11) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy), v7 (copy), v8 (copy), l_ReportToDiagByCountryCode_0 (copy), v9 (copy)
    return function(v12) --[[ Line: 16 ]]
        -- upvalues: v11 (copy), v3 (ref), v6 (ref), v5 (ref), v7 (ref), v10 (copy), v8 (ref), l_ReportToDiagByCountryCode_0 (ref), v9 (ref)
        local l_searchKeyword_0 = v11.searchKeyword;
        local l_searchUuid_0 = v11.searchUuid;
        if not l_searchUuid_0 then
            return v3.reject("Must have a searchUuid.");
        elseif not l_searchKeyword_0 then
            return v3.reject("Must have a searchKeyword to search with.");
        elseif v12:getState().RequestsStatus.SearchesInGamesStatus[l_searchUuid_0] == v6.Fetching then
            return v3.resolve("Search with Uuid " .. l_searchUuid_0 .. " has been debounced");
        else
            local v15 = {
                SearchQuery = l_searchKeyword_0, 
                SessionId = l_searchUuid_0, 
                PageType = "all", 
                GlobalSessionId = v11.omniSearchUuid
            };
            if v11.isAppend then
                local v16 = v12:getState().Search.SearchesInGames[l_searchUuid_0];
                assert(v16, "Should always have SearchesInGames for searchUuid");
                v15.PageToken = v16.nextPageToken;
            end;
            v12:dispatch(v5(l_searchUuid_0, v6.Fetching));
            return v7(v10, v15):andThen(function(v17) --[[ Line: 49 ]]
                -- upvalues: v12 (copy), v8 (ref), v10 (ref), v11 (ref), l_ReportToDiagByCountryCode_0 (ref), v9 (ref)
                local v18 = v12:dispatch(v8(v10, v11, v17));
                l_ReportToDiagByCountryCode_0("GamesList", "RoundTripTime", v17.responseTimeMs, v9);
                return v18;
            end, function(v19) --[[ Line: 54 ]]
                -- upvalues: v12 (copy), v5 (ref), l_searchUuid_0 (copy), v6 (ref), v3 (ref)
                v12:dispatch(v5(l_searchUuid_0, v6.Failed));
                return v3.reject(v19);
            end);
        end;
    end;
end;