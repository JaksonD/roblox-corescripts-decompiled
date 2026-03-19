local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v5 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellEntrySurfaceType);
local v6 = require(l_script_FirstAncestor_0.Components.FAEUpsellOverlay);
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local l_FFlagEnableSocialUpsellFocusFixes_0 = require(l_Parent_0.SharedFlags).FFlagEnableSocialUpsellFocusFixes;
local v9 = {
    isInExperience = false, 
    upsellEntrySurface = v5.Unknown, 
    upsellType = v4.Unknown
};
return function(v10) --[[ Line: 28 ]]
    -- upvalues: v3 (copy), v2 (copy), v9 (copy), l_FFlagEnableSocialUpsellFocusFixes_0 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v4 (copy), v6 (copy)
    return (v3.useMemo(function() --[[ Line: 29 ]]
        -- upvalues: v2 (ref), v9 (ref), v10 (copy), l_FFlagEnableSocialUpsellFocusFixes_0 (ref), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v4 (ref), v3 (ref), v6 (ref)
        local v11 = nil;
        local v12 = v2.Dictionary.union(v9, v10.data or {});
        if l_FFlagEnableSocialUpsellFocusFixes_0 then
            v12.containerRef = v10.containerRef;
        end;
        if not l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
            v12.isInExperience = false;
        end;
        if v10.upsellType == v4.FacialAgeEstimation then
            v11 = v3.createElement(v6, v12);
        end;
        return v11;
    end, {
        v10.upsellType, 
        v10.data
    }));
end;