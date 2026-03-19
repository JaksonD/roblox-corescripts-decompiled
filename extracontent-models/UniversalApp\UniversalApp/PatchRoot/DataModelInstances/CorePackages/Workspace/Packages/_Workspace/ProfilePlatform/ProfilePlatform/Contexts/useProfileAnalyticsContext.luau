local l_Parent_0 = script:FindFirstAncestor("ProfilePlatform").Parent;
local v1 = require(script.Parent.ProfileAnalyticsContext);
local v2 = require(l_Parent_0.React);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return v2.useContext(v1);
end;