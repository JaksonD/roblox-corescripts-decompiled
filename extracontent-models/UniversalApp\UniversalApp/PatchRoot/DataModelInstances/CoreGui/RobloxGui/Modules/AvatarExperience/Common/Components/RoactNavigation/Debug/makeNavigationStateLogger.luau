local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.Debug.dumpNavigationHierarchy);
local v3 = require(l_CorePackages_0.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.state");
return function(v4, v5) --[[ Line: 20 ]]
    -- upvalues: v3 (copy), v2 (copy)
    if v5 == nil then
        v5 = v3.active[v3.Levels.Trace];
    end;
    if not v5 then
        return function(_, _, _) --[[ Line: 26 ]]

        end;
    else
        local v9 = nil;
        return function(_, v11, v12) --[[ Line: 31 ]]
            -- upvalues: v2 (ref), v4 (copy), v9 (ref)
            local v13 = v2(v11);
            print(string.format("[%s] action: %s\n%s", v4, tostring(v12.type), v13 == v9 and "" or v13));
            v9 = v13;
        end;
    end;
end;