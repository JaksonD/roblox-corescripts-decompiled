local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Thunks.ApiFetchIAPProducts);
return function(v2, _) --[[ Line: 5 ]]
    -- upvalues: v1 (copy)
    local l_Subscriptions_0 = v2.IAPProducts.Subscriptions;
    return {
        screenSize = v2.ScreenSize, 
        subscriptionProduct = l_Subscriptions_0 and l_Subscriptions_0[1] or nil, 
        iapProductsFetchingStatus = v1.GetFetchingStatus(v2)
    };
end;