local _ = require(script.Parent.types);
local l___DEV___0 = _G.__DEV__;
return function(v2) --[[ Line: 5 ]] --[[ Name: inspectRouteEntry ]]
    -- upvalues: l___DEV___0 (copy)
    local v3, v4 = next(v2);
    if l___DEV___0 then
        assert(v3 and v4, "route entry should contain exactly one route config");
    end;
    return v3, v4;
end;