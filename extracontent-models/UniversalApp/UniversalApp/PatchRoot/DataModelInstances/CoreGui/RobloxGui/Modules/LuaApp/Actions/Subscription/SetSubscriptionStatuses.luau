local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_makeActionCreator_0 = require(l_CorePackages_0.Packages.Rodux).makeActionCreator;
local _ = require(l_Modules_0.LuaApp.Models.SubscriptionApi.SubscriptionStatusModel);
return l_makeActionCreator_0(script.Name, function(v4) --[[ Line: 11 ]]
    return {
        subscriptionStatuses = v4
    };
end);