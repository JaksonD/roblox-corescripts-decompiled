local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function() --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v3) --[[ Line: 7 ]]
        -- upvalues: v2 (ref), v1 (ref)
        v3:dispatch(v2(v1.PurchasePassInsufficientRobux));
    end;
end;