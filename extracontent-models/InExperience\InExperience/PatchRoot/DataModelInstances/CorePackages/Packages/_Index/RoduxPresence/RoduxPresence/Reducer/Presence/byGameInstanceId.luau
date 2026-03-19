local v0 = require(script.Parent.createReducerSlice);
return function(v1) --[[ Line: 2 ]]
    -- upvalues: v0 (copy)
    return v0("byGameInstanceId", "gameId", v1);
end;