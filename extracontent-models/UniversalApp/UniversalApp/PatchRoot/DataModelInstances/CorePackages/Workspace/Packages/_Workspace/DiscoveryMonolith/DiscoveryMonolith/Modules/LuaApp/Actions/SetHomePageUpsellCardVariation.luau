local l_Parent_0 = script:FindFirstAncestor("DiscoveryMonolith").Parent;
local l_makeActionCreator_0 = require(l_Parent_0.Rodux).makeActionCreator;
local l_FFlagEnableAEGIS1HomePageBanner_0 = require(l_Parent_0.SocialUpsell).Flags.FFlagEnableAEGIS1HomePageBanner;
return l_makeActionCreator_0(script.Name, function(v3, v4, v5, v6) --[[ Line: 16 ]]
    -- upvalues: l_FFlagEnableAEGIS1HomePageBanner_0 (copy)
    if l_FFlagEnableAEGIS1HomePageBanner_0 then
        return {
            upsellCardType = v3, 
            titleTextOverride = v4, 
            bodyTextOverride = v5, 
            upsellCardV2Config = v6
        };
    else
        return {
            upsellCardType = v3, 
            titleTextOverride = v4, 
            bodyTextOverride = v5
        };
    end;
end);