local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.ToastType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v3 = require(l_Modules_0.LuaApp.getPurchaseErrorTypeFromErrorResponse);
local v4 = require(l_Modules_0.LuaApp.PurchaseErrorLocalizationKeys);
return function(v5) --[[ Line: 7 ]]
    -- upvalues: v3 (copy), v4 (copy), v2 (copy), v1 (copy)
    return function(v6) --[[ Line: 8 ]]
        -- upvalues: v3 (ref), v5 (copy), v4 (ref), v2 (ref), v1 (ref)
        local v7 = v4[v3(v5)];
        v6:dispatch(v2({
            toastType = v1.PurchaseMessage, 
            toastMessage = v7
        }));
    end;
end;