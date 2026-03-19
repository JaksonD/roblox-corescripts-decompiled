local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v2 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
return function() --[[ Line: 6 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v3) --[[ Line: 7 ]]
        -- upvalues: v1 (ref), v2 (ref)
        if v3:getState().CentralOverlay.OverlayType == v1.VngContactInfoFormWebviewPopup then
            v3:dispatch(v2());
        end;
    end;
end;