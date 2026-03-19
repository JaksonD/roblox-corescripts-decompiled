local v0 = require(script.Parent.useLazyRef);
return function(v1) --[[ Line: 11 ]] --[[ Name: useInitializedValue ]]
    -- upvalues: v0 (copy)
    return v0(v1).current;
end;