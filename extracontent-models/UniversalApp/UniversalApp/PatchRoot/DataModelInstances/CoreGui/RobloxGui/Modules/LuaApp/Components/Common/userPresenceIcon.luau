local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Models.User);
return {
    [v1.PresenceType.OFFLINE] = nil, 
    [v1.PresenceType.ONLINE] = "component_assets/circle_16", 
    [v1.PresenceType.IN_GAME] = "icons/menu/games_small", 
    [v1.PresenceType.IN_STUDIO] = "icons/logo/studiologo_small"
};