local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.CentralOverlay);
local v4 = require(l_Parent_0.RobloxAppEnums);
local l_useDispatch_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local l_CentralOverlayType_0 = v4.CentralOverlayType;
local l_SetCentralOverlay_0 = v3.Actions.SetCentralOverlay;
local l_CloseCentralOverlay_0 = v3.Thunks.CloseCentralOverlay;
local _ = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v11 = require(l_script_FirstAncestor_0.Store.getOverlayStore);
local v12 = require(l_script_FirstAncestor_0.Constants);
local v13 = require(l_Parent_0.Cryo);
local v14 = nil;
if l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
    v14 = v11(false);
end;
return function(v15) --[[ Line: 32 ]]
    -- upvalues: l_useDispatch_0 (copy), v2 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v14 (ref), v12 (copy), v13 (copy), l_SetCentralOverlay_0 (copy), l_CentralOverlayType_0 (copy), l_CloseCentralOverlay_0 (copy)
    local v16 = l_useDispatch_0();
    local v19 = v2.useCallback(function(v17, v18) --[[ Line: 35 ]]
        -- upvalues: v15 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v14 (ref), v12 (ref), v13 (ref), v16 (copy), l_SetCentralOverlay_0 (ref), l_CentralOverlayType_0 (ref)
        if v15 then
            if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and v14 then
                v14.setCurrentOverlay(v12.OVERLAY_TYPES.SocialUpsell, {
                    upsellType = v17, 
                    data = v13.Dictionary.join(v18, {
                        isInExperience = v15
                    })
                });
                return;
            end;
        else
            v16(l_SetCentralOverlay_0(l_CentralOverlayType_0.SocialUpsellOverlay, {
                upsellType = v17, 
                data = v18
            }));
        end;
    end, {
        v15
    });
    local v20 = v2.useCallback(function() --[[ Line: 53 ]]
        -- upvalues: v15 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v14 (ref), v16 (copy), l_CloseCentralOverlay_0 (ref)
        if v15 then
            if l_FFlagEnableAEGIS2CommsFAEUpsell_0 and v14 then
                v14.dismissCurrentOverlay();
                return;
            end;
        else
            v16(l_CloseCentralOverlay_0());
        end;
    end, {
        v15
    });
    return v2.useMemo(function() --[[ Line: 63 ]]
        -- upvalues: v19 (copy), v20 (copy)
        return {
            openSocialOverlay = v19, 
            closeSocialOverlay = v20
        };
    end, {
        v19, 
        v20
    });
end;