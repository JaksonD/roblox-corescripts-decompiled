local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_User_0 = v1.RoduxUsers.Models.User;
local l_llama_0 = v1.llama;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
return function(v5) --[[ Line: 8 ]]
    -- upvalues: l_User_0 (copy), l_llama_0 (copy), l_PresenceType_0 (copy)
    local v6 = l_User_0.mock();
    return l_llama_0.Dictionary.join(v6, {
        username = v6.name, 
        thumbnail = "rbxassetid://2610133241", 
        userPresenceType = l_PresenceType_0.Offline, 
        isPremium = false
    }, v5 or {});
end;