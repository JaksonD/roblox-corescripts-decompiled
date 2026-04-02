local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialUpsell");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.Enum.SocialUpsellType);
local v5 = require(l_script_FirstAncestor_0.Analytics.Enum.UpsellEntrySurfaceType);
local v6 = require(l_script_FirstAncestor_0.Components.FAEUpsellOverlay);
local l_FFlagEnableAEGIS2CommsFAEUpsell_0 = require(l_Parent_0.SharedFlags).FFlagEnableAEGIS2CommsFAEUpsell;
local v8 = {
    isInExperience = false, 
    upsellEntrySurface = v5.Unknown, 
    upsellType = v4.Unknown
};
return function(v9) --[[ Line: 27 ]]
    -- upvalues: v3 (copy), v2 (copy), v8 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (copy), v4 (copy), v6 (copy)
    return (v3.useMemo(function() --[[ Line: 28 ]]
        -- upvalues: v2 (ref), v8 (ref), v9 (copy), l_FFlagEnableAEGIS2CommsFAEUpsell_0 (ref), v4 (ref), v3 (ref), v6 (ref)
        local v10 = nil;
        local v11 = v2.Dictionary.union(v8, v9.data or {});
        v11.containerRef = v9.containerRef;
        if not l_FFlagEnableAEGIS2CommsFAEUpsell_0 then
            v11.isInExperience = false;
        end;
        if v9.upsellType == v4.FacialAgeEstimation then
            v10 = v3.createElement(v6, v11);
        end;
        return v10;
    end, {
        v9.upsellType, 
        v9.data
    }));
end;