local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_useIsSpatial_0 = require(l_CorePackages_0.Workspace.Packages.Responsive).useIsSpatial;
local v4 = require(l_Modules_0.LuaApp.Components.More.VRSettings);
local v5 = require(l_Modules_0.LuaApp.Components.More.AccountSettings.SettingsPage);
return function(v6) --[[ Line: 8 ]] --[[ Name: MoreSettingsPageSelector ]]
    -- upvalues: l_useIsSpatial_0 (copy), v1 (copy), v4 (copy), v5 (copy)
    if l_useIsSpatial_0() then
        return v1.createElement(v4, v6);
    else
        return v1.createElement(v5, v6);
    end;
end;