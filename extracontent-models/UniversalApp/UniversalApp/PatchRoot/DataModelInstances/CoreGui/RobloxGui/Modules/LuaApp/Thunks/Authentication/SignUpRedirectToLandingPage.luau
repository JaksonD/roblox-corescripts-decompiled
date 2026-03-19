local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Actions.Authentication.ClearSignUpInfo);
local v3 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
return function(_) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v3 (copy), v1 (copy)
    return function(v5) --[[ Line: 9 ]]
        -- upvalues: v2 (ref), v3 (ref), v1 (ref)
        v5:dispatch(v2());
        v5:dispatch(v3({
            {
                name = v1.Landing
            }
        }));
    end;
end;