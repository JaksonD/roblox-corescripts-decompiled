local v0 = require(script.Parent.getUserProfileFromId);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v3 = v0(v1, v2);
    if v3.names then
        return v3.names.displayName;
    else
        return nil;
    end;
end;