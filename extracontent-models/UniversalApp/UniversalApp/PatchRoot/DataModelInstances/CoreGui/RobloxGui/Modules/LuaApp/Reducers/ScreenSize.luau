local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetScreenSize);
return function(v2, v3) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or Vector2.new(0, 0);
    assert(v2, "");
    if v3.type == v1.name then
        return v3.screenSize;
    else
        return v2;
    end;
end;