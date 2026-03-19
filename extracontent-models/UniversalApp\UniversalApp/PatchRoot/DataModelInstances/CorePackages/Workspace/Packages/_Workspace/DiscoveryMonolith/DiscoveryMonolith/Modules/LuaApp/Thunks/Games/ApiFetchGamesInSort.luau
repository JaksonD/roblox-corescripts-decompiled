local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Promise);
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local v4 = require(l_Parent_0.DiscoveryTypes);
local l_GameSortGroups_0 = v4.GameSortGroups;
local v6 = require(l_Parent_0.FetchStatusRodux);
local l_FetchStatusReducer_0 = v6.FetchStatusReducer;
local l_FetchStatusNamespace_0 = v6.FetchStatusNamespace;
local l_SetFetchStatus_0 = v6.SetFetchStatus;
local l_GameFiltersReducer_0 = require(l_Parent_0.GameFilters).DataStore.GameFiltersReducer;
local l_getSelectedGameFilterOptions_0 = require(l_Parent_0.GameFilters).DataStore.getSelectedGameFilterOptions;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v13 = require(l_Modules_0.LuaApp.Http.Requests.ExploreApi.ExploreGetSortContents);
local v14 = require(script.Parent.updateGamesSortData);
local v15 = require(l_Modules_0.Personalization.Sessions.DiscoverPageSession);
local function v18(v16, v17) --[[ Line: 21 ]]
    -- upvalues: l_SetFetchStatus_0 (copy), l_FetchStatusNamespace_0 (copy)
    return l_SetFetchStatus_0(l_FetchStatusNamespace_0.GameSorts, v16, v17);
end;
return function(v19, v20, v21, v22) --[[ Line: 25 ]]
    -- upvalues: v2 (copy), v4 (copy), l_FetchStatusReducer_0 (copy), l_FetchStatusNamespace_0 (copy), l_RetrievalStatus_0 (copy), v15 (copy), l_GameFiltersReducer_0 (copy), l_GameSortGroups_0 (copy), l_getSelectedGameFilterOptions_0 (copy), v18 (copy), v13 (copy), v14 (copy)
    return function(v23) --[[ Line: 26 ]]
        -- upvalues: v20 (copy), v2 (ref), v4 (ref), l_FetchStatusReducer_0 (ref), l_FetchStatusNamespace_0 (ref), l_RetrievalStatus_0 (ref), v22 (copy), v15 (ref), l_GameFiltersReducer_0 (ref), l_GameSortGroups_0 (ref), l_getSelectedGameFilterOptions_0 (ref), v18 (ref), v13 (ref), v19 (copy), v14 (ref), v21 (copy)
        if v20 == nil or v20.name == nil then
            return v2.resolve("Invalid sort request");
        else
            assert(v20, "sort should always exist; assert for linter");
            if v20.dataSource ~= v4.DataSourceType.ExploreApi then
                return v2.resolve((("Could not fetch games for %*; expected an ExploreApi sort but the sort is from %*"):format(v20.name, v20.dataSource)));
            elseif v23:getState().Personalization[l_FetchStatusReducer_0.key][l_FetchStatusNamespace_0.GameSorts][v20.name] == l_RetrievalStatus_0.Fetching then
                return v2.resolve("Request for sort " .. v20.name .. " has been debounced");
            else
                local v24 = v22 or {};
                v24.sortId = v20.name;
                v24.sessionId = v15:Get();
                local v25 = v23:getState().Personalization[l_GameFiltersReducer_0.key][l_GameSortGroups_0.Games];
                local l_l_getSelectedGameFilterOptions_0_0 = l_getSelectedGameFilterOptions_0;
                local v27 = if v25 then v25.allFilters else {};
                for v28, v29 in (l_l_getSelectedGameFilterOptions_0_0(v27)) do
                    if v24[v28] then
                        warn((("URL parameter %* already exists"):format(v28)));
                    else
                        v24[v28] = v29;
                    end;
                end;
                v23:dispatch(v18(v20.name, l_RetrievalStatus_0.Fetching));
                return v13(v19, v24):andThen(function(v30) --[[ Line: 64 ]]
                    -- upvalues: v14 (ref), v19 (ref), v23 (copy), v21 (ref), v18 (ref), v20 (ref), l_RetrievalStatus_0 (ref)
                    v14(v19, v23, v30.responseBody, v21);
                    v23:dispatch(v18(v20.name, l_RetrievalStatus_0.Done));
                end, function(v31) --[[ Line: 68 ]]
                    -- upvalues: v23 (copy), v18 (ref), v20 (ref), l_RetrievalStatus_0 (ref), v2 (ref)
                    v23:dispatch(v18(v20.name, l_RetrievalStatus_0.Failed));
                    return v2.reject(v31);
                end);
            end;
        end;
    end;
end;