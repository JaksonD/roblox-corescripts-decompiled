local l_AppStorageService_0 = game:GetService("AppStorageService");
local v1 = game:DefineFastFlag("EnableConsoleExpControlsIXP684", false);
local v2 = {
    HAMBURGER = "hamburger", 
    SUBMENU = "submenu"
};
local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
    -- upvalues: l_AppStorageService_0 (copy)
    return l_AppStorageService_0:GetItem("ExperienceMenuVersion");
end);
if l_status_0 and (l_result_0 == v2.HAMBURGER or l_result_0 == v2.SUBMENU) then
    return v1;
else
    return false;
end;