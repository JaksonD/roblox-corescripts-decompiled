local v0 = require(script.Parent.symbols);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    getmetatable(v1)[v0.ReturnValue] = {
        v2
    };
end;