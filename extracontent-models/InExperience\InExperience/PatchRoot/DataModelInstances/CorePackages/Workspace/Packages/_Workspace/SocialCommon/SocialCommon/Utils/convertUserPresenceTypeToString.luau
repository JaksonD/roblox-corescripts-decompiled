local l_Parent_0 = script:FindFirstAncestor("SocialCommon").Parent;
local l_PresenceType_0 = require(l_Parent_0.LuaSocialLibrariesDeps).RoduxPresence.config({
    keyPath = "SocialCommon.Presence"
}).Enums.PresenceType;
return function(v2) --[[ Line: 8 ]]
    -- upvalues: l_PresenceType_0 (copy)
    if v2 == l_PresenceType_0.Online then
        return "Online";
    elseif v2 == l_PresenceType_0.InStudio then
        return "InStudio";
    elseif v2 == l_PresenceType_0.InGame then
        return "InGame";
    else
        return "Offline";
    end;
end;