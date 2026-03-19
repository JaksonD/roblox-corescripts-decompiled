local v0 = require(script.Parent.Parent.utils.invariant);
local v1 = require(script.Parent.Parent.utils.isValidScreenComponent);
return function(v2) --[[ Line: 20 ]]
    -- upvalues: v0 (copy), v1 (copy)
    v0(type(v2) == "table", "routeConfigs must be an array table");
    for v3, v4 in v2 do
        v0(type(v3) == "number", ("routeConfigs must be an array table (found non-number key %q of type %q)"):format(v3, (type(v3))));
        local v5, v6 = next(v4);
        v0(next(v4, v5) == nil, ("only one route must be defined in each entry (found multiple at index %d)"):format(v3));
        local v7 = true;
        if type(v6) ~= "table" then
            v7 = false;
        end;
        local v8 = if v7 then v6 else {};
        local v9 = v7 and v6.screen or v6;
        v0(v1(v9) or type(v8.getScreen) == "function" and v1(v8.getScreen()), "The component for route '%s' must be a Roact Function/Stateful component or table with 'getScreen'.getScreen function must return Roact Function/Stateful component.", v5);
        local l_v0_0 = v0;
        local v11 = true;
        if v8.screen ~= nil then
            v11 = v8.getScreen == nil;
        end;
        l_v0_0(v11, "Route '%s' should provide 'screen' or 'getScreen', but not both.", v5);
    end;
    v0(#v2 > 0, "Please specify at least one route when configuring a navigator.");
    return v2;
end;