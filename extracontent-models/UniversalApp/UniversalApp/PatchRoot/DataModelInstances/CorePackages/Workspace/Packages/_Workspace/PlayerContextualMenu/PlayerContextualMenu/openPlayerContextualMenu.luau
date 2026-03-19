local l_Parent_0 = script:FindFirstAncestor("PlayerContextualMenu").Parent;
local v1 = require(l_Parent_0.CentralOverlay);
local v2 = require(l_Parent_0.RobloxAppEnums);
local _ = require(script.Parent.Components);
return function(v4) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5) --[[ Line: 10 ]]
        -- upvalues: v1 (ref), v2 (ref), v4 (copy)
        v5:dispatch(v1.Actions.SetCentralOverlay(v2.CentralOverlayType.PlayerContextualMenu, v4));
    end;
end;