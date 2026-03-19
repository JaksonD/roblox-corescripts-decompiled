local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
return function(v2, v3) --[[ Line: 4 ]]
    -- upvalues: v1 (copy)
    return function(v4) --[[ Line: 5 ]]
        -- upvalues: v1 (ref), v2 (copy), v3 (copy)
        v4:dispatch(v1(v2, v3));
        v4:flush();
    end;
end;