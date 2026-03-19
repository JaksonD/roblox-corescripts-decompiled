local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3) --[[ Line: 7 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v4) --[[ Line: 8 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy)
        v4:dispatch(v2({
            name = v1.PhoneVerification, 
            extraProps = {
                onSuccessCallback = v3.onSuccessCallback, 
                closeCallback = v3.closeCallback, 
                origin = "contactImport"
            }
        }, nil));
    end;
end;