local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.React);
local v3 = require(l_Modules_0.LuaApp.Components.FlyoutSidePanel.FlyoutSidePanel);
local l_useDrawerShouldMount_0 = require(l_CorePackages_0.Workspace.Packages.Drawer).Hooks.useDrawerShouldMount;
return v2.memo(function(v5) --[[ Line: 11 ]] --[[ Name: FlyoutSidePanelWrapper ]]
    -- upvalues: l_useDrawerShouldMount_0 (copy), v2 (copy), v3 (copy)
    if l_useDrawerShouldMount_0() then
        return v2.createElement(v3, v5);
    else
        return nil;
    end;
end);