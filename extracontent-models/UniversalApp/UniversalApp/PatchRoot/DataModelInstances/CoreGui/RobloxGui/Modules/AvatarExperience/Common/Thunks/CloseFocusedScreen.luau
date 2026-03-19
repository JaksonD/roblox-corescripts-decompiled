local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local v3 = require(l_Modules_0.LuaApp.Navigation.isRootRouteInRN);
local v4 = require(l_Modules_0.LuaApp.Thunks.NavigateBack);
local v5 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
return function(v6) --[[ Line: 18 ]]
    -- upvalues: v5 (copy), v3 (copy), v4 (copy), v2 (copy)
    return function(v7) --[[ Line: 19 ]]
        -- upvalues: v5 (ref), v6 (copy), v3 (ref), v4 (ref), v2 (ref)
        local v8 = v5.getRootNavigation(v6);
        if v3(v8.state) then
            v7:dispatch(v4(false));
            return;
        else
            v6.dispatch(v2.Actions.back(nil));
            return;
        end;
    end;
end;