local _ = require(script.Parent.Types);
return function(v1) --[[ Line: 4 ]]
    return function(v2) --[[ Line: 5 ]]
        -- upvalues: v1 (copy)
        v1:reportCounter(v2.name, v2.count or 1);
        return v2;
    end;
end;