local _ = game:GetService("CorePackages");
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.ScreenList);
return function(v3, v4) --[[ Line: 8 ]]
    -- upvalues: v2 (copy)
    local v5 = v3 or {};
    return {
        ScreenList = v2(v5.ScreenList, v4)
    };
end;