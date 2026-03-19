local _ = require(script.Parent.Parent.Types);
return function(v1) --[[ Line: 3 ]]
    return function(v2) --[[ Line: 4 ]]
        -- upvalues: v1 (copy)
        v1:reportCounter(v2.name, v2.count or 1);
        return v2;
    end;
end;