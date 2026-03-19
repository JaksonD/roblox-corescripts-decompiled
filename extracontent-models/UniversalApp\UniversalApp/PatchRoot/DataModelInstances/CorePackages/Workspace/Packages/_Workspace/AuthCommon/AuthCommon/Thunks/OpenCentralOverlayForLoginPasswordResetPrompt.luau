local l_Parent_0 = script:FindFirstAncestor("AuthCommon").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function() --[[ Line: 7 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v3) --[[ Line: 8 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        v3:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.LoginPasswordResetPrompt, {}));
    end;
end;