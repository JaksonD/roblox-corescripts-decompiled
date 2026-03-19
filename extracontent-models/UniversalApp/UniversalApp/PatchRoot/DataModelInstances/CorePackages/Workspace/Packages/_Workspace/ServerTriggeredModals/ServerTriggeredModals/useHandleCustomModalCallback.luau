local l_script_FirstAncestor_0 = script:FindFirstAncestor("ServerTriggeredModals");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.SharedFlags);
local v4 = require(l_Parent_0.SocialUpsell);
local v5 = require(l_script_FirstAncestor_0.CustomModalType);
local v6 = require(l_script_FirstAncestor_0.reportModalImpression);
local v7 = require(l_script_FirstAncestor_0.sendModalImpressionEvent);
local l_SocialUpsellType_0 = v4.Enums.SocialUpsellType;
local l_UpsellEntrySurfaceType_0 = v4.Analytics.Enum.UpsellEntrySurfaceType;
local l_UpsellComponent_0 = v4.Analytics.Enum.UpsellComponent;
local l_useSocialUpsellOverlayController_0 = v4.Hooks.useSocialUpsellOverlayController;
local l_FFlagEnableCommsFAEUpsell_0 = v3.FFlagEnableCommsFAEUpsell;
local l_FFlagAddMinorFixesToUpsellAnalytics_0 = v4.Flags.FFlagAddMinorFixesToUpsellAnalytics;
return function(v14, v15) --[[ Line: 20 ]]
    -- upvalues: l_FFlagEnableCommsFAEUpsell_0 (copy), l_useSocialUpsellOverlayController_0 (copy), v2 (copy), v5 (copy), l_SocialUpsellType_0 (copy), l_FFlagAddMinorFixesToUpsellAnalytics_0 (copy), l_UpsellEntrySurfaceType_0 (copy), l_UpsellComponent_0 (copy), v6 (copy), v7 (copy)
    local v16 = if l_FFlagEnableCommsFAEUpsell_0 then l_useSocialUpsellOverlayController_0(false) else nil;
    return v2.useCallback(function(v17) --[[ Line: 26 ]]
        -- upvalues: l_FFlagEnableCommsFAEUpsell_0 (ref), v5 (ref), v16 (copy), l_SocialUpsellType_0 (ref), l_FFlagAddMinorFixesToUpsellAnalytics_0 (ref), l_UpsellEntrySurfaceType_0 (ref), l_UpsellComponent_0 (ref), v6 (ref), v15 (copy), v7 (ref)
        if l_FFlagEnableCommsFAEUpsell_0 and v17.modalType == v5.SocialFaceAgeEstimationUpsell then
            v16.openSocialOverlay(l_SocialUpsellType_0.FacialAgeEstimation, {
                upsellEntrySurface = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellEntrySurfaceType_0.Homepage else l_UpsellEntrySurfaceType_0.HomepageBottomSheet, 
                upsellEntryComponent = if l_FFlagAddMinorFixesToUpsellAnalytics_0 then l_UpsellComponent_0.Modal else nil, 
                onMounted = function() --[[ Line: 35 ]] --[[ Name: onMounted ]]
                    -- upvalues: v6 (ref), v15 (ref), v17 (copy), v7 (ref)
                    v6(v15, v17.modalId, v17.modalType);
                    v7(v17.modalId, v17.modalType);
                end
            });
        end;
    end, {
        v15, 
        v14, 
        if l_FFlagEnableCommsFAEUpsell_0 then v16.openSocialOverlay else nil
    });
end;