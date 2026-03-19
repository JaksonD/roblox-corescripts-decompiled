local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserSearch");
local _ = require(l_script_FirstAncestor_0.Common.LocalTypes);
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Rodux.RoduxPresence).Enums.PresenceType;
return {
    isUserOnline = function(v3) --[[ Line: 7 ]]
        -- upvalues: l_PresenceType_0 (copy)
        local v4 = true;
        if v3 ~= l_PresenceType_0.Online then
            v4 = true;
            if v3 ~= l_PresenceType_0.InStudio then
                v4 = v3 == l_PresenceType_0.InGame;
            end;
        end;
        return v4;
    end, 
    isUserInGame = function(v5) --[[ Line: 15 ]]
        -- upvalues: l_PresenceType_0 (copy)
        return v5 and v5.universeId and v5.userPresenceType == l_PresenceType_0.InGame or false;
    end
};