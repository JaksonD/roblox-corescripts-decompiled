local v0 = require(script.Parent.getCurrentRouteKey);
local v1 = require(script.Parent.useNavigation);
return function() --[[ Line: 4 ]] --[[ Name: useCurrentRouteKey ]]
    -- upvalues: v1 (copy), v0 (copy)
    local v2 = v1();
    return v0(v2);
end;