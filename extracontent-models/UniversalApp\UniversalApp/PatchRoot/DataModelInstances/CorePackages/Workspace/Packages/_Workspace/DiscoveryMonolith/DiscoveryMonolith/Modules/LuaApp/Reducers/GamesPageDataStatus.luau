local l_script_FirstAncestor_0 = script:FindFirstAncestor("DiscoveryMonolith");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_RetrievalStatus_0 = require(l_Parent_0.Http).Enum.RetrievalStatus;
local l_Modules_0 = l_script_FirstAncestor_0.Modules;
local v4 = require(l_Modules_0.LuaApp.Actions.SetGamesPageDataStatus);
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
return function(v6, v7) --[[ Line: 11 ]]
    -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy), l_RetrievalStatus_0 (copy), v4 (copy)
    v6 = v6 or if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then {
        status = l_RetrievalStatus_0.NotStarted, 
        isRefreshFetch = false
    } else l_RetrievalStatus_0.NotStarted;
    if v7.type == v4.name then
        if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then
            return {
                status = v7.status, 
                isRefreshFetch = v7.isRefreshFetch or false
            };
        else
            v6 = v7.status;
        end;
    end;
    return v6;
end;