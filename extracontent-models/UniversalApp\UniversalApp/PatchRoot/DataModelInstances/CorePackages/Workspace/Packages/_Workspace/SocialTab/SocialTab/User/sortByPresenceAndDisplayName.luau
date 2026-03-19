local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_PresenceType_0 = require(l_script_FirstAncestor_0.dependencies).RoduxPresence.Enums.PresenceType;
local v2 = {
    [l_PresenceType_0.InGame] = 3, 
    [l_PresenceType_0.Online] = 2, 
    [l_PresenceType_0.InStudio] = 1, 
    [l_PresenceType_0.Offline] = 0
};
local function _(v3) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), l_PresenceType_0 (copy)
    return v2[v3] or v2[l_PresenceType_0.Offline];
end;
return function(v5, v6) --[[ Line: 17 ]]
    -- upvalues: v2 (copy), l_PresenceType_0 (copy)
    local v7 = v2[v5.userPresenceType] or v2[l_PresenceType_0.Offline];
    local v8 = v2[v6.userPresenceType] or v2[l_PresenceType_0.Offline];
    if v7 == v8 then
        return string.lower(v5.displayName) < string.lower(v6.displayName);
    else
        return v8 < v7;
    end;
end;