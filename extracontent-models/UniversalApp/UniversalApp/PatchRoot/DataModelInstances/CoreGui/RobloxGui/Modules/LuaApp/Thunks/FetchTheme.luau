local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetTheme);
game:DefineFastFlag("FixFetchThemePromiseRejection", false);
return function(v2, v3) --[[ Line: 8 ]]
    -- upvalues: v1 (copy)
    return v1(v2, v3):andThen(function(v4) --[[ Line: 9 ]]
        local v5 = v4[1];
        if game:GetFastFlag("FixFetchThemePromiseRejection") then
            if v5 then
                return string.lower(v5.themeType);
            else
                return string.lower("light");
            end;
        else
            return (string.lower(v5.themeType));
        end;
    end);
end;