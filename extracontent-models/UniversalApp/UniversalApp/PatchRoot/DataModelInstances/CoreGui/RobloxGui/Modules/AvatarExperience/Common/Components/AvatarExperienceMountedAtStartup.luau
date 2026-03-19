local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_GetFFlagLuaAppPostAppInteractiveLoader_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppPostAppInteractiveLoader;
local v4 = require(l_CorePackages_0.Packages.RoactRodux);
local v5 = require(l_CorePackages_0.Packages.React);
local v6 = require(l_CorePackages_0.Workspace.Packages.RoactUtils);
local v7 = require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceInitialization);
local v8 = require(l_Modules_0.AvatarExperience.Common.Managers.AvatarSceneManager);
local v9 = require(l_Modules_0.AvatarExperience.Common.Components.ItemSelectionManager);
local v10 = require(l_Modules_0.LuaApp.Enum.LoginStatus);
local v11 = require(l_Modules_0.AvatarExperience.Common.Debug.AvatarExperienceIXPDiagnostics);
local l_AXPrefetchMarketplaceIXP_0 = require(l_CorePackages_0.Workspace.Packages.AvatarExperienceExperiments).AXPrefetchMarketplaceIXP;
local v13 = require(l_Modules_0.AvatarExperience.Common.Components.WidgetList.Hooks.usePrefetchMarketplace);
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local l_useStore_0 = v6.Hooks.RoactRodux.useStore;
return (v4.connect(function(v16, _) --[[ Line: 89 ]] --[[ Name: mapStateToProps ]]
    return {
        authStatus = v16.AuthenticationStatus.status
    };
end, nil)(function(v18) --[[ Line: 48 ]] --[[ Name: AvatarExperienceMountedAtStartup ]]
    -- upvalues: l_GetFFlagLuaAppPostAppInteractiveLoader_0 (copy), l_useIsSpatial_0 (copy), l_useStore_0 (copy), v10 (copy), l_AXPrefetchMarketplaceIXP_0 (copy), v13 (copy), v5 (copy), v9 (copy), v8 (copy), v7 (copy), v11 (copy)
    local v19 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then l_useIsSpatial_0() else nil;
    local l_shouldStart_0 = v18.shouldStart;
    local l_shouldManageBackground_0 = v18.shouldManageBackground;
    local v22 = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then l_useStore_0() else v18.store;
    local v23 = v18.authStatus == v10.LOGGED_IN or l_shouldStart_0;
    if l_AXPrefetchMarketplaceIXP_0.isEnabled() then
        v13();
    end;
    return v5.createElement(v5.Fragment, {}, {
        ItemSelectionManager = v5.createElement(v9), 
        AvatarSceneManager = if v23 then v5.createElement(v8, {
            store = v22, 
            shouldStart = l_shouldStart_0, 
            shouldManageBackground = if l_GetFFlagLuaAppPostAppInteractiveLoader_0() then not v19 else l_shouldManageBackground_0, 
            renderSky = l_shouldStart_0
        }) else nil, 
        AvatarExperienceInitialization = if v23 then v5.createElement(v7) else nil, 
        AvatarExperienceIXPDiagnostics = v5.createElement(v11)
    });
end));