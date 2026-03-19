local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppChartsResetFetchingStatusOnFilterChange;
return l_makeActionCreator_0(script.Name, function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 (copy)
    assert(type(v3) == "string", string.format("SetGamesPageDataStatus action expects status to be a string, was %s", (type(v3))));
    return {
        status = v3, 
        isRefreshFetch = if l_FFlagLuaAppChartsResetFetchingStatusOnFilterChange_0 then v4 else nil
    };
end);