local l_script_FirstAncestor_0 = script:FindFirstAncestor("UserLib");
local v1 = require(l_script_FirstAncestor_0.Models.User);
return {
    [0] = v1.PresenceType.OFFLINE, 
    [1] = v1.PresenceType.ONLINE, 
    [2] = v1.PresenceType.IN_GAME, 
    [3] = v1.PresenceType.IN_STUDIO
};