local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: v3 (copy), v1 (ref), v2 (copy)
        if v4 == v3 then
            return v1.resolve(nil);
        else
            return v1.resolve(v2);
        end;
    end;
end;