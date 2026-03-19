local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v3, v4, v5, v6, v7, v8, v9) --[[ Line: 8 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v10) --[[ Line: 17 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy), v7 (copy), v8 (copy), v9 (copy)
        v10:dispatch(v2({
            name = v1.RobuxUpsell, 
            detail = "", 
            extraProps = {
                triggerContext = v3, 
                priceInRobux = v4, 
                userRobux = v5, 
                itemName = v6, 
                itemIcon = v7, 
                purchaseItem = v8, 
                itemProductId = v9
            }
        }));
    end;
end;