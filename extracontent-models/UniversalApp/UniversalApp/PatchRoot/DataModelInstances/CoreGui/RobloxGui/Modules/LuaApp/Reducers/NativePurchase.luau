local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.ClearNativePurchaseResult);
local _ = require(l_Modules_0.LuaApp.Enum.NativePurchaseProductTypeEnum);
local v3 = require(l_Modules_0.LuaApp.Actions.SetNativePurchaseResult);
return function(v4, v5) --[[ Line: 15 ]]
    -- upvalues: v3 (copy), v1 (copy)
    local v6 = if v4 ~= nil then v4 else {};
    if v5.type == v3.name then
        return {
            nativeProductId = v5.nativeProductId, 
            purchaseStatus = v5.purchaseStatus, 
            productType = v5.productType
        };
    elseif v5.type == v1.name then
        return {};
    else
        return v6;
    end;
end;