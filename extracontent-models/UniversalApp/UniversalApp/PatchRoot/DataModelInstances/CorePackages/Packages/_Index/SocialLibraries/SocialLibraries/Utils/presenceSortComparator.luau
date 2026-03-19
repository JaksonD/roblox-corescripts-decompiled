local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialLibraries");
local l_UserModel_0 = require(l_script_FirstAncestor_0.dependencies).UserModel;
local v2 = {
    [l_UserModel_0.PresenceType.IN_GAME] = 3, 
    [l_UserModel_0.PresenceType.ONLINE] = 2, 
    [l_UserModel_0.PresenceType.IN_STUDIO] = 1, 
    [l_UserModel_0.PresenceType.OFFLINE] = 0
};
return function(v3, v4) --[[ Line: 13 ]]
    -- upvalues: v2 (copy)
    v3 = v3 or {};
    v4 = v4 or {};
    local l_presence_0 = v3.presence;
    local l_presence_1 = v4.presence;
    if l_presence_0 and l_presence_1 and v2[l_presence_0] ~= v2[l_presence_1] then
        return v2[l_presence_0] > v2[l_presence_1];
    else
        return v3.displayName < v4.displayName;
    end;
end;