local v0 = require(script.Parent.prettyPrint);
local v1 = {
    outputFunction = print
};
v1.middleware = function(v2, v3) --[[ Line: 10 ]] --[[ Name: middleware ]]
    -- upvalues: v1 (copy), v0 (copy)
    return function(v4) --[[ Line: 11 ]]
        -- upvalues: v2 (copy), v1 (ref), v0 (ref), v3 (copy)
        local v5 = v2(v4);
        v1.outputFunction(("Action dispatched: %s\nState changed to: %s"):format(v0(v4), v0(v3:getState())));
        return v5;
    end;
end;
return v1;