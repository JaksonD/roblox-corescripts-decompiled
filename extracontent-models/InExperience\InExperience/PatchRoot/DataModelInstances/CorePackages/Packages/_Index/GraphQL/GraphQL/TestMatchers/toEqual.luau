local v0 = require(script.Parent.Parent.luaUtils.deepEqual);
return function(v1, v2) --[[ Line: 17 ]] --[[ Name: toEqual ]]
    -- upvalues: v0 (copy)
    local v3, v4 = v0(v1, v2);
    local v5 = nil;
    v5 = if not v3 then v4:gsub("{1}", "received"):gsub("{2}", "expected") else ("expected: not %s\nreceived:     %s"):format(tostring(v2), (tostring(v1)));
    return {
        pass = v3, 
        message = v5
    };
end;