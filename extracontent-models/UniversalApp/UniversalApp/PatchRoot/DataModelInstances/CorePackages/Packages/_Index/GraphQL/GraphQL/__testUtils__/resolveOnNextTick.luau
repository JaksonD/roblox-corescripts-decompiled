local v0 = require(script.Parent.Parent.Parent.Promise);
return function() --[[ Line: 11 ]]
    -- upvalues: v0 (copy)
    return v0.defer(function(v1) --[[ Line: 13 ]]
        v1(nil);
    end);
end;