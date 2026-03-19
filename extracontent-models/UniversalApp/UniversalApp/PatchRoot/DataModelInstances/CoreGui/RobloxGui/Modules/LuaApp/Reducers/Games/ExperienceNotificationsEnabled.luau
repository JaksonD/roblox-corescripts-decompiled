local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Packages.Cryo);
local v3 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledCount);
local v4 = require(l_Modules_0.LuaApp.Actions.Games.SetExperienceNotificationsEnabledLimit);
return function(v5, v6) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v2 (copy), v4 (copy)
    v5 = v5 or {
        count = 0, 
        limit = 0
    };
    assert(v5, "");
    if v6.type == v3.name then
        return (v2.Dictionary.join(v5, {
            count = v6.count
        }));
    else
        if v6.type == v4.name then
            v5 = v2.Dictionary.join(v5, {
                limit = v6.limit
            });
        end;
        return v5;
    end;
end;