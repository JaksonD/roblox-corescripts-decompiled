local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local l_PresenceType_0 = require(l_script_FirstAncestor_0.dependencies).RoduxPresence.Enums.PresenceType;
return {
    [l_PresenceType_0.Offline] = nil, 
    [l_PresenceType_0.Online] = "component_assets/circle_16", 
    [l_PresenceType_0.InGame] = "icons/menu/games_small", 
    [l_PresenceType_0.InStudio] = "icons/logo/studiologo_small"
};