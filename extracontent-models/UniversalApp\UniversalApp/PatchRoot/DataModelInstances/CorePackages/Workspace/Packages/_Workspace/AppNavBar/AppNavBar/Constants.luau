local l_Parent_0 = script.Parent.Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_FFlagAppIaHomeSubTab_0 = require(l_Parent_0.SharedFlags).FFlagAppIaHomeSubTab;
return {
    STUDIO_CTA_EVENT_CONTEXT = "StudioCTA", 
    STUDIO_CTA_EVENT_NAME_OPEN = "OpenStudioCreatePage", 
    STUDIO_CTA_EVENT_NAME_MOUNT = "MountStudioButton", 
    HOME_CONTAINER_SUB_TAB_PAGES = if l_FFlagAppIaHomeSubTab_0 then {
        l_AppPage_0.Home, 
        l_AppPage_0.Games
    } else nil
};