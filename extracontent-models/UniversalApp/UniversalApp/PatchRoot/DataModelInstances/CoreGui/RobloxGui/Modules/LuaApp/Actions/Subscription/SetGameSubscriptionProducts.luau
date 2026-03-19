local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
return v1(script.Name, function(v3, v4) --[[ Line: 5 ]]
    -- upvalues: v2 (copy)
    v2.isType(v3, "string", "universeId");
    v2.isType(v4, "table", "subscriptionProducts");
    return {
        universeId = v3, 
        subscriptionProducts = v4
    };
end);