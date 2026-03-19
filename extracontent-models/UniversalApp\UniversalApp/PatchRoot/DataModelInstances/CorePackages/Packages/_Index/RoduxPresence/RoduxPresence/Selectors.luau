local v0 = require(script.getUserPresenceByUserId);
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    return {
        getUserPresenceByUserId = v0(v1)
    };
end;