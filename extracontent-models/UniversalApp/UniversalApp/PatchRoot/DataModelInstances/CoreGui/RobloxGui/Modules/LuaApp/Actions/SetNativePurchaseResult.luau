local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Action);
local _ = require(l_Modules_0.LuaApp.Enum.NativePurchaseProductTypeEnum);
return v1(script.Name, function(v3, v4, v5) --[[ Line: 10 ]]
    return {
        nativeProductId = v3, 
        purchaseStatus = v4, 
        productType = v5
    };
end);