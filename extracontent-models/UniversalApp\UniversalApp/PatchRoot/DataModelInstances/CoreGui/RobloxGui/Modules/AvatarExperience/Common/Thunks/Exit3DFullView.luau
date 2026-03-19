local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.Common.Thunks.SetFullView);
local v2 = require(l_Modules_0.AvatarExperience.Common.Enum.FullView);
return function(v3, v4) --[[ Line: 10 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v5) --[[ Line: 11 ]]
        -- upvalues: v4 (copy), v2 (ref), v1 (ref), v3 (copy)
        if v5:getState().AvatarExperience.Common.FullView[v4] == v2.SceneFullView then
            v5:dispatch(v1(v3, v4, v2.None));
        end;
    end;
end;