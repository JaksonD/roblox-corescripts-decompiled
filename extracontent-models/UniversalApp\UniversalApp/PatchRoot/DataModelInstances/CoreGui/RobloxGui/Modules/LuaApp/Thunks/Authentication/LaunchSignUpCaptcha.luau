local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3) --[[ Line: 5 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 6 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy)
        v4:dispatch(v2({
            name = v1.CaptchaNative, 
            detail = "", 
            extraProps = {
                captchaCallback = v3, 
                captchaType = "signup"
            }
        }));
    end;
end;