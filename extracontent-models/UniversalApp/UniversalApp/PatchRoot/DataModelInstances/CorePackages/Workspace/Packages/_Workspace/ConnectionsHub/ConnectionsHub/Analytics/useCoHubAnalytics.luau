local l_Parent_0 = script:FindFirstAncestor("ConnectionsHub").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AnalyticsSetup);
return function(v3) --[[ Line: 12 ]] --[[ Name: useCoHubAnalytics ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (v1.useMemo(function() --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v3 (copy)
        return v2({
            infoForAllEvents = v3
        });
    end, {
        v3
    }));
end;