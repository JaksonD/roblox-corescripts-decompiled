local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_PresenceType_0 = require(l_script_FirstAncestor_0.Rodux.Presence).Enums.PresenceType;
local v2 = require(l_script_FirstAncestor_0.Common.Enums);
local v3 = {
    [l_PresenceType_0.Offline] = v2.PresenceTypes.Offline, 
    [l_PresenceType_0.Online] = v2.PresenceTypes.Online, 
    [l_PresenceType_0.InGame] = v2.PresenceTypes.InGame, 
    [l_PresenceType_0.InStudio] = v2.PresenceTypes.InStudio, 
    Offline = v2.PresenceTypes.Offline, 
    Online = v2.PresenceTypes.Online, 
    InGame = v2.PresenceTypes.InGame, 
    InStudio = v2.PresenceTypes.InStudio
};
return function(v4, v5) --[[ Line: 18 ]]
    -- upvalues: v3 (copy), v2 (copy)
    local v6 = v3[v4] or v2.PresenceTypes.Offline;
    if v6 == v2.PresenceTypes.InGame and v5 == nil then
        return v2.PresenceTypes.Online;
    else
        return v6;
    end;
end;