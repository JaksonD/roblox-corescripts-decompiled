local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function(v3, v4, v5, v6) --[[ Line: 6 ]]
    -- upvalues: v2 (copy), v1 (copy)
    return function(v7) --[[ Line: 7 ]]
        -- upvalues: v2 (ref), v1 (ref), v3 (copy), v4 (copy), v5 (copy), v6 (copy)
        v7:dispatch(v2(v1.PurchaseGameRobuxShortfall, {
            gameName = v3, 
            robuxShortfall = v4, 
            theme = v5, 
            pageFilter = v6
        }));
    end;
end;