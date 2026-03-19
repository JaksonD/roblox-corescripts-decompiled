local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_PresenceTypes_0 = require(l_Parent_0.Analytics.Enums).PresenceTypes;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local v4 = {
    [l_PresenceType_0.InGame] = l_PresenceTypes_0.InGame, 
    [l_PresenceType_0.InStudio] = l_PresenceTypes_0.InStudio, 
    [l_PresenceType_0.Offline] = l_PresenceTypes_0.Offline, 
    [l_PresenceType_0.Online] = l_PresenceTypes_0.Online
};
return function(v5) --[[ Line: 15 ]]
    -- upvalues: l_PresenceTypes_0 (copy), v4 (copy)
    if not v5 then
        return nil;
    elseif type(v5) == "string" and v5 ~= "" then
        return l_PresenceTypes_0[v5];
    else
        return v4[v5];
    end;
end;