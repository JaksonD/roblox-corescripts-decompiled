local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Cryo);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v3 = require(l_Modules_0.LuaApp.Actions.Subscription.SetSubscriptionStatuses);
return function(v4, v5) --[[ Line: 6 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v6 = v4 or {};
    if v5.type == v3.name then
        v6 = v1.Dictionary.join(v6, v5.subscriptionStatuses);
    end;
    return v6;
end;