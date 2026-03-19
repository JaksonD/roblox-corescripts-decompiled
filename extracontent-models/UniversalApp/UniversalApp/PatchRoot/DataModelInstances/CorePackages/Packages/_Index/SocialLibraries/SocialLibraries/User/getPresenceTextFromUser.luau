local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_UserModel_0 = require(l_script_FirstAncestor_0.dependencies).UserModel;
return function(v2) --[[ Line: 5 ]]
    -- upvalues: l_UserModel_0 (copy)
    local l_presence_0 = v2.presence;
    local l_lastLocation_0 = v2.lastLocation;
    if l_presence_0 == l_UserModel_0.PresenceType.OFFLINE then
        return "Common.Presence.Label.Offline";
    elseif l_presence_0 == l_UserModel_0.PresenceType.ONLINE then
        return "Common.Presence.Label.Online";
    elseif l_presence_0 == l_UserModel_0.PresenceType.IN_GAME or l_presence_0 == l_UserModel_0.PresenceType.IN_STUDIO then
        if l_lastLocation_0 then
            return (tostring(l_lastLocation_0));
        else
            return "Common.Presence.Label.Online";
        end;
    else
        return "";
    end;
end;