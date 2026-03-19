local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(script.Parent.AnalyticsDispatchContext);
return function() --[[ Line: 6 ]] --[[ Name: useAnalyticsDispatch ]]
    -- upvalues: v1 (copy), v2 (copy)
    return (v1.useContext(v2));
end;