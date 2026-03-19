local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v2 = require(l_Modules_0.LuaApp.Enum.OverlayType);
return function(v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 7 ]]
        -- upvalues: v1 (ref), v2 (ref), v3 (copy), v4 (copy)
        v5:dispatch(v1(v2.EconomicRestrictionPrompt, {
            failureReason = v3, 
            expirationTimeInMinutes = v4
        }));
    end;
end;