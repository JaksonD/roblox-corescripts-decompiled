local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Flags.GetFFlagUseNonYieldGetSystemTheme);
return function(v2) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    if v1() then
        return v2:getSystemTheme();
    else
        return v2:getSystemThemeAsync();
    end;
end;