local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Enums.PresenceTypes);
local v3 = require(l_Parent_0.Foundation);
local v4 = {
    [v2.Offline] = v3.Enums.UserPresence.Away, 
    [v2.Online] = v3.Enums.UserPresence.Active, 
    [v2.InGame] = v3.Enums.UserPresence.InExperience, 
    [v2.InStudio] = v3.Enums.UserPresence.Active, 
    Offline = v3.Enums.UserPresence.Away, 
    Online = v3.Enums.UserPresence.Active, 
    InGame = v3.Enums.UserPresence.InExperience, 
    InStudio = v3.Enums.UserPresence.Active
};
return function(v5) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), v3 (copy)
    return v4[v5] or v3.Enums.UserPresence.None;
end;