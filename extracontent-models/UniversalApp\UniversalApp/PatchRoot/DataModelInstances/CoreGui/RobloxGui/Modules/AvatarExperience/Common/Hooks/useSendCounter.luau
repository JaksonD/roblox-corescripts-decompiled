local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v2 = require(l_Modules_0.AvatarExperience.Catalog.Services.Analytics);
local v3 = require(l_Modules_0.AvatarExperience.Common.Constants);
return function() --[[ Line: 8 ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    local v4 = v1(v2);
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v4 (copy), v3 (ref)
        v4.sendCounter(v3.Counter.PREFIX .. v5);
    end;
end;