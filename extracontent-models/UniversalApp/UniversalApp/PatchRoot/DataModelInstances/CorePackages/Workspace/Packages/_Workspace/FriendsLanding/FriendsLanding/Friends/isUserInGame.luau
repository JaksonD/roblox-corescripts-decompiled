local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_PresenceType_0 = require(l_script_FirstAncestor_0.dependencies).RoduxPresence.Enums.PresenceType;
return function(v2) --[[ Line: 11 ]]
    -- upvalues: l_PresenceType_0 (copy)
    if not v2 then
        return false;
    else
        assert(v2, "user modal must be non-nil");
        return v2.userPresenceType == l_PresenceType_0.InGame and (v2.lastLocation and v2.lastLocation ~= "" or false);
    end;
end;