local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Workspace.Packages.AppStartup);
local l_AppStartupSequence_0 = v3.AppStartupSequence;
local l_PostAppInteractiveContainer_0 = v3.PostAppInteractiveContainer;
local l_createLazyComponent_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Components.createLazyComponent;
local v7 = l_createLazyComponent_0(function() --[[ Line: 12 ]]
    -- upvalues: l_CorePackages_0 (copy)
    return require(l_CorePackages_0.Workspace.Packages.QueryRefetch).QueryRefetchManager;
end);
local v8 = l_createLazyComponent_0(function() --[[ Line: 16 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.ContactImporter.ContactImporterManagerWrapper);
end);
local v9 = l_createLazyComponent_0(function() --[[ Line: 20 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.AvatarExperience.Common.Components.AvatarExperienceMountedAtStartup);
end);
local v10 = l_createLazyComponent_0(function() --[[ Line: 24 ]]
    -- upvalues: l_Modules_0 (copy)
    return require(l_Modules_0.LuaApp.Components.UpdateRequiredPrompt);
end);
return function(_) --[[ Line: 28 ]] --[[ Name: PostAppInteractiveLoader ]]
    -- upvalues: v2 (copy), l_PostAppInteractiveContainer_0 (copy), l_AppStartupSequence_0 (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy)
    return v2.createElement(l_PostAppInteractiveContainer_0, {
        appStartupSequence = l_AppStartupSequence_0.default
    }, {
        QueryRefetchManager = v2.createElement(v7), 
        ContactImporterManager = v2.createElement(v8), 
        AvatarExperienceMountedAtStartup = v2.createElement(v9), 
        UpdateRequiredPrompt = v2.createElement(v10)
    });
end;