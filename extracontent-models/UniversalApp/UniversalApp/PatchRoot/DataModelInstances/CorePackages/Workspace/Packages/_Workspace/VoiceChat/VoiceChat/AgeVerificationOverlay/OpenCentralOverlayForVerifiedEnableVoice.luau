local l_Parent_0 = script:FindFirstAncestor("VoiceChat").Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
return function(v3) --[[ Line: 6 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy)
    return function(v4) --[[ Line: 7 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v3 (copy)
        v4:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.VerifiedEnableVoice, v3 or {}));
    end;
end;