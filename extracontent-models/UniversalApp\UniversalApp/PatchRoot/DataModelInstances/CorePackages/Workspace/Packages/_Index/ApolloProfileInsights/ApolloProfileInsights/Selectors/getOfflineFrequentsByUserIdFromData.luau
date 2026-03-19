local v0 = require(script.Parent.getProfileInsightsByUserIdFromData);
return function(v1, v2) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    local v3 = v0(v1, v2);
    if v3 then
        return v3.isOfflineFrequents or false;
    else
        return false;
    end;
end;