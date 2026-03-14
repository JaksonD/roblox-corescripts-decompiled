local v0 = require(script.Parent.symbols);
local v1 = require(script.Parent.Spy);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy), v0 (copy)
    if type(v2) == "function" then
        local v3 = v1.lookup(v2);
        if v3 then
            return v3[v0.Calls];
        else
            error("Calling getCalls on a non-spy function");
        end;
    end;
    local v4 = rawget(v2, v0.Calls);
    if v4 == nil then
        v4 = getmetatable(v2)[v0.Calls];
    end;
    if v4 == nil then
        error("Calling getCalls on a non-mock");
    end;
    return v4;
end;