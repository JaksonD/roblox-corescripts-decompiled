local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetGlobalGuiInset);
return function(v2, v3) --[[ Line: 11 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or {
        left = 0, 
        top = 0, 
        right = 0, 
        bottom = 0
    };
    assert(v2, "");
    if v3.type == v1.name then
        return {
            left = v3.left, 
            top = v3.top, 
            right = v3.right, 
            bottom = v3.bottom
        };
    else
        return v2;
    end;
end;