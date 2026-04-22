local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SocialUpsell);
local v4 = require(l_script_FirstAncestor_0.CustomModalType);
local v5 = require(l_script_FirstAncestor_0.reportModalImpression);
local v6 = require(l_script_FirstAncestor_0.sendModalImpressionEvent);
local l_SocialUpsellType_0 = v3.Enums.SocialUpsellType;
local l_UpsellEntrySurfaceType_0 = v3.Analytics.Enum.UpsellEntrySurfaceType;
local l_UpsellComponent_0 = v3.Analytics.Enum.UpsellComponent;
local l_useSocialUpsellOverlayController_0 = v3.Hooks.useSocialUpsellOverlayController;
return function(v11, v12) --[[ Line: 16 ]]
    -- upvalues: l_useSocialUpsellOverlayController_0 (copy), v2 (copy), v4 (copy), l_SocialUpsellType_0 (copy), l_UpsellEntrySurfaceType_0 (copy), l_UpsellComponent_0 (copy), v5 (copy), v6 (copy)
    local v13 = l_useSocialUpsellOverlayController_0(false);
    return v2.useCallback(function(v14) --[[ Line: 19 ]]
        -- upvalues: v4 (ref), v13 (copy), l_SocialUpsellType_0 (ref), l_UpsellEntrySurfaceType_0 (ref), l_UpsellComponent_0 (ref), v5 (ref), v12 (copy), v6 (ref)
        if v14.modalType == v4.SocialFaceAgeEstimationUpsell then
            v13.openSocialOverlay(l_SocialUpsellType_0.FacialAgeEstimation, {
                upsellEntrySurface = l_UpsellEntrySurfaceType_0.Homepage, 
                upsellEntryComponent = l_UpsellComponent_0.Modal, 
                onMounted = function() --[[ Line: 24 ]] --[[ Name: onMounted ]]
                    -- upvalues: v5 (ref), v12 (ref), v14 (copy), v6 (ref)
                    v5(v12, v14.modalId, v14.modalType);
                    v6(v14.modalId, v14.modalType);
                end
            });
        end;
    end, {
        v12, 
        v11, 
        v13.openSocialOverlay
    });
end;