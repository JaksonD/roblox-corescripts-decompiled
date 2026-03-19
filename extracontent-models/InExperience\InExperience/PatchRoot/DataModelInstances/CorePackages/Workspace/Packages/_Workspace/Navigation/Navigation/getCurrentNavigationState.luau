local _ = require(script.Parent.types);
local function v1(v2) --[[ Line: 7 ]] --[[ Name: getCurrentNavigationState ]]
    -- upvalues: v1 (copy)
    if v2.routes and v2.index then
        return v1(v2.routes[v2.index]);
    else
        return v2;
    end;
end;
return v1;