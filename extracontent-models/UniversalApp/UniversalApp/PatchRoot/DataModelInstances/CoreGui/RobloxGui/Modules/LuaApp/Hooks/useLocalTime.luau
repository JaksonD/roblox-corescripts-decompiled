local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Hooks.useRoactService);
local v2 = require(l_Modules_0.LuaApp.Services.RoactLocalization);
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v5 = v1(v2);
    if v3 then
        local v6 = DateTime.fromIsoDate(v3);
        if v6 then
            local l_v5_Locale_0 = v5:GetLocale();
            return v6:FormatLocalTime(v4 or "l", l_v5_Locale_0);
        end;
    end;
    return nil;
end;