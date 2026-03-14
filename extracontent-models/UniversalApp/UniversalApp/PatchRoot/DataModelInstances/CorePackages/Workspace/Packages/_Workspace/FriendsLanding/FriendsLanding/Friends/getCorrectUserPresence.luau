local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_PresenceType_0 = require(l_script_FirstAncestor_0.dependencies).RoduxPresence.Enums.PresenceType;
local v2 = require(script.Parent.isUserInGame);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: l_PresenceType_0 (copy), v2 (copy)
    if not v3 then
        return nil;
    else
        assert(v3, "");
        local l_userPresenceType_0 = v3.userPresenceType;
        if l_userPresenceType_0 == l_PresenceType_0.InGame then
            return v2(v3) and l_PresenceType_0.InGame or l_PresenceType_0.Online;
        else
            return l_userPresenceType_0;
        end;
    end;
end;