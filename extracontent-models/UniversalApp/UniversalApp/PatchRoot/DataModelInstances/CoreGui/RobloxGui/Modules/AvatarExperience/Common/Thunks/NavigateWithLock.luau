local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.Actions.ApplySetNavigationLocked);
return function(v4) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v3 (copy)
    v2.isType(v4, "function", "navigationCallback");
    return function(v5) --[[ Line: 17 ]]
        -- upvalues: v3 (ref), v4 (copy)
        if v5:getState().Navigation.lockNavigationActions then
            return;
        else
            v5:dispatch(v3(true));
            v4();
            return;
        end;
    end;
end;