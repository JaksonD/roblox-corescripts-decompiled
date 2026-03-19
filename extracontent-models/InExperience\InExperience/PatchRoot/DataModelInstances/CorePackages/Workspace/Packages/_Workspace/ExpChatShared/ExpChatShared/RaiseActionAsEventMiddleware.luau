local v0 = require(script.Parent.ActionBindableEvent);
return function(v1, _) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return function(v3) --[[ Line: 4 ]]
        -- upvalues: v0 (ref), v1 (copy)
        v0:Fire(v3);
        v1(v3);
    end;
end;