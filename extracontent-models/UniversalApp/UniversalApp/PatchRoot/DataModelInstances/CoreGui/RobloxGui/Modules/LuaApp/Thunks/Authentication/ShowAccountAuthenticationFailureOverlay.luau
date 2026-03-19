local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v3 = require(l_Modules_0.LuaApp.AppPage);
local v4 = require(l_Modules_0.LuaApp.Thunks.ResetNavigationHistory);
return function(v5, v6) --[[ Line: 8 ]]
    -- upvalues: v4 (copy), v3 (copy), v2 (copy), v1 (copy)
    v5:dispatch(v4({
        {
            name = v3.Landing
        }
    }));
    v5:dispatch(v2(v1.AccountAuthenticationFailureOverlay, {
        onActivated = v6
    }, {
        DisableBackButtonClose = true
    }));
end;