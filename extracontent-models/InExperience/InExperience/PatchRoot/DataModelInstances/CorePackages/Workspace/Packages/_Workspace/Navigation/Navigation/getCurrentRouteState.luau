local _ = require(script.Parent.types);
local v1 = require(script.Parent.getCurrentNavigationState);
return function(v2) --[[ Line: 8 ]] --[[ Name: getCurrentRouteState ]]
    -- upvalues: v1 (copy)
    if not v2 then
        return nil;
    elseif not v2.state then
        return nil;
    else
        return (v1(v2.state));
    end;
end;