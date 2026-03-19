local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_Modules_0.AvatarExperience.Common.AvatarExperienceState);
local v2 = require(l_Modules_0.AvatarExperience.Common.Actions.SetEquippedInTryOnManager);
return function(v3, v4, _, v6, _) --[[ Line: 12 ]]
    -- upvalues: v2 (copy)
    return function(v8) --[[ Line: 13 ]]
        -- upvalues: v2 (ref), v3 (copy), v4 (copy), v6 (copy)
        v8:dispatch(v2(v3, v4, v6));
    end;
end;