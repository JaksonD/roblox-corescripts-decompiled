local v0 = require(script.Parent.getUserProfileFromId);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return v0(v1, v2).platformProfileId;
end;