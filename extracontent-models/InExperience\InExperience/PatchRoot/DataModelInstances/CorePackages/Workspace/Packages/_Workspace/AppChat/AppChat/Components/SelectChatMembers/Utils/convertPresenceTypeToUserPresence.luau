local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_UserModel_0 = require(l_Parent_0.UserLib).Models.UserModel;
local l_PresenceType_0 = require(l_Parent_0.GraphQLServer).types.PresenceType;
return function(v3) --[[ Line: 9 ]]
    -- upvalues: l_PresenceType_0 (copy), l_UserModel_0 (copy)
    if v3 == l_PresenceType_0.Online then
        return l_UserModel_0.PresenceType.ONLINE;
    elseif v3 == l_PresenceType_0.InGame then
        return l_UserModel_0.PresenceType.IN_GAME;
    elseif v3 == l_PresenceType_0.InStudio then
        return l_UserModel_0.PresenceType.IN_STUDIO;
    else
        return l_UserModel_0.PresenceType.OFFLINE;
    end;
end;