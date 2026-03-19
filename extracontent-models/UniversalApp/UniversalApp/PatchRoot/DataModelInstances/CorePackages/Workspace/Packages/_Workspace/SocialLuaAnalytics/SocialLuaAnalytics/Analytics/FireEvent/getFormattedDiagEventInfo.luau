local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLuaAnalytics");
local l_DiagEventTypes_0 = require(l_script_FirstAncestor_0.Analytics.Enums).DiagEventTypes;
local _ = require(script.Parent.Parent.Types);
local function _(v3, v4) --[[ Line: 7 ]] --[[ Name: formatValue ]]
    if type(v3) == "function" then
        return (v3(v4));
    else
        return v3;
    end;
end;
return function() --[[ Line: 11 ]] --[[ Name: getFormattedDiagEventInfo ]]
    -- upvalues: l_DiagEventTypes_0 (copy)
    return function(v6, v7) --[[ Line: 12 ]]
        -- upvalues: l_DiagEventTypes_0 (ref)
        local l_name_0 = v6.name;
        local v9 = if type(l_name_0) == "function" then l_name_0(v7) else l_name_0;
        l_name_0 = v6.type or l_DiagEventTypes_0.Counter;
        local v10;
        if l_name_0 == l_DiagEventTypes_0.Stats then
            local l_stats_0 = v6.stats;
            v10 = (if type(l_stats_0) == "function" then l_stats_0(v7) else l_stats_0) or 0;
        else
            local l_count_0 = v6.count;
            v10 = (if type(l_count_0) == "function" then l_count_0(v7) else l_count_0) or 1;
        end;
        local l_platformSpecificity_0 = v6.platformSpecificity;
        return {
            type = l_name_0, 
            name = v9, 
            value = v10, 
            platformSpecificity = l_platformSpecificity_0
        };
    end;
end;