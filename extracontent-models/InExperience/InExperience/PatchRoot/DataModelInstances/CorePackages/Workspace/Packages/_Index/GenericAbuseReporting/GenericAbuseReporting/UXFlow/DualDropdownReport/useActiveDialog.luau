local l_Parent_0 = script:FindFirstAncestor("GenericAbuseReporting").Parent;
local v1 = require(l_Parent_0.React);
return function() --[[ Line: 8 ]] --[[ Name: useActiveDialog ]]
    -- upvalues: v1 (copy)
    local v2, v3 = v1.useState("Form");
    return v2, v3;
end;