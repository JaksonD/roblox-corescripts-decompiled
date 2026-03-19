local v0 = require(script.Parent.utils.invariant);
return function(v1, v2) --[[ Line: 4 ]]
    -- upvalues: v0 (copy)
    if v1.childRouters and v1.childRouters[v2] then
        return v1.childRouters[v2];
    else
        v0(type(v1.getComponentForRouteName) == "function", "router.getComponentForRouteName must be a function if no child routers are specified");
        local v3 = v1.getComponentForRouteName(v2);
        if type(v3) == "table" then
            return v3.router;
        else
            return nil;
        end;
    end;
end;