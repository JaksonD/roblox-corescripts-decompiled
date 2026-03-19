local _ = require(script.Parent.types);
local v1 = require(script.Parent.getCurrentRouteState);
return function(v2) --[[ Line: 7 ]] --[[ Name: getCurrentRouteKey ]]
    -- upvalues: v1 (copy)
    local v3 = v1(v2);
    if v3 then
        return v3.key;
    else
        return nil;
    end;
end;