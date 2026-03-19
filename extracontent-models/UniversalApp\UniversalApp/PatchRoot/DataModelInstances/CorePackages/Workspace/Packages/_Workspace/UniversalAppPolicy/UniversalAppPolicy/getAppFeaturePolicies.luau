local v0 = require(script.Parent.UniversalAppGetPolicy);
local v1 = require(script.Parent.AppFeaturePolicies);
return function() --[[ Line: 8 ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v2 = v0.read() or {};
    return v1(v2);
end;