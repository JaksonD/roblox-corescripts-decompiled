local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local v3 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
return function(v5) --[[ Line: 15 ]]
    -- upvalues: l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), v3 (copy)
    return function(v6) --[[ Line: 16 ]]
        -- upvalues: l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref), v5 (copy), v3 (ref)
        v6:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.SocialUpsellOverlay, {
            data = v5, 
            upsellType = v3.FacialAgeEstimation
        }));
    end;
end;