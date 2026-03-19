local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local l_EventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).EventTypes;
return function(v4, v5) --[[ Line: 16 ]] --[[ Name: createDiagMetricString ]]
    -- upvalues: l_EventTypes_0 (copy), v2 (copy)
    local v6 = v4 or l_EventTypes_0.LoadingTime;
    local v7 = v5 or {};
    return table.concat(v2.Dictionary.values({
        v6, 
        v7.fetch, 
        v7.nextPage and "nextPage" or nil, 
        v7.status
    }), "_");
end;