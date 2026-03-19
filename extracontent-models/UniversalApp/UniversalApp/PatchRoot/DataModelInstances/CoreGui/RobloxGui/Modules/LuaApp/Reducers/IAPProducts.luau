local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetIAPProducts);
return function(v2, v3) --[[ Line: 12 ]]
    -- upvalues: v1 (copy)
    v2 = v2 or {
        Robux = {}, 
        PremiumRobux = {}, 
        Subscriptions = {}
    };
    assert(v2, "");
    if v3.type == v1.name then
        return {
            Robux = v3.robux, 
            PremiumRobux = v3.premiumRobux, 
            Subscriptions = v3.subscriptions
        };
    else
        return v2;
    end;
end;