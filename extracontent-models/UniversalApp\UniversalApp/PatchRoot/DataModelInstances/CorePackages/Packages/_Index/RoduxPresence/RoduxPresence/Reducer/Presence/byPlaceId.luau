local v0 = require(script.Parent.createReducerSlice);
return function(v1) --[[ Line: 2 ]]
    -- upvalues: v0 (copy)
    return v0("byPlaceId", "placeId", v1);
end;