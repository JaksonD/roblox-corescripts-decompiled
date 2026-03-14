local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Actions.SetCurrentCharacter);
return function(v2) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v3) --[[ Line: 5 ]]
        -- upvalues: v1 (ref), v2 (copy)
        v3:dispatch(v1(v2));
    end;
end;