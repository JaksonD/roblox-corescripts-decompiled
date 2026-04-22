local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.Enum.NotificationType);
local l_FFlagUseNavigationSelectors_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUseNavigationSelectors;
local l_Selectors_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Selectors;
return function(v5) --[[ Line: 14 ]]
    -- upvalues: l_FFlagUseNavigationSelectors_0 (copy), l_Selectors_0 (copy), v2 (copy)
    return function(v6) --[[ Line: 15 ]]
        -- upvalues: l_FFlagUseNavigationSelectors_0 (ref), l_Selectors_0 (ref), v5 (copy), v2 (ref)
        local v7 = v6:getState();
        local v8 = if l_FFlagUseNavigationSelectors_0 then l_Selectors_0.selectCurrentLegacyRoute(v7) else v7.Navigation.history[#v7.Navigation.history];
        local v9 = v8[#v8];
        v5:BroadcastNotification(v9.name, v2.APP_READY);
    end;
end;